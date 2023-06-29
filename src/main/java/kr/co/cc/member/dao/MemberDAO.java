package kr.co.cc.member.dao;

import java.util.HashMap;

import kr.co.cc.member.dto.MemberDTO;


public interface MemberDAO {

	int join(MemberDTO dto);

	String login(HashMap<String, String> params);

	int idChk(String id);
	
	MemberDTO getUserInfo(HashMap<String, String> params);
	
	MemberDTO getUserInfoPW(HashMap<String, String> params);

	MemberDTO userInfo(Object attribute);

}
