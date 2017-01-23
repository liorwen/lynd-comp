/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.plugin
{
    import lyndcomp.IApp;
    import lyndcomp.component.base.IComponent;
    import lyndcomp.plugin.base.IPlugin;
    import lyndcomp.tool.util;

    public class ScreenPlugin implements IPlugin
    {

        public function ScreenPlugin()
        {

        }

        public function install(app:IApp, param:Object):void
        {
            if (!param.hasOwnProperty("screen"))
                return;
            if (!util.hasInterface(param.screen, IComponent))
                return;
            app.setProperty("screen", param.screen);
            var comp:IComponent = param.screen;
            comp.startup();
        }
    }
}
