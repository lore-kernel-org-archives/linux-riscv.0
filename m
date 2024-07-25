Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D11C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9RTH5mxczgPYUQr/0+s2sxhuDSuZoIUPI0f1Njex1s=; b=Dz6c6jiB+GCu6Y
	Gi0c7Kk9N1mrvTpPfV3UWqljOU9nxaCGKC+5DXEpga5Z8R8Zm8Za0kZJwsq22g20rmr0FABGTBvJg
	Ruq/XUktDTXWufrujHWtJnl0MFo/njdTeGFCs0ODz9vn7vm0K4cxcE6zUyidJRMrk2ZWoOzeNWCjH
	6yH4cZgEhsMC08fz2xjMfRgCHAqc0/5UhxOHyYOS1cKVwGD0Q3BgA9eaOnrXfa/Irvd1ZxUj4Wpzd
	NujyW0AMWyUlxjtHloE2UMfp6F1fmAYod5ELPuAAidHGd6ArbrWLY1qIg5thPP6cRS61Slq+4snov
	0Kv/jArJOEaJ/QEyVuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYX-000000015jv-0uAl;
	Thu, 25 Jul 2024 13:30:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOv-00000000sLd-13m2
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909813; x=1753445813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=15hyDjA6CZyVRgtJnFulDkwlNePq5xuT1A/C4/KCaN0=;
  b=SJ6R+nLiUQEctX9bHgugg9uK6zMoBqz9lLr+mYRYyUbQDqeqbYt9vXj+
   p6wWl09tfusJU+D2ybU/TWdMu23lSsLpnsOCSnPTwIUyqNi266TdiGhmU
   ask/7Jlo+M6k3UOY9oXskubQ5+DyyrS9jka9CXKnTvjwtvYE/v1gE2OlJ
   xVD54XkT2duQZHnGTSZORwFxlC6jZmOeLS3i4k5/Oa2aTxkIeSo7JBAV3
   PCQ8DC73uUIG4Bi1O0bsaaGQj6MlP65MVLyG5twKpuJCCtR6uzGXiOgIx
   S4otEbAy2K4swf7Ff1ROnThbOOhBQ2aWpRBBgkY96zXz/1L3DhPTYy7PC
   g==;
X-CSE-ConnectionGUID: 7H0adE5mRmid6ymnvkB3VA==
X-CSE-MsgGUID: NS1Uot/LRn+ZUzEjPoqsLQ==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="197092683"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:43 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:41 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Andi Shyti <andi.shyti@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 10/17] dt-bindings: i2c: microchip: corei2c: Add PIC64GX as compatible with driver
Date: Thu, 25 Jul 2024 13:16:02 +0100
Message-ID: <20240725121609.13101-11-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_051653_429485_CA6E2D68 
X-CRM114-Status: UNSURE (   7.63  )
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

PIC64GX i2c is compatible with the MPFS driver

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index afa3db726229..4ba8a27eb8e5 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -18,6 +18,10 @@ properties:
       - items:
           - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
           - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+      - items:
+          - const: microchip,pic64gx-i2c
+          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+          - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
       - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
 
   reg:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
