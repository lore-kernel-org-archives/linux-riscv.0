Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D72C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYyUw4o+roYSVyWE9a+F6Mo1HPgZG5gehAbYs9wTTNE=; b=UnWDf/18EUpU+o
	Yjt6fRc8n30wBpCQ7TRP69YJn/DRQo7aFKf9Cmik4ppAUSFEfzpVMvUjLMnrRHI4nQmCDl18ZvrsX
	eX8OGP4ohjGYm8SpQpJtcxuRz9w2ojiXzI7RxlzWEOloVtfK7wF5qtE5nPKNX9TpIQ6qJf8ujVapl
	fATwLPeudTYQljORahY7YkZcQ+slUx939mk44Uk3+Q6oAXxMSmro8BiyltpEjVdoYiZDVUq8rfR3X
	N92iikGoFKzVJx0dMUwpsLBawzu2ddRuXQ0ssxGa4P0aytgL7D8IUrz5z6KR//eeOYN1adnzc4xQd
	fPB2zMW9zdlbrzBcnF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qu4-001FKu-0e;
	Fri, 26 May 2023 06:26:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qu0-001FEY-21
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 06:26:18 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4F5AC24E1BE;
	Fri, 26 May 2023 14:25:32 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 26 May
 2023 14:25:32 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 26 May 2023 14:25:31 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
Date: Fri, 26 May 2023 14:25:28 +0800
Message-ID: <20230526062529.46747-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526062529.46747-1-william.qiu@starfivetech.com>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_232616_817952_D6BBE468 
X-CRM114-Status: GOOD (  11.29  )
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
 drivers/spi/spi-cadence-quadspi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 6ddb2dfc0f00..c6430fb3a0a4 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1624,6 +1624,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi)
 static int cqspi_probe(struct platform_device *pdev)
 {
 	const struct cqspi_driver_platdata *ddata;
+	struct clk *qspi_ahb, *qspi_apb;
 	struct reset_control *rstc, *rstc_ocp, *rstc_ref;
 	struct device *dev = &pdev->dev;
 	struct spi_master *master;
@@ -1715,6 +1716,32 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
+		qspi_ahb = devm_clk_get(dev, "qspi-ahb");
+		if (IS_ERR(qspi_ahb)) {
+			dev_err(dev, "Cannot claim QSPI_AHB clock.\n");
+			ret = PTR_ERR(qspi_ahb);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(qspi_ahb);
+		if (ret) {
+			dev_err(dev, "Cannot enable QSPI AHB clock.\n");
+			goto probe_clk_failed;
+		}
+
+		qspi_apb = devm_clk_get(dev, "qspi-apb");
+		if (IS_ERR(qspi_apb)) {
+			dev_err(dev, "Cannot claim QSPI_APB clock.\n");
+			ret = PTR_ERR(qspi_apb);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(qspi_apb);
+		if (ret) {
+			dev_err(dev, "Cannot enable QSPI APB clock.\n");
+			goto probe_clk_failed;
+		}
+
 		rstc_ref = devm_reset_control_get_optional_exclusive(dev, "rstc_ref");
 		if (IS_ERR(rstc_ref)) {
 			ret = PTR_ERR(rstc_ref);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
