Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDB2C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7rbnwAwZryRDBIe0Vso1lza8SQzhxY45qugoOJLttk=; b=rxTgAoxCmYC6WJ
	PmoxXAxGm+OPr0N+Jdd3/FNXtgIsy1fL7U9JYpbfrVD+KIYwIxkPxhXyoyoTZuHmu+rOaxRmrWA9v
	n4idWFMGTO+ohB+PrYqeKourZKhFtXjWjiujjuleK3TB2CnY1xRb+mmGkLvuTbCSAUZuUFfvKMDDC
	u7knWGQnP0vs5xAr7O6fhxDJNBiVYQ7DX8sqx7nTa4OjqKcWGIx4tN6ERwGMUi0/ooJ0vyXZpaH9I
	UyE0ZySUQOh0Fq6SWgUno7bhsRqd16114SIGFce0wg5vnRM31dsB35hUMDL3ZFdG44ls18uXo/A1o
	p5i5DU6xU58KMiPwwBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUojI-0000000CAMn-3ScJ;
	Thu, 26 Jun 2025 15:41:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnux-0000000BzyW-3RdM;
	Thu, 26 Jun 2025 14:49:37 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkXJXJkvLwHuTpAwjvS0vUf4fEyF+xPIPCi5NiqwgZg=;
	b=nSaQCQ+IHhLsvffHxI3+qDKzxsBniO963XIYMSa4/MbUUJpX9o3IIyBndFYw+n5M6fqFUh
	3q+2Bc7BB2MVeC+voczKHzEkh/o3xC/gGaS2zbgaVyw/hsP5Fa5qWVHUPTYmVZwmC2DZZV
	KbEahyUeLdN7tOaJW72bbNwsCm6c6jg4wGtwFXMowZEchV1mt3cp7Cxyx8im6LpMMJyp3D
	0cFqLcXGdZfh/YBzlIWhXoIIBRGd7uUb7Qx+UudeF4a2tqe/kBwwgi2EuB39GqOKkh24rZ
	i29wjE42TIH6U4S8Ac4x/Qp/fJL0TrN8ME+hFIFFtqTKAoZJtZabqMaLSgs+Wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkXJXJkvLwHuTpAwjvS0vUf4fEyF+xPIPCi5NiqwgZg=;
	b=F9dx+UrfW5xu7dgNLVw0va+kP/3CyD/ZP0gDAyjIwhjycwqtJWLNkZnRpOSgHoReXhxaDD
	LOvuAc7P2JErQxAA==
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
Subject: [PATCH 05/12] irqchip/loongson-pch-msi.c: Switch to msi_create_parent_irq_domain()
Date: Thu, 26 Jun 2025 16:49:02 +0200
Message-Id: <7ae78d7b7e33ad8ca1ec2ba28957546c81ba86f7.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074936_003845_AC23832B 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Switch to use the concise helper to create an MSI parent domain.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org
---
 drivers/irqchip/irq-loongson-pch-msi.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
index a0257c7bef108..4aedc9b90ff77 100644
--- a/drivers/irqchip/irq-loongson-pch-msi.c
+++ b/drivers/irqchip/irq-loongson-pch-msi.c
@@ -153,26 +153,21 @@ static struct msi_parent_ops pch_msi_parent_ops = {
 	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
-static int pch_msi_init_domains(struct pch_msi_data *priv,
-				struct irq_domain *parent,
+static int pch_msi_init_domains(struct pch_msi_data *priv, struct irq_domain *parent,
 				struct fwnode_handle *domain_handle)
 {
-	struct irq_domain *middle_domain;
-
-	middle_domain = irq_domain_create_hierarchy(parent, 0, priv->num_irqs,
-						    domain_handle,
-						    &pch_msi_middle_domain_ops,
-						    priv);
-	if (!middle_domain) {
+	struct irq_domain_info info = {
+		.ops		= &pch_msi_middle_domain_ops,
+		.size		= priv->num_irqs,
+		.parent		= parent,
+		.host_data	= priv,
+		.fwnode		= domain_handle,
+	};
+
+	if (!msi_create_parent_irq_domain(&info, &pch_msi_parent_ops)) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
 	}
-
-	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
-
-	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = &pch_msi_parent_ops;
-
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
