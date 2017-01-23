/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.component.base
{
    import flash.events.Event;

    public class ComponentEvent extends Event
    {
        public static const ADD_TO_SCREEN_READY:String = "add_to_screen_ready";
        private var _param:Object;

        public function ComponentEvent(type:String, param:Object = null)
        {
            super(type, false, false);
            _param = null;
        }


        override public function clone():Event
        {
            return new ComponentEvent(type, param);
        }

        public function get param():Object
        {
            return _param;
        }
    }
}
