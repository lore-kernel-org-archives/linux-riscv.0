Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA99C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7+TXRMsqGef65iySV68MFEVK7SdzB58CYFO37qV/6fk=; b=2DenNg1HOls/a1
	IMtDl8mtsyLYxXaSxFTP3QwYSGliq9UJ1i3ggLV38rRnio4McRtsVCEJ36gln4r3fPqQiU5D3PUhO
	d8nd4/nZcZXM+E+8PjA8DFJKsQ1TnYv2oiI2N6jWb3QtJlISlhHsw2wmUTokY2LKKKgYt4ITvSqzl
	Fp0MkH/W4BJQmBuhKu+Nu7O4DA3voDpBnvS/2/1UTcyLvrv2IRGD4lQIKq+GKvPqW7Zqs33wIDSa7
	chrwy9Wo/YRhgZlYC5rr8MFzC/YWXMjPMbUf/aJS2r/FxRyh5wu+AT/aeFywCsmVpL8Fc+qkdeHFm
	A5xZPFt/70jk25Ae0qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrIN-000zMz-UE; Fri, 03 Feb 2023 08:19:43 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrIK-000zIK-6E
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 08:19:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F0C7224E1D1;
	Fri,  3 Feb 2023 16:19:14 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 16:19:15 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 3 Feb 2023 16:19:13 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] StarFive's SDIO/eMMC driver support
Date: Fri, 3 Feb 2023 16:19:10 +0800
Message-ID: <20230203081913.81968-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_001940_386054_122FC27E 
X-CRM114-Status: GOOD (  12.91  )
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
be used in StarFive's VisionFive 2 board. The main purpose of adding
this driver is to accommodate the ultra-high speed mode of eMMC.

The last patch should be applied after the patchset [1]:
[1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/

Changes since v2:
- Wraped commit message according to Linux coding style.
- Rephrased the description of the patches.
- Changed the description of syscon regsiter.
- Dropped redundant properties.

The patch series is based on v6.1.

William Qiu (3):
  dt-bindings: mmc: Add StarFive MMC module
  mmc: starfive: Add sdio/emmc driver support
  riscv: dts: starfive: Add mmc node

 .../bindings/mmc/starfive,jh7110-mmc.yaml     |  77 ++++++++
 MAINTAINERS                                   |   6 +
 .../jh7110-starfive-visionfive-2.dtsi         |  23 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  37 ++++
 drivers/mmc/host/Kconfig                      |  10 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/dw_mmc-starfive.c            | 185 ++++++++++++++++++
 7 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
 create mode 100644 drivers/mmc/host/dw_mmc-starfive.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
