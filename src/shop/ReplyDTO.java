package shop;

public class ReplyDTO {
	private String id;
	private String bbsid;
	private String content;
	private String writer;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBbsid() {
		return bbsid;
	}
	public void setBbsid(String bbsid) {
		this.bbsid = bbsid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
