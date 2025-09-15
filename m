Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A52CAC58E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx3JrgirJOhZKbW0LqRD2iPiBKaOdZEVeDvUEFb7hXI=; b=vJaiHdO24A0Rt1
	k/oRR6PC5z8lRrcfwDkqooSS4TEPV4fenK/roSr9PHwWE9/BBacUxORRxOGv5iWj7/rvqs/lsy95P
	qBhi5dW7tN0zVHEUIUZxj8ej+lktK8R9GmJvg9XmwB5n/c4I4wpfbbo2HSrd6qymA4EHfXdxlOu0H
	2nsfo01d8IZy3DeBdv6PeC2YFSAOGa+E7tyMsseIfOllXf03P6gsuYGHMY8n5GtGFQc0Rp1KT7v1d
	4MxIxcNHaqkPQeYOOhPS+UpV249nmoTH8rw/W7+7tFqVR+Pa0ZyRIbV1NfO/Fk6w6wD6R5TySAHhL
	s29VogST/AqGufZ9YsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5vc-00000003XfV-00dH;
	Mon, 15 Sep 2025 09:55:20 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5vZ-00000003Xdh-46nH
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 09:55:19 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8657F25D67;
	Mon, 15 Sep 2025 11:55:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgoPlgG5Q7LO; Mon, 15 Sep 2025 11:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757930115; bh=AyARZ8O9kOKQYCzMN7H8nfyDa+QfPPanHy+EOHRlTZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iCBSPSqSf/ae2cdGdzoi0nIYnHcl9swtZg5xYgVMHaA+RK+TiTywEm6ndQBr/wYzU
	 W9XUHaRhY1aWw1HH3B0u0+ZF7zat9tAFKGny94W7SHYKCoiEYoNsPxcab1nGWX7kXs
	 UjnJDlDC5Y/MK0I7Dt0NFNeWysLtScQIZpCMMRis7VhTTk/XfQuXr4OUMoz3tgXfv6
	 JRCNeuTZFUpXmXRKqTRPE65/GaKF0vLIWWqkIhd48jenzvqh+zbnQFSIJrmymlXcRz
	 EwapK/485NYNDeYc7YIyP/U8PGGiLNKCg0R618XoWgwCgxvgJYtj8TxbCFvs5LU8qk
	 LyD9oulumYEJA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 3/5] reset: th1520: Prepare for supporting multiple controllers
Date: Mon, 15 Sep 2025 09:53:29 +0000
Message-ID: <20250915095331.53350-4-ziyao@disroot.org>
In-Reply-To: <20250915095331.53350-1-ziyao@disroot.org>
References: <20250915095331.53350-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_025518_156991_D234F5E9 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TH1520 SoC is divided into several subsystems, shipping distinct reset
controllers with similar control logic. Let's make reset signal mapping
a data structure specific to one compatible to prepare for introduction
of more reset controllers in the future.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/reset/reset-th1520.c | 42 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 14d964a9c6b6..2b65a95ed021 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -29,14 +29,20 @@
 #define TH1520_HDMI_SW_MAIN_RST		BIT(0)
 #define TH1520_HDMI_SW_PRST		BIT(1)
 
+struct th1520_reset_map {
+	u32 bit;
+	u32 reg;
+};
+
 struct th1520_reset_priv {
 	struct reset_controller_dev rcdev;
 	struct regmap *map;
+	const struct th1520_reset_map *resets;
 };
 
-struct th1520_reset_map {
-	u32 bit;
-	u32 reg;
+struct th1520_reset_data {
+	const struct th1520_reset_map *resets;
+	size_t num;
 };
 
 static const struct th1520_reset_map th1520_resets[] = {
@@ -90,7 +96,7 @@ static int th1520_reset_assert(struct reset_controller_dev *rcdev,
 	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
 	const struct th1520_reset_map *reset;
 
-	reset = &th1520_resets[id];
+	reset = &priv->resets[id];
 
 	return regmap_update_bits(priv->map, reset->reg, reset->bit, 0);
 }
@@ -101,7 +107,7 @@ static int th1520_reset_deassert(struct reset_controller_dev *rcdev,
 	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
 	const struct th1520_reset_map *reset;
 
-	reset = &th1520_resets[id];
+	reset = &priv->resets[id];
 
 	return regmap_update_bits(priv->map, reset->reg, reset->bit,
 				  reset->bit);
@@ -120,11 +126,14 @@ static const struct regmap_config th1520_reset_regmap_config = {
 
 static int th1520_reset_probe(struct platform_device *pdev)
 {
+	const struct th1520_reset_data *data;
 	struct device *dev = &pdev->dev;
 	struct th1520_reset_priv *priv;
 	void __iomem *base;
 	int ret;
 
+	data = device_get_match_data(dev);
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -138,22 +147,31 @@ static int th1520_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->map))
 		return PTR_ERR(priv->map);
 
-	/* Initialize GPU resets to asserted state */
-	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
-				 TH1520_GPU_RST_CFG_MASK, 0);
-	if (ret)
-		return ret;
+	if (of_device_is_compatible(dev->of_node, "thead,th1520-reset")) {
+		/* Initialize GPU resets to asserted state */
+		ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
+					 TH1520_GPU_RST_CFG_MASK, 0);
+		if (ret)
+			return ret;
+	}
 
 	priv->rcdev.owner = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(th1520_resets);
+	priv->rcdev.nr_resets = data->num;
 	priv->rcdev.ops = &th1520_reset_ops;
 	priv->rcdev.of_node = dev->of_node;
 
+	priv->resets = data->resets;
+
 	return devm_reset_controller_register(dev, &priv->rcdev);
 }
 
+static const struct th1520_reset_data th1520_reset_data = {
+	.resets = th1520_resets,
+	.num = ARRAY_SIZE(th1520_resets),
+};
+
 static const struct of_device_id th1520_reset_match[] = {
-	{ .compatible = "thead,th1520-reset" },
+	{ .compatible = "thead,th1520-reset", .data = &th1520_reset_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, th1520_reset_match);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
