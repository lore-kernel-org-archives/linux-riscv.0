Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE23C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQhe9zqOZToncfAhLLyKN7tAOK5gaF9hURb/91Mvw0k=; b=1ZX4AxbflZivy3
	jEpu008fncEzWZbG7Q9nQtGnSkqJPeWaCC3AIbzjDoLdf/yLs3LJY3IEvg2HS/VClhU32mzJVUPp0
	IHvKXT3UEWS6Q+/vGh0VJtToGzR32T5u0BVPjtXSL7TOiIa4RwkQ6nMNIzvNMcvkSrtoeiXM17EaB
	FPfo4bbscR5zYxCo15VeSfaYFFElTL3FBU14WcasdvicofgJo8OSIlLxPYvkhkA7kvSHN+3svaX2M
	YZD+03QA/X1+KrmFBt8DcqfBfBKZERHcH35sjFRmb9HKB5nb0KhjXC3SKfcSl7DB0a480PJSGNb5h
	cEZ2721ZS3SsYDE/owxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUocJ-0000000C8kG-3PEy;
	Thu, 26 Jun 2025 15:34:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnut-0000000Bzw7-1ETh;
	Thu, 26 Jun 2025 14:49:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1h6sQyjT8FDCPgBDdSgNZubpG9nhAkbkG2lkhugPhQ=;
	b=MOZ6E7iCTTEcetQzCELuNNuAx46vOhJE14mS5kWCVx4b/hnfKfKTmEpmq/QC0A9/FB0qAi
	k6gq5qNFLVX/E/WI4svdHeFVdjv4MFup2wUKRr6oPKVlV0PH14Qth60GR9sA84tuam5m3x
	YfD899AMdpHiYFtrCB4BcIg1Y8sWAa41X89Hq+yurNqbxgHh7rxn13z0QiIKruUeacYL4J
	ptyXr6wwLw3rTN+FMbHwc+qBSsVoxW/+c9UYdyXY1Tmutcb9OQyrGQysQdiyOJxlcj3I5z
	hzuqwRtzKP4YyLhzvgFaG1+1FO0FV1iLpuoUmY/H0jJKTdgDW+41KgIETpvJ6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1h6sQyjT8FDCPgBDdSgNZubpG9nhAkbkG2lkhugPhQ=;
	b=65z1qE3l+CngzEH4hNvhsaFiTqSH3y7pkFbPyEi+jWPHv0rSZHOo5JR2/C0Qje6SB9PiLj
	p6dBstpI32Jtq3AQ==
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
Subject: [PATCH 01/12] irqdomain: Add device pointer to irq_domain_info and msi_domain_info
Date: Thu, 26 Jun 2025 16:48:58 +0200
Message-Id: <943e52403b20cf13c320d55bd4446b4562466aab.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074931_474586_7B758FC2 
X-CRM114-Status: GOOD (  12.95  )
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

Add device pointer to irq_domain_info and msi_domain_info, so that device
can be specified at domain creation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 include/linux/irqdomain.h | 2 ++
 include/linux/msi.h       | 2 ++
 kernel/irq/irqdomain.c    | 1 +
 kernel/irq/msi.c          | 3 ++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 7387d183029b7..266b5e5bb8ced 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -279,6 +279,7 @@ struct irq_domain_chip_generic_info;
  *			domains are added using same fwnode
  * @ops:		Domain operation callbacks
  * @host_data:		Controller private data pointer
+ * @dev:		Device which creates the domain
  * @dgc_info:		Geneneric chip information structure pointer used to
  *			create generic chips for the domain if not NULL.
  * @init:		Function called when the domain is created.
@@ -298,6 +299,7 @@ struct irq_domain_info {
 	const char				*name_suffix;
 	const struct irq_domain_ops		*ops;
 	void					*host_data;
+	struct device				*dev;
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 	/**
 	 * @parent: Pointer to the parent irq domain used in a hierarchy domain
diff --git a/include/linux/msi.h b/include/linux/msi.h
index 6863540f4b717..77227d23ea84b 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -488,6 +488,7 @@ struct msi_domain_ops {
  *			gets initialized to the maximum software index limit
  *			by the domain creation code.
  * @ops:		The callback data structure
+ * @dev:		Device which creates the domain
  * @chip:		Optional: associated interrupt chip
  * @chip_data:		Optional: associated interrupt chip data
  * @handler:		Optional: associated interrupt flow handler
@@ -501,6 +502,7 @@ struct msi_domain_info {
 	enum irq_domain_bus_token	bus_token;
 	unsigned int			hwsize;
 	struct msi_domain_ops		*ops;
+	struct device			*dev;
 	struct irq_chip			*chip;
 	void				*chip_data;
 	irq_flow_handler_t		handler;
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index c8b6de09047be..4afbd3ac532fb 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -317,6 +317,7 @@ static struct irq_domain *__irq_domain_instantiate(const struct irq_domain_info
 
 	domain->flags |= info->domain_flags;
 	domain->exit = info->exit;
+	domain->dev = info->dev;
 
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 	if (info->parent) {
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 9febe797a5f6a..9b09ad3f9914c 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -889,6 +889,7 @@ static struct irq_domain *__msi_create_irq_domain(struct fwnode_handle *fwnode,
 
 	if (domain) {
 		irq_domain_update_bus_token(domain, info->bus_token);
+		domain->dev = info->dev;
 		if (info->flags & MSI_FLAG_PARENT_PM_DEV)
 			domain->pm_dev = parent->pm_dev;
 	}
@@ -1051,6 +1052,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	bundle->info.data = domain_data;
 	bundle->info.chip_data = chip_data;
 	bundle->info.alloc_data = &bundle->alloc_info;
+	bundle->info.dev = dev;
 
 	pops = parent->msi_parent_ops;
 	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
@@ -1089,7 +1091,6 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
 	if (!domain)
 		return false;
 
-	domain->dev = dev;
 	dev->msi.data->__domains[domid].domain = domain;
 
 	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
