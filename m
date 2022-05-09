Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21kdcT81RT8F+LLj6advkIvf8+Oszeh+8b/VIfjnQAI=; b=ioLbz6/xKpd4Bu
	PemFEbCmlP8Q6ws9m7vbLA+VM6ogxNjmWDAxXGKEvxZUz1iE7iw+aNMyo2oQgeq/t+Nh2B5kpmpgF
	PRDzJc4s46jiH7IwuwQ06Glo093CC8AZIRmA03rudce14Mg4KwUr46FLszBSJfhpojurJPNU2CLdX
	coqsACXmm25MI9mcfYxS4ZkTdKrP7ytEzAfVYG0UatuOq0jfFpNcz/MfY6lxurw5FRExbbI1Bgoyy
	eTkcM56jNSfJVny8TUEK3/KtsJeeH4veLYEhOWZZM1hkInEV4MbaH83QXMNFlmepymav9dOFZPmz4
	2w2rJTROCYctZ41Ukp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuKF-00CE8O-E1; Mon, 09 May 2022 03:44:47 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuJC-00CDeq-4Q; Mon, 09 May 2022 03:43:45 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CE8E5C0059;
 Sun,  8 May 2022 23:43:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 08 May 2022 23:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1652067817; x=1652154217; bh=d0
 1N/erYFX7bR8qphSaL0E+u7qcuOLHPoAFbrgswNxo=; b=SkhbTEZCfHoUSC+hT6
 Xw+sFgzQf3tB7PglZb4Gc/AEYXzaMxZaf7tMx7v9GuEQU1iBVtRfpyuY78VM7FN7
 O75GxUP5ljbDG1ROmHXc/s4/h+mFFmeziGzx/HGY/uxQlJFR9OrowoDRSLHo7EGT
 O6yHyoqTn5TYuWTUYzVcluxtV8SRntRHRn2J9NC8y7TgPgb53buYwtULZFMNv0Q4
 eAq4EPfV8Eg+MkaHzWOZgd33QddU93SLje5Flk/sjVsoAgXwm3EeGhThVZn1Uq04
 oHhJ8f9ZP+fLiNC6IDMG+idFltghxB3YOnkcv5D+lmWo+bqYmt4KTbCOJnqWw/RB
 cZqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652067817; x=1652154217; bh=d01N/erYFX7bR8qphSaL0E+u7qcuOLHPoAF
 brgswNxo=; b=waT+PST6TZOCYGD6+mgqu8u9k1ii+EPtIJNJguXjbc/Q/xk2Vv/
 fOX3Naupih4ONT8Ac/MzrVD47b0KOOXwRBlu2u8ln0u9klvMQbUwn6jgoqBA/ZI4
 Pvam9p4tP76MIPoHBqbsApWlvjG5ik5pd5/jsfqffpGG6ZVQSpPJ9QVp78VxcvDR
 GGfXa+M/wZbPBkCSuB76+aZre6Bckipgn6KMF82DRQr+m4j8upHqkHWRH4wEENnD
 qN58YlPEBVFeuqJpLRl/Y4a12Ty+Z9VBECWSVRDcgynuAlOUi2nzlAXwQyBpiVGI
 6cUcszL+uxnia5sEmlZnVwnsvFN4fCqqKiA==
X-ME-Sender: <xms:6I14YlfMxm6yXgecgNla9R1vp9G8_d6jTXfjEDhMHXs3IVnpO123ZQ>
 <xme:6I14YjNHZeDXcbF32oP_3t708469Lh6TmQQ4eLVYgx30sC_BayZve2QOlo7xFHaop
 POYy-MtbtlmMaa8WQ>
X-ME-Received: <xmr:6I14Yuh6e13NnjrctaKO3V8PXQ9AHEnPeCQv_RQD5vkFm0RlZmbGbrdot9h9GZNAz5dH4l1PWbS_oVRc0lCcIHfdFxLOHDsBfy-k4R_vryZWY6Ae4CEUf-qd8ncjiwRUBTDG9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6I14Yu8ww4CedLGln1ZCC9mVFYIyQE8k3kSLV-gI-RVxGhfsww1Ukw>
 <xmx:6I14YhtUqsuXIR7sZi5sPTOF1LCBiD0m_pVaACz9V7pqLbp6EB__eA>
 <xmx:6I14YtGt4DKnc4WdT-HeJsB6j7wAHe9SzT8w9ZPFDLrzd19l6NDeEQ>
 <xmx:6Y14YiMmxiAlhAZmaToDDYiiXTxdIm0obahsuDaiptHj_PVMe96uCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 23:43:36 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 1/5] genirq: GENERIC_IRQ_EFFECTIVE_AFF_MASK depends on SMP
Date: Sun,  8 May 2022 22:43:29 -0500
Message-Id: <20220509034333.60017-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509034333.60017-1-samuel@sholland.org>
References: <20220509034333.60017-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_204342_760881_E74D4B35 
X-CRM114-Status: GOOD (  12.11  )
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

An IRQ's effective affinity can only be different from its configured
affinity if there are multiple CPUs. Make it clear that this option is
only meaningful when SMP is enabled. Most of the relevant code in
irqdesc.c is already hidden behind CONFIG_SMP anyway.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm/mach-hisi/Kconfig |  2 +-
 drivers/irqchip/Kconfig    | 14 +++++++-------
 kernel/irq/Kconfig         |  1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 2e980f834a6a..36d71f6797ca 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -40,7 +40,7 @@ config ARCH_HIP04
 	select HAVE_ARM_ARCH_TIMER
 	select MCPM if SMP
 	select MCPM_QUAD_CLUSTER if SMP
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	help
 	  Support for Hisilicon HiP04 SoC family
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 15edb9a6fcae..bc90500a7573 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -8,7 +8,7 @@ config IRQCHIP
 config ARM_GIC
 	bool
 	select IRQ_DOMAIN_HIERARCHY
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ARM_GIC_PM
 	bool
@@ -34,7 +34,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select PARTITION_PERCPU
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ARM_GIC_V3_ITS
 	bool
@@ -76,7 +76,7 @@ config ARMADA_370_XP_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
 	select PCI_MSI if PCI
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config ALPINE_MSI
 	bool
@@ -112,7 +112,7 @@ config BCM6345_L1_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config BCM7038_L1_IRQ
 	tristate "Broadcom STB 7038-style L1/L2 interrupt controller driver"
@@ -120,7 +120,7 @@ config BCM7038_L1_IRQ
 	default ARCH_BRCMSTB || BMIPS_GENERIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config BCM7120_L2_IRQ
 	tristate "Broadcom STB 7120-style L2 interrupt controller driver"
@@ -179,7 +179,7 @@ config IRQ_MIPS_CPU
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_IPI if SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config CLPS711X_IRQCHIP
 	bool
@@ -282,7 +282,7 @@ config VERSATILE_FPGA_IRQ_NR
 config XTENSA_MX
 	bool
 	select IRQ_DOMAIN
-	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
 config XILINX_INTC
 	bool "Xilinx Interrupt Controller IP"
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 10929eda9825..a2a8df39c2bc 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -24,6 +24,7 @@ config GENERIC_IRQ_SHOW_LEVEL
 
 # Supports effective affinity mask
 config GENERIC_IRQ_EFFECTIVE_AFF_MASK
+       depends on SMP
        bool
 
 # Support for delayed migration from interrupt context
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
