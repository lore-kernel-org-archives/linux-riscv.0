Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994ECFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltauhvryDAeWBoyKiI6Rp3GByNINRgfFgyHML5ylUMg=; b=O8v/rYWn4vZ5By
	K5vgvLPev52tZ5/GFB5PnQNGJ/cZoF4e0D7AZT848UIQ2tedp8qwrjOMBp06eV1jRiBSOGjVzT2JO
	2fki+cnNVx7ZV5g4mI6aHRvIaWx2OlTk0w/bwt0Rg5IMZIWKyvztSCZ4twa6vD29VFSxHyj2Fties
	rsuzJjRMYapR55Qz9kF7o3rmEzPqfnfeAMLPKUuAohpx7aw3l3JZJZo2jHYss93NtoaLHhqiX74PW
	qSmriaKiTBYvrC4/Rqa8IkkPm4vFy8RJuGJ8R1ATcX0Hv7sCVx3+pfEo4tQGLmfg2ZK9uEUa4OH/o
	yUlSEHE5qhu+GIV8uEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0zE-00000003J2C-2Hig;
	Wed, 29 Apr 2026 09:13:40 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0zA-00000003J1B-1HoE
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 09:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=UdMs010C5F0YX3vHI4Kv9XgCU5Baql8
	ZWhWSA778QWE=; b=bXjp0fIwuhG/1riqlA+6vdwn5I1bAiwFgppVayFml2hFyEM
	cOqtpWuQKFgporundVXnsV43ntVNkkuMsj97g/TEPrkZm1VkR9Ag1c8opPBLV8zg
	jSejhsJa3S9eFiTdidaudvZszwTJttNXvAgVZQ6WbdjddACN60ukJU+PdrO8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cULgy_FpFiUDAA--.1811S4;
	Wed, 29 Apr 2026 17:14:11 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Wed, 29 Apr 2026 17:13:26 +0800
Subject: [PATCH v7 2/4] serial: 8250_dw: build Renesas RZN1 CPR value from
 DW_UART_CPR_* definitions
MIME-Version: 1.0
Message-Id: <20260429-ultrarisc-serial-v7-2-e475cce9e274@ultrarisc.com>
References: <20260429-ultrarisc-serial-v7-0-e475cce9e274@ultrarisc.com>
In-Reply-To: <20260429-ultrarisc-serial-v7-0-e475cce9e274@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777454005; l=2352;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=WjU2AbG/UNZElfP5fOb5TngitEhS+RvlYopZbCL9xXY=;
 b=pXZUyBhbEF+Kbgi8VaJ2MAn/3ZlhJpiSvRPGWpuC327nYc0DfeuXWKL2DIVbmlRj6zHE/gb5u
 NpsbXThPptqBjz10533RFGhcY4w8k7yYSf3dljImBm+JGaWbeG1+/mV
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cULgy_FpFiUDAA--.1811S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KF17ur43AF13KFWxKr4DJwb_yoW8KF47pr
	s0kr4qvr1Y93WfW34IkrWjvFWSqa15Ga4IkF9rG3sxt3ZIyr1ktrs0vFy3trZrJFWFvr45
	GF17Zw15ua4jkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwBRsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_021336_700987_571B49FD 
X-CRM114-Status: GOOD (  13.10  )
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
 drivers/tty/serial/8250/8250_dw.c    | 10 +++++++++-
 drivers/tty/serial/8250/8250_dwlib.h |  8 +++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 467755bf0092..480f82d89856 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -937,7 +937,15 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
 
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
+		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(16),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
 };
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 2f26f9ecacbe..1fe52332e774 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -6,6 +6,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/build_bug.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
@@ -68,8 +69,13 @@
 #define DW_UART_CPR_DMA_EXTRA		BIT(13)
 #define DW_UART_CPR_FIFO_MODE		GENMASK(23, 16)
 
-/* Helper for FIFO size calculation */
+/* Helpers for FIFO size calculation */
 #define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)) * 16)
+#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)			\
+	(FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE,		\
+			  BUILD_BUG_ON_ZERO((size) > 2048) +	\
+			  BUILD_BUG_ON_ZERO((size) % 16) +	\
+			  ((size) / 16)))
 
 struct dw8250_port_data {
 	/* Port properties */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
