package loggerAOP;

import java.util.Hashtable;

public abstract class TimerAbstract {
	protected Hashtable<String, Double> timesTable;
	
	public void setTimeFor(String id) {
		if(!timesTable.containsKey(id)) {
			double actualTime = System.nanoTime();
			timesTable.put(id, actualTime);
		} else {
			System.out.println("Error: Method already in timesTable!");
		}
	}
	
	public String getFinalTimeFor(String id) {
		if(timesTable.containsKey(id)) {
			final double actualTime = System.nanoTime();
			final double methodTime = timesTable.get(id);
			
			final double timeRan = this.differenceInMs(methodTime, actualTime);
			
			timesTable.remove(id);
			return ("\nTimer: " + id + "ran for " + timeRan + "milliseconds" + "\n");
			
		} else {
			System.out.println("Error: " + id + " not found timesTable!");
		}
		
		return "";
	}
	
	protected double differenceInMs(double startTime, double endTime) {
		return (endTime - startTime) / 1e6;
	}
}
