package kr.co.cc.noticeBoard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.cc.archive.dto.ArchiveDTO;
import kr.co.cc.noticeBoard.dto.NoticeBoardDTO;
import kr.co.cc.noticeBoard.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
   @Autowired NoticeBoardService service;
   @Value("${spring.servlet.multipart.location}") private String root;
   
   
//   @RequestMapping(value="/noticeBoardList.go")
//   public String noticeBoardList(){
//      return "noticeBoardList";
//   
//   }
   
   @RequestMapping(value="/noticeBoard.go")
   public ModelAndView noticeBoard(){
	   logger.info("list");
		ModelAndView mav = new ModelAndView("noticeBoardList") ;
	
			ArrayList<NoticeBoardDTO> list = service.nolist();
			logger.info("list cnt" + list.size());
			mav.addObject("list", list);
			
		return mav;
         
   }
   
   @RequestMapping(value = "/noticeBoardWrite.go")
   public ModelAndView writeForm() {
         
	   return new ModelAndView("noticeBoardWriteForm");
   }
   

   
   @RequestMapping(value = "/noticeBoardWrite.do", method = RequestMethod.POST)
   public String nowrite(MultipartFile file, @RequestParam HashMap<String, String> params, HttpSession session) {
   
     logger.info("params : " + params);
     logger.info("파일 : "+file);
 
      return service.nowrite(file, params,session);
   }
   
   @RequestMapping(value="/noticeBoardDetail.do")
   public String nodetail(Model model, @RequestParam String id){
      
      logger.info("nodetail : "+id);
      
      NoticeBoardDTO detailno = service.archivedetail(Integer.parseInt(id), "detail");
		String page = "redirect:/msSendList.go";
		
		if(detailno != null) {
			
			logger.info("if문 진입");
			String detailfile = service.noDetailFile(Integer.parseInt(id));
			
			logger.info("detailFile :"+detailfile);
			
			page = "noticeBoardDetail";
			model.addAttribute("detailno", detailno);
			model.addAttribute("detailFile", detailfile);
			
		}	
		return page;
}
   
//   @RequestMapping(value="/noticeBoardDetail.do")
//   public String noDetail(Model model, @RequestParam String id) {
//      
//      logger.info("detail : "+id);
//      
//      NoticeBoardDTO detailno = service.nodetail(Integer.parseInt(id), "detail");
//      String page = "redirect:/msSendList.go";
//      
//      if(detailno != null) {
//         
//         logger.info("if문 진입");
//         String detailfile = service.noDetailFile(Integer.parseInt(id));
//         
//         logger.info("detailFile :"+detailfile);
//         
//         page = "noticeBoardDetail"; 
//         model.addAttribute("detailno", detailno);
//         model.addAttribute("detailFile", detailfile);
//         
//      }
//      
//      return page;
//   }
   
   @RequestMapping(value="/noticeBoardDel.do", method=RequestMethod.GET)
   public ModelAndView del(@RequestParam String id) {
      
      ModelAndView mav = new ModelAndView("noticeBoard") ;

         logger.info("delete id : "+id);         
         
         if(service.del(id) > 0) {
         mav.setView(new RedirectView("noticeBoard.go"));
      }      

      return mav;
   }
   
//   // 읽사
//   
//   @RequestMapping(value="/noticeList.go")
//   public String nList(Model model) {      
//      logger.info("start");
//      
//      ArrayList<NoticeBoardDTO> list = service.nlist();
//       model.addAttribute("list", list);
//      
//      return "noticeList";
//   }

        
}