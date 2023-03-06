Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EC4C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYjAy6sT+rxr2r0qjqkRfY+ywrQQBZHbPaODhiRqsjM=; b=tR+YdBiyRIGaD+
	Vh9KeujgyexvGC+dgHVAOHd7Pw7pf4ypOLN2iJYgHeQRfqZLG5MI0ViooOhwp1KfIV58FbqI5PAZm
	2iXKk0JwjT2IB3RO1sgAftia4iqXRFULsY7jMG8qG8/pWgJSBdq9zua2h3smHy/DrL/T89m8eBJLc
	05w86xfk52v3CA2y/CvxWlx49Qd5isMZxPofPLA8Ymf56cIMrtEoUgxEbyIZfoObLIiY2peBB0eB7
	zDR8oqk6la4xzQnHDYqgQj66xzK78jtY8NVlFn7toy1R9bjrjnkGljJmBPm++pdq9zcO126uJwGGr
	glMVj1BE/n8ixArt7BCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZD2c-00Df7k-Vz; Mon, 06 Mar 2023 15:46:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZD2S-00Df1E-Kj
	for linux-riscv@bombadil.infradead.org; Mon, 06 Mar 2023 15:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tm96vC0cWAp38E2vUsR62M/Y08UCJ4koumHkaqMkEkw=; b=OmuWg1kQYDzmwlN9HFfWEOglSG
	bQVYZ3HGT/XIzNdcUvIU3H+kFqsy42J58HhKc7dXq3baLY8VjUMMGGJhNngr8EXePDqLUz7ywkiMP
	wgaPCetAGQ9d5ev2R8qJQE9rEOBmO42bfYTxT4UMcrnT2/QuLMVxp/NDUtT+Im91GziCLRIyELv3V
	y/JDmE5JHW6dH8crgbeErhhsw1AaDDsQc4j2sZUIM0iTx8wOTvKMSmoIPROQfuguQMPCWKWZba5Ps
	9kY9LmqzduN2D2S7dvLwTQfk5NOCtWLu8rn3T2MeMV/Q9n3Qa58Ytgfa3okDrz/o4GfCCQ0yyNgH4
	gzQnPHeg==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pZBTE-00GhBe-2F
	for linux-riscv@lists.infradead.org;
	Mon, 06 Mar 2023 14:05:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2007024E309;
	Mon,  6 Mar 2023 22:04:43 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 22:04:43 +0800
Received: from localhost.localdomain (183.27.97.46) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 22:04:42 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain resets items for JH7110 dma
Date: Mon, 6 Mar 2023 22:04:28 +0800
Message-ID: <20230306140430.28951-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230306140430.28951-1-walker.chen@starfivetech.com>
References: <20230306140430.28951-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_140545_291669_58291E48 
X-CRM114-Status: UNSURE (   9.29  )
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

The DMA controller needs two reset items to work properly on JH7110 SoC,
so there is need to constrain the items' value to 2, other platforms
have 1 reset item at most.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index ad107a4d3b33..d8b5439f215c 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -12,14 +12,12 @@ maintainers:
 description:
   Synopsys DesignWare AXI DMA Controller DT Binding
 
-allOf:
-  - $ref: "dma-controller.yaml#"
-
 properties:
   compatible:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - starfive,jh7110-axi-dma
 
   reg:
     minItems: 1
@@ -58,7 +56,8 @@ properties:
     maximum: 8
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   snps,dma-masters:
     description: |
@@ -109,6 +108,23 @@ required:
   - snps,priority
   - snps,block-size
 
+allOf:
+  - $ref: "dma-controller.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - starfive,jh7110-axi-dma
+    then:
+      properties:
+        resets:
+          minItems: 2
+    else:
+      properties:
+        resets:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
