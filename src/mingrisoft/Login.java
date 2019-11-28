package mingrisoft;
import java.sql.Connection;                          //导入Java包（数据库连接用）
import java.sql.SQLException;				         //导入Java包（数据库连接用）
/**
 * 文件名：Login.java
 * 文件功能描述：登录
 * 开发人：fjh
*/
public class Login {

	DBConnection DBConn = new DBConnection();     	//引入数据库连接
	Function Fun = new Function();                 	//引入功能命令。如验证密码、页面渲染等
	
	/**
     * 方法名：LoginCheck
     * 功能描述：管理员后台登录时，用户名密码验证。
     * @param user:提交的用户名，pwd:提交的密码
     * @return true：表示验证正确;
    */
	public boolean LoginCheck(String user, String pwd) {
		try {
			Connection Conn = DBConn.getConn();  	// 取得数据库的连接状态
			boolean OK = true;                     	// 新建变量“ok”，值为true（布尔类型）
			OK = Fun.CheckLogin(Conn, user, pwd);	// 调用功能函数CheckLogin，返回值赋给OK
			return OK;					        	// 将OK的值返回
		} catch (SQLException e) {
			return false;  							// 如果出现异常，返回false
		}
	}
}
