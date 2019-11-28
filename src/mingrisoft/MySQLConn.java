package mingrisoft;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class MySQLConn {
 
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        Connection conn = null;
        // 驱动引擎
        String jd = "com.mysql.jdbc.Driver";
        // 连接MySQL的连接
        String url = "jdbc:mysql://127.0.0.1:3306/hello";
        // MySQL的用户名
        String user = "root";
        // MySQL的密码
        String password = "root";
        try {
            // 加载驱动
            Class.forName(jd);
            // 连接数据库对象
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("连接成功");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("引擎失败");
            e.printStackTrace();
        }
        if (conn != null) {
            try {
                // 关闭资源
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
 
}