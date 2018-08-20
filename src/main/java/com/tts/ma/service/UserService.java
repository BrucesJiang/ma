package com.tts.ma.service;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/20 22:32
 * @Version
 */
public interface UserService {
    public void register(String username, String password);
    public void login(String username, String password);
}
