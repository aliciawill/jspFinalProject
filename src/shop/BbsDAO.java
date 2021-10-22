package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {
	Connection con;

	public BbsDAO() {
		try {
			// 1.�ٿ�ε� �޾Ҵ� connector����
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1.connector���� ok..");

			// 2.�������� ����� ������ �̿��ؼ� ����
			String url = "jdbc:mysql://localhost:3306/shop8";
			String user = "root";
			String password = "1234";
			con = DriverManager.getConnection(url, user, password);
			System.out.println("2.db���� ok.. ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(BbsDTO dto) {
		try {
			String sql = "update bbs set title = ?, content = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getId());
			System.out.print("3. SQL�� ����� ok...");
			ps.executeUpdate();
			System.out.print("4. SQL�� DB�� ���� ok...");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BbsDTO> list() {
		
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		//list�� ��� ���� �������.
		//�迭�� ����� �̸� ������ ����.
		//int[] num = new int[10];
		
		BbsDTO dto2 = null; 
		//������ ��ġ�� ������ ����� �� �ִ� ����!
		//select�޼ҵ� ������������ �� �� �ִ� ��������
		//�������� = local����
		
		try {
			String sql = "select * from bbs order by id desc"; // �ش��ϴ� class�� ������� ������,
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				dto2 = new BbsDTO();
				String id = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				dto2.setId(id);
				dto2.setTitle(title);
				dto2.setContent(content);
				dto2.setWriter(writer);
				list.add(dto2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} //method
	
	public  BbsDTO select(BbsDTO dto) {
		BbsDTO dto2 = null; 
		//������ ��ġ�� ������ ����� �� �ִ� ����!
		//select�޼ҵ� ������������ �� �� �ִ� ��������
		//�������� = local����
		
		try {
			String sql = "select * from bbs where id = ?"; // �ش��ϴ� class�� ������� ������,
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				dto2 = new BbsDTO();
				String id = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				dto2.setId(id);
				dto2.setTitle(title);
				dto2.setContent(content);
				dto2.setWriter(writer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto2;
	} //method

	public void insert(BbsDTO dto) {
		try {
			String sql = "insert into bbs(title, content, writer) values (?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getWriter());
			System.out.println("3. SQL�� ����� ok...");
			ps.executeUpdate();
			System.out.println("4. SQL�� DB�� ���� ok...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(BbsDTO dto) {
		try {
			System.out.println(dto.getId());
			String sql = "delete from bbs where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			System.out.println("3. SQL�� ����� ok...");

			ps.executeUpdate();
			System.out.println("4. SQL�� DB�� ���� ok...");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
