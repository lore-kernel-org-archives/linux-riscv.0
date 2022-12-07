Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7A6C63705
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5Cl8uo2coY+GvsrENr0D5lvfX6NDcuco/WZrzBBqWA=; b=T+yvAIu+p3AwzT
	z6DqM6RD3lonq52+8ow4dCxSfm136uq1wBZiV37hBTL8defP0l9PPj562gJ6SvCd47SEwydy+04cy
	QTKQ+LFZ5FVfaYl8jkSx2HK+KcQhb48X/IaQs1T79AXb0JqMS5PBSvnZxmLIo8q8tSbTSm+iaTgYz
	I1GJIDfMsjwo1e1K6YqwMK5Cye0YGm+hP5dnB7Z52YCN7BwtZSokMENPVymNa/KWSfPTCgMXiAfU/
	iwjtilVgJxdoCrFUAbt0M77rmYzLUOes7x4BNgVWm5Mem6Y1DMfWuq6JoOnmihgw5uGyKEObvq6hv
	jtlglfT2YjLj86Cr0tZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2use-004Gy9-U5; Wed, 07 Dec 2022 13:54:36 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2usS-004GlF-F4
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 13:54:26 +0000
X-QQ-mid: bizesmtp74t1670421240tpugafm0
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 Dec 2022 21:53:59 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: WfQrrMZtGtFaBhCIjFkwlouFogiRdBICx5npfjqOayIRbX/Flh8LzJ93MYCFh
	36X35vAPGzUK6kjShIP7otSDF0ZW6nd1bkmmFzHHzjDrZYl2OsqoTk0Zz7hFXdq3Dw19JIB
	kKjISittyAUaHDPTnXlZtLYNZgmDRE6fon+hkNT/Lp8E/T09fUcoErU3Js7KONhTPwYzOWQ
	ai7k+ZIRsSQgaurOY1zU3WIdrNIbh2qgEigV/9325z9PywKyNrTwOmUq+E80jl/rpsoEzwo
	nfnv+NSCaYIX8vdLu8G7yMR/sMKJb7f9Ka/F5NyWt9vgcsc1uaHibUBnFqzNQr8yob5P7FB
	30Z9Ilrkk8MZVXrBeZCLIGbhzumN94YTX34evrXQ6lxCwHpwnM=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 3/3] serial: Rename earlycon semihost driver
Date: Wed,  7 Dec 2022 21:53:52 +0800
Message-Id: <20221207135352.592556-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207135352.592556-1-bmeng@tinylab.org>
References: <20221207135352.592556-1-bmeng@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_055424_819523_DCDEF38D 
X-CRM114-Status: GOOD (  10.89  )
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

Now that earlycon semihost driver works on RISC-V too, let's use a
much more generic name for the driver.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

(no changes since v1)

 drivers/tty/serial/Kconfig                           | 12 ++++++------
 drivers/tty/serial/Makefile                          |  2 +-
 .../{earlycon-arm-semihost.c => earlycon-semihost.c} |  0
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/tty/serial/{earlycon-arm-semihost.c => earlycon-semihost.c} (100%)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index e94d1265151c..a3779472edf6 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -73,17 +73,17 @@ config SERIAL_AMBA_PL011_CONSOLE
 	  your boot loader (lilo or loadlin) about how to pass options to the
 	  kernel at boot time.)
 
-config SERIAL_EARLYCON_ARM_SEMIHOST
-	bool "Early console using ARM semihosting"
+config SERIAL_EARLYCON_SEMIHOST
+	bool "Early console using Arm compatible semihosting"
 	depends on ARM64 || ARM || RISCV
 	select SERIAL_CORE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-	  Support for early debug console using ARM semihosting. This enables
-	  the console before standard serial driver is probed. This is enabled
-	  with "earlycon=smh" on the kernel command line. The console is
-	  enabled when early_param is processed.
+	  Support for early debug console using Arm compatible semihosting.
+	  This enables the console before standard serial driver is probed.
+	  This is enabled with "earlycon=smh" on the kernel command line.
+	  The console is enabled when early_param is processed.
 
 config SERIAL_EARLYCON_RISCV_SBI
 	bool "Early console using RISC-V SBI"
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index 238a9557b487..cd9afd9e3018 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -6,7 +6,7 @@
 obj-$(CONFIG_SERIAL_CORE) += serial_core.o
 
 obj-$(CONFIG_SERIAL_EARLYCON) += earlycon.o
-obj-$(CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST) += earlycon-arm-semihost.o
+obj-$(CONFIG_SERIAL_EARLYCON_SEMIHOST) += earlycon-semihost.o
 obj-$(CONFIG_SERIAL_EARLYCON_RISCV_SBI) += earlycon-riscv-sbi.o
 
 # These Sparc drivers have to appear before others such as 8250
diff --git a/drivers/tty/serial/earlycon-arm-semihost.c b/drivers/tty/serial/earlycon-semihost.c
similarity index 100%
rename from drivers/tty/serial/earlycon-arm-semihost.c
rename to drivers/tty/serial/earlycon-semihost.c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
