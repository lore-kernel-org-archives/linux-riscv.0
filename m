Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099A6EF99FF
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Im12BJXVNE/i9JDer6F2/+UcSRAZbLU85+1Gp4Q7l8=; b=aPC+3UrctQ7izn
	1lJKm2WkK9Uw/S+Lo0ldlRHLKCr3eXoCKv3Ho6WpWUUPlX5VDvWQ2XAGvYsMNF8M6UHs85EDGCcj4
	1JxebDtD9bjbWIqTM7ZHrgJJntBUn41TB2OWnQbQuyxeQuclSaKpMLmDdabSyTOaK4k5LmfiK+QNc
	Rao9TpyqDDvPxlXSXkChlCekGTJtXJ/3ATvpbaUm+giSt1lxCEsY8fatCGqajIK/jNhLFLKIIBn/d
	WmhPg8NTjbf/IS2FAuJbcieoH9a6LocY9iqYQ59/xxDGVqv8EBn0SstWfhk0w8YYNbndKBYyq4zU1
	jqDrOqdwq/HPCNSLfXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEmY-00000004X1Z-1tA4;
	Sat, 14 Feb 2026 12:29:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEmV-00000004X0n-2EgA;
	Sat, 14 Feb 2026 12:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28ACA43515;
	Sat, 14 Feb 2026 12:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262E8C16AAE;
	Sat, 14 Feb 2026 12:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771072191;
	bh=d3leH17O1fRr5mMSAHm8v+e6UyTxO6lBZs5fKTZ9z7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ttk9aR1mtR3IiwgGLsojTMmyzW4IMjwT84h2Q0JmBdHtS7HfXXcvWax/vcI03CVYJ
	 ibbaLJRweyDiH6LqfD1SDzEZ7DU3dIUSA8YxeQ3X0ixTNNEQvkSdZ5aKiWbmW2BQYD
	 omKnT9PooJZFGgcSIQMbCiRUEldJuuJU7CgLgXsmRiMM/GL7tmZ0yrUMp+AJDpziJI
	 owF4Hq/eHGMW9GKa6kfRuDcg2spac3yDgxMXvmBb07V4LmHatl0y8KcVybzs/GrwO3
	 JT5n+6Nh5nm7S/7rqlRfePHnJG/zU/GhKg5BYelUp1aAR6qqIObz2gMNJQHzCvlsMO
	 6o0nSpK2I2E1g==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 14 Feb 2026 20:29:16 +0800
Subject: [PATCH v2 3/3] phy: k1-usb: k3: add USB2 PHY support
MIME-Version: 1.0
Message-Id: <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
In-Reply-To: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3516; i=dlan@kernel.org;
 h=from:subject:message-id; bh=d3leH17O1fRr5mMSAHm8v+e6UyTxO6lBZs5fKTZ9z7U=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpkGqqiAsrSYoorc6rdtzJ9k4ECHdzurifSHXgt
 Pnruaj99I2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaZBqqhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0y8g/+L3eRbB3FLRDjz8/jGbdsPiqTzHX+LyoDY+H3eL2gL+hakz7GTfjW+
 wBqlcvaDJXPvDCYJvVPqO/sFqI1I9iGfy9QVexM+VYeYas1gBQmBOqMkio6m10NRZ0dUc29u9+Q
 KCJuV5eqP+4OlvHQ8FUGdTlM5BKtcmoCoRbjuCwjJDvsP30jx04ePtmGTWnCKgeF6TCpGcPdWrf
 U+MajHTJYd3nBJ8LOP5bFBe2Xb5Hj29tuLN73lW17nifaoTOY6ie572UoifdXj60lrhRJX+tARC
 S1UsY30c2FaLqMK9aKsflx4UO7Wa/YApk7x/SCZSRW3mPL6Bt+eyKCIx6+z4b6HrYWUGJ/FvX9s
 YA3x0t972Ag4b1Ljfa2ymC619c+sTHfcB05Ofvq/nO/dfBo8UhHOEk+UQ13/ttprgJfvi04VtNz
 k23thIwnMyozuEKPCCP0/YEZtChDrfZH5WjB3pgAiPGGqmli2YvPz7WRUkS/qYlYjDZ8YRGwlS5
 iJunFzRU0xzZS4/dGGjbd6X1gHbqX6MshLa19LAsQiYvuSyc1mmZp+3QJ6xXQ+VlqrylJHU5RbJ
 l8rhREur8DpAEtIbgZckYCK/ua2Owy0JxXdJRYaSec74dczjJ28KZ5eSirKyDKYLaCvHvcKqqV6
 ZcldLzLo4cEajcJSw1u1ItOcikaFWg=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_042951_615590_1A6AEDB9 
X-CRM114-Status: GOOD (  13.52  )
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

Add USB2 PHY support for SpacemiT K3 SoC.

Register layout of handling USB disconnect operation has been changed,
So introducing a platform data to distinguish the different SoCs.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 959bf79c7a72..b4ba97481ddd 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -51,6 +51,9 @@
 #define PHY_K1_HS_HOST_DISC		0x40
 #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
 
+#define PHY_K3_HS_HOST_DISC		0x20
+#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
+
 #define PHY_PLL_DIV_CFG			0x98
 #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
 #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
@@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 	return 0;
 }
 
-static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
+static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
 {
 	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
 
@@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
 	return 0;
 }
 
-static const struct phy_ops spacemit_usb2phy_ops = {
+static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+
+	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
+					   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);
+
+	return 0;
+}
+
+static const struct phy_ops spacemit_k1_usb2phy_ops = {
 	.init = spacemit_usb2phy_init,
 	.exit = spacemit_usb2phy_exit,
-	.disconnect = spacemit_usb2phy_disconnect,
+	.disconnect = spacemit_k1_usb2phy_disconnect,
+	.owner = THIS_MODULE,
+};
+
+static const struct phy_ops spacemit_k3_usb2phy_ops = {
+	.init = spacemit_usb2phy_init,
+	.exit = spacemit_usb2phy_exit,
+	.disconnect = spacemit_k3_usb2phy_disconnect,
 	.owner = THIS_MODULE,
 };
 
@@ -167,12 +187,15 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct spacemit_usb2phy *sphy;
+	const struct phy_ops *ops;
 	void __iomem *base;
 
 	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
 	if (!sphy)
 		return -ENOMEM;
 
+	ops = device_get_match_data(dev);
+
 	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
 	if (IS_ERR(sphy->clk))
 		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
@@ -185,7 +208,7 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 	if (IS_ERR(sphy->regmap_base))
 		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
 
-	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
+	sphy->phy = devm_phy_create(dev, NULL, ops);
 	if (IS_ERR(sphy->phy))
 		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
 
@@ -196,7 +219,8 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id spacemit_usb2phy_dt_match[] = {
-	{ .compatible = "spacemit,k1-usb2-phy", },
+	{ .compatible = "spacemit,k1-usb2-phy", .data = &spacemit_k1_usb2phy_ops },
+	{ .compatible = "spacemit,k3-usb2-phy", .data = &spacemit_k3_usb2phy_ops },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
