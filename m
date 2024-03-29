Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E67C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 06:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31fmFNm/FVQc5Fxnn06VHTiIyJUdeP88JjfbkBtxX1c=; b=QvMuyRrYcTYs66
	d1ZbBPpCCY41Ev5o9OjRDN2j/fBFOxFE1jc2T9gfUGHii8ekpHe8m7mccKife0v4vmSSlPpq22gR1
	bjhC7khsd4bsZgIp0ixDzKrtwMpU16PFS1i1wVOHYDfz3xDpNvxTNrmfrzdvttJjuJzqU8EvvJd5u
	VXaBJkSZfRrGGgh15GH0z9FAUndd/2pin6aRL7LMT9DqteIvwyz2SB9IEhUTnbTKmIGlF+gHxl0SC
	b1uHz3Hstveq59RTby3VYRgOKWutoqypCmuJGzy43PndGidQR/PBnLX3q02K7Zc/trdPcOUsNCfAM
	p2yxZttCH7QsnCeS3tiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5d3-0000000H1ui-1ip5;
	Fri, 29 Mar 2024 06:22:17 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5ct-0000000H1pe-4C3l
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 06:22:14 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-222a9eae9a7so877814fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 23:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711693326; x=1712298126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPRTTnRNGB6MC8MgLxeQqBqXiKf58UGvbzByUZNl4Io=;
        b=M6Bso4SWZErsxKEbZrP8HJSSXN23W9Suy8Zm+IiGnkVI/pChfLSmlaDEdv67zKjo3h
         9MjI28it34Akgc29SxDl8do3YWBuc3gzpUxwnNbAgv4W92dTksg9573jyrI4aqCrdvJ1
         9rxBX1QWXnh5KmRcud+iZ+SdMflCB3cKvBEDwniMwJmgF/1xNbKSKrEAJj6emr0YquJw
         i45l+7uMcynbaVI0PmR/CCH9m/C7IFEtfYaaErZsG6cLkoj9qvi/+TUtXr9VtyTJep10
         ZLtCOgVw4ey3KFklkQhRQHIJzwwL3KVwPwH7gRYmo5InFTTjvKGEbzrWcjXnmPcr81ba
         qY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711693326; x=1712298126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPRTTnRNGB6MC8MgLxeQqBqXiKf58UGvbzByUZNl4Io=;
        b=n01jp6+4zWg8lfz/FEujLsQtyHI+6XHzvTFZj632x3xSnsAogU7GW5FELWELRH8UV9
         sggfBuOaD/JZ0iJnpY4IS3HozeIQ75q5KSGDXkzmIsmw03Q9L4GNKyGDBxNro9OODqMX
         QZybT0dfcykn2JcnEYVWAqrENkT6eDoGveZMKA8I2lt03d9efoeoilhCa71FN2lh0PHD
         R7Pc1sJbdSpgXgwEr8akWHOn0AQA/DQd3DEy54LJLHjgQS4Nnvp0+REtDpvdpCNvqIv8
         xlvgWXAPBt1Du4wkiMg4cF3lnwN45il9Aeohs7X9baJ4Nyqm+PMJFWiQLzmjo5q4/BqC
         iy6w==
X-Forwarded-Encrypted: i=1; AJvYcCVAuHCqWGWYv3qD4nPcKEwD3JeSQQTB8K2MSwRt6NRO6g2RfbGlTVHyZc1XAA8kPGR/3hlm3wCChqI4EkCHZ6iCa6SsB7pOSJXMfIQRV3E6
X-Gm-Message-State: AOJu0YzfqDvf+UUEhLf1zlZN9rrqplSlv2GWGTQz2954xE2ZBAi/plwj
	nYw4tQmtBFUMioBZenPCVDchKKfcT1FthN3z6XLHTJ+97FT+lRUW
X-Google-Smtp-Source: AGHT+IFfKEV6h5Gw0WJIq9oU8ZXTVVdJrpoffjn8gZvwWlpJ2sPuHTHLS00yMZSya2NF4n05nQWr6g==
X-Received: by 2002:a05:6870:f68b:b0:22b:5bc1:66e7 with SMTP id el11-20020a056870f68b00b0022b5bc166e7mr1384174oab.11.1711693325826;
        Thu, 28 Mar 2024 23:22:05 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m40-20020a05683032a800b006e6bf2cc882sm521325ott.26.2024.03.28.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:22:05 -0700 (PDT)
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
Subject: [PATCH v13 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Fri, 29 Mar 2024 14:21:58 +0800
Message-Id: <f4934589ebc3a393c270bb9e5ab7493f57af3c38.1711692169.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711692169.git.unicorn_wang@outlook.com>
References: <cover.1711692169.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_232208_102110_422026EB 
X-CRM114-Status: GOOD (  10.64  )
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
