Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25901EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8V8YCL13JUXFKGHeQkVaZ2rKxHlXzHBmuQXbQGSwcO0=; b=IFRlddg9DYqSw9
	PQCHFmS/Bnooc7oxDac292GFka/WbGJ0miCiKQf7tRn2qdrhfnrBoWrLvg0gSN/sOjKcGyFkINAtm
	dTJ09//keZ1vqm9QdabbcN+koD5yFr4E/tfp4EY+DIpAcTHQnDFoBD2/9IPwkF+sGuSliMPvPIlTp
	wFJIyhdYJCwD365OjXZF7hE52veKXWWJjzPOorB07pGN2sCd7a3IqM0hzDmimtnbWAldcxYNli9WG
	FetAVVc34HvDrSusvV9FQeqGNTlkHBexmo++W9IHZ0jmHYsdaN7JqxLaL9vqzmIC+v6V1RvFMoSRY
	ujgnxgkZ56QxfQRvSzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbyd-00Ceua-2X;
	Tue, 04 Jul 2023 09:05:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbyZ-00Cenk-27
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:05:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9D19D24E2B5;
	Tue,  4 Jul 2023 17:04:57 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 17:04:56 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 4 Jul 2023 17:04:55 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v4 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
Date: Tue, 4 Jul 2023 17:04:52 +0800
Message-ID: <20230704090453.83980-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704090453.83980-1-william.qiu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_020536_007629_A95C6C79 
X-CRM114-Status: GOOD (  13.27  )
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/
---
 drivers/spi/spi-cadence-quadspi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 6ddb2dfc0f00..8774f9aaff61 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -63,6 +63,8 @@ struct cqspi_st {
 	struct platform_device	*pdev;
 	struct spi_master	*master;
 	struct clk		*clk;
+	struct clk_bulk_data	*clks;
+	int			num_clks;
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
