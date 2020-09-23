// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Interface to probe the instruction moving through the pipeline
//
// TODO: does not support dummy instruction insertion right now,
//       might have to revisit and update.
interface core_ibex_instr_monitor_if #(
  parameter DATA_WIDTH = 32
) (
  input clk
);

  // ID stage
  logic                  valid_id;
  logic                  err_id;
  logic                  is_compressed_id;
  logic [          15:0] instr_compressed_id;
  logic [DATA_WIDTH-1:0] instr_id;
  logic [DATA_WIDTH-1:0] pc_id;
  logic                  branch_taken_id;
  logic [DATA_WIDTH-1:0] branch_target_id;

  clocking instr_cb @(posedge clk);
    input valid_id;
    input err_id;
    input is_compressed_id;
    input instr_compressed_id;
    input instr_id;
    input pc_id;
    input branch_taken_id;
    input branch_target_id;
  endclocking

endinterface
