Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C67C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31fmFNm/FVQc5Fxnn06VHTiIyJUdeP88JjfbkBtxX1c=; b=2MJN0fl3G7nm3d
	P04L00rzwwMByUPWbVgAnRQ2iI47Xbv9mXGySmMLZODu2X2cexb7au8mWV3w/GtJBXcZsQaWEJbsq
	wxsfD7PU+KKPlA6YjJwUKR6EINNx9c3j780DAuiJlmVoV64IqoxW89ZAWk2cdiLxcYF7wkI1nSPGj
	2Ls8NDdvJhhq3LtQJCwA515xPvwBNIC87rC3k9/101W78E1YmDuLoe5qIscYKCyDcvz4SyF9n5WjY
	ECYUW0V/YiWfzRqrvuKERFTQkcfZA4ZQ8Z36DaVtTv/S/d96EL0R7Syy1FEjka2lxm3UWZEXLE0LJ
	NnsGrOHnCDu1kKYKetUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGh8-00000007KdR-1XSq;
	Mon, 15 Apr 2024 07:24:02 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGh5-00000007Kbp-3vj9
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 07:24:01 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6e0f43074edso2045040a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713165838; x=1713770638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPRTTnRNGB6MC8MgLxeQqBqXiKf58UGvbzByUZNl4Io=;
        b=l8dwUpUIpXimpiyxyzH1sH570mH9ZWoMWvghid97IXl/+hlzQKvwSqTVctBC3IkJJw
         vvdWcZ7HGPfzG59l55eux0ySWguZhfGZEjFNA2V1lwsn46sGZPjIrVj6GuD/e4RmGUlF
         Z/IIlweY4+uhhGjm+le18kFdgJfOjIlUfHejJXui8dUQ3lfxsKA3b0w8byulV90GsJBy
         d6sTFukXKs9rDmGJhLm4K9+qau4S9rch5jsgWfjT4Ti9AsKOZg3biETngw41XBPMR6Vd
         HfNKc61ATJ0u2qY0me9B7/mEp6AbPDFE7j5hiEf9AAmEYCeMmnkoKbdC09pQoK7UerML
         q6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713165838; x=1713770638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPRTTnRNGB6MC8MgLxeQqBqXiKf58UGvbzByUZNl4Io=;
        b=DV6e4/FukJScG4TU7PLQyuywFo0FSyoFYz4feO0iu5agphdTxXXcNikp+Hh3K60ZR7
         Er2fLZ9UudboDVIoaksOc9oRLrs5kF4KCmkMX21m4CJeEfTfFeNuOptUCF8ZDDT7AFkx
         M9OmqZzNvQyKQ69Z9yc7Z8UUqnz4rVc3MAADiqsXZjnXXPBbkaEjgAkqqLbvEv4yuuax
         lQUqAVGLz3U10WHXLLHBYPAScua7Dlrd6GY2ECLwFVNRzxmK61FW1FDEFxiGxuMBSjuB
         RCwPSTSJyqYFhzCvf09/lk+b6LIbSpdyKx/7jTx05Orfc4mGTOO/l6utSm4b3Gjdb/Q6
         os1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFMzKxHXCTNBeZNVkNTAGPw56ZQp0xqLI2Up1WRa14Vfzxo1o/OyhuHJZH72+q3Wa1YXfmFzdCs+6GyFJyexUErFv7ZibUKFCJaS1XHLnb
X-Gm-Message-State: AOJu0YxoK5tjBzs29d3FlieGFTd8csMSfTdDUsp+m3c7LYBX9pe5SEVf
	IKKRh1bBaqXZMxv/IIzKLPrvp4tqCeseKAx9IJK4ijukVAYlc3mo
X-Google-Smtp-Source: AGHT+IGpiBBC2cEu8GRBC8tpHfBybNg/WOBaHwzCJMcCDFu3ggw2rTC6WE2uAyi3jpLUgBGTX0hePw==
X-Received: by 2002:a05:6808:2a7c:b0:3c7:a9b:74c2 with SMTP id fu28-20020a0568082a7c00b003c70a9b74c2mr2995368oib.5.1713165837810;
        Mon, 15 Apr 2024 00:23:57 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ku4-20020a056808708400b003c718601b81sm105519oib.8.2024.04.15.00.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 00:23:55 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v14 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Mon, 15 Apr 2024 15:23:49 +0800
Message-Id: <ffb589094e3a111dfbf1c8961e9d3f328d2b9fde.1713164546.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713164546.git.unicorn_wang@outlook.com>
References: <cover.1713164546.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_002400_022701_DACABF05 
X-CRM114-Status: GOOD (  10.59  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add clock generator node to device tree for SG2042, and enable clock for
uart.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 +++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 49 ++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 49b4b9c2c101..80cb017974d8 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -14,6 +14,18 @@ chosen {
 	};
 };
 
+&cgi_main {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll0 {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 81fda312f988..8aab027cf730 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -4,8 +4,10 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
+#include <dt-bindings/clock/sophgo,sg2042-pll.h>
+#include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
 #include <dt-bindings/interrupt-controller/irq.h>
-
 #include <dt-bindings/reset/sophgo,sg2042-reset.h>
 
 #include "sg2042-cpus.dtsi"
@@ -20,12 +22,54 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	cgi_main: oscillator0 {
+		compatible = "fixed-clock";
+		clock-output-names = "cgi_main";
+		#clock-cells = <0>;
+	};
+
+	cgi_dpll0: oscillator1 {
+		compatible = "fixed-clock";
+		clock-output-names = "cgi_dpll0";
+		#clock-cells = <0>;
+	};
+
+	cgi_dpll1: oscillator2 {
+		compatible = "fixed-clock";
+		clock-output-names = "cgi_dpll1";
+		#clock-cells = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
 
+		pllclk: clock-controller@70300100c0 {
+			compatible = "sophgo,sg2042-pll";
+			reg = <0x70 0x300100c0 0x0 0x40>;
+			clocks = <&cgi_main>, <&cgi_dpll0>, <&cgi_dpll1>;
+			#clock-cells = <1>;
+		};
+
+		rpgate: clock-controller@7030010368 {
+			compatible = "sophgo,sg2042-rpgate";
+			reg = <0x70 0x30010368 0x0 0x98>;
+			clocks = <&clkgen GATE_CLK_RP_CPU_NORMAL>;
+			#clock-cells = <1>;
+		};
+
+		clkgen: clock-controller@7030012000 {
+			compatible = "sophgo,sg2042-clkgen";
+			reg = <0x70 0x30012000 0x0 0x1000>;
+			clocks = <&pllclk MPLL_CLK>,
+				 <&pllclk FPLL_CLK>,
+				 <&pllclk DPLL0_CLK>,
+				 <&pllclk DPLL1_CLK>;
+			#clock-cells = <1>;
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
@@ -341,6 +385,9 @@ uart0: serial@7040000000 {
 			interrupt-parent = <&intc>;
 			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <500000000>;
+			clocks = <&clkgen GATE_CLK_UART_500M>,
+				 <&clkgen GATE_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			resets = <&rstgen RST_UART0>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
