Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE7ECD4F45
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NAeZA2R1n0YrG6SfcEajFvpUFSsAIkCfQr+TJ9ESUQ=; b=uW4gnTQRiJ4Av6
	mpxeM3b0x1OICHvHYqKxSqvSl6z3d9KF8Ta2Qo9NoJeK+QfvfFkwKOoZUeIpFIq+8PPAVGH3ut4xU
	gVEZgkuykW9FVYjwnr4J5vhbXl+AlYo+nE5EmM6BoB1ilNFCbPxhfVGSVdC8om4edkLS5v66Yad01
	JSz+ADOvhVFZ+xCLHQBcSyncte2ezHPds+HzaIiVn9umWCG1smM4+sTibXRBvQ8Ynj0sBFCaKCn6v
	ZbuS3dZ4XCypObf5gAZSs+uMES5n5Umz4u9wRsIwuiYvHjvB92OYXPFsS6KtFV3gLRfBeCeU0Gsl4
	Jt97+lgbGYMAxq/Kqwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcnh-008dT4-0A;
	Fri, 22 Sep 2023 09:50:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcne-008dSH-1x
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695376214; x=1726912214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lacmBtTBGbdaCOwsWzi6JZgwiP0fwtmzcKJKP/0c+uQ=;
  b=P4BwR1g2TmT8On9oCT+k30Z2KjVcq4yjnH/X5WrGk+E/EW6t8y1pzbfT
   8WEAjUYAo/6xgjRLcJr4kRgJ8WySvHxcZeIPBJQp7EPv6RX7KfULSlV3h
   oF33F/eFGSuGBcggm0XynPUik206kpI9ascdjx8yE/2TgSs4mmSVdKQEb
   VZjP4kvr0GA3i2t5eUeRUglG1MYlcibPdSuFIFb7omBWOWrS71+Cz/7uv
   jJAZv17VyDoKRSFcmkX9XMcBKiTHWJL5Uyi/khBygXgEa07N5iTx2Cbd6
   8cPDqDplZGh8r8sh0WsHhuiGYM7aCgDIp10svzKIiLv2kBI6kVNsgLR6R
   w==;
X-CSE-ConnectionGUID: fQsQIPFwSuS+RkzQs9lxqw==
X-CSE-MsgGUID: RZFDWMWZQ7qxjkETvSSgcQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="236602659"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2023 02:50:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 22 Sep 2023 02:50:12 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 22 Sep 2023 02:50:07 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>, <palmer@sifive.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 2/3] dt-bindings: dma: sf-pdma: add new compatible name
Date: Fri, 22 Sep 2023 15:20:38 +0530
Message-ID: <20230922095039.74878-3-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922095039.74878-1-shravan.chippa@microchip.com>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025014_653376_CEB350DC 
X-CRM114-Status: UNSURE (   7.71  )
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

add new compatible name microchip,mpfs-pdma to support out of order dma
transfers this will improve the dma throughput for mem-to-mem transfer

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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
