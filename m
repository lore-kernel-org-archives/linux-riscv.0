Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2435C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 04:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hFDz0q8aLjMVEHDL7QML9MSp0FPeMZ2tUExbhFW8S2o=; b=Ji0xjrZSKiQSnk
	AKccvjPnJLbfZPIzkB4e63yBGsFMeUw3xKE0iNAQHG0kI6+Gtbl+3vgjmO3Rg6Mks81BFTfxN4A9X
	prTOocANJRfkAa28mlmhRnns7rldEb5FkfVz48+kO+FemR/z6PuXBVj7Jbfyf7uNp0UxCD2pKnLi+
	faY30k22MkE/EZ/XZd8AVXQtM89EsXmOqhVednwhe97PmRnGi/Ea/+xaFWuWolHwMfyaL00dKhMbI
	zVW3TIsK7VTksqEgNr89S7bw6eZAq9EcLkZ+/qUxFjurk6UMIvR9QIpXDSmzfmj2HNNQXWEfz4+qh
	pUYoxjFMgx7YAGDAsYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyIh-009Iw9-K9; Mon, 21 Nov 2022 04:20:55 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyId-009Itm-Oc
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 04:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669004435; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EIYjPyf3w9DhOjCCV/thJnwy7+qR8H6OPg0QKLaSKnCByoEPMqWcaSrrEfl8jpnzZDVqlRh1cSpDS6xmL/fnhKjaLBWXxnZnHYFfihO5Wl1Ibo8G9ipQ+AcIX8poprNpQtWKlpu3gYh5DamF+3yKQhvCrpVQj/Xf1wzcq7umLfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669004435; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Fn9irMP7okWvGngWT9Yen8/hGTg+Lf8+wdc49FOs54U=; 
	b=SQdrkthZ3zNdQjTsWZiarcl7C48MQI+M6Db1b0yo+k+5UCytb/FPeFw5WNe2+V7e66CXHVS3N8vrCpHpQyrR9ThUJDrOWJxk44GuLS1hJa1ACAeIvZuxHUhoeVrECw8sZM0LlkrANOLKv9+8zZHDj7pjbe5/hE5cI9EsQY36xx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669004435;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Fn9irMP7okWvGngWT9Yen8/hGTg+Lf8+wdc49FOs54U=;
	b=IrhV21Qk8cneeCv3AilZlbff9rhfx5nIAlv3U6oM8R+nmzFhwKOylK0+Fg2OerRF
	XCmRfC/dNKHQNzMylKI+WbiNR3w6kh2m1wI28VmHw5DJooGYSlB5UJpGmbEaAbsmiSR
	ATgK5+gyFK2EVRmb3gCgqDoF1MN6/TGN9xYkThjg=
Received: from edelgard.fodlan.icenowy.me (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 1669004435056302.11536882473524; Sun, 20 Nov 2022 20:20:35 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] irqchip/sifive-plic: drop quirk for two-cell variant
Date: Mon, 21 Nov 2022 12:20:26 +0800
Message-Id: <20221121042026.419383-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_202051_890275_1D6461AA 
X-CRM114-Status: GOOD (  14.25  )
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

As the special handling of edge-triggered interrupts are defined in the
PLIC spec, we can assume it's not a quirk, but a feature of the PLIC
spec; thus making it a quirk and use quirk-based codepath is not so
necessary.

Move to a #interrupt-cells-based practice which will allow both device
trees without interrupt flags and with interrupt flags work for all
compatible strings.

In addition, this addresses a stable version DT binding violation --
Linux v5.19 comes with "thead,c900-plic" with #interrupt-cells defined to
be 1 instead of 2, this commit will allow DTs that complies to Linux
v5.19 binding work (although no such DT is devliered to the public now).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/irqchip/irq-sifive-plic.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2f4784860df5..219e4f1b62f0 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -67,6 +67,7 @@ struct plic_priv {
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
 	unsigned long plic_quirks;
+	u32 interrupt_cells;
 };
 
 struct plic_handler {
@@ -208,7 +209,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
 
-	if (!test_bit(PLIC_QUIRK_EDGE_INTERRUPT, &priv->plic_quirks))
+	if (priv->interrupt_cells < 2)
 		return IRQ_SET_MASK_OK_NOCOPY;
 
 	switch (type) {
@@ -246,7 +247,7 @@ static int plic_irq_domain_translate(struct irq_domain *d,
 {
 	struct plic_priv *priv = d->host_data;
 
-	if (test_bit(PLIC_QUIRK_EDGE_INTERRUPT, &priv->plic_quirks))
+	if (priv->interrupt_cells >= 2)
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
 
 	return irq_domain_translate_onecell(d, fwspec, hwirq, type);
@@ -357,6 +358,10 @@ static int __init __plic_init(struct device_node *node,
 	}
 
 	error = -EINVAL;
+	of_property_read_u32(node, "#interrupt-cells", &priv->interrupt_cells);
+	if (WARN_ON(!priv->interrupt_cells))
+		goto out_iounmap;
+
 	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
 	if (WARN_ON(!nr_irqs))
 		goto out_iounmap;
@@ -479,12 +484,5 @@ static int __init plic_init(struct device_node *node,
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
-
-static int __init plic_edge_init(struct device_node *node,
-				 struct device_node *parent)
-{
-	return __plic_init(node, parent, BIT(PLIC_QUIRK_EDGE_INTERRUPT));
-}
-
-IRQCHIP_DECLARE(andestech_nceplic100, "andestech,nceplic100", plic_edge_init);
-IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_edge_init);
+IRQCHIP_DECLARE(andestech_nceplic100, "andestech,nceplic100", plic_init);
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
