Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFDEC46CC5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 10:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7ntJPHanIpFCwJXpyL1O8Sn7cntMWiaFMeJGvYdPxw=; b=Inrp3hwmjI3L9E
	h5MUX1MnNmRsDoofMkrLT11rtqS1Yi3Mi+BIkT8Kk59pU5zBn4NSGi0l2MjVxChc2ihYKiabJCTCY
	9s8ZG4peBXZOoeInkUKkjxzQi6g7DTovUeopYGAJa4+BsD60t+k3JcYFG72PWXKj7CkFMH58PsjJc
	jXGKWWkWKHmyhk6CaV52vS0zEFAvkxylidC9/DPqwXLmDjMplRcDKNnY26oBpNTecWht8/8994l+n
	nZaB/mkOpsQ15hE0j8GtmtPGzW9ehjYb7VKJFIx8o6uODaaScWF/YwVDgKVMuiZOOFDCi5UOaRRJu
	5ta0nxNw9dEuj1iU+4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYFB-00FH5B-0d;
	Fri, 08 Dec 2023 10:38:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYF8-00FH2V-2m
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 10:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702031882; x=1733567882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7fpfZLQ/wUMnvIzkFtnwjbFo65V7UhlC6XBu/GZbLfo=;
  b=Kx6DmMO5T8DaD23iP85N1shu9MtLdz760wS5wc2FjCaKYgiEEohe/JFp
   l3qVdRv/zR/AMrejyluPWyaYrb9wVK9HVSJzu4M9feDo3bqBSSbnRAB2E
   /0cjeVb0AoVvIsQoVVROJypaNskbD+ps4rN3RoRD1GRZrskigKZtoXS11
   JO/XPJfWxONhJd1A3n57XQmbBWHiY+jEfCqXe7VBPyrFuNjKEJbcief4/
   5B6yuQIzzvDLqfeuvsM59zwHDgjrNf7+xkNocdI8Y98kS8Uum21HuYeq9
   XvF7Gc9ZaqVRNVxowxxBo5xOX5JkyXSSbZ7NwREIkUTB46PmCp0u2vpsy
   Q==;
X-CSE-ConnectionGUID: H3XQVRBZQ2qxsVmz7vJ8Sw==
X-CSE-MsgGUID: Hl/X09+ES/+vFdJJftuD7g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="13315277"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Dec 2023 03:37:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 03:37:50 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 03:37:45 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v5 1/4] dmaengine: sf-pdma: Support of_dma_controller_register()
Date: Fri, 8 Dec 2023 16:08:53 +0530
Message-ID: <20231208103856.3732998-2-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208103856.3732998-1-shravan.chippa@microchip.com>
References: <20231208103856.3732998-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_023802_958954_BDF3C752 
X-CRM114-Status: GOOD (  11.73  )
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
It calls of_dma_controller_register() with of_dma_xlate_by_chan_id
to get the generic DMA device tree helper support and the DMA
clients can look up the sf-pdma controller using standard APIs.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 3125a2f162b4..6109e1c5a09e 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -20,6 +20,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
+#include <linux/of_dma.h>
 #include <linux/slab.h>
 
 #include "sf-pdma.h"
@@ -563,7 +564,20 @@ static int sf_pdma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = of_dma_controller_register(pdev->dev.of_node,
+					 of_dma_xlate_by_chan_id, pdma);
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
 
 static void sf_pdma_remove(struct platform_device *pdev)
@@ -583,6 +597,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		tasklet_kill(&ch->err_tasklet);
 	}
 
+	if (pdev->dev.of_node)
+		of_dma_controller_free(pdev->dev.of_node);
+
 	dma_async_device_unregister(&pdma->dma_dev);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
