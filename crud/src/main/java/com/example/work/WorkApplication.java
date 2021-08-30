package com.example.work;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class WorkApplication {

	public static void main(String[] args) {
		SpringApplication.run(WorkApplication.class, args);
	}
	
	 @Bean
	 public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
		 HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
	     return filter;
	 }

}
