Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD277C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aom85WNUpJOSMvniqo3M/KFl1Qfl55nD4aF3eg6I5Os=; b=CDm+WNQ5atvZRl
	I6WS6L1uYZ6VdaZg4koLjkqUnWi5zHGjGCzzsqYppM5pYEizDuq0jHThMoAcMSZoMfwDD0WucjJ9S
	LOkvNT340o8INOP6NQYXbBYkpgRyQaaoODRdciWy8iOCGZjY8GPKRoVfsMhgGkIfIKZyTJh/r3PGE
	AvvfhlwWuGoJkrSJHdSXMlN/R0rxwA56l+BuJjKP4fFP5swaDnW1qJA8Dd4qkrNa//usc8YIR530C
	2jzh3Le2COxbrD62vCj6nHxx/VBghVrqC+dXojjuMm5pfr2VPH6e/xO0Kf1MaRMzfYh1KhjbZAGiJ
	ikeexxWIhEZt6O/zHhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoj8-0000000CAJx-0oom;
	Thu, 26 Jun 2025 15:41:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuw-0000000Bzxy-3VZD;
	Thu, 26 Jun 2025 14:49:36 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDPZSiRjIrBu3L0mAoo4Z14oMd2brpt/a9a8i/MwVwI=;
	b=hl/CvgJftBwQuXGwjera4DNcyc5KVFTYYYBRaCt85BBXlSr+NOFo4liMuDDuGuEDA08JRR
	9kECWWNebtVKtUi6O1IoEVtQfHvtcCqC+reamRDMcr++uzHi7FFtyTEpnTfWmY6gk30WC0
	Syr9/80XY+6W8o3ZmLzLHnXSUNpPA0/qoauBU5ySTQQmv3xy2jWhBAaeSP58EtNtLVh/86
	vcDNk4VSgK6x6g3qbIJx+dXFCZXTbjURylPipzpVGBiGYAZ+Lm+VG7ZG5VXeerfQ2RmCMq
	EkmPeLlGSYNN3Nzgb2CcsM3t/mDRooZ7h6g/gya1dYzqVjwo4xJ0dg1919KmhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDPZSiRjIrBu3L0mAoo4Z14oMd2brpt/a9a8i/MwVwI=;
	b=5gjOj5qEa8MI8tht7YvPXgkn/vPlU41HeXiQrs+o8JZv31+Zigm+RjLGCTQDWDnW4G+BEP
	LHS+nX0A6GMC8rAg==
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
Subject: [PATCH 04/12] irqchip/imx-mu-msi: Convert to msi_create_parent_irq_domain() helper
Date: Thu, 26 Jun 2025 16:49:01 +0200
Message-Id: <4f05fff99b6cc5875d2f4dadd31707e2dedaafc8.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074935_019773_D3319F7C 
X-CRM114-Status: UNSURE (   9.31  )
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
switch the IMX letter soup over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20241204124549.607054-7-maz@kernel.org
---
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-imx-mu-msi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 137da1927d144..d2a4e8a61a42b 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -223,21 +223,21 @@ static const struct msi_parent_ops imx_mu_msi_parent_ops = {
 
 static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *dev)
 {
-	struct fwnode_handle *fwnodes = dev_fwnode(dev);
+	struct irq_domain_info info = {
+		.ops		= &imx_mu_msi_domain_ops,
+		.fwnode		= dev_fwnode(dev),
+		.size		= IMX_MU_CHANS,
+		.host_data	= msi_data,
+	};
 	struct irq_domain *parent;
 
 	/* Initialize MSI domain parent */
-	parent = irq_domain_create_linear(fwnodes, IMX_MU_CHANS,
-					  &imx_mu_msi_domain_ops, msi_data);
+	parent = msi_create_parent_irq_domain(&info, &imx_mu_msi_parent_ops);
 	if (!parent) {
 		dev_err(dev, "failed to create IRQ domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
 	parent->dev = parent->pm_dev = dev;
-	parent->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	parent->msi_parent_ops = &imx_mu_msi_parent_ops;
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
