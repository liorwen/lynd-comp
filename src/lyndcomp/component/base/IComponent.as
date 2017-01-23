/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.component.base
{
    import flash.events.IEventDispatcher;

    public interface IComponent extends IEventDispatcher
    {
        function startup():void;

        function startupAt(index:int):void;

        function stopup(isRemove:Boolean):void;

        function get viewState():String;

        function set viewState(value:String):void;

        function get eventState():String;

        function set eventState(value:String):void;

        function get isAdded():Boolean;

        function set x(value:Number):void;

        function get x():Number;

        function set y(value:Number):void;

        function get y():Number;

        function set width(value:Number):void;

        function get width():Number;

        function set height(value:Number):void;

        function get height():Number;

        function set mouseEnabled(value:Boolean):void;

        function get mouseEnabled():Boolean;

        function set visible(value:Boolean):void;

        function get visible():Boolean;
    }
}
