package ctlBean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import eDelegator.CDelegator;

@ManagedBean(name = "GLSetupBean")
@SessionScoped
public class GLSetupBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String glCode = "";
	private String glName = "";
	private String glDescription = "";
	Map ReturnObj = new HashMap<String, String>();
	Map ValidatorObj = new HashMap<String, String>();
	
	public String getGlCode() {
		return glCode;
	}
	public void setGlCode(String glCode) {
		this.glCode = glCode;
	}
	public String getGlName() {
		return glName;
	}
	public void setGlName(String glName) {
		this.glName = glName;
	}
	public String getGlDescription() {
		return glDescription;
	}
	public void setGlDescription(String glDescription) {
		this.glDescription = glDescription;
	}
	public final String Update() {

		Map DataObj = new HashMap<String, String>();
		DataObj.put("GLCode", glCode);
		DataObj.put("GLNAME", glName);
		DataObj.put("GLDESCRIPTION", glDescription);
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
