Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9415CC6FA90
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 11:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+uTiNJoIO99aCv6n40QiBU78qvNqHtPWO/pC2DGui0=; b=ERSDIJe04leDkB
	ftW6W0a16zLzAgP5GmSF8rJURr2rh5cCaFMSNWVsevop/vTxkzggq+hAB6oNjIIwVwDj7JIsZEoJR
	1SOL0Sx2gfV46uOvBk1aJWkPwlbSpgsH2fVMoz/AFib98N6o9MGL6u5/lZeLu07hIo/uu6eNF/Nrj
	2a+FYVwWK4O9gyQJ2b+XxHwvpVcR5l5SJWTo+nuRnsHrakRnTT9yDuN4Kq/r1hgrkI/rY7nmokfXN
	M3rQLdTmua6pJzry+gdfxbEnh5Y1yecwh8Ye5+HxFoj2KDxPSAmWTJkIeGMzpvooFxlGrFnZUteHf
	fMqTUtZrvi6JgWBAR/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9VI-00Cfgm-IU; Fri, 16 Sep 2022 11:27:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9VC-00CfcT-4I
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 11:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663327641; x=1694863641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHwrhdKNh2gRti7y/1xovElw2DRB4M7uCFirk9to6l4=;
  b=NaZKhn0+xVWt717BQRZwEI6WLa+/3V1MbzyUojPfOKSyQh8U4pId4Ppd
   YFESry3KC+LHJMcIsfVTiKdobU0Ob9zMC4ohPvSW9bEbd/qUy8g5NnAnv
   U4lPrT+J/P7JS9SVs6F+w64ESlrbtD0OGDJQNa/05j/fKSkoE+Ylu0rJk
   PsR6l8tsBoSj9lcq3GDv+3EavzKixMP1BRo/FBh2XB2aIXHlSA9cadkDw
   JVq4hf9scw1xWd3ZXCaHuPT3VutJE21X48DIvWc+oMg0vQ5+qacvLj1en
   GFaGZ6z4XaVGsYHO40BK18QIOAuBLC3VR+SLO+iN2FM0eSuzY4+qevzw8
   w==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="114001485"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 04:27:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 04:27:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 16 Sep 2022 04:27:16 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 02/10] dt-bindings: riscv: microchip: document the aries m100pfsevp
Date: Fri, 16 Sep 2022 12:26:38 +0100
Message-ID: <20220916112645.567794-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220916112645.567794-1-conor.dooley@microchip.com>
References: <20220916112645.567794-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_042722_300210_68B6792E 
X-CRM114-Status: UNSURE (   6.84  )
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

Add a compatible for the Aries Embedded M100PFSEVP SOM + EVK platform.

Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 485981fbfb4b..630f82c85a0c 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -27,6 +27,7 @@ properties:
 
       - items:
           - enum:
+              - aries,m100pfsevp
               - sundance,polarberry
           - const: microchip,mpfs
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
