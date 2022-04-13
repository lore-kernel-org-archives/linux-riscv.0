Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfBprYxO1RXJdJ7HBo0xu5evucEHfKnl8CbZ8nXRiFk=; b=FCGARmtP88O8v1
	KJD4ZHV0bo7QMrk90zRSTuJPEQ2S/d7YuFv2O+OcvrN8MiMVo2doLKMuFvHkXpEFOOZMMYAY3Ur26
	r8F19fBdWhiVRiXGbVh8RwAr26j5lNRl910mzPZsGaWaFBAcjf/fUVyH7wHgH9owcQu3t6dhg5FLg
	hrV9xJM43WeEHI/7Ymg4KoJWCbld3gvplbcXWeIRjWrhHvoDAHwkFhncqfCO1s6J6UKhUr0/7BZeA
	fVgj3bvVztfJLwlILUEsWIMR+xxWqEZ1G6EexpzCaLPmO3jyor/OlKtVYNmteJKuOiJZL9L3xOjhe
	2HNvIkQvf8UFNekO9/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXxH-00HWCB-LM; Wed, 13 Apr 2022 08:02:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXxC-00HW5y-Ry
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 08:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649836938; x=1681372938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xn2MNOCffxx+tCEz7pBkbKKEsZdD+0DRzYY3aFgh6pw=;
 b=jmKfHoKXfD/MBOCDo1T9cNTgdcFcx1fJHCt8SIcr8pWvIvdYmV/U0bYG
 7bVrOXLOaEN+OHNNDPwMRMSiFutGkcsNDTsKfj2mk1vy63/PTck6YXXJ2
 KqFNQuEBZCR+QONzbsuzZS8Xo3HbvkoMdgaLXGP0B9aJJlapJIkc4l5bV
 cb/URCEina7CflDPVOgZnZb5Qovn5qA5H2x1XGK25Mk9jkwvR5UWewvRb
 4Xl7/IO7MskJcDqxzDTtvElUZtEDyHVIRWiLFgj/a25Wb/ZsTeroSx9l0
 sJUYU1KKEvOqL22tWZQ95n7pcPpvN713dVXPIP40iWdvCvh+yCTSD095E g==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; d="scan'208";a="160365366"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2022 01:02:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 13 Apr 2022 01:02:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
Date: Wed, 13 Apr 2022 08:58:33 +0100
Message-ID: <20220413075835.3354193-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_010218_933443_EA0F03AC 
X-CRM114-Status: UNSURE (   9.21  )
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

The rtc on PolarFire SoC does not use the AHB clock as its reference
frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
this second clock to the binding as a required property.

Fixes: 4cbcc0d7b397 ("dt-bindings: rtc: add bindings for microchip mpfs rtc")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml          | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
index a2e984ea3553..500c62becd6b 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -31,11 +31,19 @@ properties:
           to that of the RTC's count register.
 
   clocks:
-    maxItems: 1
+    items:
+      - description: |
+          AHB clock
+      - description: |
+          Reference clock: divided by the prescaler to create a time-based
+          strobe (typically 1 Hz) for the calendar counter. By default, the rtc
+          on the PolarFire SoC shares it's reference with MTIMER so this will
+          be a 1 MHz clock.
 
   clock-names:
     items:
       - const: rtc
+      - const: rtcref
 
 required:
   - compatible
@@ -48,11 +56,12 @@ additionalProperties: false
 
 examples:
   - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
     rtc@20124000 {
         compatible = "microchip,mpfs-rtc";
         reg = <0x20124000 0x1000>;
-        clocks = <&clkcfg 21>;
-        clock-names = "rtc";
+        clocks = <&clkcfg CLK_RTC>, <&clkcfg CLK_RTCREF>;
+        clock-names = "rtc", "rtcref";
         interrupts = <80>, <81>;
     };
 ...
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
