public class TestOGraph {
    public static String Check(){
        Map<String,String> mMap = new Map<String,String>();
        mMap.put('chess','square');
        mMap.put('Cricket','Circle');
        mMap.put('Football','Rectangle');
        String s = mMap.get('Football');
        System.debug('S   '+s);
        return s;
    }
}