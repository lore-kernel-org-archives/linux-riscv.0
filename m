Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D558C7EE2C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mpd5nYs5xncTtRB37kBO1Zzxk5f7ZQcDL44IbQ9RMhY=; b=u73LqGXrY1eSOs
	asp1WWC/LTT0BKmsmsfXNHo1StGHs4G6akvGiwxRFAQiVe8Ypfo1nA1RoKNPVISX9gFVLX58YskIJ
	dY9RMaGGqxEMM+cWDFoGrxa8m816ln3TygVOg2f4qZPdXmT4TRsP0yHMEeVv3CSVOM2bD9ox4ugXP
	68KS/yd1F2FsRcGsr6eFsvSOwx56D1Gc1HOYokHInUFZaq/lr59GfPJSyxk/x2xt9gfXgD4vC5/Gg
	MKVwqAZx8hHr+U1G+hqwmeV2vRVR5txb3FX9uUk1aw2phZixWYOcuJH3Mr0jwLoaAy+3AXyX68Tle
	JsBpw7P9vcra1ivOipMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qu8-001FMm-2g;
	Fri, 26 May 2023 06:26:24 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qu4-001FET-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 06:26:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1231F806C;
	Fri, 26 May 2023 14:25:31 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 26 May
 2023 14:25:30 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 26 May 2023 14:25:30 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v1 0/3] Add initialization of clock for StarFive JH7110 SoC
Date: Fri, 26 May 2023 14:25:26 +0800
Message-ID: <20230526062529.46747-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_232620_671983_09A760AC 
X-CRM114-Status: UNSURE (   9.77  )
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

Hi,

This patchset adds initial rudimentary support for the StarFive
Quad SPI controller driver. And this driver will be used in
StarFive's VisionFive 2 board. In 6.4, the QSPI_AHB and QSPI_APB
clocks changed from the default ON state to the default OFF state,
so these clocks need to be enabled in the driver.At the same time,
dts patch is added to this series.

The patch series is based on v6.4rc3.

William Qiu (3):
  dt-bindings: qspi: cdns,qspi-nor: Add clocks for StarFive JH7110 SoC
  spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
  riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC

 .../bindings/spi/cdns,qspi-nor.yaml           | 15 +++++++--
 .../jh7110-starfive-visionfive-2.dtsi         | 32 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 18 +++++++++++
 drivers/spi/spi-cadence-quadspi.c             | 27 ++++++++++++++++
 4 files changed, 89 insertions(+), 3 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
