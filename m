Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D34EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVF6DxGa30+QONtFUe3KCOm0hfFH0PF5GWSmiTMPq8o=; b=Sl6Qg2OvT08E1g
	3XhJjDzyJaGMEjJI9J6qyKG2+QtBO0Vy+Prf4KR2r/baLxNCGUXuN34xLcM9GlFuXDhKfnvfrI0Sy
	V19IZiekkUDzBctuIN+c8SaCwZOotonTf5ajoCfsC0SWG3ylbC7K1JGvcEiA/2svXcLiiVLCqSHcT
	GN98lxhWLDAzdkILeylKZCWelkEvdJZoJn6rj+9nD+Ts8BSzglWB7AJD667rFXrclNcFraRllujGM
	4nNYxi0qBxBV40/+k1xqjQc3eQkhb3Pb4C3nYkq0HdNCEgkq0D2kja9Rjo06edbTmAXNYWNS8z22o
	46uw69ptk/Bwrl3kAl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGMy-003yjl-1q;
	Fri, 30 Jun 2023 15:49:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGMv-003yj0-2p
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 15:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688140149; x=1719676149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iQVdQ5/Fd7A+l93rxa4YuqFXIveaFWB1LxC6Y87vXmk=;
  b=hVFHbktXoTCsQqMFleBBqumOan/HFIjWKmCBgt+XMZ1VtdsAZhBokcVd
   KjT5+wHrh1oybYmrMdJ9u09+VzltLOb9EU2TARZzekERiPa6YM/BvdPOQ
   G8IdWY3V+Dd/u8DauygrHr5XZKcJGiDWx1rHUad8O7RKODi9IJWt8jicx
   ushf7O3485hSv+aCl94Uf+bxOX0VQ1u2xeDAST0dLvO9szdXMenzgD1lq
   xGu4lf2Fyhp8SsasNf1y05NymipUH1IBRRLQpCvQc3kzP+Ra5IXgA+6Mg
   mdEQkqUSu2/ybWL6ux3PThV3lkB97gj94XfoRiNb1b21T1Bnclx/KYARf
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="159339679"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2023 08:49:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 30 Jun 2023 08:49:06 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 30 Jun 2023 08:49:04 -0700
From: <daire.mcnamara@microchip.com>
To: <conor@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 1/8] PCI: microchip: Correct the DED and SEC interrupt bit offsets
Date: Fri, 30 Jun 2023 16:48:52 +0100
Message-ID: <20230630154859.2049521-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
References: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_084909_977695_937A6EC0 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

The SEC and DED interrupt bits were the wrong way round so the SEC
interrupt handler attempted to mask, unmask, and clear the DED interrupt
and vice versa. Correct the bit offsets so each interrupt handler
operates properly.

Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip PolarFire PCIe controller driver")
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 5e710e485464..dd5245904c87 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -167,12 +167,12 @@
 #define EVENT_PCIE_DLUP_EXIT			2
 #define EVENT_SEC_TX_RAM_SEC_ERR		3
 #define EVENT_SEC_RX_RAM_SEC_ERR		4
-#define EVENT_SEC_AXI2PCIE_RAM_SEC_ERR		5
-#define EVENT_SEC_PCIE2AXI_RAM_SEC_ERR		6
+#define EVENT_SEC_PCIE2AXI_RAM_SEC_ERR		5
+#define EVENT_SEC_AXI2PCIE_RAM_SEC_ERR		6
 #define EVENT_DED_TX_RAM_DED_ERR		7
 #define EVENT_DED_RX_RAM_DED_ERR		8
-#define EVENT_DED_AXI2PCIE_RAM_DED_ERR		9
-#define EVENT_DED_PCIE2AXI_RAM_DED_ERR		10
+#define EVENT_DED_PCIE2AXI_RAM_DED_ERR		9
+#define EVENT_DED_AXI2PCIE_RAM_DED_ERR		10
 #define EVENT_LOCAL_DMA_END_ENGINE_0		11
 #define EVENT_LOCAL_DMA_END_ENGINE_1		12
 #define EVENT_LOCAL_DMA_ERROR_ENGINE_0		13
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
