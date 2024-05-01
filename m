Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4015C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hy+hwAwXtmw0vPkfYv9PPrn4RBKvVq12tinBM0TBgwg=; b=qcyf/HiSHzWbnN
	x+bMmPifhPV3wpWKubVlOtdbUswKLg2Wvxi5cPTnbGROmaGsjTmp7KqmOzN+23m9x2pYU87va+CgH
	Jk3LOJ58MfKGwmLLbCACn6rW9LABAfe7iQkfs0XgqqJ+yjUgyPt3mvAtsNz0TFPbebzU0ftMk1w/6
	gss9gCveZZwvPsFwBl1ShViWfCfK/2MS0jVEZUr+8cAzktbarz0T48vWq5rTAboLsYxaNV3BjYvWi
	u6INPthqkwJy8eT8khZrV1DSBCHb9cUCGdkwwqOBMHxCsPT6aWM2I3+zZL2kfLiFmIEG3fKvVhN8k
	8GxMxGmEZkSCxuPeu6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2AHb-00000009ibv-17kR;
	Wed, 01 May 2024 13:46:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28wa-00000009NYb-0qlW
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:20:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e834159f40so53998425ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714566015; x=1715170815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NA6fALA+ztvPArpqc5Jdn/FWi0fZsP181uxTjKG28r0=;
        b=DFQOJXMgUUiVRVD4s4BiKNqLcMNLLKl6ELFmF1a1kWK+xx1LATX4iEDy4pV3YBPD4B
         rNPH/1Xa/F9MQ2YiiyYpyefG3K3QiwDi3JtFq7Fn1xMM8ivPoonwzPAJwoVmfLeGUqYq
         6odexmqTmaYEVdAg6AYKznE7Cm3WEyv39aStEufbQSRL3JSxHEuht+0q72ajobR5AP1w
         Nd5BxT7xVdEcH+g+DPNADBnka5ZTk7m91KhJI4oG37/IYDD0tY3tI1ipzQXza10zIoL6
         4xfhWibpah+70tt6RQgt9mtIuRlqbpP8sKX1r1tfJz5ZoQrPvXLz0rcvCBgL+tR+nvZH
         imvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714566015; x=1715170815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NA6fALA+ztvPArpqc5Jdn/FWi0fZsP181uxTjKG28r0=;
        b=lQbuve6GDYrVBJIkzL2g4HUyR3+VqJZtW/uebtgXW/51qdTyfOL2AWaFMw0SWkmROB
         xk9i72jhqOPsR2rA++6aOlIT2k4p8gVzfq4uA1ahkx9xVwOc1rvF9xXd7Ssovb+pFhpk
         vGnCAwbP0E5ThGmhizhbaYwD5r4lcMFm213CB+AAmNriVV97ZvxQqnXvKUN72v8yvgoH
         ohmdaZTppEGtCJI4hfcorTzByAXOwsC4It1cNBFGsotKDjEeClEyNJgDVdvJP9bPUiqD
         lz+W9myKvcK7dOJEsZlPEPIKiNb1lay2K99026pohPqxRenJhZiwUfE19UnBGXUMTTS3
         nF2w==
X-Forwarded-Encrypted: i=1; AJvYcCWXMEFoisdokfhYwN3ryMklwb5EQMONJ697wvBfGbO6TQrvvdPEhNSlbc9ju8tqI6mp1vnkqugBt75kIbxDO7FCsXQji2xacB1Ju5tlczrc
X-Gm-Message-State: AOJu0YwqypKYFxIsjXDd9L+58PvW9h2MA8rYUOwrIfowC//kSLrY4JCP
	LdCv9BcskBvGyWPb+uXgi5ncCU5Sq7lYc0c1OUKbjAiWTYW0TI3nwGVikzN/ZRc=
X-Google-Smtp-Source: AGHT+IHYfyPObdgft5ubD0a+EdF/ZUFESa543BOMp550uRgpGcGY3JeWyQR+nmnrayByMoL+UjNZmA==
X-Received: by 2002:a17:902:ed01:b0:1eb:494f:dc66 with SMTP id b1-20020a170902ed0100b001eb494fdc66mr2209312pld.23.1714566015601;
        Wed, 01 May 2024 05:20:15 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:20:15 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 17/17] serial: 8250: Add 8250_acpi driver
Date: Wed,  1 May 2024 17:47:42 +0530
Message-Id: <20240501121742.1215792-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_052022_774645_7D8C14E2 
X-CRM114-Status: GOOD (  24.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V has non-PNP generic 16550A compatible UART which needs to be
enumerated as ACPI platform device. Add driver support for such devices
similar to 8250_of.

The driver is enabled when the CONFIG_SERIAL_ACPI_PLATFORM option is
enabled. Enable this option for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/configs/defconfig        |  1 +
 drivers/tty/serial/8250/8250_acpi.c | 96 +++++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig     |  8 +++
 drivers/tty/serial/8250/Makefile    |  1 +
 4 files changed, 106 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_acpi.c

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3cae018f9315..bea8241f52eb 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -150,6 +150,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_ACPI_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
diff --git a/drivers/tty/serial/8250/8250_acpi.c b/drivers/tty/serial/8250/8250_acpi.c
new file mode 100644
index 000000000000..3682443bb69c
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_acpi.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Serial Port driver for ACPI platform devices
+ *
+ * This driver is for generic 16550 compatible UART enumerated via ACPI
+ * platform bus instead of PNP bus like PNP0501. This is not a full
+ * driver but mostly provides the ACPI wrapper and uses generic
+ * 8250 framework for rest of the functionality.
+ */
+
+#include <linux/acpi.h>
+#include <linux/serial_reg.h>
+#include <linux/serial_8250.h>
+
+#include "8250.h"
+
+struct acpi_serial_info {
+	int	line;
+};
+
+static int acpi_platform_serial_probe(struct platform_device *pdev)
+{
+	struct acpi_serial_info *data;
+	struct uart_8250_port port8250;
+	struct device *dev = &pdev->dev;
+	struct resource *regs;
+
+	int ret, irq;
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!regs) {
+		dev_err(dev, "no registers defined\n");
+		return -EINVAL;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	memset(&port8250, 0, sizeof(port8250));
+
+	spin_lock_init(&port8250.port.lock);
+
+	port8250.port.mapbase           = regs->start;
+	port8250.port.irq               = irq;
+	port8250.port.type              = PORT_16550A;
+	port8250.port.flags             = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
+					  UPF_IOREMAP | UPF_FIXED_TYPE;
+	port8250.port.dev               = dev;
+	port8250.port.mapsize           = resource_size(regs);
+	port8250.port.iotype            = UPIO_MEM;
+	port8250.port.irqflags          = IRQF_SHARED;
+
+	port8250.port.membase = devm_ioremap(dev, port8250.port.mapbase, port8250.port.mapsize);
+	if (!port8250.port.membase)
+		return -ENOMEM;
+
+	ret = uart_read_and_validate_port_properties(&port8250.port);
+	if (ret)
+		return -EINVAL;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->line = serial8250_register_8250_port(&port8250);
+	if (data->line < 0)
+		return data->line;
+
+	platform_set_drvdata(pdev, data);
+	return 0;
+}
+
+static void acpi_platform_serial_remove(struct platform_device *pdev)
+{
+	struct acpi_serial_info *data = platform_get_drvdata(pdev);
+
+	serial8250_unregister_port(data->line);
+}
+
+static const struct acpi_device_id acpi_platform_serial_table[] = {
+	{ "RSCV0003", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, acpi_platform_serial_table);
+
+static struct platform_driver acpi_platform_serial_driver = {
+	.driver = {
+		.name			= "acpi_serial",
+		.acpi_match_table	= ACPI_PTR(acpi_platform_serial_table),
+	},
+	.probe			= acpi_platform_serial_probe,
+	.remove_new		= acpi_platform_serial_remove,
+};
+
+builtin_platform_driver(acpi_platform_serial_driver);
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 47ff50763c04..fbfe4d3501b1 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -576,3 +576,11 @@ config SERIAL_OF_PLATFORM
 	  are probed through devicetree, including Open Firmware based
 	  PowerPC systems and embedded systems on architectures using the
 	  flattened device tree format.
+
+config SERIAL_ACPI_PLATFORM
+	tristate "ACPI platform bus based probing for 8250 ports"
+	depends on SERIAL_8250 && ACPI
+	default n
+	help
+	  This option is used for generic 8250 compatible serial ports
+	  that are enumerated through ACPI platform bus.
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index ea2e81f58eac..8c0ef357fc4e 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_SERIAL_8250_CONSOLE)	+= 8250_early.o
 
 obj-$(CONFIG_SERIAL_8250_ACCENT)	+= 8250_accent.o
 obj-$(CONFIG_SERIAL_8250_ACORN)		+= 8250_acorn.o
+obj-$(CONFIG_SERIAL_ACPI_PLATFORM)	+= 8250_acpi.o
 obj-$(CONFIG_SERIAL_8250_ASPEED_VUART)	+= 8250_aspeed_vuart.o
 obj-$(CONFIG_SERIAL_8250_BCM2835AUX)	+= 8250_bcm2835aux.o
 obj-$(CONFIG_SERIAL_8250_BCM7271)	+= 8250_bcm7271.o
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
