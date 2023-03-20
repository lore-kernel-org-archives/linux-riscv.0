Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8F8C7618D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9O70IKgoG8uU/J55b2jZL2FkDkAkMMWm4gY9TONalk=; b=yIRQ92bwqn68js
	x/80wNGEpI4TbDn5gUWhqVNHn7VUCv0nOuH2fPXMdZrGc8vJK5eSncFAcFkS3JLIk2j6xkiwZ10iF
	AclbG9CmCPXgrvMwpRRoSYGNyTKhm6yPOIejdtR/2rvQWzccdw+tyvxmIIjuFscFWU4LTqnPHXp4w
	StptqltKap7xFEYQJ6JIy/WtqrJV64yTi7+3Ol4rUbkvumLA4AunyoDNwNyyLCUpz34wELPSolUY9
	YNISazTWNDqw6+tpy+dJDISO8/tsJniwZAzQTb0iFpUsiruCKY+4quTVQ+vl6xFipg5mbqBXqg2Xb
	Mtr3A8IgHza56tyA/hMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDx0-008rV5-0z;
	Mon, 20 Mar 2023 11:45:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCuD-008ecf-0F
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 10:38:23 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 277C924DF02;
	Mon, 20 Mar 2023 18:37:53 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 18:37:53 +0800
Received: from ubuntu.localdomain (183.27.97.64) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 18:37:52 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 01/21] clk: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
Date: Mon, 20 Mar 2023 18:37:30 +0800
Message-ID: <20230320103750.60295-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320103750.60295-1-hal.feng@starfivetech.com>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033821_263807_ACC08AC4 
X-CRM114-Status: GOOD (  11.62  )
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

Using ARCH_FOO symbol is preferred than SOC_FOO.
Set obj-y for starfive/ in Makefile, so the StarFive drivers
can be compiled with COMPILE_TEST=y but ARCH_STARFIVE=n.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/clk/Makefile         | 2 +-
 drivers/clk/starfive/Kconfig | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..3bed88d67a3a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -117,7 +117,7 @@ obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
 obj-$(CONFIG_ARCH_STM32)		+= stm32/
-obj-$(CONFIG_SOC_STARFIVE)		+= starfive/
+obj-y					+= starfive/
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
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
