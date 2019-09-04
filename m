Return-Path: <SRS0=6ibT=W7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2189FC3A5A7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 14:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E13206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 14:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XN2CtNw6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E13206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3jjOgezoEIkv1ogf0y3nS0wWtD4ioNj/MsAxAjDI5E=; b=XN2CtNw6FnPX2Q
	rTPOA8dC0PJxUUpEQAVwEyT16dgocClFP/8+v/jh5D5/73vKXrBZxrUkY35t6tfpkjquh0w/dU8r+
	essTDSkj/8heOc0MGtYx5P766GmCNfP/G4f1+nhQkGBPs3twt/xDpn3MUSQ9WtLsjjFtVBwIp/uK4
	aqi3ok4BLR0DR6CTRlO9qwV+eOoStHDSavg53Yb2fl6IS4Rraa/JdTqZ0IUHxyGkVpP8fNZs/OHOx
	W44rBkZ8eq1f6B7WC8NIANAKW3UrA+8DlA1E4QnZ0U7yagiJnYf2Drya6BnvVPkB69clLiAIbVODn
	Fk0lzQoPXCUEFy2WQPug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5W1n-0004lc-Jr; Wed, 04 Sep 2019 14:12:55 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Vqd-0005wz-Ds; Wed, 04 Sep 2019 14:01:25 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 68D776C4A34FFCD4FBBF;
 Wed,  4 Sep 2019 22:01:21 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 22:01:08 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <broonie@kernel.org>, <f.fainelli@gmail.com>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <eric@anholt.net>, <wahrenst@gmx.net>,
 <shc_work@mail.ru>, <agross@kernel.org>, <khilman@baylibre.com>,
 <matthias.bgg@gmail.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
 <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
 <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
 <kgene@kernel.org>, <krzk@kernel.org>, <andi@etezian.org>,
 <palmer@sifive.com>, <paul.walmsley@sifive.com>, <baohua@kernel.org>,
 <mripard@kernel.org>, <wens@csie.org>, <ldewangan@nvidia.com>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <yamada.masahiro@socionext.com>, <michal.simek@xilinx.com>
Subject: [PATCH -next 34/36] spi: zynqmp: use devm_platform_ioremap_resource()
 to simplify code
Date: Wed, 4 Sep 2019 21:59:16 +0800
Message-ID: <20190904135918.25352-35-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190904135918.25352-1-yuehaibing@huawei.com>
References: <20190904135918.25352-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_070123_781306_F8E33527 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 5e9ea8a..60c4de4 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1016,7 +1016,6 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	int ret = 0;
 	struct spi_master *master;
 	struct zynqmp_qspi *xqspi;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 
 	eemi_ops = zynqmp_pm_get_eemi_ops();
@@ -1031,8 +1030,7 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	master->dev.of_node = pdev->dev.of_node;
 	platform_set_drvdata(pdev, master);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	xqspi->regs = devm_ioremap_resource(&pdev->dev, res);
+	xqspi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(xqspi->regs)) {
 		ret = PTR_ERR(xqspi->regs);
 		goto remove_master;
-- 
2.7.4



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
