Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232F4C52CD9
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8eDYS8OWvSoACHBh/+/1+N1dZM0mIiAcHORNptVNQo=; b=JVfPOLl2RgfpCA
	5GGVxl8AbRd1txSWadb1qlFgxcBdTS7W45Poaqr+JLgH3H97XSMXzIh5oJvUQlSRyiZvLV58DUDL3
	PGNEHUzQKbbzFEp87GJlqHXTXiMljpRJkG+PqPy6141d2MHYqdozMKFoauf4rGxKu297N5l4CDF4r
	scReehFvW68R4rvePZqa9Z6oOBOzV9hL7Ikzzeh6N6+je5A93rd91weCOllcEn/ELBPhbIEcReOE6
	eWS/h5CCA3G2nPSKjnF9gsa4hbej67RqQIJ1i77rETPWPC5U9nbbJAnPa796VSRL82al4dqlcUH0l
	AXZC+Tp+qFcqpwm/I2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYW-000000015jI-1Iiq;
	Thu, 25 Jul 2024 13:30:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOs-00000000sLd-3p8P
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909810; x=1753445810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nLkCuTBPfpbqNBH1j3e2/aPI6MfTBWdislcAckUBGL0=;
  b=LKMoy54LXZJp1IFic4pqbWz12qr+3BuFabkmEOFpvwN+oPx7nb5fYVy5
   opL47YyYHiLQinp06GsfxLWgD8eE/9qipZjNlP4t/AfI9OXk+CBeC2wNq
   +HKCeClcO6PkWyBAKPtz2sRbFdBQV0QU1CjsO82KQpqxoXh+vXUc8pkM7
   aadWJEfurCCvm3n7bUmFOAdiEHVpubJdmyD8QLgRpZP/qcfpDz/psONmk
   DeOJ9Uv8eSqU/+YOv7zhZIxDCaxylxq+gg4SL8Ww6nBW3Zs24uKA5v7jD
   opNIr+1aprXIX07Dubp9BzItRmmMDgxE8ceFkINe3XL7RflcAsmYArtLd
   A==;
X-CSE-ConnectionGUID: 7H0adE5mRmid6ymnvkB3VA==
X-CSE-MsgGUID: QB6OQBHnTN+Wj2m9Fj8muA==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="197092682"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:40 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:37 -0700
From: <pierre-henry.moussay@microchip.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>, Green Wan <green.wan@sifive.com>, Palmer Debbelt
	<palmer@sifive.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 09/17] dt-bindings: dma: sifive pdma: Add PIC64GX to compatibles
Date: Thu, 25 Jul 2024 13:16:01 +0100
Message-ID: <20240725121609.13101-10-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_051651_094506_3B1CE052 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX is compatible as out of order DMA capable, just like the MPFS
version, therefore we add it with microchip,mpfs-pdma as a fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../bindings/dma/sifive,fu540-c000-pdma.yaml      | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index 3b22183a1a37..609e38901434 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -27,11 +27,16 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-pdma
-          - sifive,fu540-c000-pdma
-      - const: sifive,pdma0
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-pdma
+          - const: microchip,mpfs-pdma
+          - const: sifive,pdma0
+      - items:
+          - enum:
+              - microchip,mpfs-pdma
+              - sifive,fu540-c000-pdma
+          - const: sifive,pdma0
     description:
       Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
       Supported compatible strings are -
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
