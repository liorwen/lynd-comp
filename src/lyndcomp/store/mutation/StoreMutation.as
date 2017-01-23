/**
 * Created by zear19st on 2017/1/20.
 */
package lyndcomp.store.mutation
{
    import flash.utils.Dictionary;

    import lyndcomp.tool.util;

    public class StoreMutation
    {
        private var _mutationDict:Dictionary;

        public function StoreMutation()
        {
            _mutationDict = new Dictionary();
        }

        public function push(moduleName:String, param:Object):void
        {
            for (var type:* in param)
            {
                if (util.compareClass(param[type], Function))
                {
                    _mutationDict[type] = {stateName: moduleName, fn: param[type]};
                }
            }
        }

        public function commit(type:String, ...rest):void
        {

        }

    }
}
