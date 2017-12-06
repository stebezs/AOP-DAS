package loggerAOP;

import main.*;

public aspect Logger extends LoggerAspect{
	private Timer timer = new Timer();
	pointcut myClass(): within(MergeSortExample);
	
	// This is used for keeping track of which method have been called
	private static int sortCount = 0;
	private static int mergeCount = 0;
	public static final String signatureSort = "void main.MergeSortExample.sort(int[], int, int)";
	public static final String signatureMerge = "void main.MergeSortExample.merge(int[], int, int, int)";

	// Overriding advises with a new timer
	// NEW: JointPoint id + Signature as id; Using Timer
    before(): myMethod() {
    	final String calledSign = thisJoinPointStaticPart.getSignature().toString();
    	final String finalId = this.getBeforeId(calledSign) + calledSign;
    	timer.setTimeFor(finalId);
        logStart(finalId);
    }
    
    after(): myMethod() {
    	final String calledSign = thisJoinPointStaticPart.getSignature().toString();
    	final String finalId = this.getAfterId(calledSign) + calledSign;
    	stream.println(timer.getFinalTimeFor(finalId));
        logEnd(finalId);
    }
	
    
	public static void main(String[] args) {
        Logger.startStream(System.err);
        Main.main(args);
    }
	
	private String getBeforeId(String id) {
		String addId = "";
    	
    	if(id.equals(signatureSort)) {
    		sortCount++;
    		addId = "" + sortCount;
    	} else if (id.equals(signatureMerge)) {
    		mergeCount++;
    		addId = "" + mergeCount;
    	} else {
    		// Do nothing
    	}
    	
    	return addId;
	}
	
	private String getAfterId(String id) {
		String addId = "";
    	
    	if(id.equals(signatureSort)) {
    		addId = "" + sortCount;
    		sortCount--;
    	} else if (id.equals(signatureMerge)) {
    		addId = "" + mergeCount;
    		mergeCount--;
    	} else {
    		// Do nothing
    	}
    	
    	return addId;
	}
}
