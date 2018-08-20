package com.tts.ma.service;

import com.tts.ma.dto.ItemInfo;

import java.util.List;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/20 13:58
 * @Version
 */
public interface ItemService {
    public List<ItemInfo> getAllItems() ;

    public List<ItemInfo> getItems(List<Integer> idx);

    public ItemInfo getItemById(int index);


    public int getTotoalNum() ;
}
