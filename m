Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8EC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rrdhxWUH/Sl+hwGzsItGAgPSe7gHh804lNUZZXHurI=; b=Y4QM2/01pL/eyD
	pSWeDt50zlbQrN4k0mVfsJIgkfsa2KnUQy614zXhMEE8bN/WZDcrriS444LgezuCzIfKsK+KWMKNV
	rUkpSALOKbVaKJFinB+q6LqJ7b751t6f/A61Qq63rqXHXUZqARqZbuex8NEtqFOmPVIs3r7bWzhnY
	OUQik9euFH0KSGoljTmA99ZV9/Hao7xohop4djxCff8v8/iHS3mOhRKsVPfrSZqNx3GBYB6BLRld/
	HSSW238d/+SA0uLqEtilp78g9Wbc03OHB+jYAqQzEL/JOyQ0L1eG6PqGntvMHXxNtR9DqyMxWLku6
	6jTqwCtp1gShlgDz1Mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdnI-00BCZO-1G;
	Tue, 16 Jan 2024 07:23:32 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdnG-00BCYR-0D
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:23:31 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-210645bcf4cso245485fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705389747; x=1705994547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSNu/F0YjWWvZJ8YEGZOLrkQaebTdrL0bEYeNxkjWKw=;
        b=WluiIaU5FL4hlnQ1xDvpSnJstuDTJDn/TA1Nd5eG7DI8F/DobVpWKDGdKxu/X5OznA
         758ypN3MeeYOlxio227psRDHDnyMUcZKTBwhUnBfHPEHfi/ioGs5NbFO+II0EaoXFblS
         zQdkNiapJCz5+bPVVv1T+PZvA2QfDUaY2jwD4khtaSad3+tpTqTl0QhhSsvn828k/IKT
         A3oMckKMqTuvCQBozc37KjJmfln/3VBP5QZK7c4cMiikL9fVPXOmBkloaFbw7BqyDOkd
         x9RGmKhovW7sWj7n+HVKP5Rmod9etR0Y5d1FITORPjWIHfZGw+YAXeciYBYhr6Rr467P
         xd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705389747; x=1705994547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSNu/F0YjWWvZJ8YEGZOLrkQaebTdrL0bEYeNxkjWKw=;
        b=sEgK3y6WD1O/n36cdCo/sJcY0Ne7UkfMyMyZR5zCG2B2cj6LmswH67prI7HfsEZ8Es
         MQRDYPugPIy+T/5wVw/cOWXs/pgxY5CGi5g1tsIfaOYR5JJO7IIbLLRQW9hebc2RaZgu
         HrunP4mPT+XFf0x82kNPCdn5offTE9L8oAbOG+Kp/Mhj9SLOMyCVjv94040V1O83evPf
         PHyeoPJ1pbT0yohOnCxI18S1zS0s92eaHPbd1jFnUlm/CvGVGfCGMzeh0DDsFNrmE58r
         vJSyKrpezkxdUpLd4DpM68qUxJnqYQbeTf0lujFbctqNT7axVKKPociXx2VPUqpa9Vhf
         PRVA==
X-Gm-Message-State: AOJu0YyFdBV5waQ5RnnnihT87cTkygCLPlRrbg0vycqo3s2UAnZsPe3S
	iZcHn22hpQ5qTBM9IfKhbXs=
X-Google-Smtp-Source: AGHT+IH69Ohci1IK5bZui+I6s85n29iczQYaPx877llDqKJLtWt+hCvbGqWnV03YlB5FQwI24tl4OQ==
X-Received: by 2002:a05:6870:3128:b0:210:7b00:e811 with SMTP id v40-20020a056870312800b002107b00e811mr389496oaa.71.1705389747085;
        Mon, 15 Jan 2024 23:22:27 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id t20-20020a05687044d400b002060e99b486sm2905903oai.22.2024.01.15.23.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 23:22:26 -0800 (PST)
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
Subject: [PATCH v8 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Tue, 16 Jan 2024 15:22:20 +0800
Message-Id: <f2edd136c97cea465a81e8949a36471c26db9b09.1705388518.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705388518.git.unicorn_wang@outlook.com>
References: <cover.1705388518.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_232330_103871_939B9DAC 
X-CRM114-Status: UNSURE (   9.74  )
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
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 39 +++++++++++++++++++
 2 files changed, 51 insertions(+)

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
index 93256540d078..6dd8d89d4833 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
 
 #include "sg2042-cpus.dtsi"
 
@@ -18,6 +19,24 @@ aliases {
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
@@ -311,12 +330,32 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		system-control@7030010000 {
+			compatible = "sophgo,sg2042-sysctrl";
+			reg = <0x70 0x30010000 0x0 0x1000>;
+
+			sysclk: clock-controller {
+				compatible = "sophgo,sg2042-sysclk";
+				clocks = <&cgi_main>, <&cgi_dpll0>, <&cgi_dpll1>;
+				#clock-cells = <1>;
+			};
+		};
+
+		clkgen: clock-controller@7030012000 {
+			compatible = "sophgo,sg2042-clkgen";
+			reg = <0x70 0x30012000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
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
