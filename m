Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15B5C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OQ91bNWstnFV2Gzues1dW8F8pz3VgbiFYf38O1p3ee8=; b=CWSyBFZZdCs8AY
	xpjJ6UMWTqP9wJsiclSWuRoxGAcifozi21/ETXSCI7f4T5yrZa8OaeYsk1uELuy/VO6FaL5Y6bajR
	Mc1JoYm9Ih/38NhtUfN2bM9hwunF8elCcv3wHExmiQ0xq1A+UO1z45ui8o16Ge1xKe+RPE/qXEbQt
	DoUGEPSnYByHNv1EndeVKUBTBW9eIV5lly6mTp4JWQ96s1L14mOrd7Pf5+BBllTt5Am9cK236day+
	ouhFhstNBn+a7FZkKVvkQwXQ/0v5MJPD6OEVDGvP8ZFOyWCZd7s9u+a+P5wb4j53FDUmAjbxPRneK
	cqnsTOM5vt+avus9pm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabq-00BMr2-9N; Wed, 11 Jan 2023 12:53:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabm-00BMpG-Dz
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673441615; x=1704977615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QKLSe53ZxfhTjhv3XU7LdIwDt1114h07vebSpiOwft4=;
  b=c/rRNs0bCOgEPViL2wF49IUn0DZVsG4lUd2/Zen0E4ZO4mhjV+TovGEZ
   tC+03h4Igghfgyy+5OM+WXq2OvBhu4WuCnxTGTY152x4ACDnunB0UQlJ2
   Xan1MpjZ7pasCbOi4qiIeYAYRRw9cZUkwqCZ9/GPKIUp0UZxzRD1opIee
   eYjwoTLQNcQ2sWIE1YcZxKUC9CN+jE7rC4ihW6V2/9g0L5Ob2lrzb57f8
   B2S/3E66eXpGyVJWeFmiZUS1rv+dpDp8cQspDpr/Wa6mtGEp3/+JlIofd
   ZRsXmhajDgQkkb1iZzFxp2s66fkh2zqwOn/2kpBN1DxoKC2NkLlMYLrUm
   g==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="191745067"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:53:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:53:29 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 05:53:26 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 00/11] PCI: microchip: Partition address translations
Date: Wed, 11 Jan 2023 12:53:12 +0000
Message-ID: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_045334_562601_5A453A09 
X-CRM114-Status: GOOD (  14.17  )
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

From: Daire McNamara <daire.mcnamara@microchip.com>

Changes since v2:
- Replaced GENMASK(63,0) with GENMASK_ULL(63,0) to remove warning
- Added patch to avoid warning on cast of argument to devm_add_action_or_reset()
- Added patch to enable building driver as a module

Changes since v1:
- Removed unused variables causing compile warnings
- Removed incorrect Signed-off-by: tags
- Capitalised msi and msi-x
- Capitalised FIC and respelled busses to buses
- Capitalised all comments
- Renamed fabric inter connect to Fabric Interface Controller as per PolarFire SoC TRM

Microchip PolarFire SoC is a 64-bit device and has DDR starting at
0x80000000 and 0x1000000000. Its PCIe rootport is connected to the CPU
Coreplex via an FPGA fabric. The AXI connections between the Coreplex and
the fabric are 64-bit and the AXI connections between the fabric and the
rootport are 32-bit.  For the CPU CorePlex to act as an AXI-Master to the
PCIe devices and for the PCIe devices to act as bus masters to DDR at these
base addresses, the fabric can be customised to add/remove offsets for bits
38-32 in each direction. These offsets, if present, vary with each
customer's design.

To support this variety, the rootport driver must know how much address
translation (both inbound and outbound) is performed by a particular
customer design and how much address translation must be provided by the
rootport.

This patchset contains a parent/child dma-ranges scheme suggested by Rob
Herring. It creates an FPGA PCIe parent bus which wraps the PCIe rootport
and implements a parsing scheme where the root port identifies what address
translations are performed by the FPGA fabric parent bus, and what
address translations must be done by the rootport itself.

See https://lore.kernel.org/linux-pci/20220902142202.2437658-1-daire.mcnamara@microchip.com/
for the relevant previous patch submission discussion.

It also re-partitions the probe() and init() functions as suggested by
Bjorn Helgaas to make them more maintainable as the init() function had
become too large.

It also contains some minor fixes and clean-ups that are pre-requisites:
- to align register, offset, and mask names with the hardware documentation
  and to have the register definitions appear in the same order as in the
  hardware documentation;
- to harvest the MSI information from the hardware configuration register
  as these depend on the FPGA fabric design and can vary with different
  customer designs;
- to clean up interrupt initialisation to make it more maintainable;
- to fix SEC and DED interrupt handling.

I expect Conor will take the dts patch via the soc tree once the PCIe parts
of the series are accepted.

Conor Dooley (1):
  riscv: dts: microchip: add parent ranges and dma-ranges for IKRD
    v2022.09

Daire McNamara (10):
  PCI: microchip: Correct the DED and SEC interrupt bit offsets
  PCI: microchip: Remove cast warning for devm_add_action_or_reset() arg
  PCI: microchip: enable building this driver as a module
  PCI: microchip: Align register, offset, and mask names with hw docs
  PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
  PCI: microchip: Clean up initialisation of interrupts
  PCI: microchip: Gather MSI information from hardware config registers
  PCI: microchip: Re-partition code between probe() and init()
  PCI: microchip: Partition outbound address translation
  PCI: microchip: Partition inbound address translation

 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  62 +-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-microchip-host.c  | 688 +++++++++++++-----
 3 files changed, 533 insertions(+), 219 deletions(-)


base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
