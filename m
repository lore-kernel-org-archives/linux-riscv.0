Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6515EFB44B0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 05:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VD/8U9OO0Tw9U0pp1WqKcAyk675d4bMilctwpZnvLxI=; b=GDs/dehA3Jf0nX
	zdORupSp74OPKEO2KNP/VsBmq/MEh1MQCQNboBmsEiMN2zZx/o3fXUKcYyvPGKEZLMAdWTzM8cHpi
	xA8yFSnk0HyQ/Dh9pgQaR5HbBGDk1sHhPQDyZX1xQgum7lx9LZ+yKNC+OKaw8VmntiBdVCGuf73jk
	UWVLp/JV/X0mpizOcy50SjRdlGzIcvxG8yQkj9fFPcXqc0nIVuSyA7FxlbAhCLwtAcytwkK1A2upZ
	gnfY12iQ2+9jRhEHOjnEFuSaw7fSrIQK0K7ApWV+C+fKFI+ji3UhyI+eUpdlVFjX7apG6DbBSbJ60
	HkWpgrVJcz3K/M97Fz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9HC-0000000Cfih-1hqe;
	Fri, 24 Apr 2026 05:40:30 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9H9-0000000Cfhu-1jJp
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 05:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=n+Mra1RI8A32LCU/hPXltc+TQ6Q646Q
	yx9RcVRBugnk=; b=Cq2lORS0qBdbfGxNvoAgK2H9SP4QdVJFdoJ75LRMvIdIvAO
	JunCLhx+ynyfQHl8oI8fZcuBGOhEKSdq47A3l0Qcc4O7vjLVWE89c05AXTZVSfn7
	rgfX0trQt0eGSFUvVDuB9Sto43KvjHqked/b7PPcWZ/3fV1qDhF43XJhAaPg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJlAutpm8gCAA--.1607S3;
	Fri, 24 Apr 2026 13:40:57 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Fri, 24 Apr 2026 13:39:28 +0800
Subject: [PATCH v4 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
MIME-Version: 1.0
Message-Id: <20260424-ultrarisc-serial-v4-1-1765a0b4c4a0@ultrarisc.com>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
In-Reply-To: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777009209; l=7179;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=1EJ+15mmRD/oeHglBVGEUf+8kQPiJcsHUEUYYNgLwiA=;
 b=tmMxvaIfQOKnIu7Q2yyAAL3YeamV0Bjy7J3CDnd9cB2kHTdmgTnh09LI3Y7Fej9DsKQO2lvOh
 2O2cwiX9WWmCqv1zCBH5fGWnR9j++1AFtAZ59BpIWDcrbtbJVyqZqXr
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUJlAutpm8gCAA--.1607S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WF48GFWfur4rZry8tr1rCrg_yoW3GF48pr
	1FkFZ8tF1qya13W34xtFW3tr4xXFWxGw109ry3W3yDtFW8A34ktFyYvFW3tr4DXryrArWU
	JF1UAw1Yga4I9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWnq6L8ACQABsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_224028_013883_15DFEE9D 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move the DW_UART_* register offsets and CPR bit/field definitions from
8250_dwlib.c into 8250_dwlib.h so they can be shared by 8250_dw and
8250_dwlib users.

Add an include guard for 8250_dwlib.h.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 11 -------
 drivers/tty/serial/8250/8250_dwlib.c | 49 ----------------------------
 drivers/tty/serial/8250/8250_dwlib.h | 63 ++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 60 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 94beadb4024d..467755bf0092 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -34,22 +34,11 @@
 
 #include "8250_dwlib.h"
 
-/* Offsets for the DesignWare specific registers */
-#define DW_UART_USR	0x1f /* UART Status Register */
-#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
-
 #define OCTEON_UART_USR	0x27 /* UART Status Register */
 
 #define RZN1_UART_TDMACR 0x10c /* DMA Control Register Transmit Mode */
 #define RZN1_UART_RDMACR 0x110 /* DMA Control Register Receive Mode */
 
-/* DesignWare specific register fields */
-#define DW_UART_IIR_IID			GENMASK(3, 0)
-
-#define DW_UART_MCR_SIRE		BIT(6)
-
-#define DW_UART_USR_BUSY		BIT(0)
-
 /* Renesas specific register fields */
 #define RZN1_UART_xDMACR_DMA_EN		BIT(0)
 #define RZN1_UART_xDMACR_1_WORD_BURST	(0 << 1)
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index b055d89cfb39..8859e66d2d71 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -13,55 +13,6 @@
 
 #include "8250_dwlib.h"
 
-/* Offsets for the DesignWare specific registers */
-#define DW_UART_TCR	0xac /* Transceiver Control Register (RS485) */
-#define DW_UART_DE_EN	0xb0 /* Driver Output Enable Register */
-#define DW_UART_RE_EN	0xb4 /* Receiver Output Enable Register */
-#define DW_UART_DLF	0xc0 /* Divisor Latch Fraction Register */
-#define DW_UART_RAR	0xc4 /* Receive Address Register */
-#define DW_UART_TAR	0xc8 /* Transmit Address Register */
-#define DW_UART_LCR_EXT	0xcc /* Line Extended Control Register */
-#define DW_UART_CPR	0xf4 /* Component Parameter Register */
-#define DW_UART_UCV	0xf8 /* UART Component Version */
-
-/* Receive / Transmit Address Register bits */
-#define DW_UART_ADDR_MASK		GENMASK(7, 0)
-
-/* Line Status Register bits */
-#define DW_UART_LSR_ADDR_RCVD		BIT(8)
-
-/* Transceiver Control Register bits */
-#define DW_UART_TCR_RS485_EN		BIT(0)
-#define DW_UART_TCR_RE_POL		BIT(1)
-#define DW_UART_TCR_DE_POL		BIT(2)
-#define DW_UART_TCR_XFER_MODE		GENMASK(4, 3)
-#define DW_UART_TCR_XFER_MODE_DE_DURING_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 0)
-#define DW_UART_TCR_XFER_MODE_SW_DE_OR_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 1)
-#define DW_UART_TCR_XFER_MODE_DE_OR_RE		FIELD_PREP(DW_UART_TCR_XFER_MODE, 2)
-
-/* Line Extended Control Register bits */
-#define DW_UART_LCR_EXT_DLS_E		BIT(0)
-#define DW_UART_LCR_EXT_ADDR_MATCH	BIT(1)
-#define DW_UART_LCR_EXT_SEND_ADDR	BIT(2)
-#define DW_UART_LCR_EXT_TRANSMIT_MODE	BIT(3)
-
-/* Component Parameter Register bits */
-#define DW_UART_CPR_ABP_DATA_WIDTH	GENMASK(1, 0)
-#define DW_UART_CPR_AFCE_MODE		BIT(4)
-#define DW_UART_CPR_THRE_MODE		BIT(5)
-#define DW_UART_CPR_SIR_MODE		BIT(6)
-#define DW_UART_CPR_SIR_LP_MODE		BIT(7)
-#define DW_UART_CPR_ADDITIONAL_FEATURES	BIT(8)
-#define DW_UART_CPR_FIFO_ACCESS		BIT(9)
-#define DW_UART_CPR_FIFO_STAT		BIT(10)
-#define DW_UART_CPR_SHADOW		BIT(11)
-#define DW_UART_CPR_ENCODED_PARMS	BIT(12)
-#define DW_UART_CPR_DMA_EXTRA		BIT(13)
-#define DW_UART_CPR_FIFO_MODE		GENMASK(23, 16)
-
-/* Helper for FIFO size calculation */
-#define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)) * 16)
-
 /*
  * divisor = div(I) + div(F)
  * "I" means integer, "F" means fractional
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7dd2a8e7b780..5026a123cf42 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -1,11 +1,72 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /* Synopsys DesignWare 8250 library header file. */
 
+#ifndef _SERIAL_8250_DWLIB_H_
+#define _SERIAL_8250_DWLIB_H_
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
 #include "8250.h"
 
+/* Offsets for the DesignWare specific registers */
+#define DW_UART_USR	0x1f /* UART Status Register */
+#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
+#define DW_UART_TCR	0xac /* Transceiver Control Register (RS485) */
+#define DW_UART_DE_EN	0xb0 /* Driver Output Enable Register */
+#define DW_UART_RE_EN	0xb4 /* Receiver Output Enable Register */
+#define DW_UART_DLF	0xc0 /* Divisor Latch Fraction Register */
+#define DW_UART_RAR	0xc4 /* Receive Address Register */
+#define DW_UART_TAR	0xc8 /* Transmit Address Register */
+#define DW_UART_LCR_EXT	0xcc /* Line Extended Control Register */
+#define DW_UART_CPR	0xf4 /* Component Parameter Register */
+#define DW_UART_UCV	0xf8 /* UART Component Version */
+
+/* Receive / Transmit Address Register bits */
+#define DW_UART_ADDR_MASK		GENMASK(7, 0)
+
+/* Line Status Register bits */
+#define DW_UART_LSR_ADDR_RCVD		BIT(8)
+
+/* Transceiver Control Register bits */
+#define DW_UART_TCR_RS485_EN		BIT(0)
+#define DW_UART_TCR_RE_POL		BIT(1)
+#define DW_UART_TCR_DE_POL		BIT(2)
+#define DW_UART_TCR_XFER_MODE		GENMASK(4, 3)
+#define DW_UART_TCR_XFER_MODE_DE_DURING_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 0)
+#define DW_UART_TCR_XFER_MODE_SW_DE_OR_RE	FIELD_PREP(DW_UART_TCR_XFER_MODE, 1)
+#define DW_UART_TCR_XFER_MODE_DE_OR_RE		FIELD_PREP(DW_UART_TCR_XFER_MODE, 2)
+
+/* Line Extended Control Register bits */
+#define DW_UART_LCR_EXT_DLS_E		BIT(0)
+#define DW_UART_LCR_EXT_ADDR_MATCH	BIT(1)
+#define DW_UART_LCR_EXT_SEND_ADDR	BIT(2)
+#define DW_UART_LCR_EXT_TRANSMIT_MODE	BIT(3)
+
+/* Component Parameter Register bits */
+#define DW_UART_CPR_ABP_DATA_WIDTH	GENMASK(1, 0)
+#define DW_UART_CPR_AFCE_MODE		BIT(4)
+#define DW_UART_CPR_THRE_MODE		BIT(5)
+#define DW_UART_CPR_SIR_MODE		BIT(6)
+#define DW_UART_CPR_SIR_LP_MODE		BIT(7)
+#define DW_UART_CPR_ADDITIONAL_FEATURES	BIT(8)
+#define DW_UART_CPR_FIFO_ACCESS		BIT(9)
+#define DW_UART_CPR_FIFO_STAT		BIT(10)
+#define DW_UART_CPR_SHADOW		BIT(11)
+#define DW_UART_CPR_ENCODED_PARMS	BIT(12)
+#define DW_UART_CPR_DMA_EXTRA		BIT(13)
+#define DW_UART_CPR_FIFO_MODE		GENMASK(23, 16)
+
+/* DesignWare specific register fields */
+#define DW_UART_IIR_IID			GENMASK(3, 0)
+#define DW_UART_MCR_SIRE		BIT(6)
+#define DW_UART_USR_BUSY		BIT(0)
+
+/* Helper for FIFO size calculation */
+#define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)) * 16)
+
 struct dw8250_port_data {
 	/* Port properties */
 	int			line;
@@ -38,3 +99,5 @@ static inline void dw8250_writel_ext(struct uart_port *p, int offset, u32 reg)
 	else
 		writel(reg, p->membase + offset);
 }
+
+#endif /* _SERIAL_8250_DWLIB_H_ */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
