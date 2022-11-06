import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class LotteryNumber {
	
	protected static int[] getLotteryNumber() throws IOException {
		File file = new File("winningNumbers.txt");
		if (!file.exists()) {
			file.createNewFile();
			FileWriter fileWriter = new FileWriter(file);
			List<Integer> list = new ArrayList<Integer>(7); 
			Random rng = new Random();
			
			for (int i=0; i<7; i++) { 
				int newNum;
				do {
					newNum = rng.nextInt(48)+1;
				} while (list.contains(newNum));
				
				list.add(newNum);
				fileWriter.write(String.valueOf(newNum));
				if (i==7) {break;} else {fileWriter.write(" ");}
			}
			fileWriter.close();
		}

		FileReader fileReader = new FileReader(file);
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		int[] sequence;
		sequence = Arrays.stream(
							bufferedReader.readLine().split(" ")
						).mapToInt(Integer::parseInt).toArray();
		
		bufferedReader.close();
		return sequence;
	}
	
}
