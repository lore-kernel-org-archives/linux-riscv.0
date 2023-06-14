Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6332EB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkwFDnIhoMXZGwFBgjLjYj8SuZG9DBlfFO9C3F6P0FA=; b=hBuWXAGaiMckNt
	5qOsBwwbIHwJjE8yvJKU46uYwxqXzI61KxcVnEChUvtUXiQ+nIlFEOyGe993AX2Vr1BVg1bnGXz3i
	SNuoQRMc9QR779W7JEopOzZSvws6iyTjthiJ0EhH52TBCFwS+aO62PXldQaiawKeByIpBwqTkiJus
	CHS5XocqmRMUN80Jn2/f8swMgFS9VooxTIYNk12oYoaclutHc0g3UXQgLPr/xwMiPS7SGWMfrk601
	IpUUN1FX+poh34e58UX0jHf84hpxBiuDQNyHPQN7w4N50GzeWvrtBP/G4VsVhQ5qGgPvbZaDR8exE
	Y2SeqSFUEMEZT8DYGaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SrZ-00C8Yh-0l;
	Wed, 14 Jun 2023 15:56:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SrV-00C8WR-3D
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 15:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686758205; x=1718294205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=56EU1//nUi8+2GPEi8I4JHcx+44wHat4IeyEbEwYssU=;
  b=IjKcRIYp95i6SrzD3cXHk04zLijjE/sKqgwOQr9SvSiJRfOT1bu6pvD8
   a8QQ9EpD9SzkIYNILmzCBG4H/2WAob+5FqehfNLkAXOm1+U6CEeMsr0Kj
   VCV1pyNTAauphGOssRhMrizPIK+FSJpqgo75Lusf9jT74t79867s8fjBs
   p/JFMb2q+ydpdqe7uSXfKgU1TfPxvV0AHRP5xsefKqGkO8r9TjwNL2p8M
   IY3Ib6OrQtNZxMo7cqeHvRBvRsgSQx2qwD90yWGdMd6nDWIF/T7tQaQ/f
   xGV4+BZsDdSh5Ba+YkhK5czyIRuu9OcjLMsx6f8Glb3WuvxUji/YQjl1g
   g==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="220290982"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2023 08:56:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 08:56:04 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 14 Jun 2023 08:56:03 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 2/8] PCI: microchip: Remove cast warning for devm_add_action_or_reset() arg
Date: Wed, 14 Jun 2023 16:55:50 +0100
Message-ID: <20230614155556.4095526-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_085646_097604_258F72C6 
X-CRM114-Status: GOOD (  12.52  )
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

The kernel test robot reported that the ugly cast from
void(*)(struct clk *) to void (*)(void *) converts to incompatible
function type.  This commit adopts the common convention of creating a
trivial stub function that takes a void * and passes it to the
underlying function that expects the more specific type.

Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip PolarFire PCIe controller driver")
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index dd5245904c87..73046bad1521 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -848,6 +848,13 @@ static const struct irq_domain_ops event_domain_ops = {
 	.map = mc_pcie_event_map,
 };
 
+static inline void mc_pcie_chip_off_action(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+}
+
 static inline struct clk *mc_pcie_init_clk(struct device *dev, const char *id)
 {
 	struct clk *clk;
@@ -863,8 +870,7 @@ static inline struct clk *mc_pcie_init_clk(struct device *dev, const char *id)
 	if (ret)
 		return ERR_PTR(ret);
 
-	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
-				 clk);
+	devm_add_action_or_reset(dev, mc_pcie_chip_off_action, clk);
 
 	return clk;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
