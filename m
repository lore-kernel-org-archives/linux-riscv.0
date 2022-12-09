Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EF1C04FDE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xe0pp0R+IcgwYoZt8pRJx7e2r0IWM0Bx60V+Kja4EcE=; b=Jj2r35vIxpZZHn
	l/tBXtqHsZ6/RUQa9yxIdLyvjed/p4oChzrXlTBi5jNMdGTRYdFSs28365FuIvIVZuoGskHn1bKfL
	A8PosJ6/nDP0nJqmw+FvygNtyzVxZTuZeDkOPmqcTJmBm71xB7v7y7q8PfeqcJFyvmZow4iuMsqy1
	njOvE0EefQH39YrtF3mn0wOoFjPpmcp8pNkAYjmCK1G8LGAvxcwuyMCXXZ7sidIx819eWHheC70FR
	V9oVYBHL8dZIe6FBYcYjx1pnuAF13w/oqH3eSYrsYxlqn0yApdtPQeJ5ZAIftFih30SxTM2ndfrfZ
	/IYBqWOQVpR1Tk9ePh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ewO-008nTK-LD; Fri, 09 Dec 2022 15:05:32 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ew5-008nC5-IC
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 15:05:15 +0000
X-QQ-mid: bizesmtp89t1670598285td8rum5u
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Dec 2022 23:04:44 +0800 (CST)
X-QQ-SSF: 01200000002000B0C000B00A0000000
X-QQ-FEAT: eSZ1CZgv+JDxI3bkYMKbTdjkw3HK7jXPhTCSg7Rm3gGAzVEQh3qZVDk772x62
	RcnlQ3TCDQBKpL4HEXYtAYBq+s10VpGHenajCYPlmnRYkDW1cCyvU28bP3dGoFJzt/NnAAi
	9pbziDhkypc8rcrRB2SXSoQ9okkCAjY0JDno58pfyZqblYWybP98pprywYy6WnA30twSSkk
	HtUjsUs0pEf3XziNrqPZPNwjWhRxgNggsCplY7mQcxnOAKQawZmsOycyzYMOeAirqYRIVT6
	f0vj/eey25M+7iykhR5ifMsDFZiAAyU+ULt91TPKJ7Y3MhD+QWQEG0xfqPE7M5sWLXpuFjU
	BkP38Blu5oPle1WhiJqDtKkDcUCCyCD7fzWHdV0BNU0Wonfe/4=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 2/3] riscv: Implement semihost.h for earlycon semihost driver
Date: Fri,  9 Dec 2022 23:04:36 +0800
Message-Id: <20221209150437.795918-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209150437.795918-1-bmeng@tinylab.org>
References: <20221209150437.795918-1-bmeng@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_070513_941201_EC7703D3 
X-CRM114-Status: GOOD (  12.90  )
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

Per RISC-V semihosting spec [1], implement semihost.h for the existing
Arm semihosting earlycon driver to work on RISC-V.

Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v3:
- add #ifdef in the header to prevent from multiple inclusion
- add forward-declare struct uart_port
- add a Link tag in the commit message

Changes in v2:
- Move the RISC-V implementation to semihost.h

 arch/riscv/include/asm/semihost.h | 26 ++++++++++++++++++++++++++
 drivers/tty/serial/Kconfig        |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/semihost.h

diff --git a/arch/riscv/include/asm/semihost.h b/arch/riscv/include/asm/semihost.h
new file mode 100644
index 000000000000..557a34938193
--- /dev/null
+++ b/arch/riscv/include/asm/semihost.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 tinylab.org
+ * Author: Bin Meng <bmeng@tinylab.org>
+ */
+
+#ifndef _RISCV_SEMIHOST_H_
+#define _RISCV_SEMIHOST_H_
+
+struct uart_port;
+
+static inline void smh_putc(struct uart_port *port, unsigned char c)
+{
+	asm volatile("addi    a1, %0, 0\n"
+		     "addi    a0, zero, 3\n"
+		     ".balign 16\n"
+		     ".option push\n"
+		     ".option norvc\n"
+		     "slli    zero, zero, 0x1f\n"
+		     "ebreak\n"
+		     "srai    zero, zero, 0x7\n"
+		     ".option pop\n"
+		     : : "r" (&c) : "a0", "a1", "memory");
+}
+
+#endif /* _RISCV_SEMIHOST_H_ */
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 434f83168546..e94d1265151c 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -75,7 +75,7 @@ config SERIAL_AMBA_PL011_CONSOLE
 
 config SERIAL_EARLYCON_ARM_SEMIHOST
 	bool "Early console using ARM semihosting"
-	depends on ARM64 || ARM
+	depends on ARM64 || ARM || RISCV
 	select SERIAL_CORE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
