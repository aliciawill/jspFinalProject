package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	Connection con;

	public MemberDAO() {
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

	public void update(MemberDTO dto) {
		try {
			String sql = "update member set tel = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTel());
			ps.setString(2, dto.getId());
			System.out.print("3. SQL�� ����� ok...");
			ps.executeUpdate();
			System.out.print("4. SQL�� DB�� ���� ok...");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> list() {
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		//list�� ��� ���� �������.
		//�迭�� ����� �̸� ������ ����.
		//int[] num = new int[10];
		
		MemberDTO dto2 = null; 
		//������ ��ġ�� ������ ����� �� �ִ� ����!
		//select�޼ҵ� ������������ �� �� �ִ� ��������
		//�������� = local����
		
		try {
			String sql = "select * from member"; // �ش��ϴ� class�� ������� ������,
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				dto2 = new MemberDTO();
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				dto2.setId(id);
				dto2.setPw(pw);
				dto2.setName(name);
				dto2.setTel(tel);
				list.add(dto2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} //method
	
	public  MemberDTO select(MemberDTO dto) {
		MemberDTO dto2 = null; 
		//������ ��ġ�� ������ ����� �� �ִ� ����!
		//select�޼ҵ� ������������ �� �� �ִ� ��������
		//�������� = local����
		
		try {
			String sql = "select * from member where id = ?"; // �ش��ϴ� class�� ������� ������,
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				dto2 = new MemberDTO();
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				dto2.setId(id);
				dto2.setPw(pw);
				dto2.setName(name);
				dto2.setTel(tel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto2;
	} //method
	
	public  boolean check(MemberDTO dto) {
			boolean result = false;
		try {
			String sql = "select * from member where id = ? and pw = ?"; // �ش��ϴ� class�� ������� ������,
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	} //method

	public void insert(MemberDTO dto) {
		try {
			String sql = "insert into member values (?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getTel());
			System.out.println("3. SQL�� ����� ok...");
			ps.executeUpdate();
			System.out.println("4. SQL�� DB�� ���� ok...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(MemberDTO dto) {
		try {
			String sql = "delete from member where id = ?";
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
