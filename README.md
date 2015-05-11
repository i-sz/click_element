# click_element
Implementation of data-driven asynchronous circuits using click elements

*To add to Xilinx: Project Navigator -> New Project; Default settings; Right click on the project on the left and select Add Source, do for all three files;*

*To simulate:*

*Run:*

    cd [project directory]
    do compile.do

*Right click on dut, click Add Wave.  Run:* 

    reset
    run 400 ns


TO DO LIST:

- add delay on b.req and a.ack, find delay value. possibly at the click_pipeline stage
- Remove one click element from three_stage_ring to make a two-stage ring
- Make better drawing
- Remove data FF from adder stage
- Expand data to bus
- Investigate timing
