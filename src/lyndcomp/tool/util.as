/**
 * Created by zear19st on 2017/1/16.
 */
package lyndcomp.tool
{
    import flash.utils.getQualifiedClassName;
    import flash.utils.describeType;

    public class util
    {
        public function util()
        {
        }

        public static function hasInterface(value:*, checkInterface:*):Boolean
        {
            var checkInterfaceLink:String = getQualifiedClassName(checkInterface);
            var calssXml:XML = describeType(value);
            var interfaceLength:int = calssXml.factory.implementsInterface.(@type == checkInterfaceLink).length();
            if (interfaceLength > 0)
                return true;
            return false;
        }

        public static function hasExtendsClass(value:*, checkClass:*):Boolean
        {
            var checkClassLink:String = getQualifiedClassName(checkClass);
            var calssXml:XML = describeType(value);
            var extendsClassLength:int = calssXml.factory.extendsClass.(@type == checkClassLink).length();
            if (extendsClassLength > 0)
                return true;
            return false;
        }

        public static function compareClass(target:*, contrast:*):Boolean
        {
            if (getQualifiedClassName(target) == getQualifiedClassName(contrast))
                return true;
            return false;
        }
    }
}
