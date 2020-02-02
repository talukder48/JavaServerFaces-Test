package orm;

import java.util.HashMap;
import java.util.Map;

public class Login {
	Map<String, String> ResultMap = new HashMap<String, String>();

	public Login() {
		ResultMap.clear();
	}

	public Map<String, String> Save(Map DataMap) {
		ResultMap.put("ERROR", "");
		return ResultMap;
	}
}
