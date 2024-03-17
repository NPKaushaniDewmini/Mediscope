package com.mediscoop.model;

public class Appointment {
	private int appID;
	private int patientID;
	private int doctorID;
	private String diseases;
	private String appDate;
	private String amount;
	
	public Appointment(int appID, int patientID, int doctorID, String diseases, String appDate, String amount) {
		this.appID = appID;
		this.patientID = patientID;
		this.doctorID = doctorID;
		this.diseases = diseases;
		this.appDate = appDate;
		this.amount = amount;
	}

	public int getAppID() {
		return appID;
	}

	public void setAppID(int appID) {
		this.appID = appID;
	}

	public int getPatientID() {
		return patientID;
	}

	public void setPatientID(int patientID) {
		this.patientID = patientID;
	}

	public int getDoctorID() {
		return doctorID;
	}

	public void setDoctorID(int doctorID) {
		this.doctorID = doctorID;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	
	
	
}
