Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1BAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMBXrWMBKgtFegYJ7MzkOw/cCyH8ghBgVhRMz9yvPes=; b=Re4AszK7pvL0tR
	7Xzufw0id01Mcfs9FEdsALTIHOJcGHakY21TWv/nxgAXyD/Xsj5Bh7HyVZKYWWwRwryzaPdtS+4gV
	M9Dub74kZQhxkKJelLFWrQu2SGGR9tk+XxCWjg8uQf6hC3rSWZl0I8NGEhMmQsKJFulcLtv0VOQh6
	fb4w7+pZ/qIyCuWejiY2Wqq4r+qjPBbOHbxI89Hjwz0QNKlzy7oqjisuAFYrfZ72sQ6Bpkd+oF8Xx
	dv54s8hrhP20z7jpMO9nCBb9LoYf15MvMHej7HV27r5/XHlVonu3/laife5m4Neh8MYRMGRFHjOlA
	/1VcUz2eciZ6cfzXPnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4MA-00Eq7n-6I; Mon, 09 May 2022 14:27:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4M5-00Eq3t-72
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652106442; x=1683642442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mc2Taz2Uq37+EmsM3ldlpIeLPVFcDkpSC0F+9vGxpFM=;
 b=QZBnXBNFrY5rGP3At8p+V+uoprNEIEoyLDQXd4XGPtQrx3EY02YaTD/Y
 jguFeEB+2LNU0MRHYSnGDIXEmM41WFVSaZgRoImhg2pIyn1kHuUNp02MY
 8eRDb8PKgbQEc7VMtDBh6BpeDJmIwC1m6oSMGscI+T4QDrm2Mx4wAtbce
 83Q2bo3u3ogN146PTMCxIW41fdCBmbAw/rofGcUkScb5s7B5u26fbHUgv
 JRei7KGLw8+zhVwnCM+Rc1IDcj3qqzMC0y9R0czxlihI8/mTa6GLheDn5
 mZfgTmcdoiWE58lkSjO26lHhp0Z6e9OjtNLZ9C0HdxswAnpsvxevD1OZP w==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="162858698"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 07:27:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 07:27:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 9 May 2022 07:27:01 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 06/10] dt-bindings: vendor-prefixes: add Sundance DSP
Date: Mon, 9 May 2022 15:26:07 +0100
Message-ID: <20220509142610.128590-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220509142610.128590-1-conor.dooley@microchip.com>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_072721_292603_020EFC0C 
X-CRM114-Status: UNSURE (   7.29  )
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

Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
high-performance DSP and FPGA processor boards and I/O modules.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..1d47a38c2a2e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1197,6 +1197,8 @@ patternProperties:
     description: Summit microelectronics
   "^sunchip,.*":
     description: Shenzhen Sunchip Technology Co., Ltd
+  "^sundance,.*":
+    description: Sundance DSP Inc.
   "^sunplus,.*":
     description: Sunplus Technology Co., Ltd.
   "^SUNW,.*":
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
