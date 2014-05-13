import java.io.IOException;
import org.apache.hadoop.io.LongWritable; 
import org.apache.hadoop.io.Text; 
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper; 
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reporter; 

public class MaxTemperatureMapper extends MapReduceBase implements Mapper<LongWritable, Text, Text, Text> {
	public void map(LongWritable key, Text value, OutputCollector<Text, Text> output, Reporter reporter) 
	throws IOException {
		String[] fields = value.toString().split(",");
		//Store field values
		String state = fields[0];
		String year = fields[3];
		String month = fields[4];
		String windSpeed = fields[16];
		String maxTemp = fields[20];
		String minTemp = fields[21];
		String rainFall = fields[22];
		String snow = fields[24];

		if (fields.length>0) {
			output.collect(new Text(state), 
				new Text(windSpeed+"\t"+maxTemp+"\t"+minTemp+"\t"+rainFall+"\t"+snow+"\t"+month+"\t"+year));
		}
	}
}
