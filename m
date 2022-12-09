Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC52C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5Cl8uo2coY+GvsrENr0D5lvfX6NDcuco/WZrzBBqWA=; b=duMOYLLsxQWpjb
	nBlS2Jb6MI7Nw9IkRDJGUEteeERDcUNkg2COPW3bOaz3nPaWng0KZnDV+o1vuYICBiThWCTibBYmi
	EEO9ZeLXrEvujVNTBw7geDha4bCgVfNGaVaN8mcIMkJ6uhSIab1nBq6QBSIQRotpbqsZlwIuejWYa
	nXLO28UWi37j+ErglYOcK2q2Nw0Ba5xoF27X4Ww/rwKPNuya0gChn94V+x5rNAk0tNFnij9X64T6u
	F+Hj0iyFI1QQ/kNB4LctEkNH0GXRDVew9KH/dQ972GtCIVJvO1wioJskc3E3dQuqm4EcWDYYWfdgA
	aXDC9MDLJZQ7s50d+JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ewQ-008nWd-R1; Fri, 09 Dec 2022 15:05:34 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ew6-008nC7-LI
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 15:05:17 +0000
X-QQ-mid: bizesmtp89t1670598288tzek7vk3
Received: from ubuntu.. ( [111.196.135.79])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Dec 2022 23:04:47 +0800 (CST)
X-QQ-SSF: 01200000002000B0C000B00A0000000
X-QQ-FEAT: ILHsT53NKPjG5kfsWPlb/E4DO94OjvdDf9wn6ttYvvCNpDY9/TDM9Ur27ag7K
	a+Ax5aohk1b980KZ412GaxQBoChRTv+AMSpc0cjPxse+3RraLnlsCU639j5CVj+BPHJJori
	Vbt2DGkCowbiBYA8NLOLGZJx6Z4e+EsHC6q48OfHeGuT3aDyUXYLgD5QC9lojnGNJv5HnnM
	kx7xPEIQBZTjAEoA3RfLlTZr/mtVCE+AO/IG0Kgu7uyUxaFrmX+6fDEebWyg5ObPm4nKRfs
	4sjlFW1iSHbVdyKJ+YuUNwEmbLfyVO/HuUj/iS7HnGCJuh+m8uyEXkwmL1/sKtrr5peQ3iT
	v2BAZ+mqbzzGar3pYaRaxGHVuiPBILmUZyoUiia
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 3/3] serial: Rename earlycon semihost driver
Date: Fri,  9 Dec 2022 23:04:37 +0800
Message-Id: <20221209150437.795918-4-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209150437.795918-1-bmeng@tinylab.org>
References: <20221209150437.795918-1-bmeng@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_070515_042407_BCB65FD1 
X-CRM114-Status: GOOD (  10.38  )
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
