Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C17E776FD
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G61XhUzvNWnGyg6x4GfDryRvyhgqVwb6i0T2ILntLls=; b=yPr57vDXN/HI3s
	b1pFtcUcC3zL+fGEgo+8KpEu1HNUgixnvyFy4nOvt1ysZuVW+39oIM1jDnABwb4gBhQ8VlkmUivDq
	lcIbyn/ZcQSBqA4Inj3R1rCQNV4n/8fjFcAD6rnQSf3SB7TApsqdAw+Xq22FlWzPVpaK2R9MOdDOZ
	1R33eMjJaMxprJ2Tl8D3UCNoP/SZLIC/GKL1v4BS9irF1tu0lQ9k/tXGWrQJoObGD7GVOXVHNwu21
	1R1PqOXTxh9le4A3m1c+rZh3XcSbJS7zc4lXEYEfa6NBuvliUMSyC5abEAbfMFYBcfSL0RgOn3Jrk
	JS5Z/7WLJVI/SgFMi3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWv0-00Dm2y-2s;
	Tue, 03 Oct 2023 04:21:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnWuw-00Dm20-0c
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696306915; x=1727842915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGnYDVYlhxSOhgTr4iUbpKBCV4C+XeuVk7jPWfYQ5Os=;
  b=l3EqC9q5UkcflsMCFPMdOEQMzv2tspleMy1ex3ERDpAhBJZeJ1MPi/T8
   dc9hfjqcW4BU+7RD3bewxYnR3gBXCtGlB9GbXG+fWVNndU2RdV6/Sq+ey
   lMdDzptcqjFZ5lMh8w9ifB0m9Eel6eIZUBWv3f91j5rt+ZOWw13wQF1un
   lEAshkwIZu0HGN0FYXiSKNmBri871mPz74QPf0u1w+B682JyR3j0XS6bh
   HCfd2qQ7v9pxT+3bLhCCyVx8WISz7iTLZEy3PQoA+BK8s2JpDNiCHsRxA
   sNvilyg89aOw3ekJp89AUtOoMmWMTBRBOqnutJ2qd80wpscTvd+pVzsfZ
   g==;
X-CSE-ConnectionGUID: vej+VRO8Q1y2r3o3Bac/dQ==
X-CSE-MsgGUID: 5Ei/Ysn1Q1mgStJD23Cb0A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="238350717"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2023 21:21:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 2 Oct 2023 21:21:29 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 2 Oct 2023 21:21:24 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v2 4/4] riscv: dts: microchip: add specific compatible for mpfs' pdma
Date: Tue, 3 Oct 2023 09:52:15 +0530
Message-ID: <20231003042215.142678-5-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003042215.142678-1-shravan.chippa@microchip.com>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_212154_233066_AE8174EB 
X-CRM114-Status: UNSURE (   9.25  )
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

Add specific compatible for PolarFire SoC for The SiFive PDMA driver

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 104504352e99..05525d5c2c82 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -221,7 +221,7 @@ plic: interrupt-controller@c000000 {
 		};
 
 		pdma: dma-controller@3000000 {
-			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
+			compatible = "microchip,mpfs-pdma", "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
 			interrupts = <5 6>, <7 8>, <9 10>, <11 12>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
