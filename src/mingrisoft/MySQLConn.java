package mingrisoft;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class MySQLConn {
 
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        Connection conn = null;
        // ��������
        String jd = "com.mysql.jdbc.Driver";
        // ����MySQL������
        String url = "jdbc:mysql://127.0.0.1:3306/hello";
        // MySQL���û���
        String user = "root";
        // MySQL������
        String password = "root";
        try {
            // ��������
            Class.forName(jd);
            // �������ݿ����
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("���ӳɹ�");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("����ʧ��");
            e.printStackTrace();
        }
        if (conn != null) {
            try {
                // �ر���Դ
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
 
}