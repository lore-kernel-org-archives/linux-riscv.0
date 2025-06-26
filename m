Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4D3C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7nbDCebzY96ZwBeT5n1kD7bZfgqkVC8p6J8tLtsOxw=; b=w5QCQvvwzSbNaH
	G49Ti3Wdpx9+TvPKLzSmQwY9tW37f6vgqy77Q1PTQ8b3JEJDr02ziXpuHxVeZr8OLaGaOie+BuXvU
	L2VMAZhPg6gy5PdOFKQYoNkraTgL/MmtFHF80y9pHkk0Knc71QNiUWtJXsqx1rGhxaNpWlo2iCvXt
	6x0OVHT1AvhJCfidOwDkv7tilzGYZhStKmzq8al3OwwQy+i81qf8iaVtNenueC4Dsn863YbcySGB2
	VAt1P1jxHoZ7AoVEQ2MVQIMnekwKeRF4Nh7mZNuVpSOGU86ADCchHBfd385gXrmYIlRZN8PpCSDCS
	PYVF/VRmRzyO5pFPPKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUogr-0000000C9jA-3NOf;
	Thu, 26 Jun 2025 15:39:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuw-0000000Bzxe-02AJ;
	Thu, 26 Jun 2025 14:49:35 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCV6bFUUfFxB0dupoRA2S4Wd06kQQS9OF6OfS/2EiHI=;
	b=k6cTJKEHb4brrQG+gymKJzNH1BBvN4SJI81xlJS1r/FFDjmgyleaNSMFtZqIGoBm26e8z7
	VjQzuu9WHfbyu6cXIJlSq66QsLl7l4U9l46T113HkmjWShQ1EwAjDXDpVr11NwCpvqwJ7q
	R8a2d8tkccRtd5ZG2bmIr6dfC86Hijrndx1CsbROK/bC7qMgXrmMxv6eD5xkxfIhAGi1mk
	xVz7dTRBmNzFnbvt0ER1s05EQKtfZXAFpd7ZiTa8WbfNHptOMJ8/dpwUeHyGu+OZ7bnKb3
	9M9xkbRWqXxDD2htW826eHnbiN6+69z7Gvz2VlbAuZY6QB5ka2eD/6SWu9lMbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCV6bFUUfFxB0dupoRA2S4Wd06kQQS9OF6OfS/2EiHI=;
	b=kU8nVJGpjIPyZGszjEtsn7WcpYNC9r9///57gdt2gHQ6773b68/ZNF0LCSlkKermKJAZfZ
	1Sr2D3sI0N58NBAA==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 03/12] irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
Date: Thu, 26 Jun 2025 16:49:00 +0200
Message-Id: <b906a38d443577de45923b335d80fc54c5638da0.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074934_188058_8ED91658 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

From: Marc Zyngier <maz@kernel.org>

Now that we have a concise helper to create an MSI parent domain,
switch the RISC-V letter soup over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20241204124549.607054-6-maz@kernel.org
---
Cc: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 1b9fbfce95816..74a2a28f94030 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -307,6 +307,11 @@ static const struct msi_parent_ops imsic_msi_parent_ops = {
 
 int imsic_irqdomain_init(void)
 {
+	struct irq_domain_info info = {
+		.fwnode		= imsic->fwnode,
+		.ops		= &imsic_base_domain_ops,
+		.host_data	= imsic,
+	};
 	struct imsic_global_config *global;
 
 	if (!imsic || !imsic->fwnode) {
@@ -320,16 +325,11 @@ int imsic_irqdomain_init(void)
 	}
 
 	/* Create Base IRQ domain */
-	imsic->base_domain = irq_domain_create_tree(imsic->fwnode,
-						    &imsic_base_domain_ops, imsic);
+	imsic->base_domain = msi_create_parent_irq_domain(&info, &imsic_msi_parent_ops);
 	if (!imsic->base_domain) {
 		pr_err("%pfwP: failed to create IMSIC base domain\n", imsic->fwnode);
 		return -ENOMEM;
 	}
-	imsic->base_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	imsic->base_domain->msi_parent_ops = &imsic_msi_parent_ops;
-
-	irq_domain_update_bus_token(imsic->base_domain, DOMAIN_BUS_NEXUS);
 
 	global = &imsic->global;
 	pr_info("%pfwP:  hart-index-bits: %d,  guest-index-bits: %d\n",
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
