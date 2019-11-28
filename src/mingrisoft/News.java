package mingrisoft;

import java.sql.Connection;								//导入Connection包（数据库连接用）
import java.sql.ResultSet;								//导入ResultSet包（数据库连接用）
import java.sql.Statement;								//导入Statement包（数据库连接用）
/**
 * 文件名：News.java
 * 文件功能描述：新闻管理模块的增删改查功能操作
 * 开发人：fjh
*/
public class News {

	DBConnection DBConn = new DBConnection();          		//创建数据库连接类的对象
	Function Fun = new Function();				    	//创建功能命令类的对象。如验证密码

	/**
     * 方法名：ListNews
     * 功能描述：实现新闻列表页（查）
     * @param toPage:分页跳转页面地址，pageNum:每页显示记录数量
     * @return 数据库查询，新闻列表字符串结果集
    */
	public String ListNews(String toPage, String pageNum) {
		try {
			Connection Conn = DBConn.getConn();			//获取数据库连接
			Statement stmt = Conn.createStatement();		//创建数据库连接状态
			ResultSet rs = null;					//创建结果集对象
			StringBuffer resultData = new StringBuffer();		//创建结果字符串集合
			String sSql = "select * from News order by NewsID desc";		
			rs = stmt.executeQuery(sSql);				//执行数据库查询
			resultData=Fun.ListNews(resultData,rs,toPage,pageNum);  
			rs.close();						//关闭结果集查询连接
			stmt.close();						//关闭Statement
			Conn.close();						//关闭数据库连接
			return resultData.toString();				//给前台返回结果集
		} catch (Exception e) {
			return "No";						//若获取数据库失败，返回“No”
		}
	}
	
	
	
	/**
     * 方法名：AddNews
     * 功能描述：新增新闻数据记录（增）
    */
	public String AddNews(String [] newsData)
	 {			
		try
			{
			Connection Conn = DBConn.getConn();					//获取数据库
			Statement stmt = Conn.createStatement();				//创建数据库连接状态
			ResultSet rs = null;							//创建结果集查询	
			String sSql = "select * from News order by NewsID desc";		//创建数据库查询语句
		rs = stmt.executeQuery(sSql); 					      		//执行数据库查询
		String result=Fun.AddNews(Conn,stmt,rs,newsData);		  		//获取查询结果
		return result;									//返回result 结果
		}catch(Exception e){
		return "添加失败";							 	//失败，返回“添加失败”
	}
}
	
	
	
	/**
     * 方法名：DelNews
     * 功能描述：删除新闻数据记录（删）
    */
	public boolean DelNews(String newsId) {
		try {
			Connection Conn = DBConn.getConn(); 		// 获取数据库
			Statement stmt = Conn.createStatement(); 	// 创建数据库连接状态
			int NewsID = Fun.StrToInt(newsId); 		// 将字符串newsId转化为数字类型NewsID
			return Fun.DelNews(Conn, stmt, NewsID); 	// 删除数据并返回删除结果
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	/**
     * 方法名：EditNews
     * 功能描述：修改新闻数据记录（改）
    */
	public String EditNews(String[] newsData, String newsId) {
		try {
			Connection Conn = DBConn.getConn();			  	//获取数据库
			Statement stmt = Conn.createStatement();		  	//创建数据库连接状态
			return Fun.EditNews(Conn,stmt,newsData,newsId); 		//修改操作，并且返回状态
		} catch (Exception e) {
			return "数据库连接失败!";					//返回页面错误提示信息
		}
	}
	
	
	
	public String ListNewsFront(String toPage,String pageNum)
    {			
		try
    	{
    		Connection Conn = DBConn.getConn();						//创建数据库连接类
	    	Statement stmt = Conn.createStatement();					//获取连接状态
	    	ResultSet rs = null;								//创建结果集ResultSet
    		StringBuffer resultData = new StringBuffer();					//创建字符串resultData
    		String sSql = "select * from News order by NewsID desc";			//创建数据库查询sql语句
	    	rs = stmt.executeQuery(sSql);							//执行数据库查询
	    	resultData=Fun.ListNewsFront(resultData,rs,toPage,pageNum);			//获取返回分页结果
		rs.close();									//关闭结果集合
    		stmt.close();									//关闭连接状态
    		Conn.close();									//关闭数据库连接
    		return resultData.toString();							//返回页面resultData
    	}catch(Exception e)
        {
            return "No";									//出现异常，则返回No
        }
    }

	
	
	
	public String FrontNewsDetail(String id) {
		try {
			Connection Conn = DBConn.getConn();				//获取数据库的连接类
			Statement stmt = Conn.createStatement();			//创建数据库连接状态
			ResultSet rs = null;						//创建数据库结果集
			int NewsID = Fun.StrToInt(id);					//id值转int类型
			if (NewsID == 0)						//根据NewsID值进行逻辑判断
				return "No";						//若等于0，则返回No
			else {	
				try 	{
					//创建数据库的查询sql语句
					String sql = "select * from News where NewsID=" + NewsID;
					rs = stmt.executeQuery(sql);				//执行数据库查询
					StringBuffer sb = new StringBuffer();			//创建字符串sb		
					Fun.FrontNewsDetail(sb, rs);				//取出结果集，页面进行渲染
					rs.close();						//关闭数据库结果集
					stmt.close();						//关闭连接状态
					Conn.close();						//关闭数据库连接类
					return sb.toString();					//返回页面字符串sb
				} catch (Exception e) {
					Conn.rollback();					//出现错误，数据库回滚
					Conn.close();						//关闭数据库连接
					return "No";						//页面返回No，判断异常
				}
			}
		} catch (Exception e) {
			return "No";								//系统级别异常，也返回No
		}
	}





}
