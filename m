Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA927E784A8
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m61PMCr0r8tMFWgMu+x6OLYSoHz5Xp8TWonU9u984NQ=; b=AqXd6avv4UURgo
	3HU+1PTdU91lmyza8NVl3LQPIyB7ggLVEIdzGzsQEYLVYy51h7UbUY1rWrIJ3gwbVZmJWUJ0X553y
	nPCMWFVB6vUbvM4pyfu5925jrwLBaFMyZln5t2gCBW4AXF6/tqLr99pxaERpE9eAveRTMzmjoYlRo
	9NbVpl2kKNy1znNJfXOJh0SMVGbdKHjdOfS8ctCWgyPHDYPnlgR97fSciqwPj59SR7/3+qrY+nRkP
	XpIJFlTsBonk7MSJJiJzgRlTpwQFCnebeAeCESUeYOQCoDFOfc2lb2BZiLFXcJF/jwDcPyyW6F0jH
	mrnhfpYsNaR4LpzTpsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWuQ-00DlwU-2c;
	Tue, 03 Oct 2023 04:21:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWuO-00Dlw5-0S
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696306881; x=1727842881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uk/EcBn8FiTIAxuCyH3yLDadwdTVKJxp1FqVVQmqg/w=;
  b=jZc5TvkgAFpbhOm3gTSux4iNJh2LGiwHOI0Y9XDp3ulPqSmBbSayEr9D
   TK/C07XbTGeYNehk88iS8yf2ct3l3h/QeYX5Dd0fjE/wzBKQNJyTGcEkL
   Ruuc4+GrayoH4SiLoWTrvNcT6h62Y6NI858XeW3p5V/CgR7WVHuL+kwzO
   GXQoMrvujiu5fqgE1n3pGMzEorTF3pyP3DTf0GP5n8YwDO1CnOBT1NnRX
   j1A9U4mYCp3S1OB6Y7gPX5wS/5HNNZUMJdwHP/tTxMk2liSxPOn44Kmnr
   IHhJ0wkVmEzUngeXZEFgRM5RFmdWybK/kYmK0FkYGmYfkQhVq3wCZ/JD1
   g==;
X-CSE-ConnectionGUID: ryNJk9XvTIqOWjKHHkWxlA==
X-CSE-MsgGUID: Ekm9/htGRBKlxh3uJwPLog==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="238350654"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2023 21:21:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 2 Oct 2023 21:21:14 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 2 Oct 2023 21:21:09 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/4] dt-bindings: dma: sf-pdma: add new compatible name
Date: Tue, 3 Oct 2023 09:52:13 +0530
Message-ID: <20231003042215.142678-3-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003042215.142678-1-shravan.chippa@microchip.com>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_212120_183186_FBB26AA5 
X-CRM114-Status: UNSURE (   7.37  )
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

From: Shravan Chippa <shravan.chippa@microchip.com>

Add new compatible name microchip,mpfs-pdma to support
out of order dma transfers

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 .../bindings/dma/sifive,fu540-c000-pdma.yaml         | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index a1af0b906365..974467c4bacb 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -27,10 +27,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,fu540-c000-pdma
-      - const: sifive,pdma0
+    oneOf:
+      - items:
+          - const: microchip,mpfs-pdma # Microchip out of order DMA transfer
+          - const: sifive,fu540-c000-pdma # Sifive in-order DMA transfer
+      - items:
+          - enum:
+              - sifive,fu540-c000-pdma
+          - const: sifive,pdma0
     description:
       Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
       Supported compatible strings are -
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
