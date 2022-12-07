Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284A1C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L7vbrrJe5V4JCOcYOgNOS/rPKkxJ960Zt753uL7kdlw=; b=1m84ACy8Hi71NH
	cD+oJ5ZPdL7Uonfpm74PNMMUUp/Bh5Hlv33dgqrhZ5N5rkI02UeEFZiszlH2O4DhTeGgtzUtYz44w
	x9h72aQtXG4wbFDhFaTZd0DITkuuUZb0VYVRkSUZqQQgIPiM/6fiZjp0W3gREavKniRRHwcGCREoF
	W7XST8/6eB8vYiY60UQhmgAV3Dlc2SWTYB+qweYUe4xFmJxiu3iFmp2WK+yo8WHefQjtxJa1Bi2cF
	C6vClP7O0oXY4SzMLnC9BMgGwg3deDy46Dw9M5Aqp4/jwsB1lPz4orOYu/+dD/LOlqMm8Mz4PEcKx
	LHvyEX1NWN7vlDG1kXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uJR-003HU3-Nm; Wed, 07 Dec 2022 13:18:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uJM-003GlJ-Pu
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 13:18:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 11B4C24E046;
	Wed,  7 Dec 2022 21:17:33 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Dec
 2022 21:17:33 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 7 Dec 2022 21:17:32 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] StarFive's SDIO/eMMC driver support
Date: Wed, 7 Dec 2022 21:17:28 +0800
Message-ID: <20221207131731.1291517-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_051809_029227_BC728985 
X-CRM114-Status: GOOD (  11.56  )
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
designware mobile storage host controller driver. And this driver will
be used in StarFive's visionfive-v2 board. The main purpose of adding
this driver is to accommodate the ultra-high speed mode of eMMC.

The patch series is based on v6.1-rc5.

-- William

William Qiu (3):
  dt-bindings: mmc: Add bindings for StarFive
  mmc: starfive: Add sdio/emmc driver support
  riscv: dts: starfive: Add mmc node

 .../bindings/mmc/starfive,jh7110-sdio.yaml    |  71 +++++++
 MAINTAINERS                                   |   6 +
 .../jh7110-starfive-visionfive-v2.dts         |  25 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  38 ++++
 drivers/mmc/host/Kconfig                      |  10 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/dw_mmc-starfive.c            | 197 ++++++++++++++++++
 7 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
 create mode 100644 drivers/mmc/host/dw_mmc-starfive.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
