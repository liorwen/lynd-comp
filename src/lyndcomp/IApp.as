/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp
{
    import flash.display.DisplayObjectContainer;
    import flash.events.IEventDispatcher;

    import lyndcomp.component.base.IComponent;
    import lyndcomp.store.Store;

    public interface IApp extends IEventDispatcher
    {
        function setProperty(prop:String, obj:*):void;
        function hasProperty(prop:String):Boolean;
        function getProperty(prop:String):*;
        function removeProperty(prop:String):void;
        function get screen():IComponent;
        function get root():DisplayObjectContainer;
        function get store():Store;
    }
}
