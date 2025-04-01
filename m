Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F136C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gOH1PszJtvkP9JQgh/RMngtntF9r5PqWxkqj6dcYy8=; b=iOUamX5vinMjZg
	g1/bsDAJiJoI1QOUbaEAldE/oL0Uxvdc55XDEPyFetIvrV1NOm3CWsRwP9cIl+T4NTztsllJ1FA7M
	T+mvmib/UQd1HiAjIMYtNpFsu6vaiwjuuzSGKqZWDnuC8l3lI5VdZ3Q9CIxgZukWdxaqFeTzegMIK
	1/P5DQkFgGN/lJ2V4eUwEiNlaCcnJEGZK8pXC+yD6V30uCPNSYk3wTen2UDDiNiPvBUn5tgyR/a5n
	QmU4hqRCzB+56HPAdU8v1yotNodQ46mxsbAnLM/Inzu9pttXHfylXeWU4jcPks1AD6KcfH5ZMRDKy
	t2U3oQbLGGAVekM8up3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfMT-000000040Mo-1SVY;
	Tue, 01 Apr 2025 17:25:17 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfMR-000000040Kc-0wij
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 17:25:16 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 5F373EC59FE;
	Tue, 01 Apr 2025 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528314; bh=s5+2LV5qzGfSoaUmOTmwclmoPaprfIhEiBb+RxjFEmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDhwXk1kPly4aQsdTaxucqzwaYqRaKqYWr42M1/GtGO08X/D+4SV7iTxPReMUzeRS
	 rZCVxkZjqXhY8pRzxWRfi86hUkNuwwJq9MZ70Y0GMqrT6Cmu52Ko8xqRGnfgfrrqOk
	 Dyh8BdhTPgr89s2dTlG7DzOmqvnSgXAHAgjpGtlH0uTnxjT+axDJjwX26IqrpNQ27X
	 bYlyhsET4DBAbBT13+7qfhi/VDNvslLFGdYG9sNgfHkPo4umxvGHoBgNvHDB11z/WG
	 RS1Jkz8wTA4bajupV//9oyr4uBfGijkyCqNUv07d9ZodKj+5ifGYkREOAZ++m+tPse
	 lbsptewU56now==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0Me9iEaze46; Tue,  1 Apr 2025 10:25:13 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 6CAA2EC59FC;
	Tue, 01 Apr 2025 10:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528313; bh=s5+2LV5qzGfSoaUmOTmwclmoPaprfIhEiBb+RxjFEmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5/9CbaxPA6XwL2l01itGIS6+X51kE8Ajg2+Zi1Hedq8IRKepquRDAGxVdSgL2OGl
	 r0lh2/8mqhWeNmb6r8WjtkEyv1RcG6HAqJsydIWAJXhXISoDop3kIscux+pg7PT43d
	 1/W7grTWu7S2UiW5mS0lJ/1Eg6BcPOd6HDTLjauy4vd/WoZYrLx0nEUceJ9UEi0JUd
	 kX6TAktlukHmLfPICTCRF2NVjbobJXl2ej/5eWoQqrrj1wCFaJ9St78slIE9sPcPL6
	 ZcGV8aYUdSqY1zXdYN0unNNkQpGDpNGQVAWSdDOZqPkTXPt7+TDG4vqUPUtVThl/vK
	 k2xpbpT3mnlAg==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v6 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT K1
Date: Tue,  1 Apr 2025 17:24:33 +0000
Message-ID: <20250401172434.6774-6-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401172434.6774-1-heylenay@4d2.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_102515_314391_964E9271 
X-CRM114-Status: UNSURE (   9.26  )
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

Describe the PLL and system controllers that're capable of generating
clock signals in the devicetree.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12..584f0dbc60f5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/spacemit,k1-syscon.h>
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
 		};
 	};
 
+	clocks {
+		vctcxo_1m: clock-1m {
+			compatible = "fixed-clock";
+			clock-frequency = <1000000>;
+			clock-output-names = "vctcxo_1m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "vctcxo_24m";
+			#clock-cells = <0>;
+		};
+
+		vctcxo_3m: clock-3m {
+			compatible = "fixed-clock";
+			clock-frequency = <3000000>;
+			clock-output-names = "vctcxo_3m";
+			#clock-cells = <0>;
+		};
+
+		osc_32k: clock-32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			clock-output-names = "osc_32k";
+			#clock-cells = <0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -314,6 +346,17 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_apbc: system-control@d4015000 {
+			compatible = "spacemit,k1-syscon-apbc";
+			reg = <0x0 0xd4015000 0x0 0x1000>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;
@@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
 			reg = <0x0 0xd401e000 0x0 0x400>;
 		};
 
+		syscon_mpmu: system-controller@d4050000 {
+			compatible = "spacemit,k1-syscon-mpmu";
+			reg = <0x0 0xd4050000 0x0 0x209c>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		pll: system-control@d4090000 {
+			compatible = "spacemit,k1-pll";
+			reg = <0x0 0xd4090000 0x0 0x1000>;
+			clocks = <&vctcxo_24m>;
+			spacemit,mpmu = <&syscon_mpmu>;
+			#clock-cells = <1>;
+		};
+
+		syscon_apmu: system-control@d4282800 {
+			compatible = "spacemit,k1-syscon-apmu";
+			reg = <0x0 0xd4282800 0x0 0x400>;
+			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
+				 <&vctcxo_24m>;
+			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
+				      "vctcxo_24m";
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		plic: interrupt-controller@e0000000 {
 			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xe0000000 0x0 0x4000000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
