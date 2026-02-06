Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC6ECD98B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FL6gYnnZGFA+INctums1TybOIUf2PJxU/Z42KIFy6AY=; b=REgUw26owCKJOO
	CmZdVq2h3qod6osGAdG/UTyEZwfeER8jgw8S1l6gxUmc+xDD5skZoKM7W5ydDulH+ktcBjp3C0X7Z
	7eBiY6F/6zKIKQVxVZ57BfUfTaeJnG3pra0wFyQq2ftN880WLQ+qG4MfoN7Kgr4r2lFWY3yTtoHaM
	efhFLRe/svIkzqxNPsSaWv1tAvOoS1MARGQysUbj3IdLLFYteEHZpGsQF1oQZXuYSl8G5fVn71+TQ
	lQT2HGP8UFXhyG+kf2JosHJM8ph6NowE3I31lZnsMgihAITotb4V4cs4y0atUkoaCsIljJVYPnLo9
	PMzoW/sCLZF8cPdcYg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIiL-0000000B8jB-1Q3n;
	Fri, 06 Feb 2026 10:05:25 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIiI-0000000B8hY-3Ed7;
	Fri, 06 Feb 2026 10:05:23 +0000
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 335ee35ab;
	Fri, 6 Feb 2026 18:05:20 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/2] phy: spacemit: add regulator support to K1 USB2 PHY
Date: Fri,  6 Feb 2026 18:00:09 +0800
Message-Id: <20260206100009.873182-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206100009.873182-1-amadeus@jmu.edu.cn>
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9c3269cc2d03a2kunmb90599ad38e393
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhkaVkodGE0fTh1OGB1PSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020522_981964_EEF839A8 
X-CRM114-Status: GOOD (  11.60  )
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

USB VBUS may have a regulator supply. Add optional phy-supply
support to avoid the need for the regulator to be always-on.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..c163a29dabf9 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -75,6 +75,7 @@ struct spacemit_usb2phy {
 	struct phy *phy;
 	struct clk *clk;
 	struct regmap *regmap_base;
+	struct regulator *regulator;
 };
 
 static const struct regmap_config phy_regmap_config = {
@@ -98,6 +99,12 @@ static int spacemit_usb2phy_init(struct phy *phy)
 		return ret;
 	}
 
+	if (sphy->regulator) {
+		ret = regulator_enable(sphy->regulator);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * make sure the usb controller is not under reset process before
 	 * any configuration
@@ -139,6 +146,9 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 
 	clk_disable(sphy->clk);
 
+	if (sphy->regulator)
+		return regulator_disable(sphy->regulator);
+
 	return 0;
 }
 
@@ -171,6 +181,16 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
 	if (IS_ERR(sphy->regmap_base))
 		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
 
+	sphy->regulator = devm_regulator_get_optional(dev, "phy");
+	if (IS_ERR(sphy->regulator)) {
+		int ret = PTR_ERR(sphy->regulator);
+
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret, "Failed to get regulator\n");
+
+		sphy->regulator = NULL;
+	}
+
 	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
 	if (IS_ERR(sphy->phy))
 		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
