package kr.co.cc.work.dao;



import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;

import kr.co.cc.work.dto.WorkDTO;

public interface WorkDAO {

	ArrayList<WorkDTO> workHistoryList(String id);

	int timeGoBefore(String id, String date);

	String findName(String id);
	
	void timeGo(String id, String name);

	void timeEnd(String id, String date, String time);

	int WorkChangeRequestChk(String id, String type);

	void WorkChangeRequest(HashMap<String, String> params);

	ArrayList<WorkDTO> workHistoryReqListGo(String id);

	ArrayList<WorkDTO> workHistoryList_Ad();

	int WorkChangeAdmin(String working_hour_id, String type, int approval);

	int WorkChangeAdminChk(String working_hour_id, String type);

	int workHistoryChange_go(String working_hour_id, Time update_time);

	int workHistoryChange_end(String working_hour_id, Time update_time);

	ArrayList<WorkDTO> workDailyList();

	ArrayList<WorkDTO> dailyListFind(String formattedDate);

	ArrayList<WorkDTO> weekListFind(String week);

	String dayChk(String week);

	void workWorn(HashMap<String, Object> params);

	int workWornChk(String member_id, String weekRe);
	
	

	ArrayList<WorkDTO> workWornList();

	ArrayList<WorkDTO> wornAllList();

	ArrayList<WorkDTO> wornListFindName(String wornFind1, String wornFind2);
	
	ArrayList<WorkDTO> wornListFindId(String wornFind1, String wornFind2);

	void wornDel(String member_id, String week);

	ArrayList<WorkDTO> leave_recode_List(String id);
	
	WorkDTO annual_leave(String id);

	void annualRegistration(String regist_id, String approval_id, String start_date, String end_date, String use_cnt,
			String reason, String type);

	ArrayList<WorkDTO> annualRegistrationGo();

	ArrayList<WorkDTO> workHolidayList_Ad();

	ArrayList<WorkDTO> holidayListFind(String holidayList);







}
