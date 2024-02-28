/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.machinelearn.indiaprediction;

import CricPrediction.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dmg.pmml.FieldName;
import org.dmg.pmml.MiningModel;
import org.dmg.pmml.PMML;
import org.jpmml.evaluator.FieldValue;
import org.jpmml.evaluator.MiningModelEvaluator;
import org.jpmml.evaluator.ModelEvaluator;
import org.jpmml.evaluator.ProbabilityDistribution;
import org.jpmml.model.ImportFilter;
import org.jpmml.model.JAXBUtil;
import org.xml.sax.InputSource;
import javax.xml.transform.sax.SAXSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.JAXBException;
import org.xml.sax.SAXException;

/**
 *
 * @author Beast
 */
public class RandomForestPredictor extends HttpServlet {

    static Logger logger = Logger.getLogger(RandomForestPredictor.class.getName());
    static PMML model = null;
    static ModelEvaluator<MiningModel> modelEvaluator;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileNotFoundException, JAXBException, SAXException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                Connection conn = SQLconnection.getconnection();
                Statement sto = conn.createStatement();

                ResultSet rs = sto.executeQuery("SELECT * FROM indiadata where id='1'");
                if (rs.next()) {
                    /* TODO output your page here. You may use following sample code. */
                    String opponent = request.getParameter("opponent");
                    String chasing = request.getParameter("chasing");
                    int topbs10 = Integer.parseInt(request.getParameter("topbs10"));
                    int ins10 = Integer.parseInt(request.getParameter("ins10"));
                    int topbs20 = Integer.parseInt(request.getParameter("topbs20"));
                    int ins20 = Integer.parseInt(request.getParameter("ins20"));
                    int topbs30 = Integer.parseInt(request.getParameter("topbs30"));
                    int ins30 = Integer.parseInt(request.getParameter("ins30"));
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + opponent);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + chasing);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + topbs10);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + ins10);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + topbs20);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + ins20);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + topbs30);
                    System.out.println("CricPrediction.prediction.processRequest()-----> " + ins30);
                    String absolutePath = getServletContext().getRealPath("/model/model.pmml");
                    InputStream is = new FileInputStream(new File(absolutePath));
                    InputSource source = new InputSource(is);
                    SAXSource transformedSource = ImportFilter.apply(source);
                    model = JAXBUtil.unmarshalPMML(transformedSource);
                    modelEvaluator = new MiningModelEvaluator(model);

                    List<FieldName> activeFields = modelEvaluator.getActiveFields();
                    List<FieldName> groupFields = modelEvaluator.getGroupFields();
                    List<FieldName> targetFields = modelEvaluator.getTargetFields();

                    logger.info("Active Fields: " + activeFields);
                    logger.info("Target Fields:" + targetFields);

                    Map<FieldName, FieldValue> paramMap = new LinkedHashMap<FieldName, FieldValue>();

                    addStringParam(paramMap, "opponent", opponent);
                    addStringParam(paramMap, "chasing", chasing);
                    addIntParam(paramMap, "topbs10", topbs10);
                    addIntParam(paramMap, "ins10", ins10);
                    addIntParam(paramMap, "topbs20", topbs20);
                    addIntParam(paramMap, "ins20", ins20);
                    addIntParam(paramMap, "topbs30", topbs30);
                    addIntParam(paramMap, "ins30", ins30);

                    Map<FieldName, ?> results = modelEvaluator.evaluate(paramMap);
                    FieldName targetName = modelEvaluator.getTargetField();
                    ProbabilityDistribution targetValue = (ProbabilityDistribution) results.get(targetName);
                    System.out.println("Value is: " + targetValue);
                    System.out.println("result is: " + targetValue.getResult());
                    System.out.println("type is: " + targetValue.getType());
                    System.out.println("points is: " + targetValue.getCategoryValues());

                    ArrayList<FieldName> keyList = new ArrayList<FieldName>(results.keySet());

                    System.out.println("contents of the list holding keys the map ::" + keyList);
                    System.out.println("contents of the list holding values of the map ::" + results.values());

                    String str = results.values().toString();
                    String[] arrOfStr = str.split(" ");
                    for (int i = 0; i < arrOfStr.length; i++) {
                        System.out.println(arrOfStr[i]);
                    }
                    System.out.println("Lost-- " + arrOfStr[4].replace(",", ""));
                    System.out.println("Won--- " + arrOfStr[5].replace("]", ""));
                    String lost = arrOfStr[4].replace(",", "");
                    String won = arrOfStr[5].replace("]", "");
                    String predict = targetValue.getResult().toString();
                    System.out.println("Done");

                    response.sendRedirect("prediction_result.jsp?won_ratio=" + won + "&lost_ratio=" + lost + "&result=" + predict);

                }
                  else {
           response.sendRedirect("Prediction.jsp?failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
        }
    }

            // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
            /**
             * Handles the HTTP <code>GET</code> method.
             *
             * @param request servlet request
             * @param response servlet response
             * @throws ServletException if a servlet-specific error occurs
             * @throws IOException if an I/O error occurs
             */
            @Override
            protected void doGet
            (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileNotFoundException {
                try {
                    processRequest(request, response);
                } catch (JAXBException ex) {
                    Logger.getLogger(RandomForestPredictor.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SAXException ex) {
                    Logger.getLogger(RandomForestPredictor.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
            Logger.getLogger(RandomForestPredictor.class.getName()).log(Level.SEVERE, null, ex);
        }
            }

            /**
             * Handles the HTTP <code>POST</code> method.
             *
             * @param request servlet request
             * @param response servlet response
             * @throws ServletException if a servlet-specific error occurs
             * @throws IOException if an I/O error occurs
             */
            @Override
            protected void doPost
            (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileNotFoundException {
                try {
                    processRequest(request, response);
                } catch (JAXBException ex) {
                    Logger.getLogger(RandomForestPredictor.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SAXException ex) {
                    Logger.getLogger(RandomForestPredictor.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
            Logger.getLogger(RandomForestPredictor.class.getName()).log(Level.SEVERE, null, ex);
        }
            }

            /**
             * Returns a short description of the servlet.
             *
             * @return a String containing servlet description
             */
            @Override
            public String getServletInfo
            
                () {
        return "Short description";
            }// </editor-fold>

    

    public static void addIntParam(Map<FieldName, FieldValue> paramMap, String fieldNameStr, int fieldValueInt) {
        FieldName fn = new FieldName(fieldNameStr);
        FieldValue fv = modelEvaluator.prepare(fn, fieldValueInt);
        paramMap.put(fn, fv);
    }

    public static void addStringParam(Map<FieldName, FieldValue> paramMap, String fieldNameStr, String fieldValueString) {
        FieldName fn = new FieldName(fieldNameStr);
        FieldValue fv = modelEvaluator.prepare(fn, fieldValueString);
        paramMap.put(fn, fv);
    }

}
