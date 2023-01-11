Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51BEC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5y929pFzP4fHHLCysMaTCwMd0Putb4Ml6KXEgBiMsJo=; b=pbE8+k1W0ek78u
	O6K2h1TgI2zgVeD2MVpa/UXqJI1mocFGC7twPmcndaSGB9BB2VNvbZ54naR3IYoXiX0SgGU8BW9qR
	SpT9RdGPmR+MRV3J1gP3X6obt6f2u+MG6L4IviYMW3lQDpILhXwapvRYBSLACe3LuFHKlTflBTlqR
	T/VDy+Bud7hkWg5aUWwWii6MDDQIsGKT3+KMme16m5APn/Uk4+SXWmPrZgha3ToVz8jrRA2i68YVM
	24ptxLYPnGwPJxbJtPxFF1oZoh8RPPUaOmFfCmxtF18l/l/O+adGwSoq2XEAffLsQpq0yLW4CLSyh
	HgkAKOEEPgPkq1PQSAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabv-00BMtI-2H; Wed, 11 Jan 2023 12:53:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabr-00BMpG-Vc
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673441621; x=1704977621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x0S9JzNXpNTeJ8BFLbomIJarWQeVxG/Tkx1sxIwVd6Q=;
  b=gmDgbS54CpTwmgI3vBr2LDzyHlVJSinAq1bEIqMMAX16u5lmXzfegksC
   MdoIUI4TScvEwCVw2e4xm5uNUeiaTShjrpbVxiut/X7LwCgPi07jmAz76
   YRag1XCZrAppP3RwnljxKAi/kElvVmTL/d6DM9+YOIvuiVQpxnvNCLA2S
   HftpJzvu3+bkzzAmVVgx6VJ6kXOhP0D4yUMujoeyXs+tbwFQBNI1y/gWy
   qndPy0knwdYYz7Us1v1EJdrJSjZZEJXmVpWYrXoAu1dkHLeufxxhkkDo2
   QP+9EkkDUtq4LWXmq1DyS5OCAhN7MllL+rv34zmY41ZT4Xcw8t5Kfg1Ms
   w==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="191745177"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:53:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:53:37 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 05:53:34 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 02/11] PCI: microchip: Remove cast warning for devm_add_action_or_reset() arg
Date: Wed, 11 Jan 2023 12:53:14 +0000
Message-ID: <20230111125323.1911373-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_045340_108141_E5359D2B 
X-CRM114-Status: GOOD (  12.01  )
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
---
 drivers/pci/controller/pcie-microchip-host.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 5c89caaab8c9..5efd480e42fa 100644
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
