/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CricPrediction;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBException;
import javax.xml.transform.sax.SAXSource;
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
import org.xml.sax.SAXException;

/**
 *
 * @author Beast
 */
public class prediction extends HttpServlet {

    static Logger logger = Logger.getLogger(prediction.class.getName());
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
            throws ServletException, IOException, SAXException, JAXBException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);

            String opponent = request.getParameter("opponent");
            String chasing = request.getParameter("chasing");
            int topbs10 = Integer.parseInt(request.getParameter("topbs10"));
            int ins10 = Integer.parseInt(request.getParameter("ins10"));
            int topbs20 = Integer.parseInt(request.getParameter("topbs20"));
            int ins20 = Integer.parseInt(request.getParameter("ins20"));
            int topbs30 = Integer.parseInt(request.getParameter("topbs30"));
            int ins30 = Integer.parseInt(request.getParameter("ins30"));
            System.out.println("CricPrediction.prediction.processRequest()-----> "+opponent);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+chasing);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+topbs10);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+ins10);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+topbs20);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+ins20);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+topbs30);
            System.out.println("CricPrediction.prediction.processRequest()-----> "+ins30);
            
            

            InputStream is = new FileInputStream(new File(""));
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
            System.out.println("Predicted Value is: " + targetValue);
            System.out.println("Predicted Value is: " + targetValue.getResult());

            response.sendRedirect("prediction_result.jsp?Success");

        }    }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(prediction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JAXBException ex) {
            Logger.getLogger(prediction.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SAXException ex) {
            Logger.getLogger(prediction.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JAXBException ex) {
            Logger.getLogger(prediction.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
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
