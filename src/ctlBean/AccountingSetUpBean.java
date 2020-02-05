package ctlBean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import eDelegator.CDelegator;

@ManagedBean(name = "AccountingSetUpBean")
@SessionScoped
public class AccountingSetUpBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String code = "";
	private String name = "";
	private String description = "";
	Map ReturnObj = new HashMap<String, String>();
	Map ValidatorObj = new HashMap<String, String>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public final String Update() {

		Map DataObj = new HashMap<String, String>();
		DataObj.put("Code", code);
		DataObj.put("name", name);
		DataObj.put("description", description);
		DataObj.put("JavaClass", "AccountingSetup");
		DataObj.put("Method", "Save");

		CDelegator cd = new CDelegator();
		ReturnObj = cd.CommonDelegator(DataObj);

		if (ReturnObj.get("ERROR").toString() == null || ReturnObj.get("ERROR").toString() == "") {
			return "success";
		} else {
			return "failure";
		}

	}
}
