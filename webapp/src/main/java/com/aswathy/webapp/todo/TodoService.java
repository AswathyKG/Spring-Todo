package com.aswathy.webapp.todo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

import org.eclipse.jdt.internal.compiler.env.IUpdatableModule.UpdateKind;
import org.springframework.stereotype.Service;

import jakarta.validation.Valid;

@Service
public class TodoService {
	
	private static int taskCount = 0;
	
	private static List<Todo> todos = new ArrayList<>();
	static {
		todos.add(new Todo(++taskCount,"Learn Java 1","Core java",LocalDate.now().plusMonths(3),false));
		todos.add(new Todo(++taskCount,"Learn Java 1","Advanced java",LocalDate.now().plusMonths(4),false));
		todos.add(new Todo(++taskCount,"Learn SpringBoot","Basics",LocalDate.now().plusMonths(4),false));
		todos.add(new Todo(++taskCount,"Learn Swift","Basics",LocalDate.now().plusMonths(4),false));
		todos.add(new Todo(++taskCount,"practice SpringBoot","Basics",LocalDate.now().plusMonths(4),false));
		todos.add(new Todo(++taskCount,"practice Java","Basics",LocalDate.now().plusMonths(4),false));
		todos.add(new Todo(++taskCount,"Learn Python","Basics",LocalDate.now().plusMonths(4),false));
	}
	
	public List<Todo> findByUsername(String username){
		return todos;
	}
	
	//add new row to table
	public void addTodo(String task,String description,LocalDate taretDate,boolean status ) {
		Todo todo= new Todo(++taskCount, task, description, taretDate, status);
		todos.add(todo);
	}
	
	//delete a row by id
	public void deleteById(int id) {
		Predicate<? super Todo> predicate = todos -> todos.getId() == id;
		todos.removeIf(predicate);
	}

//	UpdateKind todo by id
	public Todo findById(int id) {
		Predicate<? super Todo> predicate = todos -> todos.getId() == id;
		Todo todo=todos.stream().filter(predicate).findFirst().get();
		return todo;
	}

	public void updateTodo(@Valid Todo todo) {
		deleteById(todo.getId());
		todos.add(todo);
	}
}
