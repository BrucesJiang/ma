package com.tts.ma.controller;

import com.tts.ma.contract.ct.UserContractService;
import com.tts.ma.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    UserContractService userContractService;
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Boolean re = false;
        try{
            re = userContractService.login(username, password);

        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(!re) { //登陆失败
                return "login";
            }else {
                return "index";
            }
        }
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Boolean re = false;
        try{
            re = userContractService.register("" ,username, password);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(re) //注册成功
                return "login";
            else //注册失败
                return "login";
        }
    }
}
