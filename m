Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F694CA0FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 04:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx3JrgirJOhZKbW0LqRD2iPiBKaOdZEVeDvUEFb7hXI=; b=tSK0Gf8sH6Tv0u
	oYCz2vOGdMA1uaTz66cTTrDIdjWuQyC/qqnPVclApJA1IFEwLLbJ1VGPbuHwb/NBAD1d+hB4ElJH3
	robPbdldhZ8sPmeee7hiIv8KfqGdv5fGQEevpNGNGBPxUENfI412d1a+c11R5AxYEPg2e+Fs2ow9Q
	4PV3fZ34r+jwldraW4kOPir6J91fRx0xOYwvBvrPhXWNt/aSxYlI2gNBAJiFu9RjJWOCyF7Oku7xX
	mh3Qk6q4IzaI3Xc64J0E9yf1C2q11bIGxcfZzNN58w8NYjz63aKNJ8frso5q+qmC/EnndpygStmDO
	Y3RWo0i3pttSzcTWk1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usw5r-0000000B8GK-1zJp;
	Mon, 01 Sep 2025 04:24:35 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usw5P-0000000B891-3EoO
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 04:24:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7A6D720A4A;
	Mon,  1 Sep 2025 06:24:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_DJaGlQeZov; Mon,  1 Sep 2025 06:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756700645; bh=AyARZ8O9kOKQYCzMN7H8nfyDa+QfPPanHy+EOHRlTZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I84SXVPtprJx5B7cvt8/XmOO6KhoKS5ue/q1CYtWmnXJc4c96hUItTooEuRA+1eJD
	 C6sYbhGgMemKMo/euh3NdC778y0iEvAr40yNu3a2HUSrSxUl9rACcXvJ4V47X7/aV9
	 pF3VRBp3znTnDQKCfM7gmv09sue7GHPicqPeGvyosLNP8X9eZrgYaK0TXr/T2Sqz3Y
	 4LThA1EAsA59xmy77lcUx9jH1xTQOO6S/gsM5Y+VZi6J7Wik3QYE6DHzJO54Hlo56r
	 QhHoDlVIefIlehFW4NBLY07RmL3jAMQqvcQu+yWJEd+gn7A6klqzGQWHY82+ITtbPc
	 dVnZT76n1Wh3g==
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
Subject: [PATCH 2/4] reset: th1520: Prepare for supporting multiple controllers
Date: Mon,  1 Sep 2025 04:23:18 +0000
Message-ID: <20250901042320.22865-3-ziyao@disroot.org>
In-Reply-To: <20250901042320.22865-1-ziyao@disroot.org>
References: <20250901042320.22865-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_212407_954788_F9619C2F 
X-CRM114-Status: GOOD (  14.75  )
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
