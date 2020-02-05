package orm;

import java.util.HashMap;
import java.util.Map;

public class AccountingSetup {
	Map<String, String> ResultMap = new HashMap<String, String>();

	public AccountingSetup() {
		ResultMap.clear();
	}

	public Map<String, String> Save(Map DataMap) {
		ResultMap.put("ERROR", "");
		return ResultMap;
	}
}
