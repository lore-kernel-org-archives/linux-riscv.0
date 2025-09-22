Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F5ACAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfdwjeE3wWzOPFAWIvH0JPGs82taYu5ydS5Euqh3IW4=; b=pqu023pgmWwwjE
	tTOjOEIFW2sn20rer/Wn0JT1Q31wZadaS7yRo3RVkzPOwYOAsr/w3aYsX0+DzFHiw49rzq7c8G8hc
	AKh2Il+nlUmPNCyoDyxo5VjO50EBKbK2Kzm7CVJab0moK9H2QtgPlFBKIjBY/Vzk/TQMzhO2hBjH8
	oiiMa13mYxttb3GahYxVKTeHfOfBg3NRhyeePa2CyUEWH+apn7U+2kkH8AOBg2L0pwnVIvOQdGlzD
	OcdscX8iqhaM9sWiX9NGYEXiSQr+tcwQnlo+/naOCT5dua1UXmzJQBiooYdvgSZJi2FAbpMrelTnt
	rq9RtkyGCgSzWjXe4X+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hww-0000000AjeT-1ugB;
	Mon, 22 Sep 2025 14:55:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hww-0000000Aje6-0HMQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Sep 2025 14:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PLzv6fg3fqqkM8iKZ+L1jhNCwLYKzVSOP0OdN57SCX8=; b=gLRWreLqPHCph2A0TfyLvfiVlx
	SC7+vDxd6kJ8dEyedlpH1M4ppRlvsHGSnxmEDcEdv3UugU+0fLqZbWXkTDAyw+4xMBCwScFwgcNsu
	IR4Afw2zzyCs5rmlO2rrMEibE63NcWyZzWG8s9dUCYXLdft6RPirxJWRedusl0kgCfbBjiPzpdJl1
	hEbmLJ7Kg+LO8e8M8FNq7SUIld8Dlz4VFDearzCtjXsLVFzE+isQ1IVukAn706+OnkrawcQnItryH
	3zBPfIxxi1E5IoHKQbAwGrfUmxB/HQwSMdTZLeYCH/MfS0Gdi+kQHbREbFdFi1Ch9osze6Rv7zrVe
	X+TSgqUw==;
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hws-00000008KSl-3Ogh
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 14:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758552923; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C55XzlbDLCmFbDiqjupdn3RbRvL/2iczTfU27UwBI4plR6YtkuDjy/pabhffB6p8nXzsPaNB4wlXlvfTY3j74iiwho6OqUvX//euxnMw1kEia6d860xS+CheNziVk7cbaXlqm85TQdoBhr085pEXZ4f7EtI25kun7g5sAANIUO0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758552923; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PLzv6fg3fqqkM8iKZ+L1jhNCwLYKzVSOP0OdN57SCX8=; 
	b=RJeWA3DqZvG8gjVnDJJ290dMwFXazbC23ufhwfITvd6mlu4ppzwoZmIzFbV6quvzIxylKPtv73bEFAgoo2LTntxzQd2vguSKnRoqjCUeqNswjG6QvA3f4xaxZA1gwKEBwUVRiRT4dcx1GHDgX1S3VxZMapoUF9Dni6xBTIqCxbU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758552923;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PLzv6fg3fqqkM8iKZ+L1jhNCwLYKzVSOP0OdN57SCX8=;
	b=MkzjBf4fxvx6JK7eEAmxLrzmYFsyDwsopO+l8NiJwOrpaQYQkr8P0K8Wl6cylHAD
	p06iSvqcL0U0Mm/6G3xVU/f6ezlT7B3A5z1C7dcbVYOT5sgB1Wh6v0AquwAlXUrzSJy
	J/+8woSfozohZgZSFj93cspma7J6hH/mkftdPxhs=
Received: by mx.zohomail.com with SMTPS id 1758552920497610.5552985610591;
	Mon, 22 Sep 2025 07:55:20 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 22:51:51 +0800
Subject: [PATCH 5/5] riscv: dts: anlogic: add clocks and CRU for DR1V90
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-cru-v1-5-e393d758de4e@pigmoral.tech>
References: <20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "fushan.zeng" <fushan.zeng@anlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758552834; l=2783;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=cb7wy+ZwN39ONi58h69i1DPSVfww4xXrfbM+TXkw/WI=;
 b=buSBznMbOgHdkJQ7FZtYm3RCpZxmyXDsUY+oZXW+9KxaSJHF+RaKU0KAdU860IixMtuCCq3mH
 GvDkjS5Jr3VDxCDn3E9hmEHCWpG5kWwp9vZ8l7PKnL7HY3761+D2PZB
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_155527_356614_E8B2653E 
X-CRM114-Status: GOOD (  10.76  )
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
- A 33 MHz crystal oscillator as the main system clock.
- Two optional external clocks (via IO) for the CAN and WDT modules.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 41 +++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index f9f8754ceb5247d3ca25e6a65b3f915916ba6173..6458093dcf27afd640265aa07be9b93d6cb72f8a 100644
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
@@ -39,6 +42,27 @@ cpu0_intc: interrupt-controller {
 		};
 	};
 
+	clocks {
+		can_ext: clock-ext-can {
+			compatible = "fixed-clock";
+			clock-output-names = "can_ext";
+			#clock-cells = <0>;
+		};
+
+		osc_33m: clock-33m {
+			compatible = "fixed-clock";
+			clock-frequency = <33333333>;
+			clock-output-names = "osc_33m";
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
@@ -65,21 +89,34 @@ plic: interrupt-controller@6c000000 {
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
+			clocks = <&osc_33m>, <&can_ext>, <&wdt_ext>;
+			clock-names = "osc_33m", "can_ext", "wdt_ext";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 };

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
