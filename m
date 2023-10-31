Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14137C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 05:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcn1ia0p+M7rbnDhlKABdpKCJf7+rLzAf1paXVSpy88=; b=oHTexUtEViDQQg
	cqqa4Opy2nQEDAsQlZVDfz0h9KNYlSaq8wt8IsXk9sEI9Vd8osaiXQhG8lo0urU7P3lhyf/0ncgJH
	jpbo8kje1iMIalfcQJOlmvcTkmtlrHRGa1EjtPH+QtCzPCFSMlVKVdNowFchdSPA/jCxNxk7Qwfys
	J7m85gtlRiSkpSf/M7AZ/zRThF3enJEKLoP6JmTd1B1GnQLByqYU6nFmD8Qp2ayNfpWLdbJ+/3Pzi
	hNxYyIowbx10GHbdN5yyXJqMAZQ7t/nuzrNw2aiVe+GhIf2U0ux+da1bHrs5Z0uYSkw9kvJljuzWO
	EjZ+SiOFSqxfGUrtK3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhHa-004ZAf-0f;
	Tue, 31 Oct 2023 05:27:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhHX-004Z8e-2T
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 05:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698730035; x=1730266035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zSkOZ12TKc1wwVLKvzsXxeC5tl7G/J3ooSzJ/My7COk=;
  b=N5cdZ0hgK81PO6fcS0YQv6ZJOIXeeW4sdioA26ba+NC4Ei2xjz11xn4n
   3LlT2VXa7Jr0Cj29EVMWfXb1E4AWU7Z3cyuaOz1Y+y2UlZX8yssTyYWcT
   d4OK233it/fOLxG9VE21xZ+Q2bWnlcPLbX93cSycBaRHy64xSFyCEY9k6
   yjJAQOkeh0/eYau2eEr8QOvx0FvUeYDbFg6rxHUmg5F3y2bIjsrqArKFJ
   vccnruyRTmr8avIh09j8n6zwC7//k2K+0CoyUSptImjnt+QHWZZEhHWAO
   dwg1pnDdgQ+KiPMioCHvQUMtrNtN0tMXFFDsxcBOEu9TolUj5gTCJ267c
   A==;
X-CSE-ConnectionGUID: PIbu8/OSQLmLuwlEm2kgKw==
X-CSE-MsgGUID: 4ywV+5BdQyKhiYDhnoDz9A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="11483952"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2023 22:27:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 30 Oct 2023 22:26:49 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 30 Oct 2023 22:26:45 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v4 1/4] dmaengine: sf-pdma: Support of_dma_controller_register()
Date: Tue, 31 Oct 2023 10:57:50 +0530
Message-ID: <20231031052753.3430169-2-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031052753.3430169-1-shravan.chippa@microchip.com>
References: <20231031052753.3430169-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_222715_813632_670703CC 
X-CRM114-Status: GOOD (  14.33  )
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
 drivers/dma/sf-pdma/sf-pdma.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index d1c6956af452..4c456bdef882 100644
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
+	struct sf_pdma_chan *chan;
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
@@ -583,6 +624,9 @@ static int sf_pdma_remove(struct platform_device *pdev)
 		tasklet_kill(&ch->err_tasklet);
 	}
 
+	if (pdev->dev.of_node)
+		of_dma_controller_free(pdev->dev.of_node);
+
 	dma_async_device_unregister(&pdma->dma_dev);
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
