Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F582C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osRYKNl6IBjcwkOoFVrrcuztFmFP1fGuLRD307mFivY=; b=RytuVFJ8rtM3xm
	TbL2o/21GDvSVUsnTPeTt61XTPFy3WJu8Mg41uSzrRDfKbz0Nf/5UlqVZaMxgM89g5cL3aRF58O/R
	ezUYXCFMouPrHXfsLfSd9OLQgC6wJigwJOkUycM1P7+GO9UiVlIYVXQyLG9AhLOc8v7Kar+80x+ek
	GTUODhzoDJxJaJYbfkQv2XxlMQ1Sq3Ippyb+A65wdZyzBkrU+CfXTc4S0oyQgoG9ktHY4nqTqeYyR
	yBzase8CS1T8pnt4EJydzT8pZEvQXuDotzOYXYOHpNGE/88efxLDZpXMFnwZ0EngPqlvlS5RZ5Syp
	2nuf9da5mgf5E2VG21hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiu-005Jot-NB; Fri, 19 Aug 2022 09:55:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiW-005JGY-T5
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 09:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660902904; x=1692438904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=enWMagCeiEYkjBouyM2xYVW3a2qpPlJdJrEAatsKn8A=;
  b=2fWmPR3FXXvi3SprTjbZfXD5fuWDaAIUA99oWYhZ/HwDuV+ZTtNpRgu+
   kOylg72yU1qjj+6AslWSAOmGH3HxcfUyXZopEhBJGwnWE2JRzN+1p79yh
   NqFuUbLX++iy+1575RrIovf+RlO9DBPJRC5/bbLJAEcyeezRXNTsOmGiB
   MAV3X9HiJrchhnePDIoSBiPndcA1itc9QEPppS+JvxWRUPeTYGYFZrtEI
   lFnybyABrQEj0gzSK9YiGwvleDx6dToa94qpMFN512S86OEyxKWGbpBUd
   GAjmGSpz6OVDlrjhtVs6iuPnm86NDb4/ml2xh/dEDKr46OSvTsYYp4gZB
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="173186964"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 02:55:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 02:55:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 02:54:58 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 10/13] clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
Date: Fri, 19 Aug 2022 10:53:18 +0100
Message-ID: <20220819095320.40006-11-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819095320.40006-1-conor.dooley@microchip.com>
References: <20220819095320.40006-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_025505_080400_DCF695D6 
X-CRM114-Status: GOOD (  11.13  )
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

The register functions are now comprised of only a single operation
each and no longer add anything to the driver. Delete them.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 33 ++++++--------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 565a0ae1071d..6faefae9b396 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -203,14 +203,6 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_clks[] = {
 		MSSPLL_FBDIV_WIDTH, 0, REG_MSSPLL_SSCG_2_CR),
 };
 
-static int mpfs_clk_register_msspll(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hw,
-				    void __iomem *base)
-{
-	msspll_hw->base = base;
-
-	return devm_clk_hw_register(dev, &msspll_hw->hw);
-}
-
 static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hws,
 				     unsigned int num_clks, struct mpfs_clock_data *data)
 {
@@ -220,7 +212,8 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[i];
 
-		ret = mpfs_clk_register_msspll(dev, msspll_hw, data->msspll_base);
+		msspll_hw->base = data->msspll_base;
+		ret = devm_clk_hw_register(dev, &msspll_hw->hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
 					     CLK_MSSPLL);
@@ -314,14 +307,6 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
 	}
 };
 
-static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hw,
-				 void __iomem *base)
-{
-	cfg_hw->cfg.reg = base + cfg_hw->reg_offset;
-
-	return devm_clk_hw_register(dev, &cfg_hw->hw);
-}
-
 static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
 				  unsigned int num_clks, struct mpfs_clock_data *data)
 {
@@ -331,7 +316,8 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
 
-		ret = mpfs_clk_register_cfg(dev, cfg_hw, data->base);
+		cfg_hw->cfg.reg = data->base + cfg_hw->reg_offset;
+		ret = devm_clk_hw_register(dev, &cfg_hw->hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     cfg_hw->id);
@@ -454,14 +440,6 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_CFM, "clk_periph_cfm", PARENT_CLK(AHB), 29, 0),
 };
 
-static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_clock *periph_hw,
-				    void __iomem *base)
-{
-	periph_hw->periph.reg = base + REG_SUBBLK_CLOCK_CR;
-
-	return devm_clk_hw_register(dev, &periph_hw->hw);
-}
-
 static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_clock *periph_hws,
 				     int num_clks, struct mpfs_clock_data *data)
 {
@@ -471,7 +449,8 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
 	for (i = 0; i < num_clks; i++) {
 		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
 
-		ret = mpfs_clk_register_periph(dev, periph_hw, data->base);
+		periph_hw->periph.reg = data->base + REG_SUBBLK_CLOCK_CR;
+		ret = devm_clk_hw_register(dev, &periph_hw->hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     periph_hw->id);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
