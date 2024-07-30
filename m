Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C001AC3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 05:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pu3dmdvsttl1Ou1NZC8bvG6C0TKe6TozzSYjnms4Tk8=; b=zOej0XQKVe/k92
	Pwz6OX1lisDNTOWqCGRhAtO5ZSVkn8Mx1p2yzxM3MNQrlG0POH3tajke38KbuvjJnht3qimkwz1VG
	ABgJyDBADFy1qt4juZWc1Xzyav7VfptmMbYjATWAjG/KG1Ws/Fo3lYgt8IM2+8zJdjqZPaq2r/lTp
	AJS7C3OBo6OlI+YseoE4P6VomG0WcYOLqx6ka7W1RUotaE171OVn5VWH016pnyETe4jY/gSsdFCWP
	stLEzm2AXuQdOprC9AHt/eEVZCQvtKDZ3q8Ov5w7lVr9WQZ3ZMhhIROOW9afONEdSripEDKWTyc1O
	6xT0lsSCdWqURld8TUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYf9y-0000000DeRL-0QJi;
	Tue, 30 Jul 2024 05:12:30 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYf9u-0000000DeQl-3nM3
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 05:12:28 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so2442577a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 22:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722316346; x=1722921146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TT6aLVW/zdodnhT+XtKZ6i2hFkw9MF/DUQGOLynubkI=;
        b=L15s98rfsUjtntNyQrn4tVwj+8FtlRcAL9unRflid8Ux+t8nqcQuhBv2v7n9ez/qM1
         0Q7GHfxmzoibohb7E7EB/JgqRUYc4Vk0PW4/EI17h2UlSCaht4ZShReGAy9W8fjfiC5J
         IExwEpU2dfibwfv4t2pbCOWfjMlEZQiPQHPU/lckFvZ+uMipLI4acNM4ZGp27sA4YZx0
         rYSMxM1ssUP0ozasjm4RPpxd+v+/W81mkXbBOofYK35nybckDKZK6ZV5pulEy83FLHO5
         45VNH77pTYbnzGCFsS0BVb2llKzRR2WlGSVIiZ+AcCwDYI51JczwOebowNUhYeStPjJ8
         LvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722316346; x=1722921146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TT6aLVW/zdodnhT+XtKZ6i2hFkw9MF/DUQGOLynubkI=;
        b=UgaxnMHLWv9XpjlysSOwKOlAB7EAo43uj6mUrKePSvxnyQ069wKdK7T3DA10ZbFPe/
         wwRc/ys3uM9oOvdBj4fPaeRQ/ztl6fAjKKDzsPO715dNlqrRyk+GisQaPf7E+SbZZhgL
         qcMagxbNhpb74xJlnEPKJSzAF9jP7/Qu+pjI4VVUslxZ64312DXsLQu3Y2K9hDoqq7Lo
         zZltRqydM2Ln43/lV6QpDhfZ/P8lRYCA10vyb1BkUTUwxpY9kceetjSKELnjC9iaxR0O
         AuA8JNNhnJ7M7UgKGCuTdJa/0scjG2/RdphrIx2xms8irSGG6PJTAdvYf2nTGwvWVSTA
         tZWw==
X-Forwarded-Encrypted: i=1; AJvYcCUEY0XVMhlM974DiD9pXH26LMo9sroD06kcS9pvcDnPEPD7sWtCU5+Zg0SKEFf4U2yq7k2LhwBBe0UxYCfIgTwgG+chcNZu7eZaAyWiUrN0
X-Gm-Message-State: AOJu0YwtAKkGFR4+w8s6YmanHBkaDV/cxf+CZgbKXUu11vdfspSJ/5r2
	h3Sd1n4ll6BppQeIygqzw7DD0Iq0S8UMqmdURSSUjx3/0In+P3qpkisGTLPq2WBuu+7d7GkazRi
	LRoTR68lo
X-Google-Smtp-Source: AGHT+IFMHivNH4RMDotuWrEigk/566gljKmvKgYSaYrdZAxDrTLZ78PUztPHx2BFQsrKbEtPpLVQaw==
X-Received: by 2002:a17:90a:1787:b0:2c9:75c6:32dc with SMTP id 98e67ed59e1d1-2cf7e09a8b8mr8383256a91.1.1722316345586;
        Mon, 29 Jul 2024 22:12:25 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74e8957sm11497728a91.39.2024.07.29.22.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 22:12:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] serial: 8250_platform: Enable generic 16550A platform devices
Date: Tue, 30 Jul 2024 10:42:18 +0530
Message-ID: <20240730051218.767580-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_221226_970407_20F1F365 
X-CRM114-Status: GOOD (  20.51  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Drew Fustini <dfustini@tenstorrent.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrei Warkentin <andrei.warkentin@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, 8250_platform driver is used only for devices with fixed
serial ports (plat_serial8250_port). Extend this driver for any generic
16550A platform devices which can be probed using standard hardware
discovery mechanisms like ACPI.

This is required in particular for RISC-V which has non-PNP generic
16550A compatible UART that needs to be enumerated as ACPI platform
device.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/tty/serial/8250/8250_platform.c | 77 +++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_platform.c b/drivers/tty/serial/8250/8250_platform.c
index d5c8d851348d..bdfb16bed4f2 100644
--- a/drivers/tty/serial/8250/8250_platform.c
+++ b/drivers/tty/serial/8250/8250_platform.c
@@ -6,7 +6,9 @@
  *	      PNP 8250/16550 ports
  *	      "serial8250" platform devices
  */
+#include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/once.h>
@@ -100,6 +102,65 @@ void __init serial8250_isa_init_ports(void)
 	DO_ONCE(__serial8250_isa_init_ports);
 }
 
+/*
+ * Generic 16550A platform devices
+ */
+static int serial8250_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct uart_8250_port uart = { 0 };
+	struct resource *regs;
+	unsigned char iotype;
+	int ret, line;
+
+	regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (regs) {
+		uart.port.iobase = regs->start;
+		iotype = UPIO_PORT;
+	} else {
+		regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!regs) {
+			dev_err(dev, "no registers defined\n");
+			return -EINVAL;
+		}
+
+		uart.port.mapbase = regs->start;
+		uart.port.mapsize = resource_size(regs);
+		uart.port.flags = UPF_IOREMAP;
+		iotype = UPIO_MEM;
+	}
+
+	/* Default clock frequency*/
+	uart.port.uartclk = 1843200;
+	uart.port.type = PORT_16550A;
+	uart.port.dev = &pdev->dev;
+	uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
+	ret = uart_read_and_validate_port_properties(&uart.port);
+	/* no interrupt -> fall back to polling */
+	if (ret == -ENXIO)
+		ret = 0;
+	if (ret)
+		return ret;
+
+	if (uart.port.mapbase) {
+		uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
+		if (!uart.port.membase)
+			return -ENOMEM;
+	}
+
+	/*
+	 * The previous call may not set iotype correctly when reg-io-width
+	 * property is absent and it doesn't support IO port resource.
+	 */
+	uart.port.iotype = iotype;
+
+	line = serial8250_register_8250_port(&uart);
+	if (line < 0)
+		return -ENODEV;
+
+	return 0;
+}
+
 /*
  * Register a set of serial devices attached to a platform device.  The
  * list is terminated with a zero flags entry, which means we expect
@@ -110,6 +171,15 @@ static int serial8250_probe(struct platform_device *dev)
 	struct plat_serial8250_port *p = dev_get_platdata(&dev->dev);
 	struct uart_8250_port uart;
 	int ret, i, irqflag = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
+
+	/*
+	 * Probe platform UART devices defined using standard hardware
+	 * discovery mechanism like ACPI or DT. Support only ACPI based
+	 * serial device for now.
+	 */
+	if (!p && is_acpi_node(fwnode))
+		return serial8250_platform_probe(dev);
 
 	memset(&uart, 0, sizeof(uart));
 
@@ -198,6 +268,12 @@ static int serial8250_resume(struct platform_device *dev)
 	return 0;
 }
 
+static const struct acpi_device_id acpi_platform_serial_table[] = {
+	{ "RSCV0003", 0 }, // RISC-V Generic 16550A UART
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, acpi_platform_serial_table);
+
 static struct platform_driver serial8250_isa_driver = {
 	.probe		= serial8250_probe,
 	.remove_new	= serial8250_remove,
@@ -205,6 +281,7 @@ static struct platform_driver serial8250_isa_driver = {
 	.resume		= serial8250_resume,
 	.driver		= {
 		.name	= "serial8250",
+		.acpi_match_table = ACPI_PTR(acpi_platform_serial_table),
 	},
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
