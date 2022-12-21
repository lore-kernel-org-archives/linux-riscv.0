Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59674C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bt/KStKtJH5YpTmhtodWd+zgvA2D0RzWzEVoDDRu64o=; b=3rpOYWaUk8apgv
	8KaALyr7bB5ifsau45MVstNiDZwOyteRFbDJTqwYacSL13gOBC3V1NWYd4Vx+anbMx5B6JImHn9SR
	o9Xatgk4JtkhoMBFB0uF6BYV8V5PlEABB/+zrmKMiY36fVh1GLvW95YOQatTsW39HF1EErFqqrv+w
	znIdctyyTiS+cRr/WBDv2FIC5ofrhOkM/CxmOvhos4hfQwOaa8UszRsyCuuL+GtddYsESqXOf45hp
	3HaqO7scNJaLqLJOBXQFBtP9QsNrzP21tPYRx/I3m4AqJGQ/IBKjd2HAEX1RofxKOTYbXSzhRRcbe
	5ldWzpQTkmRBsdsI8CSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81vc-00H1LC-OF; Wed, 21 Dec 2022 16:26:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81vU-00H1HI-Sq
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 16:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671640000; x=1703176000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=urUO3lBnUtgO+026vENV9ZHIqNZxZaA6oDAmSzARVN0=;
  b=ddBAY5XDIDBK0LEIHVPSXwfNUCkwXaFCO/Yv6RlVeota/LqBib9A3FBM
   7NU2GzLUM5tLty9OzhPjnqzVxc4frn/5g68y5r6mDvy11pjKBrLSqbNOk
   5mBL/GjVjFdqczkvwkSUl8BQ3nLTOe0VaO1EE0deDb0/x9a2BsKLKVbdf
   H2NX8XbXRrJHDwhKqPYihdnmKuUO4fO8SDZvrdVjPAo5FIIpTS9DQ5lm2
   wTUrrb++x+y8qeZPwenndKgvyUIucz+Cme5zICI8CkJyNFlUBwkrQs7l2
   9ZpVa1sUyXaCLlAbgJ0g7PLCZFuOVfR8J4mPn7vaXjUinbN+ONG7FzXng
   A==;
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="204941736"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Dec 2022 09:26:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 09:26:36 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 21 Dec 2022 09:26:33 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v2 0/9] PCI: microchip: Partition address translations
Date: Wed, 21 Dec 2022 16:26:21 +0000
Message-ID: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_082641_030693_6AFD36DF 
X-CRM114-Status: GOOD (  12.96  )
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

Daire McNamara (8):
  PCI: microchip: Correct the DED and SEC interrupt bit offsets
  PCI: microchip: Align register, offset, and mask names with hw docs
  PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
  PCI: microchip: Clean up initialisation of interrupts
  PCI: microchip: Gather MSI information from hardware config registers
  PCI: microchip: Re-partition code between probe() and init()
  PCI: microchip: Partition outbound address translation
  PCI: microchip: Partition inbound address translation

 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  62 +-
 drivers/pci/controller/pcie-microchip-host.c  | 678 +++++++++++++-----
 2 files changed, 524 insertions(+), 216 deletions(-)


base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
