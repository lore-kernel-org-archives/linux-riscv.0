Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12903C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSCY6GyDxzKEc8SqvPUYiebRL+Xgqh3R9IJ7YrA1AFo=; b=RAe8EJXN1ANeOF
	XsQhTfu34lKPM6OV+vZN8poQBZ+jZ7Nyb2z+drFPGO2aFbx2o02MSR6ncGrTnNkFIwTTRAXcZICmI
	nvpt3qPNX/Y8kwM8XxCQWKVH1SDSVH544TSKAxbvQYnCT6P3tO8CTC6e0+2uWZ+lDcMVvdoSoVRMR
	vt/DukwkB8sdMm85YzmqsT2qFTt3fAunVYqUecbhJcs+CKbu93GReB/WjQQypHSh80dj1nVMvBTFv
	ck6Qr8ftWQSyiTcOGriLJVZJhEwMH+k8HG6nJK7T6WbpT8CEzCJljqth80EnBy1G1AUAQ2UjqH3Oh
	Durt8rLf/Ac4P2JsK7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuJY-00CDmJ-1Y; Mon, 09 May 2022 03:44:04 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuJC-00CDfn-4Q; Mon, 09 May 2022 03:43:44 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F93D5C0114;
 Sun,  8 May 2022 23:43:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 08 May 2022 23:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1652067820; x=1652154220; bh=cR
 qjRcNVYtqC51Nn/ZV3tYv8+W5V46C9d1O6IJ4rhWE=; b=SOrY909sBDtvCDGLCq
 mRkl4pc4UCfiUxpk/pPVcZpEUEASplhDWeb8Qig0cK2ddOzwgwEyCHkVar5UJZco
 sxI/SfbwPL31fYNE5sDIvlKs3aHZnR8u/KDDvw4wOQHD3nrU9NTfMSAF0vePaC7C
 tuFzON0lzlUShBKzS/cSZOzzSPWRRLef7MCVxScNkNjhE+Vayo9J03OAKXGNKpbf
 5atrE/GuToHnnkkF9qZ1lGS3zM9yibyCozX44GQ+64q5imRg5upAs4AqEYwAW6H+
 lItGQFBPJq3dIK8ejF0gNNkMVMVOxysvcNRGnA2OZm5IM7Ltm33dIqZ+6uSFpH79
 VPaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652067820; x=1652154220; bh=cRqjRcNVYtqC51Nn/ZV3tYv8+W5V46C9d1O
 6IJ4rhWE=; b=uNmHDBSBOtjRDuRpgzvVwde0VP7Dpg1JBV5pXsbFZhy7VmI3USt
 nCEvwcwUsNtJTWUlaNSvUbtaqIyiVArwHWgMrvFJ7j3O587CUL+aPe3dqPaubyVc
 VWeEoDqZREt7MvXeTalkWED0zoVZ5sgeJ3hr8ytRHZ1Qdz3hCaHz4S6ODZ3ROsHx
 oXOZ/9tINy42gFbn/gzeCDpp/5j5Znl0SNlJ9A/dgopL5gsWBpTmxoCYGv0jpMT/
 3KJycWKqMXQBaS2jf9ALtV4Ma4d2uWHOKHP/B/eDPdOFXgY2uaYITE6zBiPHjH0J
 mPH72NlNuCuPHzFVDqIZP9/m/TmFtUw2Myw==
X-ME-Sender: <xms:7I14Yj2Eptfgee3x6VL6mTx4hEMXYqvS5aohVuPwvVTYQEn-L1vZaw>
 <xme:7I14YiE454L8T1975bjTnxMgHfjxXyMwn9v4G_0TK4sf_fsjxALpYfvfBFloj9zDY
 UMuOG1bBN8eBZ-1UA>
X-ME-Received: <xmr:7I14Yj7krMxADt78Rh6AZWB5_ZCy63lIKGh-ee72F1UT51uvDGEq5HutAaqgasZIpCVq2IPZMs-j0Lb2L1QotySsZP-ICTvi0yu66g3mDkLiO_FGfO2VVesqbiFGMMwEV58Pfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7I14Yo1OuOw5pn4TvQP80f3s1MJe1bamroihr7w_eHmtwGfxjaBCTA>
 <xmx:7I14YmHkS02UozCCB-9R0M_Q56c5RA36hOYsElKxgnuK5Dvdj73XsQ>
 <xmx:7I14Yp__0UDbDcbGQ4q9eRXFFO8J3nTXb0Guze9kwXJOgS8LEHYv2g>
 <xmx:7I14YiEbpAzWoPDSHBdhC9pwQOLBMWt9v9eV4N_Aqwz7x2harDjnJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 23:43:39 -0400 (EDT)
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
Subject: [PATCH 4/5] irqchip/sifive-plic: Make better use of the effective
 affinity mask
Date: Sun,  8 May 2022 22:43:32 -0500
Message-Id: <20220509034333.60017-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509034333.60017-1-samuel@sholland.org>
References: <20220509034333.60017-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_204342_752441_5DAF60A6 
X-CRM114-Status: GOOD (  16.57  )
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
Since this mask already takes priv->lmask into account, checking that
mask later is no longer needed (and handler->present is equivalent to
the bit being set in priv->lmask).

Then, when (un)masking or changing affinity, only clear/set the enable
bits in the specific old/new context(s). The cpumask operations in
plic_irq_unmask() are not needed because they duplicate the code in
plic_set_affinity().

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 26 ++++++++------------------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bc90500a7573..56ef2fc6d2eb 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -529,6 +529,7 @@ config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	help
 	   This enables support for the PLIC chip found in SiFive (and
 	   potentially other) RISC-V systems.  The PLIC controls devices
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bb87e4c3b88e..bf7d5bee0c0c 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -109,31 +109,18 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
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
@@ -154,11 +141,13 @@ static int plic_set_affinity(struct irq_data *d,
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
@@ -184,6 +173,7 @@ static struct irq_chip plic_chip = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity = plic_set_affinity,
 #endif
+	.flags		= IRQCHIP_AFFINITY_PRE_STARTUP,
 };
 
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
