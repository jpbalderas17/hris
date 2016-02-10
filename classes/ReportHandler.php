<?php
class ReportHandler{
	public function handleReport($request){
		if(!empty($request['id'])){
			$report = new Report();
			$report->Load("id = ?",array($request['id']));
			if($report->id."" == $request['id']){
				
				if($report->type == 'Query'){
					$where = $this->buildQueryOmmit(json_decode($report->paramOrder,true), $request);
					$query = str_replace("_where_", $where[0], $report->query);
					return $this->executeReport($report,$query,$where[1]);
				}else if($report->type == 'Class'){
					$className = $report->query;
					include MODULE_PATH.'/reportClasses/ReportBuilder.php';
					include MODULE_PATH.'/reportClasses/'.$className.".php";
					$cls = new $className();
					$data = $cls->getData($report,$request);
					return $this->generateReport($report,$data);
				}
			}else{
				return array("ERROR","Report id not found");
			}
		}		
	}
	
	
	private function executeReport($report,$query,$parameters){
		
		$report->DB()->SetFetchMode(ADODB_FETCH_ASSOC);
		$rs = $report->DB()->Execute($query,$parameters);
		if(!$rs){
			LogManager::getInstance()->info($report->DB()->ErrorMsg());
			return array("ERROR","Error generating report");
		}
		
		$reportNamesFilled = false;
		$columnNames = array();
		$reportData = array();
		foreach ($rs as $rowId => $row) {
			$reportData[] = array();
			if(!$reportNamesFilled){
				foreach ($row as $name=> $value){
					$columnNames[] = $name;
					$reportData[count($reportData)-1][] = $value;
				}
				$reportNamesFilled = true;
			}else{
				foreach ($row as $name=> $value){
					$reportData[count($reportData)-1][] = $value;
				}
			}
		}
		
		
		array_unshift($reportData,$columnNames);
		
		return $this->generateReport($report, $reportData);
		
		
	}
	
	private function generateReport($report, $data){
		

		$fileFirst = "Report_".str_replace(" ", "_", $report->name)."-".date("Y-m-d_H-i-s");
		$file = $fileFirst.".csv";
		

		
		if($report->query=="EmployeeAttendanceReport"){
			//echo MODULE_PATH.'\reportClasses\xlswriter.class.php';
			$file=$fileFirst.".xlsx";
			require_once APP_BASE_PATH.'\classes\PHPExcel.php';

			$objPHPExcel = new PHPExcel();
			$objPHPExcel->getProperties()->setCreator("HRIS SGTSI")
							 ->setTitle("Employee Attendance");
			$objPHPExcel->setActiveSheetIndex(0);
			$objPHPExcel->getActiveSheet()->setTitle('Sheet1');
			$objPHPExcel->getActiveSheet()->setCellValue('A1','Employee ID');
			$objPHPExcel->getActiveSheet()->setCellValue('B1',$data[1][0]);

			$objPHPExcel->getActiveSheet()->setCellValue('A2','Name');
			$objPHPExcel->getActiveSheet()->setCellValue('B2',$data[1][1]);

			$objPHPExcel->getActiveSheet()->setCellValue('A3','From '.date("M d, Y",strtotime($_REQUEST['date_start'])));
			$objPHPExcel->getActiveSheet()->setCellValue('B3','To '.date("M d, Y",strtotime($_REQUEST['date_end'])));

			$objPHPExcel->getActiveSheet()->setCellValue('A4','Date');
			$objPHPExcel->getActiveSheet()->setCellValue('B4','Time In');
			$objPHPExcel->getActiveSheet()->setCellValue('C4','Time Out');
			$objPHPExcel->getActiveSheet()->setCellValue('D4','Notes');

			$column=5;
			foreach ($data as $key=>$row) {
				if ($key<>0){
				//echo PHPExcel_Shared_Date::PHPToExcel( strtotime($row[2]) ).",".strtotime($row[2])." <br/> ";
					//echo "<br/>".PHPExcel_Shared_Date::PHPToExcel( strtotime($row[2]) );
				$objPHPExcel->getActiveSheet()->setCellValue('A'.$column,PHPExcel_Shared_Date::PHPToExcel( strtotime($row[2]) ));
				$objPHPExcel->getActiveSheet()->getStyle('A'.$column)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_YYYYMMDD2);

				$objPHPExcel->getActiveSheet()->setCellValue('B'.$column,PHPExcel_Shared_Date::PHPToExcel( strtotime($row[2]) ));
				$objPHPExcel->getActiveSheet()->getStyle('B'.$column)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_TIME1);

				$objPHPExcel->getActiveSheet()->setCellValue('C'.$column,PHPExcel_Shared_Date::PHPToExcel( strtotime($row[3]) ));
				$objPHPExcel->getActiveSheet()->getStyle('C'.$column)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_DATE_TIME1);

				$objPHPExcel->getActiveSheet()->setCellValue('D'.$column,$row[4]);
				$column++;
				}
			}


			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
			$objWriter->save(CLIENT_BASE_PATH.'data/'.$file);

			// require_once MODULE_PATH.'\reportClasses\xlsxwriter.class.php';
			// $file=$fileFirst.".xlsx";
			// $writer=new XLSXWriter();
			// $writer->setAuthor('SPARK HRIS');
			// $writer->writeSheetRow('Sheet1',array('Employee ID',$data[1][0]));
			// $writer->writeSheetRow('Sheet1',array('Name',$data[1][1]));
			// $writer->writeSheetRow('Sheet1',array('From '.date("M d, Y",strtotime($_REQUEST['date_start'])),'To '.date("M d, Y",strtotime($_REQUEST['date_end']))));
			// $writer->writeSheetRow('Sheet1',array('Date','Tme IN','TimeOUT','Notes'));
			
			// // $sheetdata=array();
			// // $sheetdata[]=array('Employee ID',$data[1][0]);
			// // $sheetdata[]=array('Name',$data[1][1]));
			// //$sheetdata[]=array('From '.date("M d, Y",strtotime($_REQUEST['date_start'])),'To '.date("M d, Y",strtotime($_REQUEST['date_end'])));
			// //$sheetdata[]=array('Date','Tme IN','TimeOUT','Notes');
			// foreach ($data as $key=>$fields) {
			// 	if ($key<>0){
			// 		$row=array();
			// 		// $row[]=date("n/d/Y",strtotime($fields[2]));
			// 		// $row[]=date("g:i A",strtotime($fields[2]));
			// 		// $row[]=date("g:i A",strtotime($fields[3]));
			// 		$d1=new DateTime($fields[2]);
			// 		$d2=new DateTime($fields[2]);
			// 		$d3=new DateTime($fields[3]);

			// 		$row[]=$d1->format('n/d/Y');
			// 		$row[]=$d2->format('g:i A');
			// 		$row[]=$d3->format('g:i A');
			// 		$row[]=$fields[4];
			// 		$writer->MywriteSheetRow('Sheet1',$row);
			// 	}
				
			// }
			// $writer->writeToFile( CLIENT_BASE_PATH.'data/'.$file);
		}
		else{
			
			$fileName = CLIENT_BASE_PATH.'data/'.$file;
			$fp = fopen($fileName, 'w');

			foreach ($data as $fields) {
				fputcsv($fp, $fields);
			}
				
			fclose($fp);
		}
		

		
		$uploadedToS3 = false;
		
		$uploadFilesToS3 = SettingsManager::getInstance()->getSetting("Files: Upload Files to S3");
		$uploadFilesToS3Key = SettingsManager::getInstance()->getSetting("Files: Amazon S3 Key for File Upload");
		$uploadFilesToS3Secret = SettingsManager::getInstance()->getSetting("Files: Amazone S3 Secret for File Upload");
		$s3Bucket = SettingsManager::getInstance()->getSetting("Files: S3 Bucket");
		$s3WebUrl = SettingsManager::getInstance()->getSetting("Files: S3 Web Url");
		
		if($uploadFilesToS3.'' == '1' && !empty($uploadFilesToS3Key) 
			&& !empty($uploadFilesToS3Secret) && !empty($s3Bucket) && !empty($s3WebUrl)){
			
			$uploadname = CLIENT_NAME."/".$file;
			$s3FileSys = new S3FileSystem($uploadFilesToS3Key, $uploadFilesToS3Secret);
			$res = $s3FileSys->putObject($s3Bucket, $uploadname, $fileName, 'authenticated-read');
			
			if(empty($res)){
				return array("ERROR",$file);
			}
			
			unlink($fileName);
			$file_url = $s3WebUrl.$uploadname;
			$file_url = $s3FileSys->generateExpiringURL($file_url);
			$uploadedToS3 = true;
		}
		
		
		
		$fileObj = new File();
		$fileObj->name = $fileFirst;
		$fileObj->filename = $file;
		$fileObj->file_group = "Report";
		$ok = $fileObj->Save();
		
		if(!$ok){
			LogManager::getInstance()->info($fileObj->ErrorMsg());
			return array("ERROR","Error generating report");
		}
		
		$headers = array_shift($data);
		if($uploadedToS3){
			return array("SUCCESS",array($file_url,$headers,$data));
		}else{
			return array("SUCCESS",array($file,$headers,$data));
		}
		
	}
	
	private function buildQueryOmmit($names, $params){
		$parameters = array();
		$query = "";
		foreach($names as $name){
			if($params[$name] != "NULL"){
				if($query != ""){
					$query.=" AND ";
				}
				$query.=$name." = ?";
				$parameters[] = $params[$name];
			}	
		}
		
		if($query != ""){
			$query = "where ".$query;
		}
		
		return array($query, $parameters);
	}
}