/**
 * Created by zear19st on 2017/1/17.
 */
package lyndcomp.store.state.base
{
    import flash.events.IEventDispatcher;

    public interface IState extends IEventDispatcher
    {
        function get path():String;

        function get value():*;

        function set value(value:*):void;

        function destroy():void;
    }
}
