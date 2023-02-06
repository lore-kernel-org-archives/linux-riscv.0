Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E725FC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYsFUEScOfj61I2lfpWWoHR8W0R3x/Fp45H71whQbz0=; b=AqDRKe7NMuLZlQ
	nKIfjnJlyJezwW/C1CfSwvRGeHn/R5uaD0m35AJEjYrlmWuyCn26shgV0RnfGJjY6tIZJdck1ilG1
	5BIbcfh63uqrQYxgHMclx80j/rxDF4Gq5aSU1qbMMdW6unHbDxPvuIPk5wtyswhCUMbusA+nouZpy
	UDsZCa8vT+2p1ztQUDAonOqZK+I1CcpVVdLTh2kXqcLRFIskNxfioJslL3dOw6tri5dBGCU16Ixsc
	XDum6/xca2qfyDGCE4KqATFJmYAzYbv4//wBauMSH2mGdvDjfasjgnOalZjMIs7ScSA7/crz9JTqp
	Q6aCwdbR4GC7QLhc+HLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzq5-008K8k-1B; Mon, 06 Feb 2023 11:39:13 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzq2-008K0y-EG
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 11:39:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D8FFF24E1F4;
	Mon,  6 Feb 2023 19:38:23 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 19:38:23 +0800
Received: from localhost.localdomain (183.27.96.33) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Feb
 2023 19:38:22 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
	"Walker Chen" <walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: dma: snps,dw-axi-dmac: Update resets and add snps,num-hs-if
Date: Mon, 6 Feb 2023 19:38:09 +0800
Message-ID: <20230206113811.23133-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230206113811.23133-1-walker.chen@starfivetech.com>
References: <20230206113811.23133-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_033910_665610_E293D801 
X-CRM114-Status: GOOD (  12.47  )
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

Add two reset items and properties 'snps,num-hs-if'.
The DMA controller needs to be reset before being used in JH7110 SoC.
Another difference from the original version is that the hardware
handshake number of DMA can be up to 56 while the number in original
version is less than 16, and different registers are selected according
to this.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 67aa7bb6d36a..1a8d8c20e254 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -9,6 +9,7 @@ title: Synopsys DesignWare AXI DMA Controller
 maintainers:
   - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
   - Jee Heng Sia <jee.heng.sia@intel.com>
+  - Walker Chen <walker.chen@starfivetech.com>
 
 description:
   Synopsys DesignWare AXI DMA Controller DT Binding
@@ -21,6 +22,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - starfive,axi-dma
 
   reg:
     minItems: 1
@@ -59,7 +61,12 @@ properties:
     maximum: 8
 
   resets:
-    maxItems: 1
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: axi-rst
+      - const: ahb-rst
 
   snps,dma-masters:
     description: |
@@ -74,6 +81,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2, 3, 4, 5, 6]
 
+  snps,num-hs-if:
+    description: |
+      The number of hardware handshake. If it is more than 16,
+      CHx_CFG2 is used to configure the DMA transfer instead of CHx_CFG.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 256
+
   snps,priority:
     description: |
       Channel priority specifier associated with the DMA channels.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
