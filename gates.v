/* gates module */

/* OR module */
module orBehav(output reg Y, input A,B);
	always @(A or B) begin 
    		if(A == 1'b0 & B == 1'b0)
        		Y=1'b0;
    		else
        		Y=1'b1;
	end
endmodule

/* AND module */
module andBehav(output reg Y, input A,B);
	always @(A or B) begin 
    		if(A == 1'b1 & B == 1'b1)
        		Y=1'b1;
    		else
        		Y=1'b0;
		end
endmodule

/* NAND module */
module nandBehav(output reg Y, input A,B);
	always @(A or B) begin 
    		if(A == 1'b1 & B == 1'b1)
        		Y=1'b0;
   		else
        		Y=1'b1;
	end
endmodule

/* NOR module */
module norBehav(output reg Y, input A,B);
	always @(A or B) begin 
    		if(A == 1'b0 & B == 1'b0)
        		Y=1'b1;
    		else
        		Y=1'b0;
	end
endmodule

/* XOR module */
module xorBehav(output reg Y, input A,B);
	always @(A or B) begin 
    		if((A == 1'b0 & B == 1'b1) || (A == 1'b1 & B==1'b0))
        		Y=1'b1;
    		else
        		Y=1'b0;
	end
endmodule
