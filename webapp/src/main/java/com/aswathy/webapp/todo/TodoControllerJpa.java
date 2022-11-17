 package com.aswathy.webapp.todo;

import java.time.LocalDate;
import java.util.List;

import org.apache.catalina.filters.AddDefaultCharsetFilter;
import org.eclipse.jdt.internal.compiler.env.IUpdatableModule.UpdateKind;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.service.annotation.DeleteExchange;

import jakarta.validation.Valid;

@Controller
@SessionAttributes("name")
public class TodoControllerJpa {

	private TodoService todoService;
	private TodoRepository todoRepository;
	
	public TodoControllerJpa(TodoService todoSevice,TodoRepository todoRepository) {
		super();
		this.todoService = todoSevice;
		this.todoRepository = todoRepository;
	}


//	list todo
	@RequestMapping("list-todos")
	public String listAllTodos(ModelMap model) {
		String username =getLoggedInUsername(model);
		List<Todo> todos = todoRepository.findAll();
		model.addAttribute("todos", todos);
		
		return "listTodos";
	}

	
//	 add new todo task page | GET & POST
	@RequestMapping(value="add-todos", method = RequestMethod.GET)
	public String newTodoPage(ModelMap modelMap) {
		Todo todo = new Todo(0, "","", LocalDate.now().plusMonths(3), false);
		modelMap.put("todo", todo);
		return "todo";
	}
	
	@RequestMapping(value="add-todos",method = RequestMethod.POST)
	public String addTodo(ModelMap model,@Valid Todo todo, BindingResult result) {
		if(result.hasErrors()) {
			return "todo";
		}
		todoService.addTodo(todo.getTask(), todo.getDescription(), todo.getTargetDate(), false);
		
		return "redirect:list-todos";
	}
	
//	delete todo task by id
	@RequestMapping("delete-todo")
	public String deleteTodo(@RequestParam int id) {
		todoService.deleteById(id);
		return "redirect:list-todos";
	}
	
//	show update todo page with prefilled data by id
	@RequestMapping(value="update-todo",method = RequestMethod.GET)
	public String showUpdateTodo(@RequestParam int id, ModelMap model) {
		Todo todo = todoService.findById(id);
		model.addAttribute("todo",todo);
		return "todo";
	}
	
	@RequestMapping(value="update-todo",method = RequestMethod.POST)
	public String updatTodo(ModelMap model,@Valid Todo todo, BindingResult result) {
		if(result.hasErrors()) {
			return "todo";
		}
		todoService.updateTodo(todo);
		
		return "redirect:list-todos";
	}

	
	private String getLoggedInUsername(ModelMap model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		authentication.getName();
		return authentication.getName();
	}
	
}
