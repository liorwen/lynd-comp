/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.plugin.base
{
    import lyndcomp.IApp;

    public interface IPlugin
    {
        function install(app:IApp, param:Object):void;
    }
}
