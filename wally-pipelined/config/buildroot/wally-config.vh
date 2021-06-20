//////////////////////////////////////////
// wally-config.vh
//
// Written: David_Harris@hmc.edu 4 January 2021
// Modified: 
//
// Purpose: Specify which features are configured
//          Macros to determine which modes are supported based on MISA
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
// is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT 
// OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
///////////////////////////////////////////

// include shared configuration
`include "wally-shared.vh"

`define BUILDROOT 1
`define BUSYBEAR 0
`define LINUX_FIX_READ {'h10000005}
`define LINUX_TEST_VECTORS "../linux-testgen/linux-testvectors/"
// RV32 or RV64: XLEN = 32 or 64
`define XLEN 64

`define MISA (32'h0014112D)
`define ZCSR_SUPPORTED 1
`define ZCOUNTERS_SUPPORTED 1
`define COUNTERS 32

// Microarchitectural Features
`define UARCH_PIPELINED 1
`define UARCH_SUPERSCALR 0
`define UARCH_SINGLECYCLE 0
`define MEM_DCACHE 0
`define MEM_DTIM 1
`define MEM_ICACHE 0
`define MEM_VIRTMEM 0
`define VECTORED_INTERRUPTS_SUPPORTED 1 // Domenico Ottolia 4/15: Support for vectored interrupts in _tvec csrs. Just implemented in src/privileged/trap.sv around line 75. Pretty sure this should be 1.

`define ITLB_ENTRY_BITS 5
`define DTLB_ENTRY_BITS 5

// Legal number of PMP entries are 0, 16, or 64
`define PMP_ENTRIES 16

// Address space
`define RESET_VECTOR 64'h0000000000001000

// Peripheral Addresses
// Peripheral memory space extends from BASE to BASE+RANGE
// Range should be a thermometer code with 0's in the upper bits and 1s in the lower bits
`define BOOTTIM_SUPPORTED 1'b1
`define BOOTTIM_BASE   32'h00000000 // spec had been 0x1000 to 0x2FFF, but dh truncated to 0x1000 to 0x1FFF because upper half seems to be all zeros and this is easier for decoder
`define BOOTTIM_RANGE  32'h00003FFF
//`define BOOTTIM_BASE   32'h00001000 // spec had been 0x1000 to 0x2FFF, but dh truncated to 0x1000 to 0x1FFF because upper half seems to be all zeros and this is easier for decoder
//`define BOOTTIM_RANGE  32'h00000FFF
`define TIM_SUPPORTED 1'b1
`define TIM_BASE       32'h80000000
`define TIM_RANGE      32'h07FFFFFF
`define CLINT_SUPPORTED 1'b1
`define CLINT_BASE  32'h02000000
`define CLINT_RANGE 32'h0000FFFF
`define GPIO_SUPPORTED 1'b1
`define GPIO_BASE   32'h10012000
`define GPIO_RANGE  32'h000000FF
`define UART_SUPPORTED 1'b1
`define UART_BASE   32'h10000000
`define UART_RANGE  32'h00000007
`define PLIC_SUPPORTED 1'b1
`define PLIC_BASE   32'h0C000000
`define PLIC_RANGE  32'h03FFFFFF

// Bus Interface width
`define AHBW 64

// Test modes

// Tie GPIO outputs back to inputs
`define GPIO_LOOPBACK_TEST 0

// Busybear special CSR config to match OVPSim
`define OVPSIM_CSR_CONFIG 0

// Hardware configuration
`define UART_PRESCALE 1

// Interrupt configuration
`define PLIC_NUM_SRC 53
`define PLIC_UART_ID 4

`define TWO_BIT_PRELOAD "../config/busybear/twoBitPredictor.txt"
`define BTB_PRELOAD "../config/busybear/BTBPredictor.txt"
`define BPRED_ENABLED 1
`define BPTYPE "BPGSHARE" // BPLOCALPAg or BPGLOBAL or BPTWOBIT or BPGSHARE
`define TESTSBP 0
