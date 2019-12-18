package ctlBean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;


@ManagedBean(name = "LogInBean")
@SessionScoped
public class LogInBean implements Serializable {
	private static final long serialVersionUID = 1L;

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

	public void setPassword(String password) {
		this.password = password;
	}

	public final void Update() {
		System.out.println("In Update");
		String OutPut = "Username: " + usrname + " Password: " + password;
		System.out.println(OutPut);
		System.out.println("Out Update");
	}
}
