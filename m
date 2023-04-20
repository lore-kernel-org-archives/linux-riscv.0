Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D6C77B76
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2PfZaga/cG7FeKAsOKbP8lNQE8Y1BelIRMa4AFCc8E=; b=QhdFuIYGdHJ3zl
	UW+jVoQPf1obiRfyTkyweaKKtTD83If+rowSdquJU8MRncWtfYNwk7Fd7mx2yaa3mfGUJ6sjuwJaB
	cMzQ69GreOMpC7IEdu6hUIEH+lTXHZ4+L9TW9gwco/+yA1rYmXcF53F5DzbfsEnK5/6CFqviyJgLx
	gI5r0snAsshof0Z+ndkHV0Wf0raR4l1yqBpg+ahDPmhGq4tAYvDvBERTHkHeTNuYI5KTq3SFK9IvW
	gweczHCHPD+0bWvU4yq5XSe3bGesX5U8+xV7UC2QcKTU8HJ+zHW2yk0UI1dwSWNNbyrrOZTgEwehN
	jzn38a+awV8mxcmZ574w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppS2q-007s4b-1E;
	Thu, 20 Apr 2023 11:01:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppS2m-007rvm-2l;
	Thu, 20 Apr 2023 11:01:42 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B16CE24E199;
	Thu, 20 Apr 2023 19:00:54 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 19:00:54 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 19:00:53 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Minda Chen" <minda.chen@starfivetech.com>, Mason Huo
	<mason.huo@starfivetech.com>
Subject: [PATCH v5 0/7] Add JH7110 USB and USB PHY driver support
Date: Thu, 20 Apr 2023 19:00:45 +0800
Message-ID: <20230420110052.3182-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_040141_205565_BE41B877 
X-CRM114-Status: GOOD (  18.72  )
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

This patchset adds USB driver and USB PHY for the StarFive JH7110 SoC.
USB work mode is peripheral and using USB 2.0 PHY in VisionFive 2 board.
The patch has been tested on the VisionFive 2 board.

This patchset should be applied after the patchset [1] and [2]:
[1] https://patchwork.kernel.org/project/linux-riscv/cover/20230411135558.44282-1-xingyu.wu@starfivetech.com/
[2] https://patchwork.kernel.org/project/linux-phy/cover/20230412084540.295411-1-changhuang.liang@starfivetech.com/

This patchset is base on v6.3-rc4

patch 1 is usb phy dt-binding document.
patch 2 is Pcie PHY dt-binding document.
patch 3 is USB 2.0 PHY driver.
patch 4 is PCIe PHY driver.
patch 5 is usb dt-binding document.
patch 6 is the wrapper module driver of Cadence USB3. USB controller IP is Cadence USB3.
patch 7 is USB device tree configuration.

previous version
---
version 1 patchset are split to different kernel organization. It is
incorrect. But they were sent, and Emil sent comments. I think I should 
reserve them in cover-letter. To read the change records and previous version, 
please start with version 2. 

v1: https://patchwork.kernel.org/project/linux-usb/cover/20230306095212.25840-1-minda.chen@starfivetech.com/
v2: https://patchwork.kernel.org/project/linux-usb/cover/20230308082800.3008-1-minda.chen@starfivetech.com/
v3: https://patchwork.kernel.org/project/linux-usb/cover/20230315104411.73614-1-minda.chen@starfivetech.com/
v4: https://patchwork.kernel.org/project/linux-usb/cover/20230406015216.27034-1-minda.chen@starfivetech.com/

changes
v5:
  1. (patch 1) set correct model name and commit title.
  2. (patch 2) change to '-item' in syscon property. change commit title.
  3. (patch 5)
     - change to '-item' in syscon configure.
     - change commit title and doc title.
  4. (patch 6)
     - add clk and phy deinit function
     - add clk deinit function if phy init failed.
     - coding style changes and other format changes. 

v4:
  1. (patch 1) split PCIe PHY dt-binding doc to patch 2.
  2. (patch 2) PCIe PHY add stg and sys con configuration to dt-binding doc.
  3. (patch 3)
     - split PCIe PHY driver to patch 4.
     - replace dr_mode to phy mode in jh7110_usb2_phy.
  4. (patch 4) 
     - Makefile and Kconfig sorted by alphabet sequence.
     - Add PCIe PHY stg and syscon PHY connection configuration
       for USB 3.0.
  5. (patch 5)
     - commit message changed.
     - merge wrapper dts node and cdns3 node in example.
     - Add interrupts, reg, phy and dr_mode in property.
     - Add reset-name in property example.
  6. (patch 6)
     - For dts node is merged, Using platform_device_alloc and
       platform_device_add to generate cadence sub device.
     - IOMEM and IRQ resource are passed to Cadence sub device.
     - Add PHY ops process for PHY dts setting can not be passed to
       Cadence USB driver.
     - remove the stg and sys USB 3.0 PHY configuration.
     - Change the suspend clock reset and clock enable sequence.
     - Get all reset and clock resources before enable them in 
       cdns_clk_rst_init.
     - commit message changed.
  7. (patch 7)
     - merge wrapper dts node and cdns3 node in usb dts.
     - move the stg and sys USB 3.0 PHY confiuration to
       PCIe PHY dts node.
     - commit message changed.
     - Add reset-names dts.

v3:
  1. Add patch 1 - 4. Add USB PHY driver and dt-binding doc. 
     USB PHY codes are moved to patch 3 and patch 4.
  2. (patch 5)
     - USB wrapper module dts document is moved to usb directory.
     - Remove the 'dr_mode' and 'starfive,usb2-only' setting.
     - Some dts format changes. dts binding check pass.
  3. (patch 6)
     - Remove the PHY codes. 
     - Search 'dr_mode' and phy setting from Cadence subnode.
  4. (patch 7)
     - Add USB PHY dts configurion. 
     - 'dr_mode' is moved to Cadence controller submode.

v2:
  1. (patch 5) dt-binding changes. The document example is the same as dts config.
  2. (patch 6) using dev_err_probe and syscon_regmap_lookup_by_phandle_args function. Some formats changes
  3. (patch 7) dts nodes sorted by the address after @


Minda Chen (7):
  dt-bindings: phy: Add StarFive JH7110 USB PHY
  dt-bindings: phy: Add StarFive JH7110 PCIe PHY
  phy: starfive: Add JH7110 USB 2.0 PHY driver
  phy: starfive: Add JH7110 PCIE 2.0 PHY driver
  dt-bindings: usb: Add StarFive JH7110 USB controller
  usb: cdns3: Add StarFive JH7110 USB driver
  riscv: dts: starfive: Add USB dts configuration for JH7110

 .../phy/starfive,jh7110-pcie-phy.yaml         |  58 +++
 .../bindings/phy/starfive,jh7110-usb-phy.yaml |  50 +++
 .../bindings/usb/starfive,jh7110-usb.yaml     | 131 ++++++
 MAINTAINERS                                   |  14 +
 .../jh7110-starfive-visionfive-2.dtsi         |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  44 ++
 drivers/phy/starfive/Kconfig                  |  22 +
 drivers/phy/starfive/Makefile                 |   2 +
 drivers/phy/starfive/phy-jh7110-pcie.c        | 202 +++++++++
 drivers/phy/starfive/phy-jh7110-usb.c         | 162 ++++++++
 drivers/usb/cdns3/Kconfig                     |  11 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdns3-starfive.c            | 390 ++++++++++++++++++
 drivers/usb/cdns3/core.h                      |   3 +
 14 files changed, 1097 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
 create mode 100644 drivers/phy/starfive/phy-jh7110-pcie.c
 create mode 100644 drivers/phy/starfive/phy-jh7110-usb.c
 create mode 100644 drivers/usb/cdns3/cdns3-starfive.c


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
