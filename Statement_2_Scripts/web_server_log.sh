#!/bin/bash

# Set the log file path and name
LOG_FILE=/var/log/apache2/access.log

# Set the output file path and name
OUTPUT_FILE=web_server_log_analysis.txt

# Clear the output file
> $OUTPUT_FILE

# Analyze the log file and output the results to the output file

# 1. Total requests
echo "Total Requests: $(grep -c "^" $LOG_FILE)" >> $OUTPUT_FILE

# 2. 404 Errors
echo "404 Errors: $(grep -c " 404 " $LOG_FILE)" >> $OUTPUT_FILE

# 3. Most requested pages (top 10)
echo "Most Requested Pages (top 10):" >> $OUTPUT_FILE
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -rn | head -10 >> $OUTPUT_FILE

# 4. IP addresses with the most requests (top 10)
echo "IP Addresses with the Most Requests (top 10):" >> $OUTPUT_FILE
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -rn | head -10 >> $OUTPUT_FILE

# 5. Top 10 user agents
echo "Top 10 User Agents:" >> $OUTPUT_FILE
awk '{print $12}' $LOG_FILE | sort | uniq -c | sort -rn | head -10 >> $OUTPUT_FILE

# 6. Top 10 referrers
echo "Top 10 Referrers:" >> $OUTPUT_FILE
awk '{print $11}' $LOG_FILE | sort | uniq -c | sort -rn | head -10 >> $OUTPUT_FILE

# 7. Average response time
echo "Average Response Time: $(awk '{sum+=$13} END {print sum/NR}' $LOG_FILE)" >> $OUTPUT_FILE

# Print a message indicating that the analysis is complete
echo "Web server log analysis complete. Results saved to $OUTPUT_FILE"
