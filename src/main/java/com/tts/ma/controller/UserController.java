package com.tts.ma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/20 13:41
 * @Version
 */
@Controller
public class UserController {
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        return "index";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request) {
        return "login";
    }
}
