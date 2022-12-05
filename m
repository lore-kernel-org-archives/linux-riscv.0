Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83576C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 05:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Zsrjlm8Q/td4QSuyHOjCG4Lq6EpottBNx+bEVaqnTs=; b=0XljYDpvHDT5lS
	WQQJbpjkLbuVlvCODweGh1PkPMOjtwJ6GnY/VQwN65O3uG03KPHo6H6vlqddPtXHlrBjAXSXdk6oG
	Gt24EZDsYmNTqmzKjiKNmtn9l+sQMVe35i0gv0+abnrZc66Jn1Qs7L3IJifsvSx7SD2Dyr0CEodHw
	EWyZGtsd6mQVl5C7kyjUowi+vjqCC0bZixWIRAnX3dw6ZS2I6oUlXA03xnBHZBivi4kj8K+Vbsog6
	yuqalOU7DGBeFYqvgLDgPFxTzioJy7E0C80zc4gPbom3hEe/ayMN/ZiB4wp52ZtzlwPNeFKm+TDEC
	vnW7PP4c9iiqm1cYdmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p23bR-00E7HE-W3; Mon, 05 Dec 2022 05:01:18 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p23bM-00E7DC-L3
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 05:01:15 +0000
X-QQ-mid: bizesmtp83t1670216440tdylbiir
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Dec 2022 13:00:39 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: PsQCk6chbj5eK9ByDZQ9MzbRQ+lBTauZ/hMtMvyxFIKaWgsW4FUHY+4JhPLWp
	N8cebpF9TczECdys04OEy9HJn9oZa3VLtz3WoQfuUwnGABxRVV92ZnKGLKSiUNXJ5vOly2i
	EmIlXEJEYBtM4ApVe9usMvY0zPi/qFYgvjmCUU+0nd4O1v/vE9Ch275x3rBjfwiHDf3A2T1
	ALae+DDCvEXhohsbyENwZm6hzz3JChV1omL5zQ9O6OghO903vD0KT3kQqoUEiDhoenU0Bhw
	fitqzjEco1KqPtDZACKdNQMZ2GeNH3iCax7PxJS9Eqz/Xv5K1uxwzC+K3OLB1vn9HYngpfU
	+ZkRbjl7WKf7o7fqqO6e0i0kHY+jg==
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
Subject: [PATCH 1/2] serial: Adapt Arm semihosting earlycon driver to RISC-V
Date: Mon,  5 Dec 2022 13:00:37 +0800
Message-Id: <20221205050038.195746-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_210113_009769_0F19D65A 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

Per RISC-V semihosting spec [1], adapt the existing Arm semihosting
earlycon driver to RISC-V.

[1] https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 drivers/tty/serial/Kconfig                 |  2 +-
 drivers/tty/serial/earlycon-arm-semihost.c | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

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
diff --git a/drivers/tty/serial/earlycon-arm-semihost.c b/drivers/tty/serial/earlycon-arm-semihost.c
index fcdec5f42376..25a0f91926a3 100644
--- a/drivers/tty/serial/earlycon-arm-semihost.c
+++ b/drivers/tty/serial/earlycon-arm-semihost.c
@@ -6,6 +6,10 @@
  * Adapted for ARM and earlycon:
  * Copyright (C) 2014 Linaro Ltd.
  * Author: Rob Herring <robh@kernel.org>
+ *
+ * Adapted for RISC-V and earlycon:
+ * Copyright (C) 2022 tinylab.org
+ * Author: Bin Meng <bmeng@tinylab.org>
  */
 #include <linux/kernel.h>
 #include <linux/console.h>
@@ -23,7 +27,18 @@
  */
 static void smh_putc(struct uart_port *port, unsigned char c)
 {
-#ifdef CONFIG_ARM64
+#if defined(CONFIG_RISCV)
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
+#elif defined(CONFIG_ARM64)
 	asm volatile("mov  x1, %0\n"
 		     "mov  x0, #3\n"
 		     "hlt  0xf000\n"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
