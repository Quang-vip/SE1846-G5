/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Long
 */
import model.*;
import java.util.ArrayList;
import java.util.List;

public class WorkerDAO extends MyDAO {

    public List<Worker> getWorkers() {
        String sql = "SELECT * FROM Worker";
        List<Worker> workerList = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int workerID = rs.getInt("workerID");
                int userID = rs.getInt("userID");
                double baseSalary = rs.getDouble("base_salary");
                double salaryMultiplier = rs.getDouble("salary_multi");
                String job = rs.getString("job");

                Worker worker = new Worker(workerID, userID, baseSalary, salaryMultiplier, job);
                workerList.add(worker);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return workerList;
    }
}
