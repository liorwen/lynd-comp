/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.component.base
{
    public interface IComponentState
    {
        function addState(state:String, stateIn:Function, stateOut:Function):void;
        function hasState(state:String):Boolean;
        function changeState(state:String):void;
        function get state():String;
    }
}
