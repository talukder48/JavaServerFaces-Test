package eDelegator;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import orm.*;
public class CDelegator {

	public static Map<String, String>  Facade(Map map) {
		Map<String, String> MapObj = new HashMap<String, String>();
		String method = map.get("Method").toString();
		String className = map.get("JavaClass").toString();
		try {						
			Class classDefinition = Class.forName("orm."+className);
	        Object  object = classDefinition.newInstance();	        
		    Method m = object.getClass().getDeclaredMethod(method, Map.class);
		    MapObj = (Map) m.invoke(object, map);			
			m.setAccessible(true);												       
		} 
		/*catch (InvocationTargetException e)
		{
			e.printStackTrace();
		}*/catch (Exception e) {
			//e.printStackTrace();
			MapObj.put("ERROR", "Error in Facade Method");
		}
		
		return MapObj;
	}

}
