package ctlBean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import eDelegator.CDelegator;
import validator.LoginValidation;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@ManagedBean(name = "LogInBean")
@SessionScoped
public class LogInBean implements Serializable {
	private static final long serialVersionUID = 1L;
	Map ReturnObj = new HashMap<String, String>();
	Map ValidatorObj = new HashMap<String, String>();
	LoginValidation lv = null;

	public LogInBean() {
		lv = new LoginValidation();
	}

	private String usrname = null;
	private String password = null;

	public String getUsrname() {
		return usrname;
	}

	public void setUsrname(String usrname) {

		Map<String, String> datamap = new HashMap<String, String>();
		datamap.put("USER_NAME", usrname);
		try {
			ValidatorObj = lv.UserIdValidation(datamap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (ValidatorObj.get("ERROR").toString() == null || ValidatorObj.get("ERROR").toString() == "") {
			this.usrname = usrname;
		}
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String usrname) {
		this.password = password;
	}

	public final String Update() {

		Map DataObj = new HashMap<String, String>();
		DataObj.put("UserName", usrname);
		DataObj.put("Password", password);
		DataObj.put("JavaClass", "Login");
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
