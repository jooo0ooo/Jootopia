package com.joo.jootopia;

import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.mybatis.spring.annotation.MapperScan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.joo.jootopia.mapper")
public class JootopiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(JootopiaApplication.class, args);
	}

	@PostConstruct
    void started() {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
	}

}
