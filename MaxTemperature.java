import java.io.IOException;
import org.apache.hadoop.fs.Path; 
import org.apache.hadoop.io.Text; 
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient; 
import org.apache.hadoop.mapred.JobConf; 
import org.apache.hadoop.mapred.lib.IdentityReducer;

public class MaxTemperature {
	public static void main(String[] args) throws IOException {
		if (args.length != 2) { 
			System.err.println("Usage: MaxTemperature <input path> <output path>");
			System.exit(-1);
		}
		JobConf conf = new JobConf(MaxTemperature.class); 
		conf.setJobName("Max temperature"); 
		FileInputFormat.addInputPath(conf,new Path(args[0])); 
		FileOutputFormat.setOutputPath(conf, new Path(args[1])); 
		conf.setMapperClass(MaxTemperatureMapper.class); 
		conf.setReducerClass(IdentityReducer.class); 
		conf.setOutputKeyClass(Text.class); 
		conf.setOutputValueClass(Text.class); 
		 JobClient.runJob(conf);
	}
}
