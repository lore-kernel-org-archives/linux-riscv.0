Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F751C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFhJ1qpO2LZt46zLbG3tSYjNZqe5JEfliO9pS7GlhRA=; b=1SdgzU0OejL8dF
	sWbApysP11JqlzHd4FkdYCYxyTClVAHIVZR4ZuNUFqPTV4ADwIXIL1W/rXNW3eMmNzkyZX/Wg0hI6
	EMHRqbJu+NYotE938WfkWDDaVK+pWNXsJ2BNbAT31hyMqKVKo0h4ZraReCVT57hUkSyMq8h+c5LDZ
	H3EgvuhFTr0Q6Rr0tCDJI/XIIxi+nLNrVCRF90kORKZAr7zqM0G0X4my7jjypTGa9of1lGPFY/W0e
	qhYTQJSG/nSLCy552/c63j4pwYtbBwGpz8Cpqk3ltQU10ZFYfPp5VE4bqRuA0rZA+d/5TUTFeqdb4
	vFeTHs0Nf4NnAiVfG38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdHq-009hNB-Ld; Mon, 27 Feb 2023 13:11:26 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdHm-009hG3-90
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:11:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C629424E272;
	Mon, 27 Feb 2023 21:10:54 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:10:54 +0800
Received: from localhost.localdomain (113.72.145.171) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:10:54 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain minItems/maxItems of resets for JH7110 DMA
Date: Mon, 27 Feb 2023 21:10:40 +0800
Message-ID: <20230227131042.16125-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230227131042.16125-1-walker.chen@starfivetech.com>
References: <20230227131042.16125-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_051122_616614_8C73E59D 
X-CRM114-Status: GOOD (  10.20  )
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
so there is need to change the maxItems' value to 2 and add minItems
whose value is equal to 1. Other platforms do not have this constraint.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index ad107a4d3b33..4ed0a6b7ca69 100644
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
@@ -109,6 +108,24 @@ required:
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
+          minItems: 1
+          maxItems: 2
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
