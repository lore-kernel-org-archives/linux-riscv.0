Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48963C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ps3nNFgWC1GKPQDzk+/lN16eQpbijD6khO3Q0Ayt1zE=; b=iNB3NKk2tumUdC
	UErQwyNMVRWY+4e3ZZlrUiLlCkMb9SViPD57MfCO+Wp0Qe3y+1aFp3/iMFL/zkwGRIpliTj7hP1nU
	3/HsJSZgeTDhyt/+HkNMCvfn/UdVeG6tlCmXkBW5mvImPkEnL5mqf9oAe3AyGLAeX0JrOUI/w9fjJ
	2leduWMl8FlTi8UytXfPWuvEE9+d8G5KNP1p+hvfSRQf1p+rtz+/JhDEM7I9S/jp6pZWMsp1ROCRc
	afUNUHIbZ2xs9t7u0T4sdiCGU3mErutj8DugcVITSoserzanNYPFpSVPIxwv+auY2n4TVi8198BzY
	QlYchu1ewLM8Yb9wjP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyrj-003S2l-5W; Fri, 18 Nov 2022 10:44:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyra-003Rwa-7O
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 10:44:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90AB96241A;
	Fri, 18 Nov 2022 10:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F21CC433D6;
	Fri, 18 Nov 2022 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668768289;
	bh=W+cw8CbjTjtzmisgW+jbJ65nAVSygcxv7sm+idsmMMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NOqPxHYYu82pZ61iRaesC23GHsmkrHKWF0U0tAiP5Q90stFsYyQTrFeHQXfyaJWnz
	 wodTGfqNpoaEPRlw9XApvvq2V6B8Bhl0qgnbMHE63xwzb2dMErUejwegZeX8ns8KCa
	 ZoexQJIwi7q8zN8t0S8Qe9o06OQOGVlzPQsMvPQxD7HxYHuXDjELUV2Qdf2pkhJJwO
	 YfhzkckHJPo+PjmTKnSyPsNnbJe6HTIcM6GuKcI0uya724NC9iV7BJyTE/U7oRWBPc
	 6qjAsYXxlCv724Mm+ekddLTrdn9FwuA7Vc0kIAPsdiDoJDSRZOrR9kA2xQuWEHRqnc
	 X9x81Vyv+9Hjg==
From: Conor Dooley <conor@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/3] RISC-V: stop selecting SIFIVE_PLIC at the SoC level
Date: Fri, 18 Nov 2022 10:43:01 +0000
Message-Id: <20221118104300.85016-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118104300.85016-1-conor@kernel.org>
References: <20221118104300.85016-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_024450_357742_5637E2E5 
X-CRM114-Status: GOOD (  11.99  )
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
driver select the option on a case-by-case basis, do so at the arch
level.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig      | 1 +
 arch/riscv/Kconfig.socs | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fa78595a6089..846f61254dfc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -123,6 +123,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
+	select SIFIVE_PLIC
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..15e391f38f75 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -3,7 +3,6 @@ menu "SoC selection"
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
 	select MCHP_CLK_MPFS
-	select SIFIVE_PLIC
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
@@ -13,7 +12,6 @@ config SOC_SIFIVE
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
-	select SIFIVE_PLIC
 	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
 	  This enables support for SiFive SoC platform hardware.
@@ -22,7 +20,6 @@ config SOC_STARFIVE
 	bool "StarFive SoCs"
 	select PINCTRL
 	select RESET_CONTROLLER
-	select SIFIVE_PLIC
 	help
 	  This enables support for StarFive SoC platform hardware.
 
@@ -34,7 +31,6 @@ config SOC_VIRT
 	select POWER_RESET_SYSCON_POWEROFF
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
-	select SIFIVE_PLIC
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
 	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
@@ -47,7 +43,6 @@ config SOC_CANAAN
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
