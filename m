Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DA5C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5pTaH/AVm5mFHTMQCGYiqfY5pcMRPc5s7RUgwgNKMkk=; b=NNtKv9/Sfy1fV3
	lys9N6sYc0cGPtEQNuO/Ag/0mm7TfnEzaUE+VR1HDWOXMvPhmnqFYnuF+lduT8brfwCk1i65QcSCh
	KclpldI4hbc6RvX9YJWNW2JxyaTMMwaj9U0MJnKFtI/XRbeoriDrE2iBQVY/wITHiSZyAM/5XB1Hp
	HHSGoPCXoZqyWfhPcHPg2S04YLHn+F9lki/XtYlslWKT98DoKw5CimKJpn4nIJVSFsHFk2kLwkmW8
	Qfj6MHoVpT72YTVRE1i25WcaEIHF8ktGjEB2u9Dat2xHozz2QCiaJMcXo7StFHCB4yV9skZgAF4pH
	qyeBh8TT+ISReI8TCGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpA0-003yPG-T1; Wed, 08 Mar 2023 08:28:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp9w-003yLC-VP; Wed, 08 Mar 2023 08:28:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 49FEB24E143;
	Wed,  8 Mar 2023 16:28:03 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:28:02 +0800
Received: from ubuntu.localdomain (183.27.97.46) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 8 Mar
 2023 16:28:02 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 0/3] Add JH7110 USB driver support
Date: Wed, 8 Mar 2023 16:27:57 +0800
Message-ID: <20230308082800.3008-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002829_339791_A34D6856 
X-CRM114-Status: GOOD (  13.38  )
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

This patchset adds USB driver for the StarFive JH7110 SoC.
USB work mode is peripheral and using USB 2.0 PHY in VisionFive 2 board.
The patch has been tested on the VisionFive 2 board.

This patchset should be applied after the patchset [1] and patch [2]:
[1] https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfivetech.com/
[2] https://lore.kernel.org/all/20230215113249.47727-4-william.qiu@starfivetech.com/

This patchset is base on v6.3-rc1

patch 1 is usb phy dt-binding document.
patch 2 is the glue layer of Cadence USB3 and USB phy setting. USB controller IP is Cadence USB3.
patch 3 is USB device tree configuration.

previous version
---
v1: https://patchwork.kernel.org/project/linux-usb/patch/20230306095339.26006-1-minda.chen@starfivetech.com/

changes
v2
  1. (patch 1) dt-binding check test pass and no warning. The document example is the same as dts config.
  2. (patch 2) using dev_err_probe and syscon_regmap_lookup_by_phandle_args function. Some formats changes
  3. (patch 3) dts nodes sorted by the address after @

Minda Chen (3):
  dt-bindings: phy: Add StarFive JH7110 USB dt-binding
  usb: cdns3: add StarFive JH7110 USB glue layer
  dts: usb: add StarFive JH7110 USB dts configuration.

 .../bindings/phy/starfive,jh7110-usb-phy.yaml | 158 ++++++++
 MAINTAINERS                                   |   7 +
 .../jh7110-starfive-visionfive-2.dtsi         |   6 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  38 ++
 drivers/usb/cdns3/Kconfig                     |  11 +
 drivers/usb/cdns3/Makefile                    |   1 +
 drivers/usb/cdns3/cdns3-starfive.c            | 374 ++++++++++++++++++
 7 files changed, 595 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 create mode 100644 drivers/usb/cdns3/cdns3-starfive.c


base-commit: 8ca09d5fa3549d142c2080a72a4c70ce389163cd
prerequisite-patch-id: 0e6d1df3ba9aecd925a0c604b9d91f7143be88ca
prerequisite-patch-id: ac150a8c622e858e088df8121093d448df49c245
prerequisite-patch-id: 044263ef2fb9f1e5a586edbf85d5f67814a28430
prerequisite-patch-id: 74390c129b92fb35a7088e2e5c869632c4cb3d06
prerequisite-patch-id: de93ebec041625e940f195403069b46ec17fc99c
prerequisite-patch-id: 1b2d0982b18da060c82134f05bf3ce16425bac8d
prerequisite-patch-id: 090ba4b78d47bc19204916e76fdbc70021785388
prerequisite-patch-id: a5d9e0f7d4f8163f566678894cf693015119f2d9
prerequisite-patch-id: f01a78c30f6f1970b4db7758c339bd4e5c882b16
prerequisite-patch-id: 417736eb958e1158c60a5ed74bc2350394321a80
prerequisite-patch-id: ff9fe0b043a5f7f74a1f6af5cebc4793c6f14ce7
prerequisite-patch-id: 290602062703e666191c20ca02f2840471a6bf4f
prerequisite-patch-id: f0b29adbb18edffbfeec7292c5f33e2bbeb30945
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: ea9a6d0313dd3936c8de0239dc2072c3360a2f6b
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 27197d69922ad1f33a193dfe0a8cc2b27d67982d
prerequisite-patch-id: f9ce88e490c2473c3c94ad63fa26bc91829ce2cc
prerequisite-patch-id: 7acbc9c924e802712d3574dd74a6b3576089f78c
prerequisite-patch-id: b9b8fda5e8cd2dd4c9101ec03f4c8fb8e8caa573
prerequisite-patch-id: 63a6de4511f1a7ae974551e7097af9bb91db1b0d
prerequisite-patch-id: aaff99c0bdd1604048d0713b44084ad4604816e1
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
