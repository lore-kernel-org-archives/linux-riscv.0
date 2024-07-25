Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F94C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnIrTrmxJ1Xn/Tr9IR8ZJ3fGGKjQvZx+cWwQRtSdCE0=; b=H9GQrk0gjjgLoo
	GYjKh8V6gPm290TSUC8Xp56z7K7/bRCE+i+KVmbVRh+C3b4rFtB2VCIp5slQr4nSxa3djCZK57FXJ
	4jqa3FmWvAXxJqiM6CP6yK1nsUdJ2k7y+m2U2M63kAPfw9kCKsY5+2khe2a4fUdelyBs5uunKcwh0
	iUF8jgi5OvKXxqgRJSvu6hfImGKCDfbpGiUZyy4t7xXTI79AQdnDQp7Jv8p1Cdr9FvgjVJSFZ7LdW
	AyCzosnBmalD76v6sB4DKq5xR0JNPxVeBXLdxenEfFarc9n63+mBSdzdgFD8myY5aADbGUedkAQvU
	GIjv78tmd56U+M3xwcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYZ-000000015m0-3UuV;
	Thu, 25 Jul 2024 13:30:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOx-00000000sMt-04Qu
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 12:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nwMwB6olbuH56QA6PbvNJlQSpV4mps0KFxNUoR7uYss=; b=pFatf5LxKp5T+1xaPF2ZqPzFOJ
	ropGPPlcCmr2nCeZ7IjbMwdh+Eoce/8fREBIqw1chCLbdCSsSzW+d51Hv2v6g80DWOS6IcXVnJ0rL
	ubWcCUutD+wHR7cmnFTK6O+yMKe95+JIYfZztp8oBWQyKPQdYeZ/qtg0R4z2VhgD1Di/UGGN61Wqs
	UhqIAUdwCoUK0eyYQ2vGwMKE5vO9oPdKbMfJbF5axUBvKcXOeRY/9NX5x1IgrPoD6z9DjuDmreoHI
	DkVkdNqEraLZrPeVvesO6S0scnOTBJjHzKdzJHjs0U0GpY3f59al8mgMKSJqgTRYMr4QHEc43uE2a
	LkZiPk8Q==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOs-00000003zzi-2X2r
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909811; x=1753445811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/iFlJVgVNMjAyvZbdlWZH31ro/rYnKrZRjv+0TbNhEY=;
  b=VFx6qUDf4Z/D8Yg+snD9dUQ9/sib3uZws1LQW3PgZyTfDsno4VaccoTV
   ASi71jQEF60iAbZr/hVLx1dRqb00tpjBDfwkG976dEbz9NtgC7fNx6S0E
   DOt9NlHUcTlS84Iw8bd3BSFifO2reTv/HvluTJCX0O8Jbs4MnQTy5Aqmc
   /bR7Uy0xnoA1k1cgu7NgcvNtWflYuF8GLFyFq8f4pYTXnUqeEWMNhSaGW
   R6LFNkrMZIaTblMwnUKucGT42SKX2pY2G0WBV7k9v2Q8vt8W2FXJq8zb4
   t1N0vzfMOW5rYGp7wmGwhOt3oO+tlVkpuXG+MqAhwI8u/kINfy3KgbWe/
   Q==;
X-CSE-ConnectionGUID: 73d5wsqqRUGsXcUpyIWy1Q==
X-CSE-MsgGUID: 6l13QotSQ0m9lhZr3PAqtA==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="260575367"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:28 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:26 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/17] dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO compatibility
Date: Thu, 25 Jul 2024 13:15:57 +0100
Message-ID: <20240725121609.13101-6-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131651_874924_309A0E16 
X-CRM114-Status: UNSURE (   8.61  )
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

PIC64GX GPIO is compatible with mpfs-gpio driver

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml       | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b..fdce88374a91 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -11,10 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-gpio
-          - microchip,coregpio-rtl-v3
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-gpio
+          - const: microchip,mpfs-gpio
+      - items:
+          - enum:
+              - microchip,mpfs-gpio
+              - microchip,coregpio-rtl-v3
 
   reg:
     maxItems: 1
@@ -69,7 +73,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: microchip,mpfs-gpio
+            enum:
+              - microchip,mpfs-gpio
+              - microchip,pic64gx-gpio
     then:
       required:
         - interrupts
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
