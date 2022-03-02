package Model;

public class Author {
	private int id;
	private String name;
	private String gender;
	private String information;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	
	public Author() {
		
	}
	
	public Author(int id,String name,String gender,String inf) {
		this.id=id;
		this.name = name;
		this.gender = gender;
		this.information = inf;
	}
	
	public Author(String name,String gender,String inf) {
		this.name = name;
		this.gender = gender;
		this.information = inf;
	}

}
