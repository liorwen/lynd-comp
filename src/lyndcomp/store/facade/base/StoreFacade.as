/**
 * Created by zear19st on 2017/1/19.
 */
package lyndcomp.store.facade.base
{
    import flash.utils.Dictionary;

    import lyndcomp.store.facade.MutationFacade;

    import lyndcomp.store.facade.StateFacade;

    public class StoreFacade
    {
        public static const STATE:String = "state";
        public static const MUTATION:String = "mutation";

        private static var _facadeDict:Dictionary;

        public function StoreFacade()
        {
        }

        private static function createFacadeDict():Dictionary
        {
            var res:Dictionary = new Dictionary();
            res[STATE] = new StateFacade();
            res[MUTATION] = new MutationFacade();
            return res;
        }

        public static function createFacade(facade:String, modules:Dictionary):*
        {
            if (!_facadeDict)
                _facadeDict = createFacadeDict();
            if (!_facadeDict.hasOwnProperty(facade))
                return null;
            return _facadeDict[facade].create(modules);
        }
    }
}
