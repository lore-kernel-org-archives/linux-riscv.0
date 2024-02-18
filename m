Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49624C48BC4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 02:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAox3+63rQt801JbYqu5ieamuuZive28cpk1w5VcM3Y=; b=3SzwoRJdQ+Qcu8
	dZw2c1zIgsYNeH3ulT5oLS1uY5GOwm4ipbU1Mi0mat/yO2GDE6L++ItgMM9JDVWZPAW/De3c2lJ/+
	rqijHZXr+di6DfczTJ/gNTszz6SawfY5ws8UR5ht6MhjjlmrhokPwr6wdaUy4TIo2jVNGQe8RJXf7
	Bdo8NMOKd+KXPtJtnZwGQhFfz+cc9xahuT5t/AhS8RwE+AD/8uwT+fG/vLhYgLcMtbkGGGsqWGzry
	lioMpgFKu/3gIlhxaRwjGL3w3YWYRvo9NuTjOh+wQcTxRYE5T2xxp95PgDgl0/h7s5RGdEQTQk/Z2
	V2lPDSpbG3xza4a1Uj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXIG-00000006rAV-08iZ;
	Sun, 18 Feb 2024 02:52:40 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXIC-00000006r6q-0kP6
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 02:52:37 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e2f0d6c82eso833688a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 18:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708224754; x=1708829554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3n19RkNDdq8dbMgQjlCr52ofvg6XvVFhLZ4eyMaEeA=;
        b=SytzNNDPKCnp0YX5Fn/Tu0FLSCWlaCsqGqHQ5GfRb5scUpdH/YVTln6ynEk0hjiqnA
         wM7kBY0RndUP7wTLzkd3s9wvE0ScUo1cBiB4+oAEryjrZvRUD93ofmwQ4EqAdgCIpCF0
         JaPbwAWj7RtGLtptJXjeSw5jwSpQfB3PtivBpZWudQBogyjdwZ+SxS61lYvgL79VQUS8
         afGzY94CMKLeeqHuKMJvziMHjUGggmS6FOLOsSUX0BFKZUelMv+WKIPe8TKvqCHTexeL
         CSXWeXx0uNvZxYn6nbQxUPtvGHVNFr1bU13V+SI4i934FgPWDBS2AU8Vt/AeaP2SoKEc
         wdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708224754; x=1708829554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3n19RkNDdq8dbMgQjlCr52ofvg6XvVFhLZ4eyMaEeA=;
        b=Eg9HW/b7zheccmEWqiknI+bGBGW9nQpbrldYxi0fZBV90TmwqVx+j00xLJ18BIrfAJ
         uIjTHs92wrn+B28a17GPTeKYajhRWyCqIGRag6WzNLD59F6ZbhyTqteoPgnkditRNKyl
         BFMWDh8ISgBnsULuqW5sYzGejSvg6hUFRC9l8cv86BhtGsjZyBriMTHVzFf/1yfKxVri
         FAzob0F7He5xw/LdPugiut3k5hPvahR3FHYSzSrUie2l+uFbfU7Qm/7763BN/PDvHyXK
         9qu7Gct/N/LtICE+Uo1dAw+TDgukEjeNj6DwL62TErN8tofo7z9HfN80kC7kBGBx2cMa
         9S+A==
X-Forwarded-Encrypted: i=1; AJvYcCXkccLtC+X8W1wOFu1cW/wmw+3+L7TDAmGLAX2mmr1Bmj5CKG4wYaTYUQVa9LoGWMGfedPWKzrwmEx9UrdEu9pmYJwmxxbKfA1a8w84kJQL
X-Gm-Message-State: AOJu0Yz0wjcxUqfL6sHPSB9fp4pB03Ix7LkR7nh6QCNYaHMoMDV11SWA
	mZ8+gxuq7l9c+hwPXi4A/Ih7Na+ydMsKaWeTFvPZ1bKNCWUT8zQV
X-Google-Smtp-Source: AGHT+IEeVIqfdYbflCRrTg3/7Jkh/cxWMWj69qHzmn3fE+cLdGKkNtKHAdwy21byuai9OMmNLmxB4w==
X-Received: by 2002:a9d:6415:0:b0:6e2:e50b:7ac5 with SMTP id h21-20020a9d6415000000b006e2e50b7ac5mr8331462otl.17.1708224753896;
        Sat, 17 Feb 2024 18:52:33 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d7-20020a4a9187000000b0059d97d9f75fsm549603ooh.14.2024.02.17.18.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 18:52:33 -0800 (PST)
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
Subject: [PATCH v10 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Sun, 18 Feb 2024 10:52:26 +0800
Message-Id: <dc899c89e5c30e2267965f185b52d6dded4eb1ac.1708223519.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708223519.git.unicorn_wang@outlook.com>
References: <cover.1708223519.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_185236_381237_3DB1E9DA 
X-CRM114-Status: UNSURE (   9.63  )
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
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 +++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 48 +++++++++++++++++++
 2 files changed, 60 insertions(+)

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
index ead1cc35d88b..e70c43e2ccbe 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,6 +5,9 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo,sg2042-pll.h>
+#include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
+#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
 
 #include "sg2042-cpus.dtsi"
 
@@ -18,12 +21,54 @@ aliases {
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
@@ -333,6 +378,9 @@ uart0: serial@7040000000 {
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
