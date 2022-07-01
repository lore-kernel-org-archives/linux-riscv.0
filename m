Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD0C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYz/n0b5ywQ1bL12dRdRHHIlNIevzch5E5jHFlct2vg=; b=FfTiGvhv/6EK2T
	wz0p81fuMlb9JKFAEZW8eV+Zl9GRSxsCdWu/Vtun7F+WTPqSDzUCaUliM/i+3HDImOdBrzFVGi7it
	HivaVwk2jTbsP4/kceW8doacLtTGJTlRIqc/zEnxGPm/RDx6ous//xMUxR6hpkuqfAr4VmPBVkiPV
	V8+2qBTjfS0DwM7bkLFIJBGxSLIZu+9om8pjP64tVC9RiuB6EsgUrGLHtOAsTOWL7RVfpoHQerXf2
	4lz9lBAFQ+o6oqzCotxcfcCOHQWKt8HH9LwoIL6VdXyPeLXEawWLhJe5YDCE+UPCxaUZyDlfvNsPA
	DaZRcj7egiSJpUbETVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NC4-006n6e-Cc; Fri, 01 Jul 2022 20:24:48 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NBz-006n4v-TN
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 20:24:46 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B4F95C0110;
	Fri,  1 Jul 2022 16:24:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 01 Jul 2022 16:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656707083; x=1656793483; bh=kL
	8pFphnsD3mAujBeB5qjcFnmIsFAIeaKX30aQbz51E=; b=EyONw1Yu8+T8p37RO4
	awUhCi6wA0+MiVEULKxYCoBi8opKLEwVnuzqcYCGc6lIt3sEg2tlyw8yKTa/Jh0u
	Ce/Tz0B9RU6QyDFg5MzJZmMHE5Bb5Ru8D+LEw14tRsGhhetxXym0Bh2QRoF00L0D
	EdKBF9AWDZIki/Z31FhBb44tAEHsOyzUef4gdUVd0t00bstUC+KbGFbnwzw8JpQm
	hNrdFdL1cucfuwH4UepWSh6DoUObnWuIDqXYKAzhi2frpfl4v2HH40jQSY3bJOcz
	uhlBRLgSJT+y8PjrxSkqyRX3Arb9/IjrrRaFputEeqc8zu4qQjYn5vhkMpvO0K5h
	+bDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656707083; x=1656793483; bh=kL8pFphnsD3mA
	ujBeB5qjcFnmIsFAIeaKX30aQbz51E=; b=muW6pOx1zWkvnYbBckILhkJLyNo3e
	30s7Nczk/nFtiR54O0nfjOGokUT+7P4YAZoQCmYqxCT7/KUu5aYOhdI6f4QsiY+V
	pc4IQERuGlbkQMDPNp4nSO4yjbGOIfF4VC6JfwBEz6Yb2tzF49xU2xt4gfZ/0ZRW
	SpiP6MWkYqVB398hD3kxX8JWe/CCJphDI2rXoD3nHmeAjXfHBUw0M+R52IwPf5D7
	m38b/jIN9ducIKseTBCuYRWI6Qk4KYE0C/sa+GMTYE4pw/xX/taTKt5nIPRu86Fn
	zEqIkGzP+g2Vj+Y1Av1KR8Ph6BL52gFONe/L+jzhEuUq6rd8t8s2EjAoQ==
X-ME-Sender: <xms:Cli_YmgaJ3czx9-G9oRmTBSu3ou3fHlHQKdC8nTMtw9WT7GJvW63Hg>
    <xme:Cli_YnDKNa1AWX10EhOKVHIlBwGR_R4GyY70pjSWJ-UdZGQ-m2WSOCyUGU0flz61o
    LA14AlfX77KrfqKKQ>
X-ME-Received: <xmr:Cli_YuEpaMp2_4RntfgIDMDBSssYVOq8lSMpmfumx7-xjFi3pe0yxmgJzS3QrizV1bTWFN4LuzbGwYgA4oMscnl6mPQT3HSZ_ZdJYKg9mHYeE3Tg-4hgAgnh9apTDV4TGuc6gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:C1i_YvRmScJbKUt6dOSckYYzhYtWcZpcY3nMteIRakXAGT-JKERHkQ>
    <xmx:C1i_YjzS82ggCSWYyu6jXZVC6mXnx8ZkkIHAlK7MfYCSeqYaMid_EQ>
    <xmx:C1i_Yt4H6RZHWqZswBr0Ccx14NrdQaMWzk2X1sR2asucJMnTv8C_pQ>
    <xmx:C1i_YqnprzGe5mhc1ktw5ddYdRZV5jL3Zt_y1LEHOQDXhBkVVzitJQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:24:42 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/2] irqchip/sifive-plic: Make better use of the effective affinity mask
Date: Fri,  1 Jul 2022 15:24:39 -0500
Message-Id: <20220701202440.59059-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701202440.59059-1-samuel@sholland.org>
References: <20220701202440.59059-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_132444_058313_1FA8B731 
X-CRM114-Status: GOOD (  14.73  )
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

The PLIC driver already updates the effective affinity mask in its
.irq_set_affinity callback. Take advantage of that information to only
touch bits (and take spinlocks) for the specific relevant hart contexts.

First, make sure the effective affinity mask is set before IRQ startup.

Then, since this mask already takes priv->lmask into account, checking
that mask later is no longer needed (and handler->present is equivalent
to the bit being set in priv->lmask).

Finally, when (un)masking or changing affinity, only clear/set the
enable bits in the specific old/new context(s). The cpumask operations
in plic_irq_unmask() are not needed because they duplicate the code in
plic_set_affinity().

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - Rebased on top of irqchip-next

 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 27 +++++++++------------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 462adac905a6..ea7b7485327c 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -531,6 +531,7 @@ config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	help
 	   This enables support for the PLIC chip found in SiFive (and
 	   potentially other) RISC-V systems.  The PLIC controls devices
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index b3a36dca7f1b..46595e607b0e 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -114,31 +114,18 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 	for_each_cpu(cpu, mask) {
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
 
-		if (handler->present &&
-		    cpumask_test_cpu(cpu, &handler->priv->lmask))
-			plic_toggle(handler, d->hwirq, enable);
+		plic_toggle(handler, d->hwirq, enable);
 	}
 }
 
 static void plic_irq_unmask(struct irq_data *d)
 {
-	struct cpumask amask;
-	unsigned int cpu;
-	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
-
-	cpumask_and(&amask, &priv->lmask, cpu_online_mask);
-	cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
-					   &amask);
-	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
-		return;
-	plic_irq_toggle(cpumask_of(cpu), d, 1);
+	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
 }
 
 static void plic_irq_mask(struct irq_data *d)
 {
-	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
-
-	plic_irq_toggle(&priv->lmask, d, 0);
+	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
 }
 
 #ifdef CONFIG_SMP
@@ -159,11 +146,13 @@ static int plic_set_affinity(struct irq_data *d,
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
 
-	plic_irq_toggle(&priv->lmask, d, 0);
-	plic_irq_toggle(cpumask_of(cpu), d, !irqd_irq_masked(d));
+	plic_irq_mask(d);
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
+	if (!irqd_irq_masked(d))
+		plic_irq_unmask(d);
+
 	return IRQ_SET_MASK_OK_DONE;
 }
 #endif
@@ -190,6 +179,7 @@ static struct irq_chip plic_edge_chip = {
 	.irq_set_affinity = plic_set_affinity,
 #endif
 	.irq_set_type	= plic_irq_set_type,
+	.flags		= IRQCHIP_AFFINITY_PRE_STARTUP,
 };
 
 static struct irq_chip plic_chip = {
@@ -201,6 +191,7 @@ static struct irq_chip plic_chip = {
 	.irq_set_affinity = plic_set_affinity,
 #endif
 	.irq_set_type	= plic_irq_set_type,
+	.flags		= IRQCHIP_AFFINITY_PRE_STARTUP,
 };
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
