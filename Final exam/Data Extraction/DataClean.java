package dataclean;

import java.util.ArrayList;
import java.util.Map;
import org.jblas.DoubleMatrix;
import org.json.JSONObject;


public class DataClean {
    public static void main(String[] args) 
    {
        clean obj = new clean();
        String path = "CandidateProfileData/";

        //String data = obj.readFile("single_can.txt");
        //JSONObject can = new JSONObject(data);
        
        String job = obj.getData(can, "Job-Title", 0);
        System.out.println(job);
        
        String files[] = new String[]{"Job-Title","Company","Skills"};
        obj.generateCSV(files, can);
        ArrayList<String> job = obj.generateSeperator("Job-Title", can);
        ArrayList<String> company = obj.generateSeperator("Company", can);
        ArrayList<String> skill = obj.generateSeperator("Skills", can);
        boolean[][] jobTitleMat = obj.generateMatrix(job, files[0], can);
        boolean[][] companyMat = obj.generateMatrix(company, files[1], can);
        boolean[][] skillMat = obj.generateMatrix(skill, files[2], can);
        
        System.out.println("temp");
        obj.generateCSVfrom2d(jobTitleMat, "jobTitleMat.casv");
        obj.generateCSVfrom2d(companyMat, "CompanyMat.csv");
        obj.generateCSVfrom2d(skillMat, "skillsMat.csv");
        
        
        String jobTitleCSV = 
        obj.saveFile(jobTitleCSV, "jobTitleMat.csv");
        System.out.println("job done");
        String companyCSV = obj.generateCSVfrom2d(companyMat);
        obj.saveFile(companyCSV, "companyMat.csv");
        System.out.println("company done");
        String skillCSV = obj.generateCSVfrom2d(skillMat);
        obj.saveFile(skillCSV, "skills.csv");
        System.out.println("skills done");
       
        
    }
}
