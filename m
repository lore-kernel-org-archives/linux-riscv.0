Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215F8C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niqn1qO1aEo8FG0ssqFiN6kiQGhs60IO6oeMuxShNSs=; b=t/gM8zBRyBhEQ8
	dN42qNgUKCjdIj+R2EUIFQ8DVK+aaNO/Yf50NGpJfE1JvzZxQMHArLEdyPkh251k8pV//LdbkHAOv
	dWqdG9hPsrFlSq0gj7Llq6H4Mv9hkBs+e8Ldf75kDnqd/KwvGwhgQmiKWA6uDIuKNiFWbBR4oMkXK
	OvvhBYlWFIwuhC+tU5Sw41aToFooAQSt6NcjwE0rpLxKH2GpPQDShq3GFFejV+sXzHv8b0pWI1u2u
	hZ4f8THCG/iNya10cix7Q60dLISIp8WaecHSeF9GaIyROIrjxQ4x3hTbAQWRbHj6h8BMKN9ARxz3H
	jFYdSqF6XBbrluS1HN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpvt-007icv-FN; Mon, 11 Apr 2022 09:02:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpua-007har-NU
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667640; x=1681203640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jzOIYNYNhAToneZv7qBJuMdldALMuXoxK2qI64H4ScE=;
 b=RVCaju8Z7V3OrsWwKn6LjStYY0TLa3agAvu9JVLQYuwaTgpSZ0eQ+HoD
 3IxlUTWq4dwAcXvPvpGAoJhoA3I5+W4Gj7TuVMfdD1mf2vyESP90vOD06
 1ZXPv0a/ZueBAQePaEEOVFzM8C7JkFHVLydW0A5uN8XbuL+HKzeb1upXD
 2S3hBKYN/YYz0V2HIvSIS+1llfBem3JYWyFryHMSyMzfowU34r37AUqS1
 Y/D04OjWTwgcC40Iebbh9Im43EjodA9iWV4/aSkv5vgLvjSh6/+0lHN7t
 UuodB8oZEp1x1OjKSy1dTr1h6qzsljgIvCm+mPiP1halypRcGHR8Eydno g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="155112972"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:34 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
Date: Mon, 11 Apr 2022 09:59:14 +0100
Message-ID: <20220411085916.941433-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020040_882206_6A26929E 
X-CRM114-Status: UNSURE (   8.67  )
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
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml           | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
index a2e984ea3553..1ffd97dbe6b9 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -31,11 +31,18 @@ properties:
           to that of the RTC's count register.
 
   clocks:
-    maxItems: 1
+    items:
+      - description: |
+          AHB clock
+      - description: |
+          Reference clock: divided by the prescaler to create a time-based strobe (typically 1 Hz)
+          for the calendar counter. By default, the rtc on the PolarFire SoC shares it's reference
+          with MTIMER so this will be a 1 MHz clock.
 
   clock-names:
     items:
       - const: rtc
+      - const: rtcref
 
 required:
   - compatible
@@ -48,11 +55,12 @@ additionalProperties: false
 
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
