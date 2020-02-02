package orm;

import java.util.HashMap;
import java.util.Map;

public class LoginValidator {
	Map<String, String> ResultMap = new HashMap<String, String>();

	public LoginValidator() {
		ResultMap.clear();
	}

	public Map<String, String> Save(Map DataMap) {
		ResultMap.put("ERROR", "");
		return ResultMap;
	}
}
