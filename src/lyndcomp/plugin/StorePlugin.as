/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.plugin
{
    import lyndcomp.IApp;
    import lyndcomp.plugin.base.IPlugin;
    import lyndcomp.store.IStore;
    import lyndcomp.tool.util;

    public class StorePlugin implements IPlugin
    {
        public function StorePlugin()
        {

        }

        public function install(app:IApp, param:Object):void
        {

            if (!param.hasOwnProperty("store"))
                return;
            if (util.hasInterface(param.screen, IStore))
                app.setProperty("store", param.screen);
        }
    }
}
