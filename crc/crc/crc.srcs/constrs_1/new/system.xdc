set_property IOSTANDARD LVCMOS33 [ get_ports *]
set_property PACKAGE_PIN H4[ get_ports { clk } ]
set_property PACKAGE_PIN D14[ get_ports { rst_n } ]

set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks RTSTAT-1]

set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
