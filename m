Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13357C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmzrmUDICJyQY6u1ULBVOs4Ob6u7JjA4WnYaTb2pr0o=; b=bn1RQnkpFgQLN3
	1v2wvVIbZmcKvM2b3fp4ekf8Rpqnriew6OpiZCV0LbpF7bJmGWSPnnGZZLw3gflSM8azwiEG1+lP/
	3E7XZCrwKDgrUxRWwbyczJxi1WYsf/kujI8GgH6l4y4X5uB+GPGo9beOkxBGJhHhmMogTmICyZdHI
	bF+QhR6Zs1MdtqTXfwQB9OLPBr0pkIrnpexVz0FcOXSr+2ihf1BofZBCCMrTjTeTjrU/N2S/RFaDl
	+LwIDhUf1MCmW9ia/tm8M6tCgmanWL1bYsGcIDhyLrMWnJ8fdvl+0pFHNieYnKD8vm1vFX8e9fR/S
	lWxO5vi+lPLnjFJ7yvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabr-00BMre-LL; Wed, 11 Jan 2023 12:53:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabn-00BMpg-Av
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673441616; x=1704977616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tjYAUBvEM8+Wf4xoxFJC9XV4VgaUv7rhhatptjLYPZA=;
  b=U9NdD07YGr/fd1petBpZisFrcvFb3K67KiUxIVduh6tgKp2etIkaBcnx
   +AKl9GD8brABgSFvbR5oHE04gPWMu/AlI89AR44sFDBkVX0lpdB9O1wR5
   JgdExPChCDN4rhOu3Z/XNJQgB/kR68jDDOio6dSrPzfkjBJ/Lau+rYJQD
   ISoKANXIOAaIPnQayZfz/e0weQ0egJ0C5Bo0cfl6kkv21+/tiYy/4hMaN
   mtJ8PAXicTkKqCG++39/nFtp2LDfcU7hUJtIBhrtSf/2ceHTpvYsYT1/f
   RBYNUS9XSBaReuLZoPsECVnsf+2qpntoOOQbcyNru0d3IvZucOChkeKGb
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="196330176"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:53:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:53:34 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 05:53:32 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 01/11] PCI: microchip: Correct the DED and SEC interrupt bit offsets
Date: Wed, 11 Jan 2023 12:53:13 +0000
Message-ID: <20230111125323.1911373-2-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_045335_401266_B130663A 
X-CRM114-Status: UNSURE (   8.11  )
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
index 0ebf7015e9af..5c89caaab8c9 100644
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
