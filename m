Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1ABEE49A4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 13:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ptt8nqe2m48Ycqvz15LtG15vEo20CJC1vRk5YuCErxE=; b=b2tjQ0B6RoPoAU
	S5Ls4OrgCyeQvtTB++d3QbDe47mwM1LYcxDxRMK+1ruQ0mBb1A1RZfdKCC0+a7zsNl82v556coTNK
	3O+YXL7uy3zWmeK9z06R62EcLRoPomJ0TIrUvWxFwFLMlsz4ifF+oJzdwAzexNPRAlR8OZzqB3tAq
	AHRX1nF+MNBMn0rV/+dLCwX4LXUTleacS4/R08Bpt7lQnynA3C1tTKpornQsaPgyLVj0B7YAi9n1y
	tBydMLHAMA6EyYGhnakDTpuCS49ZzppDkJ9ZThNCWFaHEG4QfO02oEG2EbRPlFeU7R1wXu3irAXaG
	0gnGiSiVwpI7TlolYOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRF1-00G12h-0C;
	Tue, 22 Aug 2023 13:16:15 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC9-00FxkD-2V;
	Tue, 22 Aug 2023 13:13:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV8h3386zTmLG;
	Tue, 22 Aug 2023 21:11:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:13 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>
CC: <lizetao1@huawei.com>, <linux-spi@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Subject: [PATCH -next 24/25] spi: spl022: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:36 +0800
Message-ID: <20230822131237.1022815-25-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_061318_379706_1BB27493 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly.
Moreover, the label "err_no_clk_en" is no used, drop it for clean code.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-pl022.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index 1af75eff26b6..468a7fea9091 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -2168,19 +2168,13 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
 		&adev->res.start, pl022->virtbase);
 
-	pl022->clk = devm_clk_get(&adev->dev, NULL);
+	pl022->clk = devm_clk_get_enabled(&adev->dev, NULL);
 	if (IS_ERR(pl022->clk)) {
 		status = PTR_ERR(pl022->clk);
 		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
 		goto err_no_clk;
 	}
 
-	status = clk_prepare_enable(pl022->clk);
-	if (status) {
-		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
-		goto err_no_clk_en;
-	}
-
 	/* Initialize transfer pump */
 	tasklet_init(&pl022->pump_transfers, pump_transfers,
 		     (unsigned long)pl022);
@@ -2236,16 +2230,14 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
 
 	return 0;
 
- err_spi_register:
+err_spi_register:
 	if (platform_info->enable_dma)
 		pl022_dma_remove(pl022);
- err_no_irq:
-	clk_disable_unprepare(pl022->clk);
- err_no_clk_en:
- err_no_clk:
- err_no_ioremap:
+err_no_irq:
+err_no_clk:
+err_no_ioremap:
 	amba_release_regions(adev);
- err_no_ioregion:
+err_no_ioregion:
 	spi_master_put(master);
 	return status;
 }
@@ -2268,7 +2260,6 @@ pl022_remove(struct amba_device *adev)
 	if (pl022->master_info->enable_dma)
 		pl022_dma_remove(pl022);
 
-	clk_disable_unprepare(pl022->clk);
 	amba_release_regions(adev);
 	tasklet_disable(&pl022->pump_transfers);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
