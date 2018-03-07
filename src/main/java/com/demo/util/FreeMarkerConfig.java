package com.demo.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Map;

/**
 * @program: spring-boot-demo
 * @description:
 * @author: hu_pf@suixingpay.com
 * @create: 2018-03-01 14:24
 **/
@org.springframework.context.annotation.Configuration
public class FreeMarkerConfig {
    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    @Bean
    public Configuration getFreeMarkerConfiguration(){
        return freeMarkerConfigurer.getConfiguration();
    }

    public void resolveMap(Map<String,String> model, String templateName){
        try {
            Template template = this.getFreeMarkerConfiguration().getTemplate(templateName);
            template.process(model, new OutputStreamWriter(System.out));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
