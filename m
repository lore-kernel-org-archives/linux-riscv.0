From: paul.walmsley@sifive.com (Paul Walmsley)
Date: Fri, 19 Oct 2018 11:48:26 -0700
Subject: [PATCH v2 0/2] tty: serial: add DT bindings and serial driver for the
 SiFive FU540 UART
Message-ID: <20181019184827.12351-1-paul.walmsley@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This series adds a serial driver, with console support, for the
UART IP block present on the SiFive FU540 SoC.  The programming
model is straightforward, but unique.

Boot-tested on a SiFive FU540 HiFive-U board (with appropriate patches
to the DT data).

The patches in this series can also be found at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v4.19-rc7

This second version fixes a few problems identified by the 0-day
build system, mostly focused around remnants relating to
CONFIG_CONSOLE_POLL, and a missing spin_unlock() in the ISR.

Paul Walmsley (2):
  dt-bindings: serial: add documentation for the SiFive UART driver
  tty: serial: add driver for the SiFive UART

 .../bindings/serial/sifive-serial.txt         |   21 +
 drivers/tty/serial/Kconfig                    |   24 +
 drivers/tty/serial/Makefile                   |    1 +
 drivers/tty/serial/sifive.c                   | 1067 +++++++++++++++++
 include/uapi/linux/serial_core.h              |    3 +
 5 files changed, 1116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
 create mode 100644 drivers/tty/serial/sifive.c


Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: linux-serial at vger.kernel.org
Cc: linux-riscv at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Cc: devicetree at vger.kernel.org

-- 
2.19.1
