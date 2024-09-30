Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D641CCF6497
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8eDYS8OWvSoACHBh/+/1+N1dZM0mIiAcHORNptVNQo=; b=YN0uNPl9SLbiPd
	o7w4q6VrgtnOVACYtdvYJcctRQyQWpeeP9Bm315Tg2T2r6B7QA8Le94DY0ZiRVu7SbAwFmLbMDUz+
	HhctpfR0BWsPQWQLBih/Ud/G7k+uZSb0V002uBPstkyEQQmA3TLsTIiZ1ljb/oqxOSR5BFT//3Kjw
	6NiSzwz48XXo+T0od8YYnR5Dy8lDE9KR/07xrnQan8kWdJ6sVc3mQadm9a3HJdndArliPB58v4SiQ
	IaKg+MY1ztZ96fCZi9FBYRa+ZdlNl9Y3AwqCtz0oHreSRRlmIx9A2wzpYOsy1x8h3CTRWoSHSwLd+
	8vWBm/fK0FWWQe7bwscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHn-0000000GeHa-1E6d;
	Mon, 30 Sep 2024 10:05:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD83-0000000Gb3Q-05WR
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690144; x=1759226144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nLkCuTBPfpbqNBH1j3e2/aPI6MfTBWdislcAckUBGL0=;
  b=LLP+xO270XxlHUzs1CsL1qgE9Yg/D4XcRCUZfIK+D82YF9n/ZxLkzMZN
   dp6DIC+cwh9ww+pfIRcdBa97Ve1Myt6AoU6RNDkdFeoNLTZ9DlAhwzy5g
   IZpt4+/fCAGmi+vSwv6qEgWmTihKj5uVG/MpqdYGUGCGTfd3/TBYc5Hzg
   5tmpsR0VFY8NWdhdFzEHl+Wrx0JJadXjRmda2+4dQtjJVvX/htCPrW8YD
   IWcKAM7e0HLmZgi1PmAojB6WKf30uO1SSQAw9q7rcpLzBlvA4VdmwyqEc
   zk4kJm7/rTr7z0u7ZLkChJP+S4GW7qJhxA8z7hSwYrInXjXEfXE4y5mqC
   g==;
X-CSE-ConnectionGUID: VDfGPtv3TTmpuSmsWgS4Xg==
X-CSE-MsgGUID: VdO0X8l/Su+LpxXBcz6CqA==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="263420168"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:23 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:20 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Vinod Koul <vkoul@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Green Wan <green.wan@sifive.com>,
	Palmer Debbelt <palmer@sifive.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 09/20] dt-bindings: dma: sifive pdma: Add PIC64GX to compatibles
Date: Mon, 30 Sep 2024 10:54:38 +0100
Message-ID: <20240930095449.1813195-10-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025543_104440_DF206901 
X-CRM114-Status: UNSURE (   8.30  )
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
