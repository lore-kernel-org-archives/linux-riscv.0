Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BB8C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydRu3Nq43bnN2rltkrfqn9JVDcSr3td3QDtvz0AOJ+k=; b=U3Z5i2bFIxdO3f
	hVRFNwTI4/4D+nNOSyFL9lLJWQjQpgjqCb4VhBO5ZxIEKO/TWjCBF+8cdsFonuk/xOhy5kU6lOKTe
	q11rD/XuJGVu0zhvutyiwv+fL/vX5OltCDzJyt1up6JPBQW94dgn1S1kNS3yWbAo2yLeoIVlEUpNO
	aFg+vh2dEW100C9WdB2VBT+H+viB9tX7w4mXm+aSK9xhliol7w6SW+xxn3csfVCJvjfl4m97t9F/g
	26Y/EZyqM/95TRGHQYHCp2GY9RD0vy6bZy9bUF/yM5YH1YAKttH5P4xHoB716ecTJtCV6aeqyfN2l
	OzOAk9PKWYj3viDDoUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev5q-00FWaS-0H;
	Wed, 22 Mar 2023 09:49:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev5n-00FWLf-0t
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 09:49:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A7B3824E3D1;
	Wed, 22 Mar 2023 17:48:32 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 17:48:32 +0800
Received: from localhost.localdomain (183.27.97.64) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 17:48:31 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v6 1/4] dt-bindings: dma: snps,dw-axi-dmac: constrain the items of resets for JH7110 dma
Date: Wed, 22 Mar 2023 17:48:17 +0800
Message-ID: <20230322094820.24738-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230322094820.24738-1-walker.chen@starfivetech.com>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024915_616324_8ACFD517 
X-CRM114-Status: GOOD (  10.16  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 5c81194e2300..363cf8bd150d 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - starfive,jh7110-axi-dma
 
   reg:
     minItems: 1
@@ -58,7 +59,8 @@ properties:
     maximum: 8
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   snps,dma-masters:
     description: |
@@ -109,6 +111,25 @@ required:
   - snps,priority
   - snps,block-size
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - starfive,jh7110-axi-dma
+then:
+  properties:
+    resets:
+      minItems: 2
+      items:
+        - description: AXI reset line
+        - description: AHB reset line
+        - description: module reset
+else:
+  properties:
+    resets:
+      maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
