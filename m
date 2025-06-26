Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F2C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+BKA6CRXkj248ki6GpIRlenNiOoAWTEcJEqA5e5S7s=; b=UAZgUaWF8LLEZN
	haZsGgwdmMYaOmNloFqe9RjLzwoj+yYPtvxFvHpzVTyIShQBPyyEM86gc4bW/BEkjZJ3PNO5sfKS6
	OEXVotee9ZJlNvdhb5a3I0W2FXGU+gIvQLGcBLyDrEWkO4dxtCvSorU19Wj34GgRyMx1xczPNCMMh
	bNyn+uUOIj0ntgQ1J/PZqd1ehtxshxZjrnLS93dOOi333Zi+lzzgj4K0mPaDVkDzr+1n8ZCdfMIEf
	z9PbuHV3p/sNBFMFM6T/9VJt0SbICQyYHrxbMYoEdXlOMcviEn8Vz6Rwp9+NxEDEUw0sbdzEbzlP4
	ykH8J8cB+Y7o1bBkmNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUojT-0000000CAQC-2L0l;
	Thu, 26 Jun 2025 15:41:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuy-0000000Bzyy-2DBU;
	Thu, 26 Jun 2025 14:49:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQJvh+4qMJpBwXh0oz+ildmCIKYnFwkVpJiG0W9NSek=;
	b=Q89pqfCdat4vTT56i2MTX0cTaMwEjsqBm0u4pbQnqmzE0GD2jw+bQLBlo/pBmMGqNAA0Qi
	IKr2QvMqOX0DRNXW90uw9oHztaPjiVlvXBFiF/aOqOgvpaQ87+cJuATK29xIkL+q9W/e2M
	t0p5DWIbScJ+4w9ctgp1UJXODLgYog+boNeuXrfqMuQxenCHgmvPdcibhqLp7kk7OxcBpb
	KopyBUISrjxix+ONfrCI9WMMwfd7rxwufRt3hoF63Ls1srjswmZK2RcKQ6EeeYhQScDfV9
	ZBbW94kOKIvU3Kh57llhjE8i1PBVG4WT5t3mTGLHXX6JC3cTSmAQXEk9QRY1uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQJvh+4qMJpBwXh0oz+ildmCIKYnFwkVpJiG0W9NSek=;
	b=xxE65vbvF2hQ7Y9sZ9cCcwBqJ1qtggiCp0YusxI6VwHfX7Psmg4sc3ccQUZF44/xzfh1Jh
	2lSa5cZxvKNYFKBg==
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
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 06/12] irqchip/sg2042-msi: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:03 +0200
Message-Id: <3e901db1a4c87678af053019774d95b73bfb9ef9.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074936_703524_455CD8CE 
X-CRM114-Status: GOOD (  10.30  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Switch to use the concise helper to create an MSI parent domain.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/irqchip/irq-sg2042-msi.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index af16bc5a3c8b5..bcfddc51bc6a1 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -219,20 +219,18 @@ static const struct msi_parent_ops sg2044_msi_parent_ops = {
 static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
-	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	struct irq_domain *middle_domain;
-
-	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs, fwnode,
-						    &sg204x_msi_middle_domain_ops, data);
-	if (!middle_domain) {
+	struct irq_domain_info info = {
+		.ops		= &sg204x_msi_middle_domain_ops,
+		.parent		= plic_domain,
+		.size		= data->num_irqs,
+		.fwnode		= dev_fwnode(dev),
+		.host_data	= data,
+	};
+
+	if (!msi_create_parent_irq_domain(&info, data->chip_info->parent_ops)) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
-
-	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
