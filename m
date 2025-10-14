Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75050CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx3JrgirJOhZKbW0LqRD2iPiBKaOdZEVeDvUEFb7hXI=; b=PIgs/5aJpodCx7
	f97U9BmMoBhS531aOttGkscyKBQ61AnTDxNMlfCc4tVHkrViWwC0YsXxRktA+TyHHng2FMuo26oi/
	upXaNOau+1TJeAast9FTpdEbncPopoprRpY620xXvbspzpy+a4y9ycOdyMUT0Guo3tNdfXTIOAOnF
	gy/4e00NQhcEKzvUZ7ADuvcfFCQ4oSPL1VhBfNqW53ZYWYSIxiTX8NPwbTpB04KMdzy+LUjxVJigK
	alsHm3sYmPNObZ1Cnco+k7eU8+MpmRzgPcYcjPvZHIiRzSmAIBcb9nKBAz2/8mQSGnkO9XTlHgzR/
	gaetSiny3prx3gaDzMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ep6-0000000GQUn-3H7L;
	Tue, 14 Oct 2025 13:12:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ep5-0000000GQTG-0MKo
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Oct 2025 13:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2Dnfb/9gAaFUBFTiqAkbIEWVV0Bx630rqpMB3MVg8Ig=; b=psKRYzWl409K0zyixntHyKcjsq
	aYzlMHVIbbXOwfLuApXRRBGtydrXjok75RqLEZpLAv52CYTiGDyYuDeFgl0fda3eL7v3gXubGg3q+
	9ZV+FcslWJz6mJC9JX3m0YGj90RBB1cpjGsiWQRHuPOtMzsxdLRBFcyJUEnzBnoothvP0cqJ0aJBi
	DPczngLd1BfgAdyiSGkVG96WrXujaVsCZBzdMtIHm0QkqFQ0Yn0SBqI9f3XEUKlmgiAye6LLKynh+
	A9EJxpiCA54CeUVpLuHxGc73ktMqyK5Ya/FXEL5qeWP2I92WKdERQ9oUBjpF54hRIp3+l7/baONL4
	bdTUFZhg==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ep0-00000005BPF-2jjb
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:12:12 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 08D6D25920;
	Tue, 14 Oct 2025 15:12:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9JygYFEavtO; Tue, 14 Oct 2025 15:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760447528; bh=AyARZ8O9kOKQYCzMN7H8nfyDa+QfPPanHy+EOHRlTZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XG0X8SA4TQ6iaWlRsiArufcfX3p7MqhJxONZ1+9iRPD9ICtmTtvqqT4B8zam5Vt1Q
	 aTVMmXkHQggPh37NX4SO8MPNRWYp0e7v2gkMdc0UldSesi9Mb1Elf54Pk/juhL5IQY
	 f8oZ1zC6a6kzWuspip2akqyLTw6PKPQvCWA+/VGyZ79jynQdAxezL8jCbFgPfz1Az+
	 63DlXzooJCRKPKmmZGouFjFwamBxT/WOverpICT5NDxvQijJC8F6mkk57HTtOp9nUz
	 VzDwOQX/6rBqbwuXt6FOkf6OgB0ZwIgmaBSFLqeT622ZH+inczpi6qN0m6eTsBT9KB
	 A5jaOEq7ZlXFQ==
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
Subject: [PATCH v3 3/5] reset: th1520: Prepare for supporting multiple controllers
Date: Tue, 14 Oct 2025 13:10:30 +0000
Message-ID: <20251014131032.49616-4-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-1-ziyao@disroot.org>
References: <20251014131032.49616-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141211_134923_756F60D9 
X-CRM114-Status: GOOD (  14.23  )
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
