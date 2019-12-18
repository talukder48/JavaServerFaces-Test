package projectUtils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class DBConnector {
	public static Connection DBConnection = null;

	public Connection GetConnection() {
		Connection con = null;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource datasource = (DataSource) envContext.lookup("jdbc/eLoanService");
			con = datasource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();

			
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		return con;
	}

	public static void OpenConnection() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource datasource = (DataSource) envContext.lookup("jdbc/eLoanService");
			DBConnection = datasource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.getLocalizedMessage();
		}

	}

	public static void CloseConnection() {
		try {
			DBConnection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void Commit() {
		try {
			DBConnection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
