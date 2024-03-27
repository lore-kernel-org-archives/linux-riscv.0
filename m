Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58D7C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31fmFNm/FVQc5Fxnn06VHTiIyJUdeP88JjfbkBtxX1c=; b=V2NSQq+9lqmjod
	kdNIwKU205E4itV3Fo6HI6LMgBzXSfLAHpeQEoDbDQ79oOFNSUAEXrpM5GR5WAY3aRMejqyt5klxK
	k59GelqdkijHFvEFySttNrALUsznqKdaz4J9lzyHHIuMFKkRl7eLbvhde1Bol5lR4CcrtTv/8Yn/K
	e9cpHlkfEbMgsE9ZIOnombGp1B9F3QHdI8vUyFgd0d+6QU3S6v0wrK+zfY+nOV6F+BSeXhhgylu30
	5kN1M9UyVC9P0MZjFV9wcRk+Ksg3YZ4lte6WQmSgCJaj4CXmWNVSx0cCoeSNxMgxRA+Mlg20f9fTh
	iNAjV56HMPtEDKmf1q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOgr-000000083gE-1bqI;
	Wed, 27 Mar 2024 08:31:21 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOgj-000000083cH-1Wuv
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 08:31:19 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3c3d70191c7so1070802b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711528271; x=1712133071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPRTTnRNGB6MC8MgLxeQqBqXiKf58UGvbzByUZNl4Io=;
        b=QQGdcpAMMzw50cwfJtavK11Gb6O5ofSjxRTi3HfrZPYGmeCguqy83bOI15HEIEHF+G
         Ae0EvCyaCT6V3dQYUcAGJUcPc9Qt8XnGFGLvr0g6knyeGT8Nd9sPkKE+KC4w1Y1hYsXk
         ZopEX/LagksKGFcV9qfR3H4qN5XdvNplGAHG5OBYqJw7P05BWjk11roKRJBPklqR9t2h
         gLl+1AoNW0ObcJ/C70rtrYhPSJE8xQxxm8gOvQ5VU9hmI2J7bwVp7x8UJk6NA0RtKQ5N
         UsP+ITZw6tgGzIiqlxDXlkvSeHY1selFH145tukI1Um7kz9OzJrVRpLheK+IUlM9r0Pe
         anRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528271; x=1712133071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPRTTnRNGB6MC8MgLxeQqBqXiKf58UGvbzByUZNl4Io=;
        b=v0H4y3VTH2D0eurmVY46wcw1vaGVndPF8w7eNKdEpcYu8OgNhXExHxwfbupq6DyRh+
         xhAtAkZjArAzO9Ou1HsFgMaNYlVM9UpHyk7RxNpMPqBWPmWeaMNxIZpuMJ9Jw1+aS8sr
         iQvROxeJn81WlYVDJ4b9M0yIL0ffAlgbbJE3cs4yFgGCVlDRRxxycyfrtoFc+q3r7xY1
         0CYxPJ+PNMxUoZlxDQJ/eof5G00/+YleG4yp6QRK8TaNq97JzR/YQmL20pVnx+Fd11ys
         Hk0U4kViMqZf8DfCMnQBbdSqBcpiNwB180qJk7QjdgO1kBS2wcWcstox9ckM2CqCNKv7
         lHnw==
X-Forwarded-Encrypted: i=1; AJvYcCW1OVSlqBAIq/nOMZ4V47qEO6y5K0DuvAhi15s88gpJF077LLlHPb6lix8Ucom/jX6dvHFaT6ptxk6wHJwhkudW+xcmAur7f0JipmbZdh01
X-Gm-Message-State: AOJu0Yw6whqq1r5Qavj9DM/fyoqMElhYW0fk0r/2AoZBNcBJJseL55rD
	Q+WDVd9ghXkRmUuXBdLRe+DO4o/DIzgif64pzeBXAlTjTFLCX+tl
X-Google-Smtp-Source: AGHT+IGXMC8GI7EHqyzHdc2ep+bX1igihkpaRvHWPRxoLI04zdhk6t5Wq0ZlSdSHmAbGqcu5fH1TAQ==
X-Received: by 2002:a05:6808:6293:b0:3c3:cd2e:3074 with SMTP id du19-20020a056808629300b003c3cd2e3074mr4469638oib.26.1711528271233;
        Wed, 27 Mar 2024 01:31:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m5-20020aca1e05000000b003c37b40b2easm1793335oic.48.2024.03.27.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:31:10 -0700 (PDT)
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
Subject: [PATCH v12 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Wed, 27 Mar 2024 16:31:03 +0800
Message-Id: <5d34a5ce93202463bd7b05ec2df93edc8fb1ef1b.1711527932.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711527932.git.unicorn_wang@outlook.com>
References: <cover.1711527932.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_013113_547724_47859401 
X-CRM114-Status: GOOD (  10.66  )
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
