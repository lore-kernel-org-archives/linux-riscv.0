Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52350C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aJgBu0rirv+jgKFp5OIXXNVwOQu9aC+gTUpsOWFSmog=; b=AdCzecyLwpOZej
	yNSSWwNWjYPSt2/3AvMMo7XpTzv/sxPGvDoTpY0hxZHJfAEJD/pjGX20u0ElqIuk4TbtGFJJb8l4E
	k1xafPBkDF4gtbxsXlNTp1IhPD8dpn92Ob533GktVw6pescgP0kF3B1obOuuFKcHnetETc0B5QAod
	UnjcTaDKlpGYm67omxyOUrwVrCZs/ZLaAmK26QWo8qFXFuvgqjyDZHdbz8ADxyIf/JKTKCytFYsYI
	0x44/mS867QXm/FEafkUiazTae4EqfGTQl3tLUGi0fwPIxPPnUlfNTWfnCFtw4eQbQXQMNxtnF3PB
	+mSE6l4TtXlcg8G1pVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAGq-0000000Dc9v-3JJV;
	Fri, 28 Jun 2024 12:00:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAGn-0000000Dc8e-1NTs
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 12:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719576001; x=1751112001;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sf6fbq4Th6RnCsXrNzNrN/n+89ot45o4S3y89hVBu/U=;
  b=S0hGeg1vLRJATXN3isG5nGusAT0btJXFWajdxVIdQw7vRQ7TdtuvGSLu
   mW0+Rb3bYyY8Kqqrh6+yCfFRDeSprcgXyfPl/gZw1nJZ59Yn38ybL8XOw
   0UBJLuzah/IykPu92LyzJiWipoSmZIlHp/6SAMOhIjZXNViS7ak06j4qs
   AWnAftsfZCGCH4oKMmvpjcLl4Lc42y34feEUhcbcSr7xOubfT4/fCnIpv
   2nmkae81QrlBo+px+i6n6auULBkpw4oWVG6/UYoMcZVBzSHcDTrvY9dQh
   f9z+wZO4YS1WCrnKL/VNHFtBM4wPFi3uWl1XeS0ZdV7kPWW9NbQkU3tcB
   A==;
X-CSE-ConnectionGUID: fhzcQ281QiKf1QfzQI0hzg==
X-CSE-MsgGUID: Ac/yOfHzTam/pke6/HYVlQ==
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="259502555"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 04:59:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 04:59:24 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 04:59:22 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 0/3] Fix address translations on MPFS PCIe controller
Date: Fri, 28 Jun 2024 12:59:20 +0100
Message-ID: <20240628115923.4133286-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_050001_476188_E0CD724D 
X-CRM114-Status: GOOD (  11.98  )
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

Hi all,

On Microchip PolarFire SoC (MPFS), the PCIe controller is connected to the
CPU via one of three Fabric Interface Connectors (FICs).  Each FIC present
to the CPU complex as 64-bit AXI-M and 64-bit AXI-S.  To preserve
compatibility with other PolarFire family members, the PCIe controller is
connected to its encapsulating FIC via a 32-bit AXI-M and 32-bit AXI-S
interface.

Each FIC is implemented in FPGA logic and can incorporate logic along its 64-bit
AXI-M to 32-bit AXI-M chain (including address translation) and, likewise, along
its 32-bit AXI-S to 64-bit AXI-S chain (again including address translation).

In order to reduce the potential support space for the PCIe controller in
this environment, MPFS supports certain reference designs for these address
translations: reference designs for cache-coherent memory accesses
and reference designs for non-cache-coherent memory accesses. The precise
details of these reference designs and associated customer guidelines
recommending that customers adhere to the addressing schemes used in those
reference designs are available from Microchip, but the implication for the
PCIe controller address translation between CPU-space and PCIe-space are:

For outbound address translation, the PCIe controller address translation tables
are treated as if they are 32-bit only.  Any further address translation must
be done in FPGA fabric.

For inbound address translation, the PCIe controller is configurable for two
cases:
* In the case of cache-coherent designs, the base of the AXI-S side of the
  address translation must be set to 0 and the size should be 4 GiB wide. The
  FPGA fabric must complete any address translations based on that 0-based
  address translation.
* In the case of non-cache coherent designs, the base of AXI-S side of the
  address translation must be set to 0x8000'0000 and the size shall be 2 GiB
  wide.  The FPGA fabric must complete any address translation based on that
  0x80000000 base.

So, for example, in the non-cache-coherent case, with a device tree property
that maps an inbound range from 0x10'0000'0000 in PCIe space to 0x10'0000'0000
in CPU space, the PCIe rootport will translate a PCIe address of 0x10'0000'0000
to an intermediate 32-bit AXI-S address of 0x8000'0000 and the FIC is
responsible for translating that intermediate 32-bit AXI-S address of
0x8000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.

And similarly, for example, in the cache-coherent case, with a device tree
property that maps an inbound range from 0x10'0000'0000 in PCIe space to
0x10'0000'0000 in CPU space, the PCIe rootport will translate a PCIe address
of 0x10'0000'0000 to an intermediate 32-bit AXI-S address of 0x0000'0000 and
the FIC is responsible for translating that intermediate 32-bit AXI-S address
of 0x0000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.

See https://lore.kernel.org/all/20220902142202.2437658-1-daire.mcnamara@microchip.com/T/
for backstory.

Changes since v5:
- Reverted setup_inbound_atr size parameter to u64 as ci system reported
  SZ_4G getting truncated to 0 on mips when I try to use size_t or resource_size_t.
  Added Acked-by tags

Changes since v4:
- Added more cleanups suggested by Ilpo Jarvinen
  Added cleanups for inbound v4 and outbound v3.

Changes since v3:
- Added nice cleanups suggested by Ilpo Jarvinen

Changes since v2:
- Added <Signed-off-by: tag>

Changes since v1:
- added bindings patch to allow dma-noncoherent
- changed a size_t to u64 to pass 32-bit compile tests
- allowed 64-bit outbound pcie translations
- tied PCIe side of eCAM translation table to 0

Conor Dooley (1):
  dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent

Daire McNamara (2):
  PCI: microchip: Fix outbound address translation tables
  PCI: microchip: Fix inbound address translation tables

 .../bindings/pci/microchip,pcie-host.yaml     |   2 +
 drivers/pci/controller/pcie-microchip-host.c  | 118 +++++++++++++++---
 2 files changed, 106 insertions(+), 14 deletions(-)


base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
