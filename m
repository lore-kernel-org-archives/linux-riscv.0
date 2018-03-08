From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu,  8 Mar 2018 14:27:34 -0800
Subject: [PATCH] tty: New RISC-V SBI console driver
Message-ID: <20180308222734.20144-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The RISC-V ISA defines a simple console that is availiable via SBI calls
on all systems.  The SBI console is designed to be availiable at all
times, so while it's most natural to use this as an early printk target
it's also possible to use this as the system console when there isn't a
better one availiable.

This patch adds support for the RISC-V SBI console via the HVC
infastructure.  It's entirely independent from our early printk support,
which results in early boot messages appearing twice over the SBI
console.  As far as I can tell that's the fault of our early printk
support (we should support earlycon) as opposed to this driver.

There is one checkpatch.pl warning here: to check the MAINTAINERS file.
They're all matched by the "K: riscv" line.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 drivers/tty/hvc/Kconfig         | 10 +++++++
 drivers/tty/hvc/Makefile        |  1 +
 drivers/tty/hvc/hvc_riscv_sbi.c | 60 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 drivers/tty/hvc/hvc_riscv_sbi.c

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index fec457edad14..e7cc617d6e45 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -97,6 +97,16 @@ config HVC_BFIN_JTAG
 	 the HVC driver.  If you don't have JTAG, then you probably don't
 	 want this option.
 
+config HVC_RISCV_SBI
+	bool "RISC-V SBI console support"
+	depends on RISCV
+	select HVC_DRIVER
+	help
+	  This enables support for console output via RISC-V SBI calls, which
+	  is normally used only during boot to output printk.
+
+	  If you don't know what do to here, say Y.
+
 config HVCS
 	tristate "IBM Hypervisor Virtual Console Server support"
 	depends on PPC_PSERIES && HVC_CONSOLE
diff --git a/drivers/tty/hvc/Makefile b/drivers/tty/hvc/Makefile
index 0b02ec7f1dfd..83079ae000ae 100644
--- a/drivers/tty/hvc/Makefile
+++ b/drivers/tty/hvc/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_HVC_XEN)		+= hvc_xen.o
 obj-$(CONFIG_HVC_IUCV)		+= hvc_iucv.o
 obj-$(CONFIG_HVC_UDBG)		+= hvc_udbg.o
 obj-$(CONFIG_HVC_BFIN_JTAG)	+= hvc_bfin_jtag.o
+obj-$(CONFIG_HVC_RISCV_SBI)	+= hvc_riscv_sbi.o
 obj-$(CONFIG_HVCS)		+= hvcs.o
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
new file mode 100644
index 000000000000..75155bde2b88
--- /dev/null
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2008 David Gibson, IBM Corporation
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ */
+
+#include <linux/console.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/moduleparam.h>
+#include <linux/types.h>
+
+#include <asm/sbi.h>
+
+#include "hvc_console.h"
+
+static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		sbi_console_putchar(buf[i]);
+
+	return i;
+}
+
+static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+{
+	int i, c;
+
+	for (i = 0; i < count; i++) {
+		c = sbi_console_getchar();
+		if (c < 0)
+			break;
+		buf[i] = c;
+	}
+
+	return i;
+}
+
+static const struct hv_ops hvc_sbi_ops = {
+	.get_chars = hvc_sbi_tty_get,
+	.put_chars = hvc_sbi_tty_put,
+};
+
+static int __init hvc_sbi_init(void)
+{
+	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+}
+device_initcall(hvc_sbi_init);
+
+static int __init hvc_sbi_console_init(void)
+{
+	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	add_preferred_console("hvc", 0, NULL);
+
+	return 0;
+}
+console_initcall(hvc_sbi_console_init);
-- 
2.16.1
