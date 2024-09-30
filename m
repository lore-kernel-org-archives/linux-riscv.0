Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02A2CF6497
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUzRVvHesGTEMkCkTxPhFkBGEFADJapOeb8XYxAMH0w=; b=ntR2DLAf6xjpZW
	oVHwqNTORRKAXQnUrOta3BKWjHTefVMdm9+nxPGUmSGVC7lSutgh/5EIcDqwWEZc7xm0vYuhpdqXe
	vZ8rFUL1Zkl3JMzgsXMhX0I92EOVEIEztO9pgHBzwPVT56KOzF1tQ+Gahh738H+Dca62KftKEXi56
	Ay5OgoyMQBE5fWfvCm782/2BmjfE7UBnsOoQ2p7YhIgSiIYDv/UAGacZCN3gNFkASwkPBEvaJ5PD7
	GTQLSI3JBV8Nh0z4Fsk1WWuFb/3utSYe8GGRFAb+UVWKkKV/cNocPBnU+MXUuzjMueLwboQUYy+wh
	Mhris/1YoMsPbpIh+wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svENA-0000000Go7O-1Gdr;
	Mon, 30 Sep 2024 11:15:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD8H-0000000Gb96-19Yw
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690157; x=1759226157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F7eatHJ8LzhxtrI6xOGtT/HyBoEdBJlHgWoOpFBeduA=;
  b=x3R2DN14jiMwx/cncUn6lX1Hv6V0WpKAhHeMjIlZC1MdsCK3GNA9fs64
   fxvvtTZlGZeaZy81O/BqWCkV4KjmRNKZqEjm3MyxTraT5xw2oFe1WmPUH
   8a/xbmg/4XNlwbk009brWIWnrDjiNekcPf8M1pn8+rLdSKFzCzAZaVTxr
   wdx9+7oo60A5c3Ed7c3umpdmhRnJbsSKDD31XNn7bPnrPMtUdQNAfdsCx
   gqd06kE/Duqqsn2008rXxLY3KFzHfjjsBzJLbNV0AEkTnJDxxK2ipHQwC
   AMTKi4L3n7otiQ2luMXlwjAQISpvbMUbsM7iI1ruMbDW1y5ks1p+7av4Q
   A==;
X-CSE-ConnectionGUID: jBRUFo6rTUOCd1OoCerG2A==
X-CSE-MsgGUID: hy4ywz09RRaYz64k6j1n4Q==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32997909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:26 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:24 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 10/20] dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with driver
Date: Mon, 30 Sep 2024 10:54:39 +0100
Message-ID: <20240930095449.1813195-11-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025557_406448_B3FB3B17 
X-CRM114-Status: UNSURE (   8.97  )
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

PIC64GX i2c is compatible with the microchip corei2c, just add fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index afa3db726229..6ff58b64d496 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -16,7 +16,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+          - enum:
+              - microchip,pic64gx-i2c
+              - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
           - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
       - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
