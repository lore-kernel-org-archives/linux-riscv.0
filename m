Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FDC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jqHPXFbRQfRi8GzWpSE2OzE9KP4b+4z5Oj7j0QoAELc=; b=xoMDr3gFS1Uvms
	hE1QL6KkhaTNVYa2zDDbrqhJXqWP/8WDB1IMiD8Bu7Crjd5Tdx2SRJgcCHxbLa8DwWZdWeqUOF4oK
	C/hPDcpfUlpVBRz+shl7hi42HWg1UBi+U2OHSVOBAcbGABdvCIK9emtX8aZiVJBsNc/uscstx/yz4
	uowHx0SXU6iFAg55sGpfsH3PlliBjZkoPXBKVs8MXoi8Aa0Uu3pGQHqp6GDzhT0PWOHXG7/oDylc6
	VDxYBmWFKx9NeBV3FYIk7n+InSDKRuFjSdhQsohEgciGqyhpma4V3vY4Ldq++zbW6QxlKFmv54qxI
	jV2o+4DNTaKsvh47FZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCy1o-00000009h84-3TCS;
	Fri, 31 May 2024 08:54:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCy1l-00000009h5w-0JoM
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 08:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1717145661; x=1748681661;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tCHprlLlnw6uDZ2ngRA1f3x4YFwg7beapb8nxZV2la8=;
  b=vGXDDKfQ1SCzztQsOv6mRtrdpJMR1BZ9ppo/vNz8LhGCzD/iH6PYtMQZ
   1+Y/kR8AvDXPVLqVNFvWFGd1YeNdFvwr2TDyXE+akNuJIFPhCLxqJgKpa
   5m3kmZPWE2YaYVdjFGmc7ulTMc8H+eATZbhP/HWzcC8UFU26RVn7s9l3t
   cVWqqVTkGCCA+bNfRi7b/BF7MqfNsxwcE5E+Fck/+wF+U6SRRcplMI3Tw
   sHdbDjcjgqFgdx5aXze/u21EZkon50yqavbkDp6o5rwFUP11mdQSpyw4S
   a0gUN7OeG0xAO9n3RdQRtkcWdydQhem5RKFLzWvYz1w4XNouL6VsuETme
   A==;
X-CSE-ConnectionGUID: l/lpyU7jQm+PQYj0dIm0ag==
X-CSE-MsgGUID: B88xxOsDQdusAgOLtg78RQ==
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="194194712"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2024 01:54:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 31 May 2024 01:53:54 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 01:53:52 -0700
From: Daire McNamara <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Daire McNamara
	<daire.mcnamara@microchip.com>
Subject: [PATCH 0/2] Fix address translations on MPFS PCIe controller
Date: Fri, 31 May 2024 09:53:31 +0100
Message-ID: <20240531085333.2501399-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_015421_305000_C557A0F6 
X-CRM114-Status: GOOD (  10.97  )
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

Daire McNamara (2):
  PCI: microchip: Fix outbound address translation tables
  PCI: microchip: Fix inbound address translation tables

 drivers/pci/controller/pcie-microchip-host.c | 104 +++++++++++++++++--
 1 file changed, 96 insertions(+), 8 deletions(-)


base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
