Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3208C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2KIl5NHZhIgwaERmu2RRgSwQ1+Osw5OUH5NU4p0lVs=; b=b2SgxRAwTuocKc
	imn2EMo+kR4voYgjeUiFnQ0/lfBt/fmVTiNk951/LuHcwzc/e6N4MlcCoYWQVuq9OlGO849kG405Y
	UthoqaVkmUkUZWLa/5X/g03OKJaPo0VLNAYdogmjhnZd8TbG3CUPE+Ci1OcbT/uFEFs+PC+vgodjA
	KR1rQUvfoXgUQQztt0aGggxPLRMI1ZJYwvPHF3fBR9pcAkYfLTPTrB4WFcem77Qj2eNInpEBBSYq0
	0f6FHegiYI7b39fQZQU3eGy9tU5Wh4AwHPhjNha5qKUu4rXtZImIQUHLqPE7A1/B3qPoyJ50Ukghc
	qoSjSAo9ppahjN2Rgr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnGY-0000000ASr2-2IrE;
	Fri, 02 Feb 2024 06:43:10 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnGU-0000000ASnd-3GWj
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 06:43:09 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6e132fef7baso964115a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 22:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706856184; x=1707460984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW7ioWygsib3qTGH3bCtwZFbfdrDyw7qBL154vPbYOU=;
        b=eszE7XhbjjhTbck+C/aqxVM/dzL00XYuxdLdQnyyjvUvHeYEGUqdoXBfL3s2pN3uwu
         Nz9mQ64M+zn84AhlUU59iIGPOGPCA2wEYhk8c0WqLKh+Z91Ungj74VscKcqJRwGHQo4Y
         eplPOX7Jt13+qwSHkP5l7L9IvbW4mWx3HrlAbVcL7k/UaZRUAsBQIR/Pzh2cgiDVxhqx
         YDEt1OuRrolL9on2pDv6bV7gIuE/VMpFCzFqUQQ40hUYPRE7A79OS5ptI/o9Eaw45tGy
         DwxMdzdGL/SX629UM+nSG1j5dorTJthF/1/c/v0OQdJnh2SlyWxxHalopetZ6MEVlSlo
         hvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706856184; x=1707460984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BW7ioWygsib3qTGH3bCtwZFbfdrDyw7qBL154vPbYOU=;
        b=Hxmw50yv9EUv0jlaovh77c6fqKNyI1k6gbjFzkbUkuyvWjmfdsjuENoFLwuLXikis0
         UC+GHSOjaXMOuK7MYV0uzyGwD8Ix36fE6kvAierNmJWAyXWhxvv9YXXju/PoTUhAghng
         DiEMCtUaJfrz4jEOgiefMC+MXdb3wa8Sy+Gb6Z0X9+2KQ8t5HGyyTNmmdsrx37dIFq6p
         gitK+y66fRiW5v8Ah8sGWRGRPBLLLtNenGd9gv+zovYfdiATm0TpsN1I8kb+1PfAhHnG
         2irUY4D2ldnDQFGsUDx8Jm0eBTmuqli8/eybXbizksY38zXvLl2nd3cN9Zfkp6YXMo2p
         r7dA==
X-Gm-Message-State: AOJu0YwrmRd3Joi7ivHgJljHZVbDuiKfZ//hGyaN9R5T0WpMPqodUsxU
	NBiqGuGL1f6cRbsxpC3mqFSOsQhvh/lTfh3OCLg7DugQv2xbNXDm
X-Google-Smtp-Source: AGHT+IEZS7LpY55EN479CaW9byfcrn8q3PFeWPPALesksVI+uPsKgcQAI6MDDGRLkQvFwDr2sJ5+0g==
X-Received: by 2002:a9d:7747:0:b0:6e1:1437:8a45 with SMTP id t7-20020a9d7747000000b006e114378a45mr1116187otl.16.1706856184002;
        Thu, 01 Feb 2024 22:43:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX4R0qDFeaJy982qi5eiCQC391aH5Ffpz/+ineKapBilqeevjYTAitfeFBMTjPa+gvB1EsA3lO9IDA5scj1w2ZHotBHONco0z8Hs3Tpciz7GZBBWBz+vWFxKDr6MEelmjZ9OZcKJlVkO/RBAUS8/D0RyHI1qO7LPjYkYuoWUeODjh8gBmVnCmBt8dG9TI8XWyZy2gr6Ys4Phg9He7ULmDT8+vuQ+gupoT8KNvptVFvaF1by7WIGL2bqb6nCTlx1vUxnJGXOWMvQIssiiVHqGDshYrvuiKmObj4u6NoD8euyrvd5pBY1oxdoPmXG7mR0jQWS2fd1FILhYg2vLkHFHIbPaaxDiDxfJMFEGvnF8jcJAftwPbUedkeElpvN79AHJUjhyB+3R/qDbdbGSH0bGzTMvxOapOjoyQ2auOiTsERY+Phdx2vuka3w0bcRwgGQwKtNYPyeNvW7QD9fNVlDf+l3jDr9JgkIcVzeycgqyS7ngBDE0CmSqWt3okOZT4R9LUjY/ySiJvd5m+0VaqA0+e0ymG2+MBTyq6gEUiKO26QmSeCaoQiKQD94SKZDbBeJrUXHqlwD4Rv6XJUh9yN8hhFkq5tdrZqr7x4Z4s9Qk9yv8XwabgxykqKxlN8OGuxH5DC2I58t9wHae2syY+Qnsrb+XkxkKK5C/klvjdflv4fAk2Q=
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id q24-20020a05683022d800b006e1116e5169sm278807otc.7.2024.02.01.22.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:43:03 -0800 (PST)
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
Subject: [PATCH v9 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Fri,  2 Feb 2024 14:42:56 +0800
Message-Id: <dff0beff331dcc4e0d46175787f045064f8bcbc9.1706854074.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706854074.git.unicorn_wang@outlook.com>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_224306_884283_6FC1BC98 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add clock generator node to device tree for SG2042, and enable clock for
uart.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 ++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 41 +++++++++++++++++++
 2 files changed, 53 insertions(+)

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
index ead1cc35d88b..d83b6a01fbd9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
 
 #include "sg2042-cpus.dtsi"
 
@@ -18,12 +19,49 @@ aliases {
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
+			#clock-cells = <1>;
+		};
+
+		clkgen: clock-controller@7030012000 {
+			compatible = "sophgo,sg2042-clkgen";
+			reg = <0x70 0x30012000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
@@ -333,6 +371,9 @@ uart0: serial@7040000000 {
 			interrupt-parent = <&intc>;
 			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <500000000>;
+			clocks = <&clkgen GATE_CLK_UART_500M>,
+				 <&clkgen GATE_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
