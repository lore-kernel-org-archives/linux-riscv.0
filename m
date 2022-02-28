Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78830C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9Mv44Ww0I4EbmqoGAb1N+56k3px15OUE5q5Bb5vjSY=; b=wDkBPqW9eVJd4q
	2NUWMBBoOsdfB7aQSk2ZZ0x1VDbwgyH7UsbwwHvv0ruwGfAx80nzMMUG9iObM7aMaevOlCSMYFhTF
	vDpmgJzzbQHTCXgiocH1tiKKHBoRgE2QT/Cdy68/n1CnxjMT8Baq8G4IYH2nUXicXSHoIPz+ddtch
	ldBs8+H4A4QgsT0NhNNikixe+DdkPfibhhQPDpN9G81TAT9gSJuFMveo1cfDM4JDfdRqg6smSNO4o
	xm0Run2JmtcHvTp8/vofuRlczWyaS1bKofd2scDNMCQ/xOHbhkNa+OWoppyIVUPTUwIXUsTdSuGCb
	5vTuKNa4kEBRdH0CZA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOkI1-00Dd5W-O6; Mon, 28 Feb 2022 17:58:29 +0000
Received: from relay-us1.mymailcheap.com ([51.81.35.219])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOkHy-00Dd4n-JY
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 17:58:28 +0000
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 231DC20122
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 17:49:21 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 9ED98267CF
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 17:49:14 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id D602E2000E;
 Mon, 28 Feb 2022 17:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 3E3B62A378;
 Mon, 28 Feb 2022 17:49:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7fNPPvqKdGq; Mon, 28 Feb 2022 17:49:03 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon, 28 Feb 2022 17:49:02 +0000 (UTC)
Received: from edelgard.icenowy.info (unknown [59.41.161.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 3A4FC405A4;
 Mon, 28 Feb 2022 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1646070542; bh=LULP0zQ1ZvfvYvSVqa6XKbmkljj5l8VtkKiZl1WBvIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j5krynj2l3oFWH2XX0+o56R6rdO4tC9K6Fet3VAyOm/KrYj/an3u2NQphq0BQyAqg
 sJ+ACBugGcVBH/bRnFGq7uVbWOihxOty/50/A3U89qZSxYciouA2GhjTK6aT0tlhH4
 kPhxodzy3jG6Q1IVetSpFjZR+rGyfCMyH0iI2WgA=
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 2/2] riscv: dts: sifive: add pwm leds for HiFive Unleashed
Date: Tue,  1 Mar 2022 01:48:37 +0800
Message-Id: <20220228174837.602758-2-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228174837.602758-1-icenowy@aosc.io>
References: <20220228174837.602758-1-icenowy@aosc.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_095826_732558_4827EE2E 
X-CRM114-Status: GOOD (  13.20  )
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

The PWM0 controller of HiFive Unleashed's FU540-C000 chip is connected
to 4 LEDs.

Add them to the device tree, with function and default trigger set from
the triggers used in old kernels done by SiFive.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 44824d7e50ac7..2935719ca169e 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -3,6 +3,8 @@
 
 #include "fu540-c000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
 
 /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
 #define RTCCLK_FREQ		1000000
@@ -32,6 +34,46 @@ hfclk: hfclk {
 		clock-output-names = "hfclk";
 	};
 
+	led-controller {
+		compatible = "pwm-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm0 0 10000000 PWM_POLARITY_INVERTED>;
+			active-low;
+			max-brightness = <255>;
+			function = LED_FUNCTION_HEARTBEAT;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm0 1 10000000 PWM_POLARITY_INVERTED>;
+			active-low;
+			max-brightness = <255>;
+			function = LED_FUNCTION_MTD;
+			linux,default-trigger = "mtd";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm0 2 10000000 PWM_POLARITY_INVERTED>;
+			active-low;
+			max-brightness = <255>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm0 3 10000000 PWM_POLARITY_INVERTED>;
+			active-low;
+			max-brightness = <255>;
+			function = LED_FUNCTION_PANIC;
+			linux,default-trigger = "panic";
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x2 0x00000000>;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
