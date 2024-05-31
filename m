Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54BAC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HSckg82H4+BYJa3SQWLJ9340EzjkkEDagOuMiZUJ8E=; b=bwYOP+798l5tEA
	i5HcCZdQ1vgNiDm/1gU5nC6G64saVE8t0EkFt8tny+JMLc7LCI3oJsZx8kZyTIwybNmBpOrKsAuJa
	NdOFXVfU0Ol4RByRIqnbr8Wd1PTlWg8H0aGbn5qE+OQztey5Tl0CHxRp682Wv9y6rSqJlgN0YdHC1
	GHYFva7M6yorbDAbqXcCUwyTCxCx22X7cA9Dl+nmZGU+VRH/5krwHi3GJ6xztusWhxdtnM7uunTYh
	27NDoMIGVxhW/Npdz3N9EVFr5ZnHotzjdEAuRNfIlZDbwH0Y/yddh4hK8UlUEwR2+KzFiXcq/RqPo
	Ox02XnyJR6ZSWmnq/bKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwKp-00000009Srd-2ydY;
	Fri, 31 May 2024 07:05:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwKj-00000009SqB-2kBm
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 07:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1717139149; x=1748675149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3Q+DafgQZOA4SgNWtOQ3VvYVuxk4kHrwKu95UhwRjM=;
  b=bkaEMbocBFD+9AviF3iTa/7V/UHPt6ytb0KtOsOzyFIkTB/eKeTA8aRj
   iMsdutTQPl2WKDSxq6JebJeto7TOUx7Ptu4cf57vXwVjaBQSr+zbHgMor
   oZGrPMpUP73cyVoKpAGXyYmT9PynPLhGGIuBW7C8KhqjOoSHI5U9YQU9t
   sGoF2i4TEIHeRfoTQG4XtZgJk+kYEB8tiK1C4k3tJVWG+2f00Qmug4oFy
   4NKElwRj/Eq3OSHQtug7aHsLJRmXW8cGilpwxpTHEaWTRszoGtRBKjMMo
   +D4ETrrf+c72FzoVuDhxBvMGgGd2Rtbkt625gK5iAjFsULO2BYg972uWC
   Q==;
X-CSE-ConnectionGUID: wTY4LIfiQwGiNFVRU5C2dQ==
X-CSE-MsgGUID: k9TrmQQaQdmMkLexubCwiA==
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="26795680"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 May 2024 00:05:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 31 May 2024 00:05:25 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 31 May 2024 00:05:23 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-usb@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Bin Liu <b-liu@ti.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: musb: mpfs: add ULPI external vbus support
Date: Fri, 31 May 2024 08:04:31 +0100
Message-ID: <20240531-fountain-plating-1d3739422a26@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240531-citable-copier-188d32c108ff@wendy>
References: <20240531-citable-copier-188d32c108ff@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=G3Q+DafgQZOA4SgNWtOQ3VvYVuxk4kHrwKu95UhwRjM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmRZU0ZO+v5P2xXYNYM7teUcGx6VXf6/4uqqCVTr0tFczw4 +PRfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZy9SYjw9bYL0s1X2rbPfmooqaxLX qzT9XjJ/ZPiu+dlVodOa2+rIKRYRrT6o963xue65rJ773y4tyShkN7W30PtIgd83PNeztNjx8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_000549_844228_9C125EB9 
X-CRM114-Status: UNSURE (   9.31  )
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

Add a property to allow configuring the musb controller on PolarFire SoC
to use an external vbus for ULPI PHYs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/usb/microchip,mpfs-musb.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
index c5e9ce2e7bc2a..27b909de49922 100644
--- a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -34,6 +34,13 @@ properties:
   clocks:
     maxItems: 1
 
+  microchip,ext-vbus-drv:
+    description:
+      Some ULPI USB PHYs do not support an internal VBUS supply and driving
+      the CPEN pin requires the configuration of the UPLI_USE__EXTVBUS
+      bit in ULPI_BUSCONTROL.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
