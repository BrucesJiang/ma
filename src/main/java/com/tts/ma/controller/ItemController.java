package com.tts.ma.controller;

import com.tts.ma.dto.ItemInfo;
import com.tts.ma.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/20 13:55
 * @Version
 */
@Controller
public class ItemController {
    @Autowired
    ItemService itemService;

    @RequestMapping(value = {"/all", "/index"})
    public ModelAndView getAll(HttpServletRequest request) {
        List<ItemInfo> itemInfos = itemService.getAllItems();
        ModelAndView modelAndView = new ModelAndView();
        request.getSession().setAttribute("list", itemInfos);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/audit")
    public ModelAndView aduit(HttpServletRequest request) {
        //String[] str = request.getParameterValues("check[]");
        String[] str = request.getParameterValues("IDCheck");
        System.out.println(str);
        for(int i = 0; i < str.length; i ++) {
            System.out.println(str[i]);
        }
        List<Integer> argList = new ArrayList<>();
        for(int i = 0; i < str.length; i ++) {
            argList.add(Integer.parseInt(str[i].trim()));
        }
        List<ItemInfo> itemInfos = itemService.getItems(argList);
        // 取远端数据

        //比较
        for(int i = 0; i < itemInfos.size(); i ++) {
            itemInfos.get(i).setState(true);
        }
        request.getSession().setAttribute("list", itemInfos);
        return new ModelAndView("index");
    }

    @RequestMapping("/detail")
    public void detail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String index = request.getParameter("index");
        ItemInfo item = itemService.getItemById(Integer.parseInt(index));
        request.setAttribute("item", item);
        response.getWriter().write("{'status': 200}");
    }
}
