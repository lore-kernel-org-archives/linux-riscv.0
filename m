Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C97E77178
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5uSn8FIWO3Ch8ThK02tFY7cIRpxdx7p9e3SUUCFNbg=; b=F4TSkDXzO9S0v1
	PuCx3oaaxZcmCRGivnGwCGeCSrQfLT9cQnE6wOzGlIzKb1XahsfRPCN/yZ7XfL9nUWagDK68ACk8O
	6Gc3FuzTT4XylFlzpQfcYUOj+EVXvWFkVqm2XVAnPqvb6ii83uluqd4kwUiEEwgnDFCAUbgfbc/Ca
	BpIUa6gSgjqPzWEl8Q133gwNGAkJf8xhiI7gnkBDbg1zDHYMv5a4lazFd1pPIv35wEBEqfGsx5VaF
	aqMfUr9A6gWIzAjE8LGdLNHMC6Ltpq6Rs9Lr5vZnyJzyxPSm60O1NWdsQAIAE5fE+8qmey6HrY/hm
	D7ESbwaPOXMz4mnvcuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoxP-0000000CawX-0Z9h;
	Wed, 04 Dec 2024 12:58:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIolc-0000000CYRQ-3SK7;
	Wed, 04 Dec 2024 12:46:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E93E5C6E30;
	Wed,  4 Dec 2024 12:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D82C4AF0E;
	Wed,  4 Dec 2024 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733316367;
	bh=cMEyrhut2oPOzp4WCdsADd6Mhl4M3N9+iIzR7Vo4fus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d7gJeuaANLlfILMnAH0xfcFXpharXfkDKqBCeIrQPfX5u+LfRez7d2wcyvxDZeEju
	 NBebxjvJDBKpWoj/KFquYuXVSv7J6GOJWuTw7921VMgO+XDikjIsWLk8Wh5LjAM5xl
	 +7YSN6trmPfmtrNcjg1yQT0at4g11nZEx6VOJikdElShAWglpzcAWNQcvg16pqsnAe
	 xBYvV+unmzueB+5j0TeOMcu7wMyRbIPN37UOpU3Rhlgz4YDbb5z/JElCmwS3hMABF3
	 sOWXIaaZV/Ocpde/D3Cln9jWVW0Xn5TknjP/RCQ+kGMDKTU/yo+tApvxbeH/8NUeI+
	 7i1zPiuWCJNTw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIolZ-000RHy-Aj;
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
Subject: [PATCH 04/11] irqchip/mvebu: Convert to msi_create_parent_irq_domain() helper
Date: Wed,  4 Dec 2024 12:45:42 +0000
Message-Id: <20241204124549.607054-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204124549.607054-1-maz@kernel.org>
References: <20241204124549.607054-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, joro@8bytes.org, suravee.suthikulpanit@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name, jiaxun.yang@flygoat.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, toan@os.amperecomputing.com, alyssa@rosenzweig.io
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_044608_942697_011B205A 
X-CRM114-Status: GOOD (  14.05  )
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
switch the mvebu family of interrupt controllers over to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-mvebu-gicp.c | 12 +++++-------
 drivers/irqchip/irq-mvebu-odmi.c | 13 +++++--------
 drivers/irqchip/irq-mvebu-sei.c  | 14 +++++---------
 3 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index b206b7fe03f17..783bfc83c2607 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -229,16 +229,14 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	inner_domain = irq_domain_create_hierarchy(parent_domain, 0,
-						   gicp->spi_cnt,
-						   of_node_to_fwnode(node),
-						   &gicp_domain_ops, gicp);
+	inner_domain = msi_create_parent_irq_domain(of_node_to_fwnode(node),
+						    &gicp_msi_parent_ops,
+						    &gicp_domain_ops,
+						    0, gicp->spi_cnt, gicp,
+						    parent_domain);
 	if (!inner_domain)
 		return -ENOMEM;
 
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_GENERIC_MSI);
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops = &gicp_msi_parent_ops;
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index 0ba39fbdb451f..74308b1cc01f1 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -204,19 +204,16 @@ static int __init mvebu_odmi_init(struct device_node *node,
 
 	parent_domain = irq_find_host(parent);
 
-	inner_domain = irq_domain_create_hierarchy(parent_domain, 0,
-						   odmis_count * NODMIS_PER_FRAME,
-						   of_node_to_fwnode(node),
-						   &odmi_domain_ops, NULL);
+	inner_domain = msi_create_parent_irq_domain(of_node_to_fwnode(node),
+						    &odmi_msi_parent_ops,
+						    &odmi_domain_ops, 0,
+						    odmis_count * NODMIS_PER_FRAME,
+						    NULL, parent_domain);
 	if (!inner_domain) {
 		ret = -ENOMEM;
 		goto err_unmap;
 	}
 
-	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_GENERIC_MSI);
-	inner_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	inner_domain->msi_parent_ops = &odmi_msi_parent_ops;
-
 	return 0;
 
 err_unmap:
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index c12e650ae7c92..26e1a436af2d1 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -429,21 +429,17 @@ static int mvebu_sei_probe(struct platform_device *pdev)
 	irq_domain_update_bus_token(sei->ap_domain, DOMAIN_BUS_WIRED);
 
 	/* Create the 'MSI' domain */
-	sei->cp_domain = irq_domain_create_hierarchy(sei->sei_domain, 0,
-						     sei->caps->cp_range.size,
-						     of_node_to_fwnode(node),
-						     &mvebu_sei_cp_domain_ops,
-						     sei);
+	sei->cp_domain = msi_create_parent_irq_domain(of_node_to_fwnode(node),
+						      &sei_msi_parent_ops,
+						      &mvebu_sei_cp_domain_ops,
+						      0, sei->caps->cp_range.size,
+						      sei, sei->sei_domain);
 	if (!sei->cp_domain) {
 		pr_err("Failed to create CPs IRQ domain\n");
 		ret = -ENOMEM;
 		goto remove_ap_domain;
 	}
 
-	irq_domain_update_bus_token(sei->cp_domain, DOMAIN_BUS_GENERIC_MSI);
-	sei->cp_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	sei->cp_domain->msi_parent_ops = &sei_msi_parent_ops;
-
 	mvebu_sei_reset(sei);
 
 	irq_set_chained_handler_and_data(parent_irq, mvebu_sei_handle_cascade_irq, sei);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
