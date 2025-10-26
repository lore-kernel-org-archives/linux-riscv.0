Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2F7CCD1A5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQZko3YE9yd02vMwz1QWcuxru1R3q894kNSyihG7FdM=; b=NRR3WI7nXIIhIX
	kTVGky7rciOceWQAUHIAzAmqC1xYUI8Osly3Zq1qI9FqElJ4LCAEYEXmTKElkjAmrMYwMYHEyAw51
	C82HokDwK6oPwgwnPtktwi0x3BGqRzGMYB3hUm1K12qYt6+1tqVTazCvn39dml/qiK4+VP7W1PI5b
	/Yt5BmyCkutFGcA+gtXfj2dSTBAsRCXkQQ1eg7ddZEQZlZVfqQ0uEaND84hN8UVHywpAWvCKkfvhc
	8v/kxD/hUCcXQ38iGH1PIFdrbXDjqHvL7P0vMY5PUOHXftmFlUSNdVgiYw+8RMzejrG7X+7sXk+It
	vljoSZLnGOyRXuGX9cDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1Rs-0000000COnb-2TcZ;
	Sun, 26 Oct 2025 14:10:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1Rq-0000000COmT-22aG
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 14:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761487815; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VUMJ2PMbBJzCB3lkTVcLR+hq9fAyqYaq4sAia6ivWNiZjnN0aKPF+NRuISl/SOcPMGQvNY8zEN3+VPIpWIzz5u9mUGGDdK7Tf4E240NgWqKRNzQAW+qwbJeE2v1hnMQqo5vdUUoBzzPWK7ev59WRPHvRajQsXvrthA631Y1thsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761487815; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eliORry44a7mPwhrGzCYhWX3lekfOrzJUK9cQoCUcTI=; 
	b=n27N1pkX/kkiKybg7rWP5Z1jKB8i+cqxS4mLc/edSqDNkQkLcF5i1CqYEOKrDU876UMfQfneD4mm7cwerxsgFq3heiqRdN1DnZhNwmzJoPsaW0LqvWjykNRONazS+fkIaXFSrb6kzRy1vLDo8RFMZ9zsOh/Kw8vBYUOwKjE28WM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761487815;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=eliORry44a7mPwhrGzCYhWX3lekfOrzJUK9cQoCUcTI=;
	b=ExrVb5+p14pRS3ti7Gyyonq9ISf/zVFRMKuC1LwY0DypFzFRP5VpLCoP1rsIp2ZA
	dT/UDwYGZ1R2wMkaSkA0FAb+PXMV64EB1XOSFpNr4BTO0ITilddsuP3SsWob/VJDIb7
	k96aeTdibxMrkvbmhUcxzNxqmrdXgSzykht5yTmc=
Received: by mx.zohomail.com with SMTPS id 1761487812789429.0882655822114;
	Sun, 26 Oct 2025 07:10:12 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 26 Oct 2025 22:00:45 +0800
Subject: [PATCH v2 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
MIME-Version: 1.0
Message-Id: <20251026-dr1v90-cru-v2-5-43b67acd6ddd@pigmoral.tech>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
In-Reply-To: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761487753; l=2784;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=yoJsOjGFvjODgrr4fqhQ6dvTgK03ghCyF/+Y4Q8LGcM=;
 b=6u/YbQzSJ0XQHj0dmGYfyTBzfl814kCdrEQD+24N03GLtrGKz6s7Yjb4fvbF1WWG3T4Pm97rS
 7F8O2/b90GQCWR3DEcxsEPNrLhvmBJgEzmUnS9UJ614Ds3zJKgI8bRM
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_071018_569462_CA7EB1F3 
X-CRM114-Status: GOOD (  10.26  )
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
index a5d0765ade3231ece0afbe8835d95cd918a44ad9..dc8358b3575124234f984c448547493d063e991f 100644
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
@@ -80,21 +104,34 @@ plic: interrupt-controller@6c000000 {
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
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
