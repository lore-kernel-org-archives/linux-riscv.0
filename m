Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52F7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyGmgAcexJr58dUYzvIzRQ1CsNwy9v1zJlHcg6Gaw8U=; b=GrHMZKaXwVEtDe
	mERIi3vwvblGxO3w7Ubb7pV5/T9ACwyb2B5Yt7CRWf26uDqyyE4uryPqn2vXYYx7ACMRLZFSlrPL/
	ki28jDDY1ILrMW5Zp80CC07ecHlTduEce5GXFtgB7YFqmX0a73w6SsxPFH0WyzWaUaxThZqQurkBz
	EIR3JeiZF2cBBbejou7j+AEiPDM5HrjyuCRKyvEo4PaJYg3DQayVArHrpLTncYbmLE08FoyPyrHeY
	9SRb0lJQYYoVRD47TdHWPiZhtlz/YpFvzrfcUk0H5ZFWW3sU8GHTH8iiHRwgQ/2Nl2+34V8WvOIYY
	riR99Vele1PEdA4pXsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ewL-008nPe-ER; Fri, 09 Dec 2022 15:05:29 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ew0-008n6d-6B; Fri, 09 Dec 2022 15:05:11 +0000
X-QQ-mid: bizesmtp89t1670598283t2j1lelf
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Dec 2022 23:04:41 +0800 (CST)
X-QQ-SSF: 01200000002000B0C000B00A0000000
X-QQ-FEAT: znfcQSa1hKZEkVEo5KsJPnztRM+YmWhuMP5lhz0A261j6bY6bsUz696ZFniYc
	IU03XC1wSi2mTpJ4Oj7Nff0Mv/eMawGUQSZLZVoQMPCrpyyWZ45AOCUMkImiFB7XXhf4GPo
	a4C1mosVhQKwwMj2rbWMSAz4HZoPpkuO2pn1BK3GOMlRTHgOhhbziFZ3fgK1f8z25438B/v
	NhmUnGbLWn6VF9J+Oa6QZvy/nu/rKuzaAkhseY4+t0ypw7NT/Yqhovc9tG3jynzpXmE6+6g
	NG4Qoz10dv3AG5/zN4SQRBb1AmUEmB+TLgvJnFXYCmlwI3Dghgs3w87u62UiIMuchUdvmWt
	FOONZXRgMzi5ce4r0xcY4MuIdqC031oicLhrpoGk00mYjUHVWk=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h
Date: Fri,  9 Dec 2022 23:04:35 +0800
Message-Id: <20221209150437.795918-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209150437.795918-1-bmeng@tinylab.org>
References: <20221209150437.795918-1-bmeng@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_070508_572505_6AE77DFC 
X-CRM114-Status: GOOD (  12.00  )
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

Move smh_putc() variants in respective arch/*/include/asm/semihost.h,
in preparation to add RISC-V support.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v3:
- add #ifdef in the header to prevent from multiple inclusion
- add forward-declare struct uart_port

Changes in v2:
- new patch: "serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h"

 arch/arm/include/asm/semihost.h            | 30 ++++++++++++++++++++++
 arch/arm64/include/asm/semihost.h          | 24 +++++++++++++++++
 drivers/tty/serial/earlycon-arm-semihost.c | 25 +-----------------
 3 files changed, 55 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/include/asm/semihost.h
 create mode 100644 arch/arm64/include/asm/semihost.h

diff --git a/arch/arm/include/asm/semihost.h b/arch/arm/include/asm/semihost.h
new file mode 100644
index 000000000000..f365787e7c23
--- /dev/null
+++ b/arch/arm/include/asm/semihost.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Author: Marc Zyngier <marc.zyngier@arm.com>
+ *
+ * Adapted for ARM and earlycon:
+ * Copyright (C) 2014 Linaro Ltd.
+ * Author: Rob Herring <robh@kernel.org>
+ */
+
+#ifndef _ARM_SEMIHOST_H_
+#define _ARM_SEMIHOST_H_
+
+#ifdef CONFIG_THUMB2_KERNEL
+#define SEMIHOST_SWI	"0xab"
+#else
+#define SEMIHOST_SWI	"0x123456"
+#endif
+
+struct uart_port;
+
+static inline void smh_putc(struct uart_port *port, unsigned char c)
+{
+	asm volatile("mov  r1, %0\n"
+		     "mov  r0, #3\n"
+		     "svc  " SEMIHOST_SWI "\n"
+		     : : "r" (&c) : "r0", "r1", "memory");
+}
+
+#endif /* _ARM_SEMIHOST_H_ */
diff --git a/arch/arm64/include/asm/semihost.h b/arch/arm64/include/asm/semihost.h
new file mode 100644
index 000000000000..87e353dab868
--- /dev/null
+++ b/arch/arm64/include/asm/semihost.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Author: Marc Zyngier <marc.zyngier@arm.com>
+ *
+ * Adapted for ARM and earlycon:
+ * Copyright (C) 2014 Linaro Ltd.
+ * Author: Rob Herring <robh@kernel.org>
+ */
+
+#ifndef _ARM64_SEMIHOST_H_
+#define _ARM64_SEMIHOST_H_
+
+struct uart_port;
+
+static inline void smh_putc(struct uart_port *port, unsigned char c)
+{
+	asm volatile("mov  x1, %0\n"
+		     "mov  x0, #3\n"
+		     "hlt  0xf000\n"
+		     : : "r" (&c) : "x0", "x1", "memory");
+}
+
+#endif /* _ARM64_SEMIHOST_H_ */
diff --git a/drivers/tty/serial/earlycon-arm-semihost.c b/drivers/tty/serial/earlycon-arm-semihost.c
index fcdec5f42376..e4692a8433f9 100644
--- a/drivers/tty/serial/earlycon-arm-semihost.c
+++ b/drivers/tty/serial/earlycon-arm-semihost.c
@@ -11,30 +11,7 @@
 #include <linux/console.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
-
-#ifdef CONFIG_THUMB2_KERNEL
-#define SEMIHOST_SWI	"0xab"
-#else
-#define SEMIHOST_SWI	"0x123456"
-#endif
-
-/*
- * Semihosting-based debug console
- */
-static void smh_putc(struct uart_port *port, unsigned char c)
-{
-#ifdef CONFIG_ARM64
-	asm volatile("mov  x1, %0\n"
-		     "mov  x0, #3\n"
-		     "hlt  0xf000\n"
-		     : : "r" (&c) : "x0", "x1", "memory");
-#else
-	asm volatile("mov  r1, %0\n"
-		     "mov  r0, #3\n"
-		     "svc  " SEMIHOST_SWI "\n"
-		     : : "r" (&c) : "r0", "r1", "memory");
-#endif
-}
+#include <asm/semihost.h>
 
 static void smh_write(struct console *con, const char *s, unsigned n)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
