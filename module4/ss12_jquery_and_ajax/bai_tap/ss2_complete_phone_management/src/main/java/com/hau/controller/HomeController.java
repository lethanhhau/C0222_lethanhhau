package com.hau.controller;

;
import com.hau.service.ISmartphoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @Autowired
    private ISmartphoneService smartphoneService;

    @GetMapping("/")
    public String showIndex() {
        return "/index";
    }
}