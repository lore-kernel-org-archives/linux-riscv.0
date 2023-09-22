Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219D6CD4F46
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYCMwNm+hRRucXl0oGihe0WNAv/rugx64bd/7/FOEVU=; b=E0Qhu6SY0XYK12
	+SofOMdtgjvzlUHv7b6i71H8pFPV67bh4G3vH8J/XeqSM7KDZ7lTGB7RumT//peO0cRkPQDPvqaon
	L7lBVpkw728BoJ37i5mn3XKcMr2YgrLp6WiJSNKD9qASiQG/w1Z9bV05NDvkSU3KI7v1OAZbPt8on
	pR9dOy5N4ltmg6E4587DX5pxtaMhtBlEfdcEsF9higlQLZ2A/Xv138y2hgu/nbOJiAUwr38F13iKJ
	ikVjVKARs2fDoEB3N/PoJvMoCzIHPLxK7zcR0SRQOGnSGs2f39ekD/16HagJ3jDo7g3jFIDR48RWH
	KwNBM64dNghiIZHCaopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcnx-008dZW-2T;
	Fri, 22 Sep 2023 09:50:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcnu-008dX4-2p
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695376231; x=1726912231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bOTU9FvgSRoMLKxQGcC6y5VPLYv6tO9qTJIAc+cPB6o=;
  b=yNMM6J4wEaTDNE3otsBHVPR8YYKXjQ7oDRzA8UQzqW1WaTfPAM3+vJjc
   rn6D7B6J5bEjNHtFpf0E+qxbm6+A1eQ/cL29CxNoBp6F8pobUtUfd0NFS
   FqArU+dOceX/YQaz0O7DolIJ1ya5kgWcaHC65ltU9Idt/Jvf+Iwsf7kP3
   L0LTl0Rg0fRrMDeW4hIRhBcLPNV0QTmFyAlBEJS8Or8Zrw4g1zQO6xu1b
   tGDe7k4X5WIxEElD960jJyEUyNemcpXhAlOaEtHJcOoRarFJBPCahuI7K
   3iIhdQGu5Ba6zNnh6sTAnt/fHcvuT2uW14rylJEfx8W/HsgRQLFzb1NLY
   Q==;
X-CSE-ConnectionGUID: JugbC+jaSBKADb3c9fFrtw==
X-CSE-MsgGUID: tbJvmtlOR4KAvlrLk/GUPw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="6047509"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2023 02:50:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 22 Sep 2023 02:50:04 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 22 Sep 2023 02:49:59 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>, <palmer@sifive.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v1 1/3] dmaengine: sf-pdma: Support of_dma_controller_register()
Date: Fri, 22 Sep 2023 15:20:37 +0530
Message-ID: <20230922095039.74878-2-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922095039.74878-1-shravan.chippa@microchip.com>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025030_975288_9DF9C6DA 
X-CRM114-Status: GOOD (  14.62  )
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

From: Shravan Chippa <shravan.chippa@microchip.com>

Update sf-pdma driver to adopt generic DMA device tree bindings.
It calls of_dma_controller_register() with sf-pdma specific
of_dma_xlate to get the generic DMA device tree helper support
and the DMA clients can look up the sf-pdma controller using
standard APIs.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index d1c6956af452..c7558c9f9ac3 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -20,6 +20,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/slab.h>
 
 #include "sf-pdma.h"
@@ -490,6 +491,33 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
 	}
 }
 
+static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args *dma_spec,
+					 struct of_dma *ofdma)
+{
+	struct sf_pdma *pdma = ofdma->of_dma_data;
+	struct device *dev = pdma->dma_dev.dev;
+	struct sf_pdma_chan  *chan;
+	struct dma_chan *c;
+	u32 channel_id;
+
+	if (dma_spec->args_count != 1) {
+		dev_err(dev, "Bad number of cells\n");
+		return NULL;
+	}
+
+	channel_id = dma_spec->args[0];
+
+	chan = &pdma->chans[channel_id];
+
+	c = dma_get_slave_channel(&chan->vchan.chan);
+	if (!c) {
+		dev_err(dev, "No more channels available\n");
+		return NULL;
+	}
+
+	return c;
+}
+
 static int sf_pdma_probe(struct platform_device *pdev)
 {
 	struct sf_pdma *pdma;
@@ -563,7 +591,20 @@ static int sf_pdma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_dma_controller_register(pdev->dev.of_node,
+					 sf_pdma_of_xlate, pdma);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Can't register SiFive Platform OF_DMA. (%d)\n", ret);
+		goto err_unregister;
+	}
+
 	return 0;
+
+err_unregister:
+	dma_async_device_unregister(&pdma->dma_dev);
+
+	return ret;
 }
 
 static int sf_pdma_remove(struct platform_device *pdev)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
