/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp
{
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;

    import lyndcomp.component.base.IComponent;
    import lyndcomp.plugin.RootPlugin;
    import lyndcomp.plugin.ScreenPlugin;
    import lyndcomp.plugin.StorePlugin;
    import lyndcomp.plugin.base.IPlugin;
    import lyndcomp.store.Store;
    import lyndcomp.tool.util;

    public class App implements IApp
    {
        private var _eventDispatch:EventDispatcher;
        private var _propDict:Dictionary;
        private var _param:Object;

        public function App(param:Object)
        {
            _eventDispatch = new EventDispatcher();
            _propDict = new Dictionary();
            _param = param;
            _param.plugin.push(RootPlugin);
            _param.plugin.push(StorePlugin);
            _param.plugin.push(ScreenPlugin);
            installPlugin();
        }

        private function installPlugin():void
        {
            if (!_param.hasOwnProperty("plugin"))
                return;
            var plugin:IPlugin;
            for (var i:int = 0; i < _param.plugin.length; i++)
            {
                if(util.hasInterface(_param.plugin[i], IPlugin))
                {
                    plugin = new _param.plugin[i]();
                    plugin.install(this, _param);
                }
            }
        }

        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
        {
            _eventDispatch.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
        {
            _eventDispatch.removeEventListener(type, listener, useCapture);
        }

        public function dispatchEvent(event:Event):Boolean
        {
            return _eventDispatch.dispatchEvent(event);
        }

        public function hasEventListener(type:String):Boolean
        {
            return _eventDispatch.hasEventListener(type);
        }

        public function willTrigger(type:String):Boolean
        {
            return _eventDispatch.willTrigger(type);
        }

        public function setProperty(prop:String, obj:*):void
        {
            _propDict[prop] = obj;
        }

        public function hasProperty(prop:String):Boolean
        {
            if (!_propDict[prop])
                return false;
            return true;
        }

        public function getProperty(prop:String):*
        {
            if (!_propDict[prop])
                return null;
            return _propDict[prop];
        }

        public function removeProperty(prop:String):void
        {
            if (!_propDict[prop])
                return;
            _propDict[prop] = null;
            delete  _propDict[prop];
        }

        public function get screen():IComponent
        {
            return getProperty("screen");
        }

        public function get root():DisplayObjectContainer
        {
            return getProperty("root");
        }

        public function get store():Store
        {
            return getProperty("store");
        }
    }
}
