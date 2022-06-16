Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D20C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jv8TSBRMRFJvpGhIlOP9TMn+3e4nA7JOLS2dEO771Dk=; b=YTNQ/oIm53Qkye
	N+r2yS8SITKUj8+NhXTbeGniAi9/97LyOOsvF6IaQR12/d7lJv73wLfUgUv8Zti1WI8BqIsM0qa5i
	ADJjsjxLdjm0sS+czmZ+99omMq/EXpAeWYyn3bZTW82PJhQ87WpdJJj8+t664PhQ83MNhhjIxBscV
	SlPcjL5H6xwz81gj50SwGwvquzGnVkIKHHYD1WWASuKX9Eku8gCEB+HL3HVt8nY09jczYr47ar70p
	7EYZHcy2nRimKbo6BjaquMjvL6ZGWm6vKO6s4HVlQnaExY4hAz54KubEkR9hjM2rl5IXVaCvQTyYt
	tzZYxOqx/2DdVwGo2+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jBj-000lnR-SF; Thu, 16 Jun 2022 06:41:07 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jBE-000lVs-04; Thu, 16 Jun 2022 06:40:37 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4DFD63200B4A;
	Thu, 16 Jun 2022 02:40:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 16 Jun 2022 02:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1655361633; x=1655448033; bh=gF
	IVYIZrAyiwuNij5NQCh0fMQtbZDXIrSMS4msW8uGU=; b=m0XlC0FoA0bDWtMj/j
	IcaW9tyvkpeRkCXfYSY6Vth/Mkmi49gfccDLkVdqp6UKY5jnIyi+mq8J3ts+OR94
	I4YpvFQIeZt3TllhlYlTPAFuz1NyTWnRxTd8FxMNrTS7vlE140fBqZByWH1C8kQZ
	kJI3tVt7lNjG7AJNeOdxaxS++HE/SL1yOu0qHAPUNIyDdtPjvh6hlQlMS9zdVsqa
	XR8070x2xZYsWbe1nYeYipPCk6jLHB+lpqjzcfU1ss+jWwyPfKkPtzLzebmICziH
	eqeToCfY6utJDGc7zVPPud34jqm1mY5+Zqn/yr+GTCGN4la+On8trSG+rKdVDjFc
	SMDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1655361633; x=1655448033; bh=gFIVYIZrAyiwu
	Nij5NQCh0fMQtbZDXIrSMS4msW8uGU=; b=Q4fz6jZ85VhnWtau8zds6FDPxJ881
	ThvUdxs7MSTf+fMlHWewlXQWN93pG9X0GLknuydCgseNtVICYDZ62BtZsSxDka6Y
	OqRYUSk04paFfWjN+CNrpl90TEhI581jfyQ6TntQ1DOObwSGvp5RH6bysmc4k/IH
	2zqfprulEjBA9/W2Rp3/0FK5bDMwBo7ricDR/UVdsQNh/hA8/7JZhrmOn/yL+fEj
	RXZauhWWT24vF4duUfGZvPqRBKRYkahTOdhnsJ4V2pfkYRE05MOsoLWscPpcaz0l
	FH08ObBYlpIC92dVvbVZTdEwGSodew5qSp/dFBK0GVubpxnv8a+Yc+FJg==
X-ME-Sender: <xms:YdCqYpn561cUKOY40_jA4C-PDJTPKy6KlL-ASaIJK0Z7ASzEZl71Bw>
    <xme:YdCqYk3YuoB1andJ0q81hAwWcZ0o2lvu6sZQul-s3N_HpkwBNXpnMxb6AduJhU3j8
    KqNnkXob2a4L55VKA>
X-ME-Received: <xmr:YdCqYvqeP9LB33hiTqu0N0sevv5mu0YcbtpxYg9GcGqNRmBoHptutG5nlrEb0qYhO9j5yNyE_C11N3cBeMVjMAqm7YHgoO1ld3o45E3DcswGX2VH47MxnOIcCeds95mzov_n_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:YdCqYpm4Rk0akO96skhLM-potAdFyH2PrmAqx0f8qLQ8P6PX_STRtA>
    <xmx:YdCqYn3TRYiZwyeBtf7x7FIlMP0LVFa7gLEAZwmiKXUbYVHZtLr23A>
    <xmx:YdCqYov2358odyPJZeIb42_9_QzBb3xIBczQ4u-vmDQWojTsUK020Q>
    <xmx:YdCqYlMEwzsCchsAIAz5ij5bNqNix31S8CTyzzrkfV6k0bv9YHIZrQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:40:33 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guo Ren <guoren@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Wei Xu <xuwei5@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/6] genirq: GENERIC_IRQ_EFFECTIVE_AFF_MASK depends on SMP
Date: Thu, 16 Jun 2022 01:40:23 -0500
Message-Id: <20220616064028.57933-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616064028.57933-1-samuel@sholland.org>
References: <20220616064028.57933-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_234036_128282_8FDD66BC 
X-CRM114-Status: GOOD (  11.26  )
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

(no changes since v1)

 arch/arm/mach-hisi/Kconfig |  2 +-
 drivers/irqchip/Kconfig    | 14 +++++++-------
 kernel/irq/Kconfig         |  1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 75cccbd3f05f..7b3440687176 100644
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
index 4ab1038b5482..6f74c144a7cc 100644
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
@@ -294,7 +294,7 @@ config VERSATILE_FPGA_IRQ_NR
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
