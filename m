Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7B4E7718F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 21:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aeJMqYowOJ1OIUPbJH9R99g1lZtcOrEfpqLMH6aAuY=; b=JvIaJUdxvNImDP
	DcBPCLkOqqaXixA5TAop5op4cp74NiNuVkZV4ZBpUO2JwqoxdF4W1najpBj+b+ttwfHAOJma13r+E
	zD+cK/yTPN4cVR8zCK01vYEibJAnsPkdHdOewNXaetXfLbflrTUoAhSx00hdwD+/QizdSwqF11zKd
	lOK3GStAusptcYxYlxBRNwrGYZmv/vpqZW/9/EB9XyMheSPrForp6rEu5fntBtHFRi3LlspPAB4og
	aEdUfLsmyzyY/Hfl/G/GnBXbgn5+D9ikj+vemEC6b5Wl6gnMbR/4TA55w7mlODfrcS7I/rKdaAZVj
	g98DcyPG92QdUAzJ1aOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTph1-0000000E4vI-1Rx9;
	Fri, 03 Jan 2025 21:58:55 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpgz-0000000E4uA-0G5T
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 21:58:54 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 92400122FE1A;
	Fri, 03 Jan 2025 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941532; bh=qZadH32Mxvg/KW2cNQGknLlppTgwQl/Gx8bFpQjBHnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWPzDNrO4SFci61Gxr/iWRSnlao8EM951VmLVApKkeL9xP7qZlqKlAa4VUqVzXjGZ
	 Evm0ehq/CosiLoOe/ogsyH2nfQVjrlu6fuBddpBGIdfYAF1Bf8hxLylhTfRGqTUk4v
	 4dgsdZfzahgDcn8kD5jkHKUF2c2iWMkTiWKsPdQA0Ryx7l5++diPamkXrdmiM7YXoW
	 7t4T96H2SlmLxTP3tb4UPNtdt9rhJgS295AlgPhQdyl4VdI/xUOPks4VmhgqD/+hud
	 BzabgTk6ryw0YfZ8xeeoc6t7jGmJQz2TOz/ugI/Ogee8eASocB4EcujhFQuCKXNIVi
	 vnLaJXtt48Y2g==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sp43EfecQ-BO; Fri,  3 Jan 2025 13:58:52 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.81.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 2483E122FE22;
	Fri, 03 Jan 2025 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941532; bh=qZadH32Mxvg/KW2cNQGknLlppTgwQl/Gx8bFpQjBHnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWPzDNrO4SFci61Gxr/iWRSnlao8EM951VmLVApKkeL9xP7qZlqKlAa4VUqVzXjGZ
	 Evm0ehq/CosiLoOe/ogsyH2nfQVjrlu6fuBddpBGIdfYAF1Bf8hxLylhTfRGqTUk4v
	 4dgsdZfzahgDcn8kD5jkHKUF2c2iWMkTiWKsPdQA0Ryx7l5++diPamkXrdmiM7YXoW
	 7t4T96H2SlmLxTP3tb4UPNtdt9rhJgS295AlgPhQdyl4VdI/xUOPks4VmhgqD/+hud
	 BzabgTk6ryw0YfZ8xeeoc6t7jGmJQz2TOz/ugI/Ogee8eASocB4EcujhFQuCKXNIVi
	 vnLaJXtt48Y2g==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v4 4/4] riscv: dts: spacemit: Add clock controller for K1
Date: Fri,  3 Jan 2025 21:56:37 +0000
Message-ID: <20250103215636.19967-6-heylenay@4d2.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103215636.19967-2-heylenay@4d2.org>
References: <20250103215636.19967-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_135853_145608_857129C9 
X-CRM114-Status: UNSURE (   8.37  )
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

Add clock controllers for APBC, APBS, APMU and MPMU regions along with
system controllers which they belong to.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0777bf9e0118..a2cd141f9177 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/spacemit,k1-ccu.h>
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -318,6 +320,40 @@ cluster1_l2_cache: l2-cache1 {
 		};
 	};
 
+	clocks {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		ranges;
+
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
@@ -326,6 +362,21 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_apbc: system-control@d4015000 {
+			compatible = "spacemit,k1-apbc-syscon", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0xd4015000 0x0 0x1000>;
+
+			clk_apbc: clock-controller {
+				compatible = "spacemit,k1-ccu-apbc";
+				clocks = <&osc_32k>, <&vctcxo_1m>,
+					 <&vctcxo_3m>, <&vctcxo_24m>;
+				clock-names = "osc", "vctcxo_1m",
+					      "vctcxo_3m", "vctcxo_24m";
+				#clock-cells = <1>;
+			};
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;
@@ -416,6 +467,52 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		syscon_mpmu: system-control@d4050000 {
+			compatible = "spacemit,k1-mpmu-syscon", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0xd4050000 0x0 0x209c>;
+
+			clk_mpmu: clock-controller {
+				compatible = "spacemit,k1-ccu-mpmu";
+				clocks = <&osc_32k>, <&vctcxo_1m>,
+					 <&vctcxo_3m>, <&vctcxo_24m>;
+				clock-names = "osc", "vctcxo_1m",
+					      "vctcxo_3m", "vctcxo_24m";
+				#clock-cells = <1>;
+			};
+		};
+
+		syscon_apbs: system-control@d4090000 {
+			compatible = "spacemit,k1-apbs-syscon", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0xd4090000 0x0 0x1000>;
+
+			clk_apbs: clock-controller {
+				compatible = "spacemit,k1-ccu-apbs";
+				clocks = <&osc_32k>, <&vctcxo_1m>,
+					 <&vctcxo_3m>, <&vctcxo_24m>;
+				clock-names = "osc", "vctcxo_1m",
+					      "vctcxo_3m", "vctcxo_24m";
+				spacemit,mpmu = <&syscon_mpmu>;
+				#clock-cells = <1>;
+			};
+		};
+
+		syscon_apmu: system-control@d4282800 {
+			compatible = "spacemit,k1-apmu-syscon", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0xd4282800 0x0 0x400>;
+
+			clk_apmu: clock-controller {
+				compatible = "spacemit,k1-ccu-apmu";
+				clocks = <&osc_32k>, <&vctcxo_1m>,
+					 <&vctcxo_3m>, <&vctcxo_24m>;
+				clock-names = "osc", "vctcxo_1m",
+					      "vctcxo_3m", "vctcxo_24m";
+				#clock-cells = <1>;
+			};
+		};
+
 		plic: interrupt-controller@e0000000 {
 			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xe0000000 0x0 0x4000000>;
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
