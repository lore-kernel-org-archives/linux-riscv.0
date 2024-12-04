Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0061DE7716E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9vxktdYGwIIz1q1jgtLwI3oD6QAGCagQsivXY/sAA0=; b=0OkOTtrZGSS3jj
	kpvmqlG66dcSZXvzTMBiPvwhJMyJNWY+oUsvYdaLEi/e4STb4qJ0EEks+svOWWSi2J7prN3vNVTvL
	xmpwiU9jcBC2/T2xqbcQExfOdKecmgkaogw5p0FptR8xcrnXYXoYuSRch38x2ynjYcovzCZGRjWNs
	EAvHYtvhGcqiMIxvSJx/xZWpw+gsXbIZ/UoSJJ27DQv/7PlEOunysOUce4UvhU3QnsvlmIgafOMUS
	Oz0u7zwwDbRc+WYiqYKjDxC5/5kGPAk8bx0beZLz/VqwGMpKM1Yz6+bJQKHo43/+KOAX3YvFu2Ve4
	VnRP28NGhFCbu3DnkvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxQ-0000000CaxS-1bXM;
	Wed, 04 Dec 2024 12:58:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIold-0000000CYRw-1Hao;
	Wed, 04 Dec 2024 12:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57EB15C6E38;
	Wed,  4 Dec 2024 12:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88DEC19422;
	Wed,  4 Dec 2024 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316367;
	bh=J2h79k3WbUC/sq2bIkNgbuUFrP/AJSlM4EuxmyTYCv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vr62k5+wqB1Fqc1D6aPCpoufZJluao/kLQZNfg84/LfpHrKbYN828AKSTqqKeQaCv
	 3qu8CJlgV0P0DphhuHV0RXZl4YlD5GanSbvvlMu2BizRaUa0Hiyflsbn0JCFsPYFlm
	 P1gkyNmR285x7ujGi1/X7nvkGtakgj9ob+HawHpkN/gsJhbfR7sLIxfJqf6ilYEPbn
	 0z1kYl4YMoWLS5wILpt7MSOKNaSISK55Ihf7zQNlQF4KCFvvTCP1K5JjOoLEXJFQAh
	 YqxtoRQYloKWZvBp/HFxKoEC7jmafjvBxIyDNWdKmnde0t3aJ5QRBubvIAF4uuPuwA
	 pJo0WFkL1wwLw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolZ-000RHy-MI;
	Wed, 04 Dec 2024 12:46:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 05/11] irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
Date: Wed,  4 Dec 2024 12:45:43 +0000
Message-Id: <20241204124549.607054-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204124549.607054-1-maz@kernel.org>
References: <20241204124549.607054-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_044609_443196_249FDE3D 
X-CRM114-Status: GOOD (  11.73  )
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

Now that we have a concise helper to create an MSI parent domain,
switch the RISC-V letter soup over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760f..3fbc3a8eb3be8 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -325,16 +325,15 @@ int imsic_irqdomain_init(void)
 	}
 
 	/* Create Base IRQ domain */
-	imsic->base_domain = irq_domain_create_tree(imsic->fwnode,
-						    &imsic_base_domain_ops, imsic);
+	imsic->base_domain = msi_create_parent_irq_domain(imsic->fwnode,
+							  &imsic_msi_parent_ops,
+							  &imsic_base_domain_ops,
+							  0, 0, imsic, NULL);
+	
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
