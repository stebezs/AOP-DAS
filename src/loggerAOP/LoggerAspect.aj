package loggerAOP;

import java.io.PrintStream;

public abstract aspect LoggerAspect {

	protected static PrintStream stream = System.err;
	protected static int callDepth = 0;

	// The methods below represents a default implementation
	// that can be used as example.
	public static void logStart(String info) {
		callDepth++;
		printStart(info);
	}

	public static void logEnd(String info) {
		callDepth--;
		printEnd(info);
	}

	public static void startStream(PrintStream destination) {
		stream = destination;
	}

	
	// Logging text methods
	protected static void printStart(String info) {
		printSpaces();
		stream.println("Now in: " + info);
		
	}

	protected static void printEnd(String info) {
		printSpaces();
		stream.println("Now exiting: " + info);
	}

	private static void printSpaces() {
		for (int counter = 0; counter < callDepth; counter++) {
			stream.print("	");
		}
	}
	
	// Main AOP implementation - Each class from LoggerAspect should have this
    abstract pointcut myClass();

    pointcut myConstructor(): myClass() && execution(new(..));
    pointcut myMethod(): myClass() && execution(* *(..));

    before(): myConstructor() {
        logStart(thisJoinPointStaticPart.getSignature().toString());
    }
    after(): myConstructor() {
        logEnd(thisJoinPointStaticPart.getSignature().toString());
    }

    before(): myMethod() {
        logStart(thisJoinPointStaticPart.getSignature().toString());
    }
    after(): myMethod() {
        logEnd(thisJoinPointStaticPart.getSignature().toString());
    }
}
