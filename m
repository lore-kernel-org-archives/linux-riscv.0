Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53236C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qou5X4pszGDcS80w7PCL5JOMWg6uw1Lzr7AWWEDls/Y=; b=uqMYsjfryWuBpM
	fszHAUds2h6ng3h8CDG7a9QNgw5cJsWUE2LSdS+T30aFVgecCkxQORc+85EL4JQKr3m6/IlKDR/7m
	rq2TVpBwPfp/i01ZUyHDj5LLEXjj1WL+DYpvN9lJK8L1RBBCFK9igRfe78BYqvASd+vfiRfJkBrSB
	MIvTdLypxRLE25pNNefayzsYVFVId7M6HD/LgJNuiL+uHF9rPYgPBSYyM9vY7Lm/M/jNGRUFHINVM
	NZUv9WGEp9PXywZqgzcbgd1n9tsu7k2Hyk85BOkX7ee2BiKjLFfrqqcK5KEhZ6escUuHD2JuqrDw1
	om/InV3zmxr+lTRdymwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFac1-00BMxG-E4; Wed, 11 Jan 2023 12:53:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaby-00BMpg-7B
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673441627; x=1704977627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S5vCuw78EMxUcrUT8ddX5mKyVGeG/2vvPlNqjUVfk1A=;
  b=o6Fqec5xStW9MJev8hybaywQmWDj7OWIUa3kfaobYnaI6VMW8Ncn80vH
   f0dLM+EbYVDRlnX2BEe+JsfF0bAZxmpHmLd8JKRKYj3gsIPSQiflhvgEA
   c5rHZOvTgoaqxGfwxjHICbV6l7zCb/jTM9zM322HNrqBfsTv2tZcO/4Ak
   VHxKMn9eGMv+i5BBTTcOWsP6M/4zn0uE+zbN1dpAOWShK9A1wUnI9FEkr
   xXhLpqGBJRk1gQHCgupVb01a3oXzJFlb0qYvb8ZuB/up5DLyxfXp7STrq
   /c5nguaYqChkQg3kqwBHMZgCq1xnJEBOF4r5AGm8rbsEOu+8CIIgKDNuM
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="196330380"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:53:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:53:45 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 05:53:43 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 05/11] PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
Date: Wed, 11 Jan 2023 12:53:17 +0000
Message-ID: <20230111125323.1911373-6-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_045346_297533_028ABD1E 
X-CRM114-Status: UNSURE (   8.52  )
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

Minor re-organisation so that event handlers can access both a pointer
to the bridge area of the PCIe Root Port and the ctrl area of the PCIe
Root Port.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 2efd48ef79d8..444ba99b070b 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -654,9 +654,10 @@ static inline u32 reg_to_event(u32 reg, struct event_map field)
 	return (reg & field.reg_mask) ? BIT(field.event_bit) : 0;
 }
 
-static u32 pcie_events(void __iomem *addr)
+static u32 pcie_events(struct mc_pcie *port)
 {
-	u32 reg = readl_relaxed(addr);
+	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
+	u32 reg = readl_relaxed(ctrl_base_addr + PCIE_EVENT_INT);
 	u32 val = 0;
 	int i;
 
@@ -666,9 +667,10 @@ static u32 pcie_events(void __iomem *addr)
 	return val;
 }
 
-static u32 sec_errors(void __iomem *addr)
+static u32 sec_errors(struct mc_pcie *port)
 {
-	u32 reg = readl_relaxed(addr);
+	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
+	u32 reg = readl_relaxed(ctrl_base_addr + SEC_ERROR_INT);
 	u32 val = 0;
 	int i;
 
@@ -678,9 +680,10 @@ static u32 sec_errors(void __iomem *addr)
 	return val;
 }
 
-static u32 ded_errors(void __iomem *addr)
+static u32 ded_errors(struct mc_pcie *port)
 {
-	u32 reg = readl_relaxed(addr);
+	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
+	u32 reg = readl_relaxed(ctrl_base_addr + DED_ERROR_INT);
 	u32 val = 0;
 	int i;
 
@@ -690,9 +693,10 @@ static u32 ded_errors(void __iomem *addr)
 	return val;
 }
 
-static u32 local_events(void __iomem *addr)
+static u32 local_events(struct mc_pcie *port)
 {
-	u32 reg = readl_relaxed(addr);
+	void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
+	u32 reg = readl_relaxed(bridge_base_addr + ISTATUS_LOCAL);
 	u32 val = 0;
 	int i;
 
@@ -704,15 +708,12 @@ static u32 local_events(void __iomem *addr)
 
 static u32 get_events(struct mc_pcie *port)
 {
-	void __iomem *bridge_base_addr =
-		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
-	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
 	u32 events = 0;
 
-	events |= pcie_events(ctrl_base_addr + PCIE_EVENT_INT);
-	events |= sec_errors(ctrl_base_addr + SEC_ERROR_INT);
-	events |= ded_errors(ctrl_base_addr + DED_ERROR_INT);
-	events |= local_events(bridge_base_addr + ISTATUS_LOCAL);
+	events |= pcie_events(port);
+	events |= sec_errors(port);
+	events |= ded_errors(port);
+	events |= local_events(port);
 
 	return events;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
