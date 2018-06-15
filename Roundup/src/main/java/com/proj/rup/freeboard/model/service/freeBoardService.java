package com.proj.rup.freeboard.model.service;

import java.util.List;

import com.proj.rup.freeboard.model.vo.FreeBoard;
import com.proj.rup.freeboard.model.vo.FreeBoardFile;

public interface freeBoardService {

	List<FreeBoard> selectfreeBoardList(int cPage, int numPerPage);

	int selectfreeBoardListCount();

	FreeBoard selectfreeBoardOne(int no);

	List<FreeBoardFile> selectfreeBoardFileList(int no);

}
