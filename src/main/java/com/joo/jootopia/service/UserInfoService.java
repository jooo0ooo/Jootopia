package com.joo.jootopia.service;

import com.joo.jootopia.bean.UserInfo;
import com.joo.jootopia.mapper.UserInfoMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService {

	@Autowired
	UserInfoMapper mapper;

	public UserInfo getUserInfo() {
		return mapper.getUserInfo();
	}

}
