Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18767C6FA83
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmVk7+cz5LFZNA6cnzjiPp3MM5jSCnnqxiWaUrJZvB8=; b=K++UHfqNa8EVQQ
	2fBz+19x3ObJzF5fXSFkmQacdwLwXCOeFJi1MD+L+OPHM9PMEET5/4fCw/8gdQGvYA0DMTEHD8mlo
	zZb++DFaIFtoMfOz0w6Kd5ozZm6ktmW7IrT+vN5vUzfy8ktf4Pe3qapRI/8dAqA8WmrfQYwud+CM0
	8UHug4j9LXu5UqFytvgMZARKGBMR3zkk6Rgk8kGK3q8XMdHB4i0UnVCHyAzTwG7i+ghPjuQljJibq
	1UxAMT68kVL1X/mCw6g6ZiSPgJvqU/Uz5j8yhGDraqP3zbl9VhjiznkJNezcWWQGBUiJARXOcnpwt
	dlu4KYn1OkfR1QBAyRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrd-005QQy-Qc; Fri, 23 Sep 2022 18:57:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnra-005QOL-IG
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 228E762040;
	Fri, 23 Sep 2022 18:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F8FC433D6;
	Fri, 23 Sep 2022 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959445;
	bh=f89YyjtwxblBIjLtvfO+MxN9XaOWq9bm7nwawlrPsCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7AhbcgVZPt73TN1fDAoL33raPIiVYTfu1Y8/DIPyV6rqtQJKefaEcnGZYELoSX23
	 7xiG7PSY0CqSdmrM81ngsJQaLROKJa26z8W3TUIBIfZbbExR99zeKldTnok0S8HXbn
	 nOb/qQXLzPY9uOaMdmb9g7PYtszy7DmNWI1QD+JIaDgxr3yQz+7LIdqti4KWuHyUnd
	 +hvA6hBY7cBhMOtitfk1jqe11CQp4IiR6T7e6RgPxhgFv59OwBjLlTYS8KXzIX/bFa
	 3lpbDLNJ5YmuHTNK0MLDqTEyAPVgHSRrl4PCwIPl+hEy8KndmOGPcuXuG5ws5skTJC
	 jWPfGDNkOi5jw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 07/27] riscv: replace SOC_STARFIVE with ARCH_STARFIVE
Date: Fri, 23 Sep 2022 19:55:46 +0100
Message-Id: <20220923185605.1900083-8-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115726_668442_E1C3C59C 
X-CRM114-Status: GOOD (  10.28  )
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

As discussed at LPC, the SOC_ symbols are being converted to ARCH_
for the sake of consistency between "incumbent" vendors and those who
have a legacy from other archs.

Convert SOC_STARFIVE to ARCH_STARFIVE across arch/riscv

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs               | 2 +-
 arch/riscv/boot/dts/starfive/Makefile | 2 +-
 arch/riscv/configs/defconfig          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c4c7add1516f..910697baf097 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -17,7 +17,7 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
-config SOC_STARFIVE
+config ARCH_STARFIVE
 	bool "StarFive SoCs"
 	select PINCTRL
 	select RESET_CONTROLLER
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 039c143cba33..7b00a48580ca 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index dac14b95c73d..971986be875f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,7 +27,7 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
-CONFIG_SOC_STARFIVE=y
+CONFIG_ARCH_STARFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
