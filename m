Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1EBC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ihcfgoArEfEpWINdL8m2NdneKwddrmhSpGJB0pYaGQ=; b=SNSaTpGtDSVXa0
	eXrGzsXgbhBbu5O/TO/CpX0nhdTX2kbgdnjHIEmhF3wOcrSXtlcb9vIAapu/h5r9Iizz8REHDWfrL
	MF6odJ/GqRSVh7OJFT+/Fkpco7Wff0pEyJuZ0Pv9mBRCUl+2wCJOLmU8pqz5Vp22+5jmMOQVjBx0m
	3rdQWKRZaN04yOi53eRlZlSjEyKuf5uRypWSnZ6wlW5A31N9c8D+I3x9qbvwv/8JpJOAkr0qn9NyH
	+sq2mItVj0vve+X2NaYkkawFu44E9T3A3wE+U+/3GxyEqOTKBFZqkghXiCRgQsxf4M8rpB6Ae4tD1
	UWdKvo3VJN0+ZtMrIDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCy1s-00000009h9t-3gea;
	Fri, 31 May 2024 08:54:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCy1n-00000009h5w-1XWu
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 08:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1717145663; x=1748681663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oo6bxxOy97R0LewTp0VK1yx3l148GkL3pKqSia9JUdA=;
  b=sn0YB9mr6NqbMVu9/ZriKB+f+v5boVNY9gREzNuXeGjGkCucM/0O+LQe
   1nPdhHzuRaAExgAgTY7Ba1AbKZ6T+qVBafW+tG8DDF7VndYQrf+d8YWsc
   Zpe36PPSrxmIJKw+P9GUysC0wvLzwpmydLbi4V18+9XflGLT/0IKRwav6
   abqwpHucULr+aAxPD8nE+HLzCemLLqN9QFygJsr52NUYVP0B1RL6PTm09
   jTUTXOL0WpxOoVzuUhmzwhv+evZjfoy0Na8NFCDQDitk3fhQUzpq7wIuZ
   YrArNMWVad1ncCftQ6gSUYjRDrP2qolHjb5ACp5y+05nkxrj/V04FYeqL
   w==;
X-CSE-ConnectionGUID: l/lpyU7jQm+PQYj0dIm0ag==
X-CSE-MsgGUID: qmmgSkVxTHeMUclhTpfFRw==
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="194194715"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2024 01:54:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 31 May 2024 01:54:00 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 01:53:58 -0700
From: Daire McNamara <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Daire McNamara
	<daire.mcnamara@microchip.com>
Subject: [PATCH 1/2] PCI: microchip: Fix outbound address translation tables
Date: Fri, 31 May 2024 09:53:32 +0100
Message-ID: <20240531085333.2501399-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240531085333.2501399-1-daire.mcnamara@microchip.com>
References: <20240531085333.2501399-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_015423_595616_971F27CE 
X-CRM114-Status: GOOD (  11.86  )
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

On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
three general-purpose Fabric Interface Controller (FIC) buses that
encapsulate an AXI-M interface. That FIC is responsible for managing
the translations of the upper 32-bits of the AXI-M address. On MPFS,
the Root Port driver needs to take account of that outbound address
translation done by the parent FIC bus before setting up its own
outbound address translation tables.  In all cases on MPFS,
the remaining outbound address translation tables are 32-bit only.

Limit the outbound address translation tables to 32-bit only.

Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip Polarfire PCIe controller driver")

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 137fb8570ba2..0795cd122a4a 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -983,7 +983,8 @@ static int mc_pcie_setup_windows(struct platform_device *pdev,
 		if (resource_type(entry->res) == IORESOURCE_MEM) {
 			pci_addr = entry->res->start - entry->offset;
 			mc_pcie_setup_window(bridge_base_addr, index,
-					     entry->res->start, pci_addr,
+					     entry->res->start & 0xffffffff,
+					     pci_addr & 0xffffffff,
 					     resource_size(entry->res));
 			index++;
 		}
@@ -1117,8 +1118,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	int ret;
 
 	/* Configure address translation table 0 for PCIe config space */
-	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
-			     cfg->res.start,
+	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
+			     cfg->res.start & 0xffffffff,
 			     resource_size(&cfg->res));
 
 	/* Need some fixups in config space */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
