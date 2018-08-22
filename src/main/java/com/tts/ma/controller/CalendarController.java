package com.tts.ma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/22 16:45
 * @Version
 */
@Controller
public class CalendarController {
    @RequestMapping("/calendar")
    public String index() {
        return "calendar";
    }
}
