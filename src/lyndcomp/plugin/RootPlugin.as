/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.plugin
{
    import flash.display.DisplayObjectContainer;

    import lyndcomp.IApp;
    import lyndcomp.plugin.base.IPlugin;
    import lyndcomp.tool.util;

    public class RootPlugin implements IPlugin
    {
        public function RootPlugin()
        {

        }

        public function install(app:IApp, param:Object):void
        {
            if (!param.hasOwnProperty("root"))
                    return;
            if(util.hasExtendsClass(param.root, DisplayObjectContainer))
                app.setProperty("root", param.root);
        }
    }
}
