Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AB5FF886F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 05:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/3X79tbTc4sDV2VwpbFykEW/0zJCW9oGIGAkWyeaJA=; b=n1uyAlZ4eez4m5
	iwqaZhNbxy6L34aabm0JD4iJs/SNWfEig9MDPvL4KAZgMlDAdgkWgxUFPO7UyTkN+puiPZV/A4pPC
	SkCHDv9cNSeLw3FMR4W1KJXvHRsfFG8BKc9AbQMH6thcQdpRT0DAG3f8RQIj+QihPHk16wrc/0gPv
	wdAUuxDfR96brDg4morQJBuuUvXprXqzeim+b6tq0H7/nEilYH4GVeyDdgK/3A40scpOdYP01il5O
	ijaOxwvZqPgJTJfZJaimt3r8cTJvzmm4v971wBpaGHZ6l23bu9KYP+CzsskeGOBmiu0Y1Vxxf4CPE
	OTHBqqm//qzNnC4G97/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHaz4-00000000Zx0-1t26;
	Tue, 28 Apr 2026 05:27:46 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHaz1-00000000ZvV-3AaO
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 05:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=eu6xcYQBkr+nwx6koqqcliFwhSiICCy
	FSC33b3cp3aA=; b=q+rbEW1HkPWpUNdrz4jW2Ok+HJG55Lo9rCXoT2X/FXJ9Jc4
	yiSQ6+E9hFP2YjriXdMVuOLKkEGVbAS1LtSsN0OHhwXtRa3pqN062IwvZ2m0qfer
	EWyWNbMr1wPTcMyLf8Xg66/SE8HzWw/7ovYW8max3z1Uh/s4Rn1qVogPIN0w=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIxRfBpJRMDAA--.1785S4;
	Tue, 28 Apr 2026 13:27:24 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 28 Apr 2026 13:26:27 +0800
Subject: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value from
 DW_UART_CPR_* definitions
MIME-Version: 1.0
Message-Id: <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
In-Reply-To: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777353989; l=2326;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=A5CCafM9ZkDWbA5vbjYEFX3HyNOl1jj7t9s3liEYB0k=;
 b=N+HNp/hepAFG1ZmnqJ49LLp4klYmysYR4HEuq/My2/fwIWaPOs61Ksl68CRtTDGxeYaRzQO0X
 6BLgGDHoPvYAu8bEP0qp6L+fAGzCmrjaNWAHngE0mCQRmOg8wV0UqFE
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUIxRfBpJRMDAA--.1785S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KF17ur43AF13KrW3AFyUtrb_yoW8KF1Upr
	s0kr4qvryY93Z3W34IkrWjvF4Sqa15Wa4I9F9rW3sxtF13Ar1ktrs0vF9xtrnrJFWFvrW5
	GF17Ary5uay0kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAisD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_222744_148985_566EB5BB 
X-CRM114-Status: GOOD (  12.08  )
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

Replace the magic CPR value for Renesas RZ/N1 with a composition using
DW_UART_CPR_* bit/field definitions and FIELD_PREP_CONST().

Introduce a helper macro to convert a FIFO size (bytes) into the CPR
FIFO_MODE field value, with BUILD_BUG_ON_ZERO() checks for alignment and
bounds. Use it to replace the literal FIFO_MODE values in the RZN1.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 11 ++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h |  7 +++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 467755bf0092..5cf3bb74b285 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -937,7 +937,16 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 	.usr_reg = DW_UART_USR,
-	.cpr_value = 0x00012f32,
+	.cpr_value = FIELD_PREP_CONST(DW_UART_CPR_ABP_DATA_WIDTH, 2) |
+		     DW_UART_CPR_AFCE_MODE |
+		     DW_UART_CPR_THRE_MODE |
+		     DW_UART_CPR_ADDITIONAL_FEATURES |
+		     DW_UART_CPR_FIFO_ACCESS |
+		     DW_UART_CPR_FIFO_STAT |
+		     DW_UART_CPR_SHADOW |
+		     DW_UART_CPR_DMA_EXTRA |
+		     FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE,
+				      DW_UART_CPR_FIFO_MODE_FROM_SIZE(16)),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
 };
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 2f26f9ecacbe..c1f87cd42ecc 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -6,6 +6,8 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/build_bug.h>
+#include <linux/align.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
@@ -70,6 +72,11 @@
 
 /* Helper for FIFO size calculation */
 #define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)) * 16)
+#define DW_UART_CPR_FIFO_MODE_MAX	0x80
+#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
+	(BUILD_BUG_ON_ZERO(!IS_ALIGNED((size), 16)) +			\
+	 BUILD_BUG_ON_ZERO(((size) / 16) > DW_UART_CPR_FIFO_MODE_MAX) +	\
+	 ((size) / 16))
 
 struct dw8250_port_data {
 	/* Port properties */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
