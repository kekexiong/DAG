package com.demo;

import com.github.pagehelper.PageHelper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.Properties;


@SpringBootApplication
@MapperScan("com.demo.dao")
public class Startup{




    public static void main(String[] args) {
        SpringApplication.run(Startup.class, args);
    }


}
