Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E78C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXg1pU9yYexVlpU1y3r6r9NRuzSHFOSWLASRALyzoN4=; b=XvbNfwklJ85IAo
	R8eZw2d12la/yq49MjPgJG0IVRLENS9hyntU1qgBma/IVpVSYH1cauS7kfZEnt2emH/tldva/Bg9G
	UHR4A7y4sYHrvjvI3zvclZfWAyV902t9pOuwVKlwpdAh582SriUdGhSDyw2icuHfouD/0d/zg773M
	9uZ8nSpdUKWQrWqPvxDuvtFhnylC4mJQBcfbiWGFjvDPLaQ4xB8J+k1UrQ8fn11lw8MFXy9VmAsWX
	eZe9Q+CT4jM4NHT6GT5qt9gxMT3aLefj0yESyGocXzoX+BIM7DNQx+NCHs22zVgwK4Fq1sVNGRxdP
	Dir0G00wNeAzoi5breAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50U7-006Dsd-1B;
	Fri, 02 Jun 2023 08:50:11 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50U4-006Dmk-18
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 08:50:09 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1F96424E276;
	Fri,  2 Jun 2023 16:49:29 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 16:49:29 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 2 Jun 2023 16:49:28 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
Date: Fri, 2 Jun 2023 16:49:24 +0800
Message-ID: <20230602084925.215411-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602084925.215411-1-william.qiu@starfivetech.com>
References: <20230602084925.215411-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_015008_543301_018F1D83 
X-CRM114-Status: GOOD (  12.93  )
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

Add QSPI clock operation in device probe.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/spi/spi-cadence-quadspi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 6ddb2dfc0f00..21788472c7fb 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -63,6 +63,8 @@ struct cqspi_st {
 	struct platform_device	*pdev;
 	struct spi_master	*master;
 	struct clk		*clk;
+	struct clk_bulk_data	*clks;
+	unsigned int		num_clks;
 	unsigned int		sclk;
 
 	void __iomem		*iobase;
@@ -1715,6 +1717,16 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
+		cqspi->num_clks = devm_clk_bulk_get_all(dev, &cqspi->clks);
+		if (cqspi->num_clks < 0) {
+			dev_err(dev, "Cannot claim clock: %u\n", cqspi->num_clks);
+			return -EINVAL;
+		}
+
+		ret = clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
+		if (ret)
+			dev_err(dev, "Cannot enable clock clks\n");
+
 		rstc_ref = devm_reset_control_get_optional_exclusive(dev, "rstc_ref");
 		if (IS_ERR(rstc_ref)) {
 			ret = PTR_ERR(rstc_ref);
@@ -1816,6 +1828,9 @@ static void cqspi_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(cqspi->clk);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi"))
+		clk_bulk_disable_unprepare(cqspi->num_clks, cqspi->clks);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
@@ -1831,6 +1846,9 @@ static int cqspi_suspend(struct device *dev)
 
 	clk_disable_unprepare(cqspi->clk);
 
+	if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
+		clk_bulk_disable_unprepare(cqspi->num_clks, cqspi->clks);
+
 	return ret;
 }
 
@@ -1840,6 +1858,8 @@ static int cqspi_resume(struct device *dev)
 	struct spi_master *master = dev_get_drvdata(dev);
 
 	clk_prepare_enable(cqspi->clk);
+	if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
+		clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
 	cqspi_wait_idle(cqspi);
 	cqspi_controller_init(cqspi);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
