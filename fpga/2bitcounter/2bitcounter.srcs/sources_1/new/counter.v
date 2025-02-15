`timescale 1ns / 1ps

module counter(
    input wire clk,           //system clock
    input wire [1:0] btn_tri_i, //two buttons (increment & decrement)
    output reg [1:0] led_out   //2-bit counter output
);

    reg [1:0] count;  
    reg btn_up_last, btn_down_last;

    always @(posedge clk) begin
        if (btn_tri_i[0] && !btn_up_last) begin
            if (count < 2'b11)  //prevent overflow
                count <= count + 1;
        end
        if (btn_tri_i[1] && !btn_down_last) begin
            if (count > 2'b00)  //prevent underflow
                count <= count - 1;
        end

        btn_up_last <= btn_tri_i[0];
        btn_down_last <= btn_tri_i[1];

        led_out <= count;
    end

endmodule
