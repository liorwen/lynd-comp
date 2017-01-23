/**
 * Created by zear19st on 2017/1/19.
 */
package lyndcomp.store.facade
{
    import flash.utils.Dictionary;

    import lyndcomp.store.facade.base.IStoreFacade;
    import lyndcomp.store.state.StateObj;

    public class StateFacade implements IStoreFacade
    {
        public function StateFacade()
        {
        }

        public function create(modules:Dictionary):*
        {
            var state:StateObj = new StateObj("state");
            for(var key:* in modules)
            {
                state[key].value = modules.state;
            }
            return state;
        }
    }
}
