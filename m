Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6C3CAC582
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsrPNCYvcS4M1qDVQ9rkpuxciR4sGvneoEUry2dcuV0=; b=1l/JGPnQ1KSFkk
	NnsJLzo/Zef06FQMxfEKRdzgHTuVqs2jnbn3Q1S53HsLP38oa2v4IJM5n+JYcaq5COXMS1tLsxClz
	DIO/qY8e1uAKqV9QWulq+agDe1xBDOuZ3sEDxdYualU+Hitb9pHUUfcmXfNH0RnmbmkSbe9h3nhLZ
	0+A9dTDpmMBKXjSHerCLVP7cwhyQh5VV07zKRWLBOSNbJjULI7MrAdWZHY6sSVmhspZnha+XPCNqq
	bWxa1P7PQMn+hCKzOaLK5i0ksQWqkK3QsLDBFmMnOdDQkn96XYUJ0GUfAmDn8boDRUh5FHHnC+7Yr
	S2FMkOcOPrv5I90ywSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbP-0000000GaNO-3m2K;
	Fri, 05 Sep 2025 03:59:07 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMru-0000000GMxA-1l4D
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 03:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757041870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ksWutTO0TtS5DYJLCjkiW+wC6H2QgVZVZuubvkBjzA+HIKoJ22Ugir1m80gjTqUhNpjmNw/4nYFZboDxmyBEOso+C30UUBPsbFXXgKA0fPxDefiW24AnGkzpHDoIHJ62FSbvR9/SO8SQUH8xEbokpRqXp0UDWvSWp7mMw0TnNaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757041870; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uk8p9LgpPoAiawj3uNhnu3nSqrQyd8EhyLBL85bAStc=; 
	b=TdpBWSOxvUTjDrdIQy7jWBJZsb8yBzFz0u0BrTf6eNNVeWGcRNH633ROGXCu3vsOoWtQqX6ghKEsl0poE3HMILvB2bOjOiTWen2y21OylK9jWeL3G1LLueTsmqthRxD6zCz0UHves6hqGs9Q11CTyBfiHmmc1Fm/CSk9ksG26wA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757041870;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Uk8p9LgpPoAiawj3uNhnu3nSqrQyd8EhyLBL85bAStc=;
	b=COJoE5XErMBk7Dl3r1pFbsURzfVwB0SK3afeopbOWxuHvKkHgH/M9I/1lb+oIpsQ
	p8n7SdsgEuX3Gl/f3HYAaP4LCT3I9urzOQfcE6L641KiR/IEmP3S1KTxeZmco2ZQglu
	OpAZJ0jqY1cUWtuvvFAnIcgTBTtFrLokSmjbNGsA=
Received: by mx.zohomail.com with SMTPS id 175704186761279.84924659089779;
	Thu, 4 Sep 2025 20:11:07 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Fri, 05 Sep 2025 11:10:24 +0800
Subject: [PATCH v8 3/3] riscv: dts: canaan: Add clock definition for K230
MIME-Version: 1.0
Message-Id: <20250905-b4-k230-clk-v8-3-96caa02d5428@zohomail.com>
References: <20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com>
In-Reply-To: <20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112276577ccf8d719803bae221d170000e4a2f0f6d1a916dca3570b2a7f21aceb757966839b3fa6f20e:zu0801122701a422f97b014ef830e02475000029498c51bd643567388fd60c02ad428e9d5615e9872e392baf:rf0801122c42ccd4eaa044255146e9f1930000f8a47fdf7daad49f2f5d957350efa4cbe59ce2d2602d942a58f8421da691:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_201206_530389_8FDE8E10 
X-CRM114-Status: GOOD (  10.12  )
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

This patch describes the clock controller integrated in K230 SoC
and replace dummy clocks with the real ones for UARTs.

For k230-canmv and k230-evb, they provide an additional external
pulse input through a pin to serve as clock source.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230-canmv.dts | 11 +++++++++++
 arch/riscv/boot/dts/canaan/k230-evb.dts   | 11 +++++++++++
 arch/riscv/boot/dts/canaan/k230.dtsi      | 26 ++++++++++++++++++--------
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
index 9565915cead6ad2381ea8249b616e79575feb896..cf33a5df9ff520a0dbb408864e615f61a115b673 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
@@ -17,8 +17,19 @@ ddr: memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
+
+	timerx_pulse_in: clock-50m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
+
+&sysclk {
+	clocks = <&osc24m>, <&timerx_pulse_in>;
+	clock-names = "osc24m", "timer-pulse-in";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230-evb.dts b/arch/riscv/boot/dts/canaan/k230-evb.dts
index f898b8e62368c3740d6795fd1e3cb0b261a460ac..24dba44955690e01e53f11d6720e60a81a9f435d 100644
--- a/arch/riscv/boot/dts/canaan/k230-evb.dts
+++ b/arch/riscv/boot/dts/canaan/k230-evb.dts
@@ -17,8 +17,19 @@ ddr: memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
+
+	timerx_pulse_in: clock-50m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
+
+&sysclk {
+	clocks = <&osc24m>, <&timerx_pulse_in>;
+	clock-names = "osc24m", "timer-pulse-in";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..7868cd4c6c9e9d82c9271f8585a71b67738d1ca7 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -58,11 +59,11 @@ l2_cache: l2-cache {
 		};
 	};
 
-	apb_clk: apb-clk-clock {
+	osc24m: clock-24m {
 		compatible = "fixed-clock";
-		clock-frequency = <50000000>;
-		clock-output-names = "apb_clk";
 		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
 	};
 
 	soc {
@@ -89,10 +90,19 @@ clint: timer@f04000000 {
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
 
+		sysclk: clock-controller@91102000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x40>,
+			      <0x0 0x91100000 0x0 0x108>;
+			clocks = <&osc24m>;
+			clock-names = "osc24m";
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@91400000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91400000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART0_RATE>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -102,7 +112,7 @@ uart0: serial@91400000 {
 		uart1: serial@91401000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91401000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART1_RATE>;
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -112,7 +122,7 @@ uart1: serial@91401000 {
 		uart2: serial@91402000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91402000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART2_RATE>;
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -122,7 +132,7 @@ uart2: serial@91402000 {
 		uart3: serial@91403000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91403000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART3_RATE>;
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -132,7 +142,7 @@ uart3: serial@91403000 {
 		uart4: serial@91404000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91404000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART4_RATE>;
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
