/**
 * Created by zear19st on 2017/1/19.
 */
package lyndcomp.store
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;

    import lyndcomp.store.facade.base.StoreFacade;
    import lyndcomp.store.state.base.StateEvent;
    import lyndcomp.store.state.base.StoreState;
    import lyndcomp.tool.util;

    public class Store implements IEventDispatcher
    {
        private var _eventDispatcher:EventDispatcher;
        private var _state:StoreState;
        private var _storeModules:Dictionary;
        private var _litenStateDict:Dictionary;

        public function Store(param:Object)
        {
            _eventDispatcher = new EventDispatcher();
            _storeModules = createModule(param);
            _litenStateDict = new Dictionary();
            _state = StoreFacade.createFacade(StoreFacade.STATE, _storeModules);
        }

        private function createModule(param:Object):Dictionary
        {
            var res:Dictionary = new Dictionary();
            for (var key:* in param)
            {
                if (util.hasExtendsClass(param[key], StoreMoudule))
                {
                    _storeModules[key] = new param[key]();
                }
            }
            return res;
        }

        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
        {
            _eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
        {
            _eventDispatcher.removeEventListener(type, listener, useCapture);
        }

        public function dispatchEvent(event:Event):Boolean
        {
            return _eventDispatcher.dispatchEvent(event);
        }

        public function hasEventListener(type:String):Boolean
        {
            return _eventDispatcher.hasEventListener(type);
        }

        public function willTrigger(type:String):Boolean
        {
            return _eventDispatcher.willTrigger(type);
        }

        public function get state():StoreState
        {
            return _state;
        }

        public function listenState(state:StoreState, callback:Function):void
        {
            if (hasListenState(state, callback))
                return;
            if (_litenStateDict[state.path] == null)
                return;
            if (_litenStateDict[state.path] == null)
                _litenStateDict[state.path] = new Dictionary();
            _litenStateDict[state.path][callback] = onListen(callback);
            addEventListener(state.path, _litenStateDict[state.path][callback]);
        }

        private function onListen(callBack:Function):Function
        {
            var fn:Function = function (e:StateEvent):void
            {
                callBack.apply(null, [e.value]);
            }
            return fn;
        }

        public function hasListenState(state:StoreState, callback:Function):Boolean
        {
            if (!_litenStateDict[state.path])
                return false;
            if (!_litenStateDict[state.path][callback])
                return false;
            return true;
        }

        public function removeListenState(state:StoreState, callback:Function):void
        {
            if (!hasListenState(state.path, callback))
                return;
            removeEventListener(state.path, _litenStateDict[state.path][callback]);
            delete _litenStateDict[state.path][callback];
        }

        public function commit(type:String, ...rest):void
        {

        }
    }
}
