Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51ECEE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcVHONSgNwfk3eeh1y5jok8pjFipyKjPIupX4ykS8is=; b=EZGXWkqBLcpF9C
	prhQ+kUZEx2y996Kd05BbgDeunkaihlQxkMBVy0JXAovJre2ZeHGHMVCgPXLn7v5gkK2F04o7ccfS
	2AQ02OKcrVMximXiFIxiZ7oCZHXQvzXL0zROA4Ia89TcpTIKd375X4CBTNxQFxIHKujMVAJnT/7w9
	2jEFpmYCK3vHXebyn/OApwq5jDq4NsaYSuyG9yluan/gqRriDpBXV6Azop7I4hQvCuJMJlYHF+yhY
	s8ZeFKOoQpEdR8MkmsoQYQij+rX3jzl8StM81s4EzBNZRaY35dm4IQSQy5KJgj2xqpLypEhkxK6CB
	HUgQMHiBAEUmzHzK2rTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRDw-00Fzmo-0h;
	Tue, 22 Aug 2023 13:15:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRC3-00FxeL-0q;
	Tue, 22 Aug 2023 13:13:12 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVV8Y6tVLzTlqq;
	Tue, 22 Aug 2023 21:10:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 21:13:07 +0800
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
Subject: [PATCH -next 18/25] spi: microchip-core: Use helper function devm_clk_get_enabled()
Date: Tue, 22 Aug 2023 21:12:30 +0800
Message-ID: <20230822131237.1022815-19-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822131237.1022815-1-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_061311_572595_B68FC624 
X-CRM114-Status: UNSURE (   8.70  )
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

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/spi/spi-microchip-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index b451cd4860ec..becdcdc9e6d1 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -539,22 +539,16 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "could not request irq\n");
 
-	spi->clk = devm_clk_get(&pdev->dev, NULL);
+	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk),
 				     "could not get clk\n");
 
-	ret = clk_prepare_enable(spi->clk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to enable clock\n");
-
 	mchp_corespi_init(master, spi);
 
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret) {
 		mchp_corespi_disable(spi);
-		clk_disable_unprepare(spi->clk);
 		return dev_err_probe(&pdev->dev, ret,
 				     "unable to register master for SPI controller\n");
 	}
@@ -570,7 +564,6 @@ static void mchp_corespi_remove(struct platform_device *pdev)
 	struct mchp_corespi *spi = spi_master_get_devdata(master);
 
 	mchp_corespi_disable_ints(spi);
-	clk_disable_unprepare(spi->clk);
 	mchp_corespi_disable(spi);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
