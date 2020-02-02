package ctlBean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import eDelegator.CDelegator;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;


@ManagedBean(name = "LogInBean")
@SessionScoped
public class LogInBean implements Serializable {
	private static final long serialVersionUID = 1L;
	Map ReturnObj =new HashMap<String, String>();
	public LogInBean() {
	}

	private String usrname = null;
	private String password = null;

	public String getUsrname() {
		return usrname;
	}

	public void setUsrname(String usrname) {
		this.usrname = usrname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String usrname) {
		this.password = password;
	}

	public final String Update() {
		
	 Map DataObj =new HashMap<String, String>();
		DataObj.put("UserName", usrname);
		DataObj.put("Password", password);
		DataObj.put("JavaClass", "LoginValidator");
		DataObj.put("Method", "Save");
		
		CDelegator cd= new CDelegator();
		ReturnObj=cd.Facade(DataObj);
		
		if (ReturnObj.get("ERROR").toString()==null ||ReturnObj.get("ERROR").toString()=="") {
			return "success";
		}
		else {
			return "failure";
		}

	}
}
