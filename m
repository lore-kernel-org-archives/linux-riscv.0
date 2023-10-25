Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D0DC25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWPFZSd5+pZQQHDiJSVF8GzUvWy0d3731tZSUD8yjJI=; b=hVtNIUTiW6Itkb
	HICmKobhy0iDRX2vkHIuxSBAUdH5zqGtQ8DH363V57guXNxLpoRrjGFXyVky5eoZLaof9xprEnFQZ
	5OG2oDQ6H0iF5NP3YPQsFqG2LXrfnWWPpPbnKSt49Rdcx31xCZTqYDjlHMWYrgdghXRcHVMRdv9Yl
	npdrzZxWFQoB+QVPJeT7lunG8ffQc6WlOYxksgeqptVX46QGRjnGfz8PyikS9Nf4KEKLarABKpaJ1
	ujJu802Kcv2jP46i19tlo0oKMcx8qiQsx3rXMeIfHUIYf7/uLgVQePkf4rnoGm7sRWMBLQt34B/Bg
	Zhh2kBSUO6481AKeDDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb22-00BzTq-19;
	Wed, 25 Oct 2023 10:22:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvb1z-00BzPa-1V
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698229352; x=1729765352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GfT80d/okzC6viedL9X8itP99mbYjg+U5fLBnEZks9k=;
  b=TTBBhQjSmM4jE+gKrucvyGRsYmMZezpwU2xJfe7wQ+hc4IMl3KV2MavV
   pjRoiF7IRwUZZsIkHRWzsA51trXb//Pp8vE+rYfuXFLaG/8gKurBAuF8Y
   jvRaN16Ilxj3sw9F42VIETYcuitz5S4GoD6Hgo3C1sHyQcv4X+YuJWCh3
   o/gHNz1hRkVF1L2Zf3QfhjY/fNNpvK7Ep0sTAPoKW0IgkLk15oSTnYb2p
   eteBJC4BEic6WO6ikUZTP7gCCpnTLd3hUPBmCCJ+xBamtJcAkslIRHv3p
   OEfEJVtNsHEobPgfQCk8Jm9nTP8DDewyG7OF7yP5/D/C5eMSupWco1PxP
   Q==;
X-CSE-ConnectionGUID: hCRWSLnNROWYEPYDprosFg==
X-CSE-MsgGUID: pAnaJDpLSHSLKPTJCWvjMQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="10660975"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2023 03:22:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 25 Oct 2023 03:21:59 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 25 Oct 2023 03:21:53 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: dma: sf-pdma: add new compatible name
Date: Wed, 25 Oct 2023 15:52:49 +0530
Message-ID: <20231025102251.3369472-3-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025102251.3369472-1-shravan.chippa@microchip.com>
References: <20231025102251.3369472-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_032231_516466_70FD5CBA 
X-CRM114-Status: UNSURE (   7.50  )
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

Add new compatible name microchip,mpfs-pdma to support
out of order dma transfers

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index a1af0b906365..3b22183a1a37 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -29,6 +29,7 @@ properties:
   compatible:
     items:
       - enum:
+          - microchip,mpfs-pdma
           - sifive,fu540-c000-pdma
       - const: sifive,pdma0
     description:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
