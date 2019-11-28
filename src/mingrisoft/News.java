package mingrisoft;

import java.sql.Connection;								//����Connection�������ݿ������ã�
import java.sql.ResultSet;								//����ResultSet�������ݿ������ã�
import java.sql.Statement;								//����Statement�������ݿ������ã�
/**
 * �ļ�����News.java
 * �ļ��������������Ź���ģ�����ɾ�Ĳ鹦�ܲ���
 * �����ˣ�fjh
*/
public class News {

	DBConnection DBConn = new DBConnection();          		//�������ݿ�������Ķ���
	Function Fun = new Function();				    	//��������������Ķ�������֤����

	/**
     * ��������ListNews
     * ����������ʵ�������б�ҳ���飩
     * @param toPage:��ҳ��תҳ���ַ��pageNum:ÿҳ��ʾ��¼����
     * @return ���ݿ��ѯ�������б��ַ��������
    */
	public String ListNews(String toPage, String pageNum) {
		try {
			Connection Conn = DBConn.getConn();			//��ȡ���ݿ�����
			Statement stmt = Conn.createStatement();		//�������ݿ�����״̬
			ResultSet rs = null;					//�������������
			StringBuffer resultData = new StringBuffer();		//��������ַ�������
			String sSql = "select * from News order by NewsID desc";		
			rs = stmt.executeQuery(sSql);				//ִ�����ݿ��ѯ
			resultData=Fun.ListNews(resultData,rs,toPage,pageNum);  
			rs.close();						//�رս������ѯ����
			stmt.close();						//�ر�Statement
			Conn.close();						//�ر����ݿ�����
			return resultData.toString();				//��ǰ̨���ؽ����
		} catch (Exception e) {
			return "No";						//����ȡ���ݿ�ʧ�ܣ����ء�No��
		}
	}
	
	
	
	/**
     * ��������AddNews
     * ���������������������ݼ�¼������
    */
	public String AddNews(String [] newsData)
	 {			
		try
			{
			Connection Conn = DBConn.getConn();					//��ȡ���ݿ�
			Statement stmt = Conn.createStatement();				//�������ݿ�����״̬
			ResultSet rs = null;							//�����������ѯ	
			String sSql = "select * from News order by NewsID desc";		//�������ݿ��ѯ���
		rs = stmt.executeQuery(sSql); 					      		//ִ�����ݿ��ѯ
		String result=Fun.AddNews(Conn,stmt,rs,newsData);		  		//��ȡ��ѯ���
		return result;									//����result ���
		}catch(Exception e){
		return "���ʧ��";							 	//ʧ�ܣ����ء����ʧ�ܡ�
	}
}
	
	
	
	/**
     * ��������DelNews
     * ����������ɾ���������ݼ�¼��ɾ��
    */
	public boolean DelNews(String newsId) {
		try {
			Connection Conn = DBConn.getConn(); 		// ��ȡ���ݿ�
			Statement stmt = Conn.createStatement(); 	// �������ݿ�����״̬
			int NewsID = Fun.StrToInt(newsId); 		// ���ַ���newsIdת��Ϊ��������NewsID
			return Fun.DelNews(Conn, stmt, NewsID); 	// ɾ�����ݲ�����ɾ�����
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	/**
     * ��������EditNews
     * �����������޸��������ݼ�¼���ģ�
    */
	public String EditNews(String[] newsData, String newsId) {
		try {
			Connection Conn = DBConn.getConn();			  	//��ȡ���ݿ�
			Statement stmt = Conn.createStatement();		  	//�������ݿ�����״̬
			return Fun.EditNews(Conn,stmt,newsData,newsId); 		//�޸Ĳ��������ҷ���״̬
		} catch (Exception e) {
			return "���ݿ�����ʧ��!";					//����ҳ�������ʾ��Ϣ
		}
	}
	
	
	
	public String ListNewsFront(String toPage,String pageNum)
    {			
		try
    	{
    		Connection Conn = DBConn.getConn();						//�������ݿ�������
	    	Statement stmt = Conn.createStatement();					//��ȡ����״̬
	    	ResultSet rs = null;								//���������ResultSet
    		StringBuffer resultData = new StringBuffer();					//�����ַ���resultData
    		String sSql = "select * from News order by NewsID desc";			//�������ݿ��ѯsql���
	    	rs = stmt.executeQuery(sSql);							//ִ�����ݿ��ѯ
	    	resultData=Fun.ListNewsFront(resultData,rs,toPage,pageNum);			//��ȡ���ط�ҳ���
		rs.close();									//�رս������
    		stmt.close();									//�ر�����״̬
    		Conn.close();									//�ر����ݿ�����
    		return resultData.toString();							//����ҳ��resultData
    	}catch(Exception e)
        {
            return "No";									//�����쳣���򷵻�No
        }
    }

	
	
	
	public String FrontNewsDetail(String id) {
		try {
			Connection Conn = DBConn.getConn();				//��ȡ���ݿ��������
			Statement stmt = Conn.createStatement();			//�������ݿ�����״̬
			ResultSet rs = null;						//�������ݿ�����
			int NewsID = Fun.StrToInt(id);					//idֵתint����
			if (NewsID == 0)						//����NewsIDֵ�����߼��ж�
				return "No";						//������0���򷵻�No
			else {	
				try 	{
					//�������ݿ�Ĳ�ѯsql���
					String sql = "select * from News where NewsID=" + NewsID;
					rs = stmt.executeQuery(sql);				//ִ�����ݿ��ѯ
					StringBuffer sb = new StringBuffer();			//�����ַ���sb		
					Fun.FrontNewsDetail(sb, rs);				//ȡ���������ҳ�������Ⱦ
					rs.close();						//�ر����ݿ�����
					stmt.close();						//�ر�����״̬
					Conn.close();						//�ر����ݿ�������
					return sb.toString();					//����ҳ���ַ���sb
				} catch (Exception e) {
					Conn.rollback();					//���ִ������ݿ�ع�
					Conn.close();						//�ر����ݿ�����
					return "No";						//ҳ�淵��No���ж��쳣
				}
			}
		} catch (Exception e) {
			return "No";								//ϵͳ�����쳣��Ҳ����No
		}
	}





}
