package orm;

import java.util.HashMap;
import java.util.Map;

public class Registration {
	Map<String, String> ResultMap = new HashMap<String, String>();

	public Registration() {
		ResultMap.clear();
	}

	public Map<String, String> Save(Map DataMap) {
		ResultMap.put("ERROR", "");

		// BO file

		return ResultMap;
	}
}
