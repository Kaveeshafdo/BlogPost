
public class Member {
  
	private String name, email, pass, rePass;
	
	public Member() {	
		super();
	}
	
	public Member(String name, String email, String pass, String rePass) {
		super();
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.rePass = rePass;
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getRePass() {
		return rePass;
	}
	public void setRePass(String rePass) {
		this.rePass = rePass;
	}
	
	
}
