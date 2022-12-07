Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2B5C4708E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5bDYqaagXpeJZclhsrhKiHTy+19TWOLi7XvIoj8WuIE=; b=ZciwLQq2zCB/Xc
	TkG36sqkA+a59pi5wIZOrsaBMjNy+XXYVEIJsuhIU4MO9T3l/OB/5yyu7+5htCoWNucliiR0HI3cM
	Byxt0SFeXo+SAnZfMUpGQ1FgwXOw9I+cXgeMJE5aK3F9bOov7Dbpl7pJfz/HD2JDgL44Pi8zcQ31z
	Lr7EBWwqjw4BL+ccgE4TLiw6fy4cj1cLmSbwUPqcibETg2DM7ooisTkSim+C1+zRyM9Ub0cDpnSDN
	po5K/BigNr026lnwhm/H/Q0l0reaWAbA4L9hiUbrcVbfHDBqOfC8ClOcGix+knedhhziABgD/xgBh
	kpRBm6smrEzymVb3Qj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2usd-004GwX-Mf; Wed, 07 Dec 2022 13:54:35 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2usQ-004Gg9-Dz; Wed, 07 Dec 2022 13:54:25 +0000
X-QQ-mid: bizesmtp74t1670421234t6glizjv
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Dec 2022 21:53:53 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: znfcQSa1hKahN1m9MXihhlD9H25KcTrmlTsiK+jnZWRL9/KxDfCfAcvhFsc/S
	H6xwwcByw5o8tyboieoNR+AmVut1u5dwzH1z7kU8wcl95Mbu8Q5d9o585jd++GMqxXex3jm
	CkZv5G0mO+lxy1HIvqPQgiBjL+Xg/FTbI3XP92dc2IIwtBscteuxqYwu9H8dMfTPR2pi76w
	XdcDgwtn7ldi7QrfHXzB8kvjGfAzHnmjj/vVARdO1lFukykzUI/F+5Z05FMnzMCP0w6VihL
	Ij5qHkPkSvQihQ2PzgtxZMIcnd8yQ+naJaNuU5uA8uQjy5YHwcnRNQRB0Q3PWeJGSSWdsg4
	lZEa5S3bFSh34fllrOvku39hQehmbNfimeWSEpMnQ1n/6Mvmn1T+aPsOt85ag==
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
Subject: [PATCH v2 1/3] serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h
Date: Wed,  7 Dec 2022 21:53:50 +0800
Message-Id: <20221207135352.592556-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_055422_820086_EDCC6F0C 
X-CRM114-Status: GOOD (  11.67  )
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

Changes in v2:
- new patch: "serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h"

 arch/arm/include/asm/semihost.h            | 23 ++++++++++++++++++++
 arch/arm64/include/asm/semihost.h          | 17 +++++++++++++++
 drivers/tty/serial/earlycon-arm-semihost.c | 25 +---------------------
 3 files changed, 41 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/include/asm/semihost.h
 create mode 100644 arch/arm64/include/asm/semihost.h

diff --git a/arch/arm/include/asm/semihost.h b/arch/arm/include/asm/semihost.h
new file mode 100644
index 000000000000..c33cb5124376
--- /dev/null
+++ b/arch/arm/include/asm/semihost.h
@@ -0,0 +1,23 @@
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
+#ifdef CONFIG_THUMB2_KERNEL
+#define SEMIHOST_SWI	"0xab"
+#else
+#define SEMIHOST_SWI	"0x123456"
+#endif
+
+static inline void smh_putc(struct uart_port *port, unsigned char c)
+{
+	asm volatile("mov  r1, %0\n"
+		     "mov  r0, #3\n"
+		     "svc  " SEMIHOST_SWI "\n"
+		     : : "r" (&c) : "r0", "r1", "memory");
+}
diff --git a/arch/arm64/include/asm/semihost.h b/arch/arm64/include/asm/semihost.h
new file mode 100644
index 000000000000..9e56d38fe5fd
--- /dev/null
+++ b/arch/arm64/include/asm/semihost.h
@@ -0,0 +1,17 @@
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
+static inline void smh_putc(struct uart_port *port, unsigned char c)
+{
+	asm volatile("mov  x1, %0\n"
+		     "mov  x0, #3\n"
+		     "hlt  0xf000\n"
+		     : : "r" (&c) : "x0", "x1", "memory");
+}
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
