Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76728C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDQ91zxHopWidTMalX4gzqFmOFYI5X5g+aQ5TKoby5g=; b=kXKNgMlF/wgaV2
	H9MzvOoTmra2SSYK8iJkSfYE4jxUm0u9p691XdvbrMkSfZDCQ0njlB6GZ09Y5iaqTesSmA2NlEqwB
	CnCZ5/IitqMfe6VGi+LteDhRQhawO53yrMVn+Fh6XZSWTOOM0clPyIr1MBewV6d6n6pNrNpUTEchg
	3P2ca8xqblQMJKN2xhHbg5/aHOklXgAd2U0lnEk3sjM1um2AlX3z8nxSuuW88ktTb63kCUDIAWSks
	wYkn20AbkaDyk5f5/rUjMpSlKGB5WOrguc5ZT6kHomm7Zwid3VVZG5PAOwHJwnScwUgOuY5ROb0ip
	s6OSNMcsJI7TgniSS6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7T-000mP4-Pe; Mon, 21 Nov 2022 22:18:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7Q-000mN4-N9
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 532A3614C5;
	Mon, 21 Nov 2022 22:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0133C433D6;
	Mon, 21 Nov 2022 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069103;
	bh=tHpQxQq0I3Nv/AqKujXXZpXk5FWAzTV8ovqrazYylmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ahhD/mmgkL43J1FtqDGQv1JruQXSTl+kBbC/iJziwcR0bRSnyoj0NL7F4Lv7/ybbc
	 xJsZ6CxIiqUM32Hu00tmgfDqGXo3T1Sa9b2uWCksISczcKzDqaZt9IgVMl7MdSoSN9
	 6c3jhr7pzSI1w06b7bIivEiMallc2hql4etXHLgKevt5NRV6ghpxsqGyLJB1tZ8v+c
	 vT/wESPjIbD8pM1cvyGbL28d4i1bm++aq57acr7Pu96GgaArhIFDnIsaCtWXreoAiE
	 xXTkw1tbdt0hV4O+/j9AFdRfCu74alxCg/A65ti5ot1P8IJ0JnIpGZAenN0UMWTQrf
	 ci1Re8/jo5r9w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v1 4/7] RISC-V: stop selecting SIFIVE_PLIC at the SoC level
Date: Mon, 21 Nov 2022 22:14:12 +0000
Message-Id: <20221121221414.109965-5-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221121221414.109965-1-conor@kernel.org>
References: <20221121221414.109965-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141824_819343_75EC6F61 
X-CRM114-Status: GOOD (  12.66  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The SIFIVE_PLIC driver is used by all current RISC-V SoCs & will be,
where possible, used for future implementations. Rather than having each
SoC select the option in Kconfig.socs, do so at the arch level.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig      | 1 +
 arch/riscv/Kconfig.socs | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fec54872ab45..d7334e02d20b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -125,6 +125,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
+	select SIFIVE_PLIC
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 203d1c528ef4..ce920f627f6d 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -6,7 +6,6 @@ config ARCH_MICROCHIP_POLARFIRE
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
 	select MCHP_CLK_MPFS
-	select SIFIVE_PLIC
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
@@ -24,7 +23,6 @@ config SOC_SIFIVE
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
-	select SIFIVE_PLIC
 	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
 	  This enables support for SiFive SoC platform hardware.
@@ -36,7 +34,6 @@ config SOC_STARFIVE
 	bool "StarFive SoCs"
 	select PINCTRL
 	select RESET_CONTROLLER
-	select SIFIVE_PLIC
 	help
 	  This enables support for StarFive SoC platform hardware.
 
@@ -51,7 +48,6 @@ config SOC_VIRT
 	select POWER_RESET_SYSCON_POWEROFF
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
-	select SIFIVE_PLIC
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
 	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
@@ -67,7 +63,6 @@ config SOC_CANAAN
 	select CLINT_TIMER if RISCV_M_MODE
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
-	select SIFIVE_PLIC
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
