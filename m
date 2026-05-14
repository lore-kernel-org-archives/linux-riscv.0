Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE32CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifW6muatBG+K3n6a5Ke3gOgfI5N5JxH198MwZlhguRw=; b=LD7v7uNjrxje52
	4S2Hrn8PGP9TXnZLGDRG8apB231oRJSD9by418jc1t7sZILOvYzp5P9yB17milZqb6A9Qf+IQFFLf
	WMiEsL3mkU82iRtxBcEMSug9rrz6MJlDlJkiFOQv7zZVTVIdlcMvbnNz2sJhqjLcawphOixYMpqeP
	kn+nAqXuZ1yv+29YpgxhIB1VCyHPEk5fJHdW24AFE86SLbutLGZo3VsImgHLaFafEMTQY2E0bU53Z
	HipstH2BLEYWZISzb4cV8aLQ6dymHVbresvjt2dyWUliQt+lIpm4v1NDpIMWByRagMcfqggz1Txv1
	GezSFKHgiLNbK6swHgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSNG-000000053u8-0XPL;
	Thu, 14 May 2026 09:28:58 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSND-000000053sv-3Qmz
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 09:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778750932; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PRQ9IptQNpfrOWHz6AHa8/wWmrDMrn8X59lvw24cOyN+neQi/3G8zxWNJ3IILYfrFIydywEN1Yu/beyAfclUxh5pZJL5kQ4ea3e//VGms9Pn4x5ZKdDyzdSODEBYGANNTS3GpvX+u00KEOMRybhNEEaZ8Bv/ae6vbB81BTtnTqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750932; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Eabchh9N0E1D/S0bkZCTAhPgOlaO6Vwf3F0+rWhR0Q=; 
	b=S8Izf4ELi4W6M4eurZmnz9mVBoDfrHhBXYr/jjyql/aG5i6OFbgc7h1Xdkibq7/XK342+76hOodDweNbJlXQRQDuxrGGVsNR2GlFK530bHX9DVdC6Uzsdkw3Mw+4jt9zgbkErkwYoqONSTCEXXYPe0tv6tNIbd2Q7ie/KLyLwRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750932;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8Eabchh9N0E1D/S0bkZCTAhPgOlaO6Vwf3F0+rWhR0Q=;
	b=o47Bvq77cjZaeWzk72AL/GU7Vmdw3AMPhmys5I6dtzNhOrtrqC0n56AwpMWKG43n
	gT14793zrQpEFPFqpqNN8wk2xChbNc4gkj5cNSO4Ra93IVE2Ju4pD8cCkGCTmqPb3NP
	ByTqU7m6E4L59AXKKJDqp59vqXgy5fpQe2mVdRGQ=
Received: by mx.zohomail.com with SMTPS id 1778750931462697.6278371898064;
	Thu, 14 May 2026 02:28:51 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:21 +0800
Subject: [PATCH v5 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
MIME-Version: 1.0
Message-Id: <20260514-dr1v90-cru-v5-5-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=3292;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=eIpyAVYU/GO0Xd5JaTDqfJlrG1CSuXkafJ6v4JOY3TY=;
 b=Wes30KbXAJ5MR3vT+KB+6Vc5vOYzqJL/n2KiDUns/Kz7H1iLtpFd0yf9O80YatYCp/jWUJDwx
 8IQxH5Y9+zYCkKFkl1+x0ZBdrRUYehq9V1zFOIJ4xfntjb+p5KUm0iJ
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_022855_891537_4F5FF509 
X-CRM114-Status: GOOD (  10.89  )
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

Add clocks and introduce the CRU (Clock and Reset) unit node
for Anlogic DR1V90 SoC, providing both clock and reset support.

The DR1V90 SoC uses three external clocks:
- A crystal oscillator as the main system clock.
- Two optional external clocks (via IO) for the CAN and WDT modules.

The main crystal oscillator frequency is board-dependent. For the
dr1v90-mlkpai-fs01 board, a 33.33 MHz oscillator is used and defined
accordingly.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts |  4 +++
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            | 40 ++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts b/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
index 597407655efd..af78f1a4eecc 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
+++ b/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
@@ -23,6 +23,10 @@ memory@0 {
 	};
 };
 
+&osc {
+	clock-frequency = <33333333>;
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index 9fe183f5f5c8..574c6608aef0 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -3,6 +3,9 @@
  * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
  */
 
+#include <dt-bindings/clock/anlogic,dr1v90-cru.h>
+#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -40,6 +43,26 @@ cpu0_intc: interrupt-controller {
 		};
 	};
 
+	clocks {
+		can_ext: clock-ext-can {
+			compatible = "fixed-clock";
+			clock-output-names = "can_ext";
+			#clock-cells = <0>;
+		};
+
+		osc: clock-osc {
+			compatible = "fixed-clock";
+			clock-output-names = "osc";
+			#clock-cells = <0>;
+		};
+
+		wdt_ext: clock-ext-wdt {
+			compatible = "fixed-clock";
+			clock-output-names = "wdt_ext";
+			#clock-cells = <0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -81,21 +104,34 @@ plic: interrupt-controller@6c000000 {
 		uart0: serial@f8400000 {
 			compatible = "anlogic,dr1v90-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xf8400000 0x0 0x1000>;
-			clock-frequency = <50000000>;
+			clocks = <&cru CLK_IO_400M_DIV8>, <&cru CLK_CPU_1X>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <71>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cru RESET_UART0>;
 			status = "disabled";
 		};
 
 		uart1: serial@f8401000 {
 			compatible = "anlogic,dr1v90-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xf8401000 0x0 0x1000>;
-			clock-frequency = <50000000>;
+			clocks = <&cru CLK_IO_400M_DIV8>, <&cru CLK_CPU_1X>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <72>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cru RESET_UART1>;
 			status = "disabled";
 		};
+
+		cru: clock-controller@f8801000 {
+			compatible = "anlogic,dr1v90-cru";
+			reg = <0x0 0xf8801000 0 0x400>;
+			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
+			clock-names = "osc", "can_ext", "wdt_ext";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 };

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
