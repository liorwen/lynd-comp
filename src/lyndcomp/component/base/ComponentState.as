/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.component.base
{
    import flash.utils.Dictionary;

    public class ComponentState implements IComponentState
    {
        private var _stateDict:Dictionary;
        private var _state:String;

        public function ComponentState()
        {
            _stateDict = new Dictionary();
            _state = "";
        }

        final public function addState(state:String, stateIn:Function, stateOut:Function):void
        {
            _stateDict[state] = {stateIn: stateIn, stateOut: stateOut};
        }

        final public function hasState(state:String):Boolean
        {
            if (!_stateDict[state])
                return false;
            return true;
        }

        final public function changeState(state:String):void
        {
            if (!_stateDict[state])
                return;
            if (_state != "")
                _stateDict[_state].stateOut.apply();
            _state = state;
            _stateDict[_state].stateIn.apply();
        }

        final public function get state():String
        {
            return _state;
        }
    }
}
