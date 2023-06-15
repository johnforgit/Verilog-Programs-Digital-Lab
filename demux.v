module demux(output reg A,B,C,D, input in,s1,s2);
	always @(in or s1 or s2) begin
    		if(s1==1'b0 & s2==1'b0) begin
        	assign A=in;
        	assign B=1'b0;
        	assign C=1'b0;
        	assign D=1'b0;
    	end
    	else if(s1==1'b0 & s2==1'b1) begin
        	assign B=in;
        	assign A=1'b0;
        	assign C=1'b0;
        	assign D=1'b0;
    	end
    	else if(s1==1'b1 & s2==1'b0) begin
        	assign C=in;
        	assign A=1'b0;
        	assign B=1'b0;
        	assign D=1'b0;
    	end
    	else if(s1==1'b1 & s2==1'b1) begin
        	assign D=in;
        	assign A=1'b0;
        	assign B=1'b0;
        	assign C=1'b0;
    	end
	end
endmodule
