/**
 * Created by zear19st on 2017/1/19.
 */
package lyndcomp.store.facade.base
{
    import flash.utils.Dictionary;

    public interface IStoreFacade
    {
        function create(modules:Dictionary):*;
    }
}
