package com.patrickhub.fitnessshop.bean;



public class Address {
	
	private int id;
	private String street;
	private String zipCode;
	private String city;
	private String country;
	private String status;
	
	public Address() {}
	
	public Address(String street, String zipCode, String city, String country, String status) {
		super();
		this.street = street;
		this.zipCode = zipCode;
		this.city = city;
		this.country = country;
		this.status = status;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public static enum Status  {
		PRINCIPALE("principale"),
		SECONDARY("secondary");
		
		
		private final String status;
		
		/**
		 * private constructor.
		 * 
		 * @param status
		 */
		private Status(final String status) {
			this.status = status;
		}
		
		@Override
		public String toString() {
			return status;
		}
	}	
	
}
