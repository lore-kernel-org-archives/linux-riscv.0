Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDEEC52CD8
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ymWw6gPDSrpDy3RfJB2w6Jm4Ko/efx1uI9CpzvFoDE=; b=tkuRN7rDtW37Su
	qWopCvbnRZYLGTkaZtpceeBNzQP1SmLOTFmAe5zj1YbK0k6hSozwGxNQN6DYLPQtHm1MytRADOPpg
	vHEtCvDcVOj6B455gXLsqOP5SpdJNyx6p45fO4MV0vMc4W5gqwDZ8wsv3FD7yHTTrrhXtyEfeLTMy
	HKHO0cdbQ0CYPNF56YrjqFlApy2wrodG3rkWmf7zfaQlr/ILoIBMOv3PYSa7N1Ah28McyhvsxISzh
	REn/cdWBDV6wjyQeA4T5IoT9YiiL+SuLf9nZWN/S+3AmXLQVJdUboLju8XqvTWERTM9aWBExoXxmJ
	Fa2YXrCzkAfiaEYaSENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYV-000000015i4-0Zr9;
	Thu, 25 Jul 2024 13:30:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOt-00000000sLl-0wo6
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 12:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y6MV5C00CmjZ99IbHWbY+BkqzJa7EKQ9kpXREhThYEk=; b=RHLSBiayXqcmuRhiPggTu39u63
	w4joIcpz5ZabHFzGwZXJR28BnE1Kk13Sd9Na1CdpGhaGG9dCMDE+bxPD3uSlTQZhqUkseSD17cCzh
	k7IsB0cfpPzmeEo/p70ODXFQaK08oLL36hQAjnbaN3SY4kWCr92PLfSRxL6Ia538bl4LJXDr6atg4
	GwBZqV54cmv9mcd98tTcaoaWugJO81NUhKjbGeBExnNb1e/bzJd0VyhbHnBVxBmiwjlmEnxUxrRyF
	rm5n47vyjKy9w0QtVq93DQXL3syh3kmRAOiBx1yguRtHBonIb+A7iEZ3m0eFkm4ENKCUf0h9Fa28L
	CuOtjyZg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOp-00000003zzi-20rp
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909808; x=1753445808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6HsXb7M+wbgz7I/sJCXA/59Pc0L4VBtPFzakf38tsso=;
  b=jhrHHwDB2LoxxfIBUlmnLAueg/AZLz+OKTckoJFQGXsVpZPoULG899TS
   DP+diZJ78OWHhvGLcf+MT9nAskxEB6+D75+nbl6xW6kGwLqSo4pCiNZed
   veoGT81hTUg8J98G7/s1P71rYjx88pGsSnmYxKqHKSjVwz1vWQWHwFI2b
   TpijuEXQ3P740ub2ZalLrdkvk98CsLlELUUECNdsePekWsj8HGrC13Fe+
   cBvUY75MHZZC5rnhMVIMEADo3wxRuDHPlWkDwbicRBVLzr9foQltT06rk
   x2WavD8EXMAZ9VNydTa7JAFq/kIcJzI1CJ4C/G/qUCO5t/fVXXhsKZy9I
   w==;
X-CSE-ConnectionGUID: 73d5wsqqRUGsXcUpyIWy1Q==
X-CSE-MsgGUID: AXpXTgm9Q0S7uDZD5lGWEg==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="260575366"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:25 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:23 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 04/17] dt-bindings: spi: add PIC64GX SPI/QSPI compatibility to MPFS SPI/QSPI bindings
Date: Thu, 25 Jul 2024 13:15:56 +0100
Message-ID: <20240725121609.13101-5-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131648_280991_73766FBC 
X-CRM114-Status: UNSURE (   8.19  )
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

PIC64GX SPI/QSPI are compatible with MPFS SPI/QSPI driver, we just use
fallback mechanism

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/spi/microchip,mpfs-spi.yaml        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index 74a817cc7d94..4c9a7f1ade50 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -20,9 +20,14 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: microchip,mpfs-qspi
+          - enum:
+              - microchip,mpfs-qspi
+              - microchip,pic64gx-qspi
           - const: microchip,coreqspi-rtl-v2
       - const: microchip,coreqspi-rtl-v2 # FPGA QSPI
+      - items:
+          - const: microchip,pic64gx-spi
+          - const: microchip,mpfs-spi
       - const: microchip,mpfs-spi
 
   reg:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
