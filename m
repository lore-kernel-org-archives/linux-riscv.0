Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596DBC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NYq0BKu3K0Ld9jgnwc/qQqPddh4tsLI4f0FdqzghFkE=; b=nxS2pMw3UW0oOb
	yrzzD8lBJxltJd3l0/l/xHezmbtBXuqvtc9oSofe8eGt+cViWBXIJwGYqaVZVwko5kZ+e1kqUVix/
	hAk1En3SRv9BooQFQWS/OUGLkbmRSibDrV0Zo2+uZnh2JzJ3ftYSDHqbgQEN2N8JySaqSNy2o556n
	Qen1YA9E0LaTfrJyRZ7KfYHYPGK80I3AxsIQcDYDWPODQ5dByDmdWdKqE/7LJ+D7gBCgQk+gizH4f
	B3pZ0NkEdeAyR87hWqUUs0Dg6Dj3HuD9GbgOpiEUXCP0pj+kWfJpvuyi6JDeQFj8OrSD6Tn4t4aKo
	9oU3Ccx25ibe573Bx4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZpa-0000000EwZM-2Ryc;
	Mon, 27 May 2024 12:52:02 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZpX-0000000EwVl-2pVm
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:52:01 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VnwRd2JWMz1S5lv;
	Mon, 27 May 2024 20:48:13 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
	by mail.maildlp.com (Postfix) with ESMTPS id 215F01402C7;
	Mon, 27 May 2024 20:51:47 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 27 May
 2024 20:51:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <anup@brainfault.org>, <tglx@linutronix.de>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] irqchip/riscv-aplic: Simplify the to_of_node code
Date: Mon, 27 May 2024 12:50:00 +0000
Message-ID: <20240527125000.3502935-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_055159_959720_895D1323 
X-CRM114-Status: GOOD (  12.80  )
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

The to_of_node has is_of_node check, so there is no need to repeat the
is_of_node and to_of_node. And if is_of_node is false, the to_of_node will
return NULL, the of_property_present will also return NULL, so remove the
redundant check.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 774a0c97fdab..28dd175b5764 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -127,6 +127,7 @@ static void aplic_init_hw_irqs(struct aplic_priv *priv)
 
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs)
 {
+	struct device_node *np = to_of_node(dev->fwnode);
 	struct of_phandle_args parent;
 	int rc;
 
@@ -134,7 +135,7 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *
 	 * Currently, only OF fwnode is supported so extend this
 	 * function for ACPI support.
 	 */
-	if (!is_of_node(dev->fwnode))
+	if (!np)
 		return -EINVAL;
 
 	/* Save device pointer and register base */
@@ -142,8 +143,7 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *
 	priv->regs = regs;
 
 	/* Find out number of interrupt sources */
-	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,num-sources",
-				  &priv->nr_irqs);
+	rc = of_property_read_u32(np, "riscv,num-sources", &priv->nr_irqs);
 	if (rc) {
 		dev_err(dev, "failed to get number of interrupt sources\n");
 		return rc;
@@ -155,8 +155,8 @@ int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *
 	 * If "msi-parent" property is present then we ignore the
 	 * APLIC IDCs which forces the APLIC driver to use MSI mode.
 	 */
-	if (!of_property_present(to_of_node(dev->fwnode), "msi-parent")) {
-		while (!of_irq_parse_one(to_of_node(dev->fwnode), priv->nr_idcs, &parent))
+	if (!of_property_present(np, "msi-parent")) {
+		while (!of_irq_parse_one(np, priv->nr_idcs, &parent))
 			priv->nr_idcs++;
 	}
 
@@ -184,8 +184,7 @@ static int aplic_probe(struct platform_device *pdev)
 	 * If msi-parent property is present then setup APLIC MSI
 	 * mode otherwise setup APLIC direct mode.
 	 */
-	if (is_of_node(dev->fwnode))
-		msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
+	msi_mode = of_property_present(to_of_node(dev->fwnode), "msi-parent");
 	if (msi_mode)
 		rc = aplic_msi_setup(dev, regs);
 	else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
