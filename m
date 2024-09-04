Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCC1CA0ED3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3DNeWIVZrfzUxbWnrNyV7In5LTuVSPyn82vq6PYrh8=; b=iODp+w52iS/Xtw
	fCdqK9GV1RpP3WM8M1Kysku8oJUl7U/5s+KhWlI6ycBTgMsmqpSi83+F+ERpxeCapq25V9QzswbLd
	eTVG3dsH+idDFLRABvtt88MgiChga7wYPSNRoAQtXzRN59gfnMk5qwgjsmqgVUojgLcS2gTkxvpxQ
	6Vcl5X1n77397ejmXPe2ikg8lFfZWgCdDyQCUK4CusUDyzJDL84H6+kKQDHUj/iSe2ATiOXjrAFJs
	E4iOQ2SRUgek92KyBdB9br3xRmwWlvzYAPmFddh4M/G5lRY1Wp/j+Gns0ozfPgeP6cm1ptKiAXTeH
	muX2NfOJzqu1JDTlyfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmgU-00000003m29-2iKk;
	Wed, 04 Sep 2024 09:52:18 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slm0b-00000003bQV-0Uvl
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 09:09:03 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ef52:68c5:eac1:f6b5])
	by albert.telenet-ops.be with cmsmtp
	id 898v2D00T3m5in10698vWk; Wed, 04 Sep 2024 11:08:56 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slm0S-0026XW-PT;
	Wed, 04 Sep 2024 11:08:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slm0V-0044NM-Fh;
	Wed, 04 Sep 2024 11:08:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Damien Le Moal <dlemoal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
Date: Wed,  4 Sep 2024 11:08:53 +0200
Message-Id: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020901_320748_5947202B 
X-CRM114-Status: GOOD (  11.33  )
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

There were never any users of k210_fpioa_data.clk and
k210_fpioa_data.pclk outside k210_fpioa_probe().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinctrl-k210.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 0f6b55fec31de700..caf20215aaba5e9b 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -96,8 +96,6 @@ struct k210_fpioa_data {
 	struct k210_fpioa __iomem *fpioa;
 	struct regmap *sysctl_map;
 	u32 power_offset;
-	struct clk *clk;
-	struct clk *pclk;
 };
 
 #define K210_PIN_NAME(i)	("IO_" #i)
@@ -925,6 +923,7 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct k210_fpioa_data *pdata;
+	struct clk *clk, *pclk;
 
 	dev_info(dev, "K210 FPIOA pin controller\n");
 
@@ -939,13 +938,13 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->fpioa))
 		return PTR_ERR(pdata->fpioa);
 
-	pdata->clk = devm_clk_get_enabled(dev, "ref");
-	if (IS_ERR(pdata->clk))
-		return PTR_ERR(pdata->clk);
+	clk = devm_clk_get_enabled(dev, "ref");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
-	pdata->pclk = devm_clk_get_optional_enabled(dev, "pclk");
-	if (IS_ERR(pdata->pclk))
-		return PTR_ERR(pdata->pclk);
+	pclk = devm_clk_get_optional_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return PTR_ERR(pclk);
 
 	pdata->sysctl_map =
 		syscon_regmap_lookup_by_phandle_args(np,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
