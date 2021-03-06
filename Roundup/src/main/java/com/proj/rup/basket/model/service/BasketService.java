package com.proj.rup.basket.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.basket.model.vo.Basket;
import com.proj.rup.basket.model.vo.BasketProduct;

public interface BasketService {

	List<BasketProduct> selectBasketList(String memberId);

	int deleteBasket(int basketNo);

	int updateBasket(Map<String, Integer> map);

	int insertBasket(Map<String, Object> map);

}
