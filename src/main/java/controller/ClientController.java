package controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ClientDAO;
import entity.Client;

@Controller
public class ClientController {

	@Autowired
	ClientDAO clientDAO;

	LocalDateTime now = LocalDateTime.now();
	private String maxDate = now.getMonthValue() < 10 ? now.getYear() + "-0" + now.getMonthValue() + "-" + now.getDayOfMonth() + "" :
		now.getYear() + "-" + now.getMonthValue() + "-" + now.getDayOfMonth() + "";
	
	@RequestMapping("/")
	public String Client(Model model) {
		model.addAttribute("command", new Client());
		List<Client> list = clientDAO.getClients();
		model.addAttribute("listClient", list);
		model.addAttribute("maxDate", maxDate);
		
		return "user/client";
	}

	@RequestMapping(value = "/createclient", method = RequestMethod.GET)
	public String createClient(Model model) {
				
		model.addAttribute("command", new Client());
		model.addAttribute("maxDate", maxDate);
		return "user/createclient";
	}

	
	@RequestMapping(value = "/saveclient", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded; charser=UTF-8")
	public String saveClient(@ModelAttribute("client") Client client, Model model) {	
		
		model.addAttribute("command", client);
		System.out.println(client);
		if (!validateForm(client)) {
			model.addAttribute("errorMessage", "Wrong data type!");			
			model.addAttribute("maxDate", maxDate);
			System.out.println("Insert failed because wrong data type");
			return "user/createclient";    			
		}
		
		if (clientDAO.getClientByID(client.getClientID()) != null) {
			model.addAttribute("errorMessage", "Existing ID number!");
			model.addAttribute("command", client);
			model.addAttribute("maxDate", maxDate);
			return "user/createclient";    
		}
		else {					
			clientDAO.addClient(client);
			return "redirect:/";    
		}
	}
	
	@RequestMapping(value = "/updateclient", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded; charser=UTF-8")
	public String updateClient(@ModelAttribute("client") Client client, Model model) {	
		
		System.out.println(client);
		if (clientDAO.getClientByID(client.getClientID()) != null) {		
			System.out.println(clientDAO.updateClient(client));					 
		}
		return "redirect:/";    
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
	
	public boolean validateForm(Client client) {
		if (client.getClientID().contains(" "))
				return false;
		
		return true;
	}
	
}
