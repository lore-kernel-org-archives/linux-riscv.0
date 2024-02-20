Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56804C48BF8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 03:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyrIX0FeKpIU5tbVxCALzoYzXtvGJhHz7J2uYGOz8rM=; b=GuVAzb+bSAjkvr
	mKbJTAJxAvOYUUXo1sQuQN2Mkj7//9Z4M5wHAzHapE7p2pop5Gkb/usK3zwwPYqeOnpm2WMy4QXig
	D383NtOmGityrlYvMOxUxJWFQNPoHJXnOAcCjbIfhir/kkYlM5F5FY+ZmOK7X16cG9GvxGY4TEb+9
	mLELvx+vldbQSmDZ3KtfEZnqsjSm/08xBOd6ib+HI6eht5mus7vx2tKQNXOMnUeyhyprXesHwt0/5
	CemW2ukdDHiMmfUhTi4MpzpPPo5v7zwlBH+My7GEy4q9l3vA4HLJD/GNCMrf1jCme9L1VR+69514A
	NvtmKNw5PoIiquIkGfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGXP-0000000CxFk-0v4M;
	Tue, 20 Feb 2024 03:11:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGXN-0000000CxFM-3Pvw
	for linux-riscv@bombadil.infradead.org;
	Tue, 20 Feb 2024 03:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=981KgcDEWu0cp8w2YBjuMYv78Dw7iGFDfkFmvYcaFI8=; b=S6V6QxXDQv6LPQVD1hWs3p6Xna
	7Y0/Pt/eVc/Df5W1BeZNNhpNo61apMQQTCOqnwiCNgoQftO4noY0XPT3CL0bk5tp5pgZVYJJLNxEr
	W6S8Lf6qd5KXZ8m9G1enDivFTGaOrsRbZzdajyonVQXO+N75yuMToGxgqNNuq85cEs930NoUjFr76
	KySzgBMoNw6DS0IuAiSztuWnSBqn+rrWA31eZ6N6GctYKzLADTw9ElpdxqGGFHm3ikPCnhxDKoaz3
	lPZuNIowCpEGkBjL5jVw2PRgJHZB6Qao2jFu24Uk0ROInXCfH3GOXlYMRzSjDJVe5cQzuIMHD4ACK
	bQzRDXtA==;
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGWl-00000001WeD-18cH
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 03:11:16 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2185d368211so3041901fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 19:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708398618; x=1709003418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=981KgcDEWu0cp8w2YBjuMYv78Dw7iGFDfkFmvYcaFI8=;
        b=ajdhUfx1HTPZriCBZVPREX4W8F2qKD49V6APj2tDceBW7LLYuP/QHSPbUBhMLOoQy6
         pLgFRedNM5o8fLpkK7mBfVjY+PjnhAyF95zF1WptBR84oWsUkCHipLReS6GklR60icLO
         J+ByKd+53yOpI9zlYSLL2TDCbmOLJop9O59FIS8ClzhHp1OD8z4GLiURZjTFD03+QyWT
         JOGnKCSoBq0drYarDealIFCy6U0nIV1czUE9zax7P8u5biKWmhm3FZHiEQtNHkraQRIX
         UISllY/vJTYoUrTyidW4QKuoumwpFVM4hXljon9xmWeGzuKOxiLK0r6kOYK6PVXG6xsO
         YY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708398618; x=1709003418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=981KgcDEWu0cp8w2YBjuMYv78Dw7iGFDfkFmvYcaFI8=;
        b=VB2dGsyFH2JPe6PbseQVMRLZR4txHO/tRk/Scn77AXh2ixxnDmPnj3EG6V0QXnhLK/
         QGtFTCRI9xqmsNJa7tgtN2AkNj4wze9kqIEoZA0PrWPG04sNXlQVyAJFV0nrz5cCpET5
         T4m3HPBQJGDsa1hji1G7aPebXelKztbPUcdxTiqsBoZCIv8SqQ3Zv66GoYhpPMAjR+Ec
         MpWs+wnhYW67GRboBlJBAQP2JC/smVQNau6w52OreIllJ2TI+As5zbIYX3H/c335ugbY
         W2r9zDtnilulgeGYwAMcZVTEpeAv5FGTu5JIVzrtXa3cowvoiaop3BMPQlsabjbo9XdZ
         7ksg==
X-Forwarded-Encrypted: i=1; AJvYcCVnJ7GfZdkS54zL4Fc3qqJQ2qI9kLnFsDdbMsTSMLTZ6xwWbOMtkPr8PvJgoNEerfoLvZYhsuCvKsZ+dd+d5LrJzDEq6dbciMsL8IaT6yGt
X-Gm-Message-State: AOJu0YwGhbDSUqvhfKqkVgjqUQliWNa9CgXi8VMQNuzMxJcXok5HvPQl
	zQ3KAzE7qA7doOineO6bmyCBtoYKXkBG0sM4FWyFl70K9Z67dabW
X-Google-Smtp-Source: AGHT+IGh/K1Gw6nt3yjR5+Y7Lvh2HpxgUnKIjZxAf221PtJHEHaunhI8NUHp3JWgmy2GEa0mEq/1Ug==
X-Received: by 2002:a05:6870:b6a4:b0:21e:4a2a:f058 with SMTP id cy36-20020a056870b6a400b0021e4a2af058mr15934161oab.18.1708398618390;
        Mon, 19 Feb 2024 19:10:18 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id wh14-20020a056871a68e00b0021e80b769edsm1679994oab.8.2024.02.19.19.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 19:10:18 -0800 (PST)
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
Subject: [PATCH v11 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Tue, 20 Feb 2024 11:10:11 +0800
Message-Id: <98b42a20f7f5a6938563b6a2ad839299ce3ab9fe.1708397315.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_031102_444937_C6E723DC 
X-CRM114-Status: UNSURE (   9.65  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
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
