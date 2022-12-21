Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96654C10F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLToQb98Iv/BYEP8ffSldLOgS6CBF1RZ/sj3jskVZgk=; b=VfZOAQcZzY31Ql
	344m9c7i6H8OmF4IwAvmCzZ2UnpjY8p1RJK1i5ZDLL9CYHih/pjwxf0/opC320VE6fiNNlk0y+nCB
	z5Uflq9xza6PoWvBzOGNElDjH00yjD2EwIUAXdGPHWKZBPHQIIB4b9sehEwWUN6Wy+1JWgPtXZLVE
	J/rSgL7K5wIPdXRbA9cPZOmszBnJzsAwbOp5t2/4//cCkH+Zxw85OEIDUPTWL3kpNkj/ELqJrtPMz
	S6mAV2S94x44L4P2fJZV0cH7Z6JjnzDBFSyHcIy2dpdZZquasL4F3Kuv0W6ntWF+b6R9guAPLlka7
	bNKdcHiOH9xSa/shnhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81vp-00H1QA-9F; Wed, 21 Dec 2022 16:27:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81vb-00H1Jd-1G
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 16:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671640007; x=1703176007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iVMStXqw7N4RCdA/T6Vc1+1aU3DyWmnv9tkZRRcEwVY=;
  b=EfZvQ18dGOYhxBYoe6lL/uhX6z6bhWqqw6NHuehtQDVGwFRyGGa0/Vw8
   vZferQNbA22ydJqaZ5h2l2t9YcP5NPN/taBXY5IOk2JmgLP3+7bQtQk2g
   qOvOx8gjWdGgiMT3XoDQtfwWUQy905k8uxmSU8b/VF4EcUKRErCKVXMtM
   P00ZF+DSodaR0ZZusNKyw51IZlUzJdixGLAESZNAmeQ2ocdO9nNqKnj86
   6apWTo18A54gW+9Aslxn+lVf9k9P7hzOm2PbIAa+FooBsnmgQQLgTPPdu
   aRejL/wqu3W3IoQ8vN1ENjuXxe74ygQ0MNBKrHTr7kvY1czwz6xWfrnZI
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="189198824"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Dec 2022 09:26:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 09:26:41 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 21 Dec 2022 09:26:39 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v2 2/9] PCI: microchip: Align register, offset, and mask names with hw docs
Date: Wed, 21 Dec 2022 16:26:23 +0000
Message-ID: <20221221162630.3632486-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
References: <20221221162630.3632486-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_082647_238661_83E5D20D 
X-CRM114-Status: UNSURE (   8.71  )
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

Minor re-organisation so that macros representing registers ascend in
numerical order and use the same names as their hardware documentation.
Removed registers not used by the driver.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 122 +++++++++----------
 1 file changed, 60 insertions(+), 62 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 5c89caaab8c9..30153fd1a2b3 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -30,66 +30,7 @@
 #define MC_PCIE_BRIDGE_ADDR			(MC_PCIE1_BRIDGE_ADDR)
 #define MC_PCIE_CTRL_ADDR			(MC_PCIE1_CTRL_ADDR)
 
-/* PCIe Controller Phy Regs */
-#define SEC_ERROR_CNT				0x20
-#define DED_ERROR_CNT				0x24
-#define SEC_ERROR_INT				0x28
-#define  SEC_ERROR_INT_TX_RAM_SEC_ERR_INT	GENMASK(3, 0)
-#define  SEC_ERROR_INT_RX_RAM_SEC_ERR_INT	GENMASK(7, 4)
-#define  SEC_ERROR_INT_PCIE2AXI_RAM_SEC_ERR_INT	GENMASK(11, 8)
-#define  SEC_ERROR_INT_AXI2PCIE_RAM_SEC_ERR_INT	GENMASK(15, 12)
-#define  NUM_SEC_ERROR_INTS			(4)
-#define SEC_ERROR_INT_MASK			0x2c
-#define DED_ERROR_INT				0x30
-#define  DED_ERROR_INT_TX_RAM_DED_ERR_INT	GENMASK(3, 0)
-#define  DED_ERROR_INT_RX_RAM_DED_ERR_INT	GENMASK(7, 4)
-#define  DED_ERROR_INT_PCIE2AXI_RAM_DED_ERR_INT	GENMASK(11, 8)
-#define  DED_ERROR_INT_AXI2PCIE_RAM_DED_ERR_INT	GENMASK(15, 12)
-#define  NUM_DED_ERROR_INTS			(4)
-#define DED_ERROR_INT_MASK			0x34
-#define ECC_CONTROL				0x38
-#define  ECC_CONTROL_TX_RAM_INJ_ERROR_0		BIT(0)
-#define  ECC_CONTROL_TX_RAM_INJ_ERROR_1		BIT(1)
-#define  ECC_CONTROL_TX_RAM_INJ_ERROR_2		BIT(2)
-#define  ECC_CONTROL_TX_RAM_INJ_ERROR_3		BIT(3)
-#define  ECC_CONTROL_RX_RAM_INJ_ERROR_0		BIT(4)
-#define  ECC_CONTROL_RX_RAM_INJ_ERROR_1		BIT(5)
-#define  ECC_CONTROL_RX_RAM_INJ_ERROR_2		BIT(6)
-#define  ECC_CONTROL_RX_RAM_INJ_ERROR_3		BIT(7)
-#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_0	BIT(8)
-#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_1	BIT(9)
-#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_2	BIT(10)
-#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_3	BIT(11)
-#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_0	BIT(12)
-#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_1	BIT(13)
-#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_2	BIT(14)
-#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_3	BIT(15)
-#define  ECC_CONTROL_TX_RAM_ECC_BYPASS		BIT(24)
-#define  ECC_CONTROL_RX_RAM_ECC_BYPASS		BIT(25)
-#define  ECC_CONTROL_PCIE2AXI_RAM_ECC_BYPASS	BIT(26)
-#define  ECC_CONTROL_AXI2PCIE_RAM_ECC_BYPASS	BIT(27)
-#define LTSSM_STATE				0x5c
-#define  LTSSM_L0_STATE				0x10
-#define PCIE_EVENT_INT				0x14c
-#define  PCIE_EVENT_INT_L2_EXIT_INT		BIT(0)
-#define  PCIE_EVENT_INT_HOTRST_EXIT_INT		BIT(1)
-#define  PCIE_EVENT_INT_DLUP_EXIT_INT		BIT(2)
-#define  PCIE_EVENT_INT_MASK			GENMASK(2, 0)
-#define  PCIE_EVENT_INT_L2_EXIT_INT_MASK	BIT(16)
-#define  PCIE_EVENT_INT_HOTRST_EXIT_INT_MASK	BIT(17)
-#define  PCIE_EVENT_INT_DLUP_EXIT_INT_MASK	BIT(18)
-#define  PCIE_EVENT_INT_ENB_MASK		GENMASK(18, 16)
-#define  PCIE_EVENT_INT_ENB_SHIFT		16
-#define  NUM_PCIE_EVENTS			(3)
-
 /* PCIe Bridge Phy Regs */
-#define PCIE_PCI_IDS_DW1			0x9c
-
-/* PCIe Config space MSI capability structure */
-#define MC_MSI_CAP_CTRL_OFFSET			0xe0u
-#define  MC_MSI_MAX_Q_AVAIL			(MC_NUM_MSI_IRQS_CODED << 1)
-#define  MC_MSI_Q_SIZE				(MC_NUM_MSI_IRQS_CODED << 4)
-
 #define IMASK_LOCAL				0x180
 #define  DMA_END_ENGINE_0_MASK			0x00000000u
 #define  DMA_END_ENGINE_0_SHIFT			0
@@ -137,7 +78,8 @@
 #define ISTATUS_LOCAL				0x184
 #define IMASK_HOST				0x188
 #define ISTATUS_HOST				0x18c
-#define MSI_ADDR				0x190
+#define IMSI_ADDR				0x190
+#define  MSI_ADDR				0x190
 #define ISTATUS_MSI				0x194
 
 /* PCIe Master table init defines */
@@ -162,6 +104,62 @@
 
 #define ATR_ENTRY_SIZE				32
 
+/* PCIe Controller Phy Regs */
+#define SEC_ERROR_EVENT_CNT			0x20
+#define DED_ERROR_EVENT_CNT			0x24
+#define SEC_ERROR_INT				0x28
+#define  SEC_ERROR_INT_TX_RAM_SEC_ERR_INT	GENMASK(3, 0)
+#define  SEC_ERROR_INT_RX_RAM_SEC_ERR_INT	GENMASK(7, 4)
+#define  SEC_ERROR_INT_PCIE2AXI_RAM_SEC_ERR_INT	GENMASK(11, 8)
+#define  SEC_ERROR_INT_AXI2PCIE_RAM_SEC_ERR_INT	GENMASK(15, 12)
+#define  NUM_SEC_ERROR_INTS			(4)
+#define SEC_ERROR_INT_MASK			0x2c
+#define DED_ERROR_INT				0x30
+#define  DED_ERROR_INT_TX_RAM_DED_ERR_INT	GENMASK(3, 0)
+#define  DED_ERROR_INT_RX_RAM_DED_ERR_INT	GENMASK(7, 4)
+#define  DED_ERROR_INT_PCIE2AXI_RAM_DED_ERR_INT	GENMASK(11, 8)
+#define  DED_ERROR_INT_AXI2PCIE_RAM_DED_ERR_INT	GENMASK(15, 12)
+#define  NUM_DED_ERROR_INTS			(4)
+#define DED_ERROR_INT_MASK			0x34
+#define ECC_CONTROL				0x38
+#define  ECC_CONTROL_TX_RAM_INJ_ERROR_0		BIT(0)
+#define  ECC_CONTROL_TX_RAM_INJ_ERROR_1		BIT(1)
+#define  ECC_CONTROL_TX_RAM_INJ_ERROR_2		BIT(2)
+#define  ECC_CONTROL_TX_RAM_INJ_ERROR_3		BIT(3)
+#define  ECC_CONTROL_RX_RAM_INJ_ERROR_0		BIT(4)
+#define  ECC_CONTROL_RX_RAM_INJ_ERROR_1		BIT(5)
+#define  ECC_CONTROL_RX_RAM_INJ_ERROR_2		BIT(6)
+#define  ECC_CONTROL_RX_RAM_INJ_ERROR_3		BIT(7)
+#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_0	BIT(8)
+#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_1	BIT(9)
+#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_2	BIT(10)
+#define  ECC_CONTROL_PCIE2AXI_RAM_INJ_ERROR_3	BIT(11)
+#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_0	BIT(12)
+#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_1	BIT(13)
+#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_2	BIT(14)
+#define  ECC_CONTROL_AXI2PCIE_RAM_INJ_ERROR_3	BIT(15)
+#define  ECC_CONTROL_TX_RAM_ECC_BYPASS		BIT(24)
+#define  ECC_CONTROL_RX_RAM_ECC_BYPASS		BIT(25)
+#define  ECC_CONTROL_PCIE2AXI_RAM_ECC_BYPASS	BIT(26)
+#define  ECC_CONTROL_AXI2PCIE_RAM_ECC_BYPASS	BIT(27)
+#define PCIE_EVENT_INT				0x14c
+#define  PCIE_EVENT_INT_L2_EXIT_INT		BIT(0)
+#define  PCIE_EVENT_INT_HOTRST_EXIT_INT		BIT(1)
+#define  PCIE_EVENT_INT_DLUP_EXIT_INT		BIT(2)
+#define  PCIE_EVENT_INT_MASK			GENMASK(2, 0)
+#define  PCIE_EVENT_INT_L2_EXIT_INT_MASK	BIT(16)
+#define  PCIE_EVENT_INT_HOTRST_EXIT_INT_MASK	BIT(17)
+#define  PCIE_EVENT_INT_DLUP_EXIT_INT_MASK	BIT(18)
+#define  PCIE_EVENT_INT_ENB_MASK		GENMASK(18, 16)
+#define  PCIE_EVENT_INT_ENB_SHIFT		16
+#define  NUM_PCIE_EVENTS			(3)
+
+/* PCIe Config space MSI capability structure */
+#define MC_MSI_CAP_CTRL_OFFSET			0xe0u
+#define  MC_MSI_MAX_Q_AVAIL			(MC_NUM_MSI_IRQS_CODED << 1)
+#define  MC_MSI_Q_SIZE				(MC_NUM_MSI_IRQS_CODED << 4)
+
+/* Events */
 #define EVENT_PCIE_L2_EXIT			0
 #define EVENT_PCIE_HOTRST_EXIT			1
 #define EVENT_PCIE_DLUP_EXIT			2
@@ -1086,7 +1084,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	      SEC_ERROR_INT_AXI2PCIE_RAM_SEC_ERR_INT;
 	writel_relaxed(val, ctrl_base_addr + SEC_ERROR_INT);
 	writel_relaxed(0, ctrl_base_addr + SEC_ERROR_INT_MASK);
-	writel_relaxed(0, ctrl_base_addr + SEC_ERROR_CNT);
+	writel_relaxed(0, ctrl_base_addr + SEC_ERROR_EVENT_CNT);
 
 	val = DED_ERROR_INT_TX_RAM_DED_ERR_INT |
 	      DED_ERROR_INT_RX_RAM_DED_ERR_INT |
@@ -1094,7 +1092,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
 	      DED_ERROR_INT_AXI2PCIE_RAM_DED_ERR_INT;
 	writel_relaxed(val, ctrl_base_addr + DED_ERROR_INT);
 	writel_relaxed(0, ctrl_base_addr + DED_ERROR_INT_MASK);
-	writel_relaxed(0, ctrl_base_addr + DED_ERROR_CNT);
+	writel_relaxed(0, ctrl_base_addr + DED_ERROR_EVENT_CNT);
 
 	writel_relaxed(0, bridge_base_addr + IMASK_HOST);
 	writel_relaxed(GENMASK(31, 0), bridge_base_addr + ISTATUS_HOST);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
