package loggerAOP;

import java.util.Hashtable;

public abstract class TimerAbstract {
	protected Hashtable<String, Double> timesTable;
	
	public void setTimeFor(String id) {
		if(!timesTable.contains(id)) {
			double actualTime = System.nanoTime();
			timesTable.put(id, actualTime);
		} else {
			System.out.println("Error: Method already in timesTable!");
		}
	}
	
	public String getActualTimeFor(String id) {
		if(timesTable.contains(id)) {
			final double actualTime = System.nanoTime();
			final double methodTime = timesTable.get(id);
			
			final double timeRan = this.differenceInMs(actualTime, methodTime);
			return (id + "ran for " + timeRan + "milliseconds");
			
		} else {
			System.out.println("Error: Method not found timesTable!");
		}
		
		return "";
	}
	
	protected double differenceInMs(double startTime, double endTime) {
		return (endTime - startTime) / 1e6;
	}
}
