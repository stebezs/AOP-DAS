package main;

public class Main {

	public static void main(String[] args) {
		MergeSortExample sorter = new MergeSortExample();
		int [] randomArray1 = sorter.generateRandomArray(100);
		int [] randomArray2 = sorter.generateRandomArray(10000);
		
		sorter.sort(randomArray1, 0, randomArray1.length - 1);
		sorter.sort(randomArray2, 0, randomArray2.length - 1);
	}

}
