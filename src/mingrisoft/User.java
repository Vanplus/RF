package mingrisoft;			

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class User
{

    DBConnection DBConn = new DBConnection();
    Function Fun = new Function(); 

	public String ListUser(String toPage, String pageNum) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			StringBuffer resultData = new StringBuffer();
			String sSql = "select * from Admin order by AdminName desc";
			rs = stmt.executeQuery(sSql);
			resultData = Fun.ListUser(resultData, rs, toPage, pageNum);
			rs.close();
			stmt.close();
			Conn.close();
			return resultData.toString();
		} catch (Exception e) {
			return "No";
		}
	}
    
}