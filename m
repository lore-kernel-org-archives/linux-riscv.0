Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F00AC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 05:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWPFZSd5+pZQQHDiJSVF8GzUvWy0d3731tZSUD8yjJI=; b=NbDypLSGqh+AYk
	I7OpbpB5etJqL1pTRdOAOUNOlNC5PE5CUrcgdBscxRkOn0bG2e5EoyXozpFXhS7vrtlKkhfP0VGdr
	6/x3cmkmxgIEe+OO3bQFVCGVYpZAlLReogHldeCMzlw//xnGPbVmPB8FY3pdMIFdzdiaTrc3kyN6M
	xSbD33bofkm5JSFFLrY05iI/YbkXYJe62WOcDy8ZGlDUttYMe80zu0U1sOGqks0aOhWLgoQG9TEUH
	N3+x6rd1Mm8BH8pETKWFbZvlqR8jPnXbg4YbaM84DGXYTFBrfHoJFYBGpkO3MPMZ+mW8dLGDWQEuZ
	SV9DXxpcuzPZFeOvrvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhHV-004Z8l-1a;
	Tue, 31 Oct 2023 05:27:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhHQ-004Z6o-1P
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 05:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698730028; x=1730266028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GfT80d/okzC6viedL9X8itP99mbYjg+U5fLBnEZks9k=;
  b=154zDygyEkSeHZBmbyt/S1IJxNKqkJYNgSdQV+OyttxytmQmhypLohLW
   c46BYC/Tz4EoxQrbhsK6J/D27OEd5IHSQhhnNs66sSLP1tkT3mhFys9qX
   ncS50Nb5yNmX7RgtJqlhj7fISyVXFN2yl4HXnFsRk9ZVQSsRUAjLODZaO
   2+zOrqWpGfVVsjMvG5613i7jGdSvJY9ulW4JKen+7SussQesLGUwyAleo
   NBXXuClv23Mu83R/iYHLSdXeK0qEBhiNm9f91sgAf352sPz8MZCj7RJ8/
   Cz6SZ9wzrglcxHIkYG0MPm7P5TdOZhl1Xu1pViuWlvpDqdf7zvy/Sz/69
   w==;
X-CSE-ConnectionGUID: chmGaGncRm67Nps8P+k0sw==
X-CSE-MsgGUID: HNDa8IaYRmivNAZCf8863A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="10872649"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2023 22:27:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 30 Oct 2023 22:26:56 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 30 Oct 2023 22:26:51 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/4] dt-bindings: dma: sf-pdma: add new compatible name
Date: Tue, 31 Oct 2023 10:57:51 +0530
Message-ID: <20231031052753.3430169-3-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031052753.3430169-1-shravan.chippa@microchip.com>
References: <20231031052753.3430169-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_222708_544783_FC04323D 
X-CRM114-Status: UNSURE (   6.54  )
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
