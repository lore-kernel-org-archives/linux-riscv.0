Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A189C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3UsyZq91i79YqjDRzQpDaQm6CEhifhtAh/cFYG8bws=; b=Y0EuJ+SfmzzsWc
	BgG9Zl3FnONVy0LHFfY9a2EhOwk78+yWGhTxPT+anTPHDKAZ66uBwzUf17ilPtbHknRF2ZIGAYKk3
	OuG0x2SDxAttVs/YK6tHIpagaL6+PWNxfd6/7lit9cu8OvJFrExbpopNie3Z6hjPv47Nxgj9nt1jy
	72phTr9S0VWsvKRG7Cr12qL3FVcBVhQyFq9toaCbRyiFbTGPHQTzIxVnwupnPJk7J/y4c42b0GE5d
	ns7+HtGBZQ+glJLJdvlqPasVLS6Sm5gx0as9BPHI+vWq4ogi8NSOCjI9L1jnfBFJ2eXDByT/+NFCn
	RJzXjrgEyTHH5/GaJdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpkM-0000hk-LM; Fri, 08 Apr 2022 14:37:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncpkH-0000dt-9T
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649428673; x=1680964673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RVSiySLuyH36Oge4rtu7xhraomGEeU6vHquQBOWopMw=;
 b=rvva9Is8riJL6jI/klLavxEASAdY8hsmy54wGjv9vb1EbBFZERNS7YQ2
 mb1OIB1Kxlfv77BlsKa1OEH2xWMotdL26zYcIECBjOoirdmSexZbPQb8z
 Kp5JBoBso5GSIL5DhKB1Cviq/nkdmySq+lsB5OBXvOh/OjHdqCY976lbZ
 0VBzAODBCu8cSDpp78DzM5sVbLhQQRfRbO/3FV5qXGyJXXZbDf9YRxcBB
 fHW6LIwTQVv9VyDeCj3SYxqarVGuP9DK4m/1s24JeJ95gswuJgKnDq6dY
 SKm5DFlxCrqi78D8W9fofHR+eOMAHu436ICEI4OvQERa6EZeEL1PcB2QF w==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="91773250"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 07:37:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:37:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 07:37:49 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 3/7] dt-bindings: rtc: add refclk to mpfs-rtc
Date: Fri, 8 Apr 2022 14:36:43 +0000
Message-ID: <20220408143646.3693104-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_073753_427154_0679737D 
X-CRM114-Status: UNSURE (   8.25  )
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
