Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36984E810B9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aLLMF1tjJIyIwxGCUTmAUxrcGmrKL31vx8E4HAlmVkM=; b=zrgvX7c62l/Pfq
	ZuskwBTNnRPXBvl+D5f42xkhxZPzfhoLOJzdKPxefujT7YM7iMmwTispkYesdBd3py1f/a2d/D0/s
	ivoRWNrPKdqWlEVcNdpQHaTFAsM53wFBH+GY+Bf7TSezuZtrnnYUN8WEsWj31sn2U0xe73SE2mpHs
	IiotSbvfhl2+Gyo02XCukwDCHN7B+N5pnZkHK84QxbXOId67prOsl5WPzDGCLaXlCtc1sZpHAA8Iv
	dGuJIdW2TNdhZoB7dPsjEczECq5b3fCipB2U83uGESVPAxT1yVV59y+svqV8VZ2HwfyzcoruPdt1w
	uPp0PwXVxZf4Bq/f3kdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRTd-000ZCm-1Y;
	Wed, 27 Sep 2023 10:09:05 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRTS-000Ynh-38
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 10:08:57 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 055B224E1DB;
	Wed, 27 Sep 2023 18:08:07 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 18:08:07 +0800
Received: from ubuntu.localdomain (113.72.144.128) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 18:08:05 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Minda Chen
	<minda.chen@starfivetech.com>
Subject: [PATCH v7 0/19] Refactoring Microchip PCIe driver and add StarFive PCIe
Date: Wed, 27 Sep 2023 18:07:43 +0800
Message-ID: <20230927100802.46620-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_030855_334648_2A731D4E 
X-CRM114-Status: GOOD (  18.10  )
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

This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
same IP and have commit their codes, which are mixed with PLDA
controller codes and Microchip platform codes.

For re-use the PLDA controller codes, I request refactoring microchip
codes, move PLDA common codes to PLDA files.
Desigware and Cadence is good example for refactoring codes.

So first step is extract the PLDA common codes from microchip, and
refactoring the microchip codes.(patch1 - 16)
Then, add Starfive codes. (patch17 - 19)

This patchset is base on v6.6-rc3

patch1 is move PLDA XpressRICH PCIe host common properties dt-binding
       docs from microchip,pcie-host.yaml
patch2 is move PolarFire codes to PLDA directory.
patch3 is move PLDA IP register macros to plda-pcie.h
patch4 is rename data structure in microchip codes.
patch5 is rename two setup functions in microchip codes, prepare to move
to common file.
patch6 is change the arguments of plda_pcie_setup_iomems()
patch7 is move the two setup functions to common file pcie-plda-host.c
patch8 is Add PLDA event interrupt codes and IRQ domain ops.
patch9 is rename the IRQ related functions, prepare to move to
pcie-plda-host.
patch10 - 14 is modify the event codes, preparing for support starfive
and microchip two platforms.
patch15 is move IRQ related functions to pcie-plda-host.c
patch16 is set plda_event_handler to static.
patch17 is add StarFive JH7110 PCIe dt-binding doc.
patch18 is add StarFive JH7110 Soc PCIe codes.
patch19 is Starfive dts config

previous version:
v1:https://patchwork.kernel.org/project/linux-pci/cover/20230719102057.22329-1-minda.chen@starfivetech.com/
v2:https://patchwork.kernel.org/project/linux-pci/cover/20230727103949.26149-1-minda.chen@starfivetech.com/
v3:https://patchwork.kernel.org/project/linux-pci/cover/20230814082016.104181-1-minda.chen@starfivetech.com/
v4:https://patchwork.kernel.org/project/linux-pci/cover/20230825090129.65721-1-minda.chen@starfivetech.com/
v5:https://patchwork.kernel.org/project/linux-pci/cover/20230907091058.125630-1-minda.chen@starfivetech.com/
v6:https://patchwork.kernel.org/project/linux-pci/cover/20230915102243.59775-1-minda.chen@starfivetech.com/

change:
  v7:
    patch8: fix the build warning.
    patch18: Some format changes (Emil's comment)
    patch19: change the pcie node sequences by alphabetical
             delete the "interupt-parent" in pcie node.

  v6:
    v5 patch 4 split to patch 4 -6. New patches just contain one
function modification. It is more reguluar.
    patch 7: Just move the two setup functions only
    patch 8 : draw a graph of PLDA local register, make it easier to
review the codes.
    v5 patch 7 split to patch 9- 14. Each patch just contain one
function modification. It is more regular.
    patch 9: rename IRQ related functions.
    patch 10 - 14 : modify the events codes, total five patch.
    patch 15: move IRQ related functions to pcie-plda-host.c
    patch 16: Add new patch 16.
    patch 18- 19 using "linux,pci-domain" dts setting.

  v5:
    patch 9 -14:
    	- Some variables names changed (evt->event).
    	- plda_handle_event() using a unify callback function to get events
num.
	- Add plda_event_ops data structure.
    patch 18:
	plda_event_ops changed which is related to patch 6- 8 changed.

  v4:
    patch 3:
    	Copy the interrupt events macros to pcie-plda-host.c
    patch 13:
    	get_events() change in patch 7. Patch 8 is just move the codes.
    other change:
	All the functions in commit message add (). 
  v3:
    patch 2- 16:
      - splite refactoring patches to multiple patch.
      - rename plda_pcie to plda_pcie_rp. Maybe other vendor will
        upstream PLDA ep codes.
    patch 17:
      - Remove the redundant reference.
      - move the offset value to codes in starfive,stg-syscon
      - change reset-gpio to prest-gpio.
    patch18:
      - Add 100ms delay after preset for PCIe 6.0 spec.
      - stg-syscon related modification.
    patch19:
      - Add dts configure.
  v2:
    patch1:
      - squash dt-bindings patches to patch1
      - add 'required' list. 
      - plda doc rename to plda,xpressrich-axi-common.yaml
    patch2 - 16:
      - squash the microchip modification patch.
    patch17:
      - remove the plda common required property.
    patch18:
      - Sync the hide rc bar ops with config read function.
      - Revert the T_PVPERL to 100ms and add comments for the source.
      - Replace the link check function by the standard link ops.
      - Convert to new pm ops marcos.
      - Some formats modification.
      - pcie-plda-host modification merge to patch4.
    other:
      - remove the pcie-plda-plat.c
      - remove the starfive dts patch first. for it depends on
        stg clock and syscon setting.

Minda Chen (19):
  dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
  PCI: microchip: Move pcie-microchip-host.c to plda directory
  PCI: microchip: Move PLDA IP register macros to pcie-plda.h
  PCI: microchip: Rename data structure
  PCI: microchip: Rename two setup functions
  PCI: microchip: Change the argument of plda_pcie_setup_iomems()
  PCI: plda: Move the setup functions to pcie-plda-host.c
  PCI: plda: Add event interrupt codes and IRQ domain ops
  PCI: microchip: Rename interrupt related functions
  PCI: microchip: Add num_events field to struct plda_pcie_rp
  PCI: microchip: Add request_event_irq() callback function
  PCI: microchip: Add INTx and MSI event num to struct plda_event
  PCI: microchip: Add get_events() callback function
  PCI: microchip: Add event IRQ domain ops to struct plda_event
  PCI: microchip: Move IRQ functions to pcie-plda-host.c
  PCI: plda: Set plda_event_handler() and event ops to static
  dt-bindings: PCI: Add StarFive JH7110 PCIe controller
  PCI: starfive: Add JH7110 PCIe controller
  riscv: dts: starfive: add PCIe dts configuration for JH7110

 .../bindings/pci/microchip,pcie-host.yaml     |  55 +-
 .../pci/plda,xpressrich3-axi-common.yaml      |  75 ++
 .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++
 MAINTAINERS                                   |  19 +-
 .../jh7110-starfive-visionfive-2.dtsi         |  64 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  86 +++
 drivers/pci/controller/Kconfig                |   9 +-
 drivers/pci/controller/Makefile               |   2 +-
 drivers/pci/controller/plda/Kconfig           |  30 +
 drivers/pci/controller/plda/Makefile          |   4 +
 .../{ => plda}/pcie-microchip-host.c          | 603 ++--------------
 drivers/pci/controller/plda/pcie-plda-host.c  | 659 ++++++++++++++++++
 drivers/pci/controller/plda/pcie-plda.h       | 266 +++++++
 drivers/pci/controller/plda/pcie-starfive.c   | 448 ++++++++++++
 14 files changed, 1835 insertions(+), 605 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich3-axi-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
 create mode 100644 drivers/pci/controller/plda/Kconfig
 create mode 100644 drivers/pci/controller/plda/Makefile
 rename drivers/pci/controller/{ => plda}/pcie-microchip-host.c (54%)
 create mode 100644 drivers/pci/controller/plda/pcie-plda-host.c
 create mode 100644 drivers/pci/controller/plda/pcie-plda.h
 create mode 100644 drivers/pci/controller/plda/pcie-starfive.c


base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
