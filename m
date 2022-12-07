Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AB1C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JkeVfUaWnElyZxDTTz1BPM02sPuxotWbxy3BL2DbmI=; b=1m6YvtxXLi+zQa
	CVYpXT4tYELvxu6sCNMAuv6U/m/u60dWuXlEPmhmOL7uRNPZbo8Dl+Yg7Xw0P3gSVKs6aim+EFlE5
	ciGAK5PaAkIZ3Iom55t7N1U/6NlDQDYXHv6ueFNhVJnZAdfPo+zNzQMpsG91kAcJA9VWpKE66zwSG
	12BZblCpHvrJ0EhINDjJY1xxAUTJwV3PrKlhzPtMndGDWatTnegKNsqg6GQfHJocGSd0Kk95qBOQz
	+WVWieOTFH1m5swbFFpC29jm+9S5kF3otu9192v4CmoiJt8sXHuiVInNnHTC6oeeAfdlMBLIKzYhG
	lHOkmInF7XageBVvYRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2usc-004GwA-EB; Wed, 07 Dec 2022 13:54:34 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2usQ-004GiI-7u
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 13:54:25 +0000
X-QQ-mid: bizesmtp74t1670421238tac3l1oe
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Dec 2022 21:53:57 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: xwvWJGGFd7MwyO0I/Q6cO3SN87cXTA0Qqfh8HCCQSS6fqMBr/qkBzS+Hb4sLp
	RIF6DZbbbporXK5SG5F4L4GnHn3cPJgPb5h4J9lKGr5wkCAxIZIeU5807depEIkwOLe/Mvy
	w0fF2c1Xl1ux4LFQLywy9e9/clKPMiR6ZcYxicJ41cKAl3Xv6ZkiqQ6IruvUZk/stFlQJH8
	iJdiwmmZOrFZdI9SL+AxAuRudDrkCSZ1BMsWKQjKaEPDbO972J8msrOerMwffpes+NXzixA
	M0hzvtwl06PkTeG8l2CIIQ8YzQIf4d5qZW2xX3RNckdIF9+X7lJdOdEAGAlDSChORGQtg0r
	FGahlUmropJkxzJ1wNuBcRJWrhJuK4yhfdO3fVCeNsWeoQ6Ohn9G58xYSpL8A==
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
Subject: [PATCH v2 2/3] riscv: Implement semihost.h for earlycon semihost driver
Date: Wed,  7 Dec 2022 21:53:51 +0800
Message-Id: <20221207135352.592556-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207135352.592556-1-bmeng@tinylab.org>
References: <20221207135352.592556-1-bmeng@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_055422_629132_51192919 
X-CRM114-Status: GOOD (  11.84  )
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

[1] https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

Changes in v2:
- Move the RISC-V implementation to semihost.h

 arch/riscv/include/asm/semihost.h | 19 +++++++++++++++++++
 drivers/tty/serial/Kconfig        |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/semihost.h

diff --git a/arch/riscv/include/asm/semihost.h b/arch/riscv/include/asm/semihost.h
new file mode 100644
index 000000000000..886f21d7a476
--- /dev/null
+++ b/arch/riscv/include/asm/semihost.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 tinylab.org
+ * Author: Bin Meng <bmeng@tinylab.org>
+ */
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
