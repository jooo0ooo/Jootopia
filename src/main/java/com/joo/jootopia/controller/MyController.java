package com.joo.jootopia.controller;

import com.joo.jootopia.bean.UserInfo;
import com.joo.jootopia.service.UserInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {

    @Autowired
    UserInfoService userInfoService;

    @GetMapping("/main/{name}")
    public String page(@PathVariable String name, Model model) {
        model.addAttribute("pageName", name);
        return "page";
    }

    @GetMapping("/get_name")
    @ResponseBody
    public UserInfo user() {
        return userInfoService.getUserInfo();
    }

}