/**
 * Created by zear19st on 2017/1/18.
 */
package lyndcomp.store.state
{
    import flash.utils.flash_proxy;
    import flash.utils.getQualifiedClassName;

    import lyndcomp.store.state.base.StateEvent;
    import lyndcomp.store.state.base.StoreState;
    import lyndcomp.tool.util;

    use namespace flash_proxy;

    dynamic public class StateObj extends StoreState
    {
        public function StateObj(path:String)
        {
            super(path);
            _property = {};
        }

        protected function getChild():Object
        {
            return _property as Object;
        }

        override flash_proxy function getProperty(name:*):*
        {
            if (!getChild().hasOwnProperty(name))
            {
                var valuePath:String = getValuePath(name);
                getChild()[name] = getState(valuePath, value);
            }
            return getChild()[name];
        }

        override flash_proxy function setProperty(name:*, value:*):void
        {
            var valuePath:String = getValuePath(name);
            if (!getChild().hasOwnProperty(name))
                getChild()[name] = getState(valuePath, value);
            else if (!util.compareClass(getChild()[name], getStateClass(value)))
            {
                delete getChild()[name];
                getChild()[name] = getState(valuePath, value);
            }
            else
                getChild()[name].value = value;
        }

        override flash_proxy function deleteProperty(name:*):Boolean
        {
            if (getChild().hasOwnProperty(name))
            {
                getChild()[name].destroy();
                getChild()[name].removeEventListener(StateEvent.PROPERTY_CHANGE, onChildListen);
                getChild()[name].removeEventListener(StateEvent.PROPERTY_DELETE, onChildListen);
                delete getChild()[name];
            }
            return true;
        }

        override flash_proxy function getDescendants(name:*):*
        {
            return super.flash_proxy::getDescendants(name);
        }

        override flash_proxy function isAttribute(name:*):Boolean
        {
            return super.flash_proxy::isAttribute(name);
        }

        override public function get value():*
        {
            var res:Object = {};
            for (var key:* in getChild())
            {
                res[key] = getChild()[key].value;
            }
            return res;
        }

        override public function set value(value:*):void
        {
            var oldValue:* = this.value;
            for (var key:* in value)
            {
                setProperty(key, value[key]);
            }
            dispatchEvent(new StateEvent(StateEvent.PROPERTY_CHANGE, path, getQualifiedClassName(value), oldValue, value));
        }

        override public function destroy():void
        {
            dispatchEvent(new StateEvent(StateEvent.PROPERTY_DELETE, path, getQualifiedClassName(value), null, value));
            var valuePath:String;
            for (var key:* in getChild())
            {
                valuePath = getValuePath(key);
                getChild()[key].destroy();
                getChild()[key].removeEventListener(StateEvent.PROPERTY_CHANGE, onChildListen);
                getChild()[key].removeEventListener(StateEvent.PROPERTY_DELETE, onChildListen);
                delete getChild()[key];
//                delete getChild()[key];
            }
        }
    }
}
