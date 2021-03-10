package controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ClientDAO;
import entity.Client;

@Controller
public class ClientController {

	@Autowired
	ClientDAO clientDAO;
	
	@RequestMapping("/")
	public String Index() {
		List<Client> list = clientDAO.getClients();
	
		 Calendar calendar = Calendar.getInstance();
		   calendar.set(Calendar.YEAR, 2015);
		   calendar.set(Calendar.MONTH, 4);
		   calendar.set(Calendar.DATE, 28);
		   Date date = calendar.getTime();
		System.out.println(clientDAO.updateClient(new Client("5", "2", "3000", "4", date , "2", "3", "4")));
		return "user/index";
	}
}
