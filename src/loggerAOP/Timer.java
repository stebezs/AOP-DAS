package loggerAOP;

import java.util.Hashtable;

public class Timer extends TimerAbstract {
	// Using default implementation of the abstract TimerAbstract class
	public Timer() {
		this.timesTable = new Hashtable<>();
	}
}
