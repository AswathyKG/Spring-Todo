package com.aswathy.webapp.todo;

import java.time.LocalDate;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Size;

public class Todo {

	private int id;
	@Size(min=5, message ="Enter atleast 5 alphabets")
	private String task;
	@Size(min=10, message="Enter atleast 10 alphabets")
	private String description;
//	@FutureOrPresent()
	private LocalDate targetDate;
	private boolean status;
	
//	constructor
	public Todo(int id, String task, String description, LocalDate targetDate, boolean status) {
		super();
		this.id = id;
		this.task = task;
		this.description = description;
		this.targetDate = targetDate;
		this.status = status;
	}

//	getter & setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(LocalDate targetDate) {
		this.targetDate = targetDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

//	convert to string
	@Override
	public String toString() {
		return "Todo [id=" + id + ", task=" + task + ", description=" + description + ", targetDate=" + targetDate
				+ ", status=" + status + "]";
	}
	
	
	
}
