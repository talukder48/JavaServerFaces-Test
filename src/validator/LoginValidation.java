package validator;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import projectUtils.DBConnector;


public class LoginValidation {
	Map<String, String> ResultMap = new HashMap<String, String>();

	public LoginValidation() {
		ResultMap.clear();
	}
	public Map<String, String> UserIdValidation(Map DataMap) throws Exception {
		ResultMap.put("ERROR_MSG", "");
		DBConnector ob = new DBConnector();
		String sql = "select * from PRMS_USER t where t.user_id=?";
		Connection con = ob.GetConnection();
		ResultSet rs=null;
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, DataMap.get("USER_NAME").toString());
			 rs = stmt.executeQuery();
			if (!rs.next()) {
				ResultMap.put("ERROR_MSG", "User not Found!");
			} else {
				ResultMap.put("USER_ROLE", rs.getString("USER_ROLE"));
				ResultMap.put("USER_NAME", rs.getString("USER_NAME"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				stmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ResultMap;
	}


	public Map<String, String> LogOut(Map DataMap) {
		return ResultMap;
	}
}
