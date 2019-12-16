package com.joo.jootopia.controller;

import com.joo.jootopia.bean.UserInfo;
import com.joo.jootopia.service.UserInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @Autowired
    UserInfoService userInfoService;

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("main");
        mav.addObject("pageName", "Welcome to Jootopia");
        return mav;
    }

    @GetMapping("/main")
    public ModelAndView main() {
        ModelAndView mav = new ModelAndView("root");
        mav.addObject("pageName", "main");
        return mav;
    }

    @GetMapping("test/{name:[todo|main|movie|page1]}")
    public ModelAndView test(@PathVariable String name) {
        ModelAndView mav = new ModelAndView("root");
        mav.addObject("pageName", name);
        return mav;
    }

    @GetMapping("/todo")
    public ModelAndView todo() {
        ModelAndView mav = new ModelAndView("root");
        mav.addObject("pageName", "todo");
        return mav;
    }

    @GetMapping("/movie")
    public ModelAndView movie() {
        ModelAndView mav = new ModelAndView("root");
        mav.addObject("pageName", "movie");
        return mav;
    }

    @GetMapping("/get_name")
    @ResponseBody
    public UserInfo user() {
        return userInfoService.getUserInfo();
    }

}