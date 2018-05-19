// dffe: D-type flip-flop with enable
//
// q      (output) - Current value of flip flop
// d      (input)  - Next value of flip flop
// clk    (input)  - Clock (positive edge-sensitive)
// enable (input)  - Load new value? (yes = 1, no = 0)
// reset  (input)  - Asynchronous reset   (reset =  1)
//
module dffe(q, d, clk, enable, reset);
    output q;
    reg    q;
    input  d;
    input  clk, enable, reset;
 
    always@(reset)
      if (reset == 1'b1)
        q <= 0;
 
    always@(posedge clk)
      if ((reset == 1'b0) && (enable == 1'b1))
        q <= d;
endmodule // dffe


module i_reader(I, bits, clk, restart);
    output      I;
    input [1:0] bits;
    input       restart, clk;
    wire        sGarbage, sGarbage_next, sBlank, sBlank_next, sI, sI_next, sI_end, 			sI_end_next;
    
	wire in000 = bits == 3'b000;
	wire in111 = bits == 3'b011;

    assign sGarbage_next = restart | (sBlank & ~(in000|in111)) | (sI & ~in000) | (sI_end &(~(in000|in111))) | (sGarbage & ~in000);   // | other condition ... 

	assign sBlank_next = ~restart & ((sGarbage & in000) | (sBlank & in000) | (sI_end & in000));

	assign sI_next = ~restart & ((sBlank & in111) | (sI_end & in111));

	assign sI_end_next = ~restart & (sI & in000); 
        
    dffe fsGarbage(sGarbage, sGarbage_next, clk, 1'b1, 1'b0);
    dffe fsBlank(sBlank, sBlank_next, clk, 1'b1, 1'b0);
    dffe fsI(sI, sI_next, clk, 1'b1, 1'b0);
    dffe fsI_end(sI_end, sI_end_next, clk, 1'b1, 1'b0);

	assign I = sI_end;	
endmodule // i_reader
