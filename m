Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB38C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpmSiiYd++Tgoe71WARKa5o85nMOh+kKCEXZ1helgoM=; b=IMOmlE7bshOgBH
	wzOgwh2pW691kypInyqtNJs1tYbPAr1LKONPS1Sta8pRycLC5q+ieBCKwRMBXKJLm+DFfxdVywwKk
	HixTMSsYX2HxRfVUl+Y4fM1RurYFu+KryUVzhcEbDyxM5O1tVfo0CAr0+2EwUsiQfuJjJGwgfLhOC
	Bkx6K/4zP8F7+5qQIDyKrgGgoejxrTKveNveg8/sYqz9sj/IfwkKxHllATFUJod069thDKM5NVVdL
	tgZJqvtS+mJ24NavmWaLESFoECSs3OWj+ORdsIgRAtiWeBPAILzVSU1pmOg/W3qrb5/v8vrnKBo/g
	r9aUINPsmgSV8NljQmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrg-005QTk-Qn; Fri, 23 Sep 2022 18:57:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrc-005QPy-T0
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E21061EBD;
	Fri, 23 Sep 2022 18:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6856C433C1;
	Fri, 23 Sep 2022 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959447;
	bh=ZlMC9F1qLt+/4YCz/dXCWX1Vl1EJNB2rcsk1FN5xgjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qs0WA1t+b3H+Rvx+tOVGL+3mTwaMX6mi6pEKeWDvTwuLP39q61A2DDZXCzFDKB3DX
	 KZnTu/TNZvfFVrSajOUH1xIYQQwKMa3dcBaQLN4gNMjtGC+kWok9a8vXaS6GMF0GiG
	 BOLe67kUSVTc+fvBbDSyem7Y/hUPclUgI5iMcCVk7eaYT3Qyh0fYIKFx9XMsBlqwq8
	 txkZCpAIeeBrkiftCJ/QkXBkgPPrbZaeORAMM4lG1yoPcVj0ridOLkOpUtqM6lfDu0
	 0wEMb7Kee3n5HmQ9exSD8RtGfack0oTMTEmxTQlAkXxGWPadOu0HI8OYMjWVDwvu0m
	 8HsI0SuI31+iQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 08/27] clk: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
Date: Fri, 23 Sep 2022 19:55:47 +0100
Message-Id: <20220923185605.1900083-9-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115728_998432_C0FB31CE 
X-CRM114-Status: GOOD (  11.19  )
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

At LPC we decided to replace the SOC_ symbols in arch/riscv with ARCH_
variants, for the sake of consistency between "incumbent" vendors and
those with legacy in other architectures. To that end, replace the
SOC_STARFIVE symbol with ARCH_STARFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/Makefile         | 2 +-
 drivers/clk/starfive/Kconfig | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index d5db170d38d2..c04628f8bb7d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -116,7 +116,7 @@ obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
 obj-$(CONFIG_ARCH_STM32)		+= stm32/
-obj-$(CONFIG_SOC_STARFIVE)		+= starfive/
+obj-$(CONFIG_ARCH_STARFIVE)		+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 003bd2d56ce7..ef3517f4a276 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -2,8 +2,8 @@
 
 config CLK_STARFIVE_JH7100
 	bool "StarFive JH7100 clock support"
-	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	default ARCH_STARFIVE
 	help
 	  Say yes here to support the clock controller on the StarFive JH7100
 	  SoC.
@@ -11,7 +11,7 @@ config CLK_STARFIVE_JH7100
 config CLK_STARFIVE_JH7100_AUDIO
 	tristate "StarFive JH7100 audio clock support"
 	depends on CLK_STARFIVE_JH7100
-	default m if SOC_STARFIVE
+	default m if ARCH_STARFIVE
 	help
 	  Say Y or M here to support the audio clocks on the StarFive JH7100
 	  SoC.
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
