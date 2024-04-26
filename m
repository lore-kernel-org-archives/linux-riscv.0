Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4A7C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 03:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41nWquj9ZU9VGvCCXdil5nrT+742NTTbC3nmhqlqKf0=; b=q8DbgBIo7B0QBS
	rpZ/OdzDU2qHAHyVa39qfNFaVqX2MYxhIGF0JgZX64cU6FnWCUnxVAxhxm5aQqxcBGKIet6wDZ1re
	bIhSWUd+jApOw3oH0AtkqL6s0N077YqfV3S++DlM6jylGg8iqvkxvMRhsBUG9Ibg4asS5Di1gRyaj
	qHInDPGBY15V49bbGRcmRPlleOtjGaZnxk0FoUbDN97RWMGt+An95OQGDS0PRVIbgb0K0TtwzH4mY
	pGEWEedPXuHLP6gLFn7l5zdmcsouBY9B4Ae13K2euYUC0BUDTAhYvMVj4L8CTEJTmZaj3UvsxAUaA
	iiaIF5+HnTiT4KyMFU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0CNP-0000000AzAT-0ulu;
	Fri, 26 Apr 2024 03:35:55 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0CNK-0000000Az7O-0eND
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 03:35:52 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5af23552172so1147589eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714102549; x=1714707349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXXhn+viEW5QNpw1s0JwBzkpEksiOVn61xZJPP4n0t4=;
        b=Rt08hABtJbIieHQoqgY464/3SrJAAKdAJ2wfN+vYS03xfoxxwWO6VVcboj/2NT86wE
         /NjL+WjKSJNRhko7RhqMu6INA37p70PqVHRRfQUfsedADnGBpUgCyb5pTFf4xtnKpvOt
         z9+L0Mq/dC3xFdxedzMtZUNEfL9mTT+Ht531T8Js6qcNos/E6n7SoBAjsK2YDeKlghJ0
         i9BxVjh1D84qzrZR6/CrFmNVg0DmuYUHVNy40KXhZDYPtG81mueZUBFLFPl/ENwru/Rh
         rHEbdCaPdIAIDxwOm/xsGMvZipuK5z6DhML5ApCc9MrHUOCI4tidhrNb6hSpvCgfcEGe
         +YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714102549; x=1714707349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXXhn+viEW5QNpw1s0JwBzkpEksiOVn61xZJPP4n0t4=;
        b=fyzVNIRKTkdNtr2viZ2Ql1vx7pFGiHZD5GsDfczMPZVXfSEnvtzqX/u6e7OcUMlTVs
         L+GQwruXUQyiE3Y3J+dWSeRB+d4yl6CqcLxIf87wVB5UZqskEt9JghbouzeLwhnkGuOK
         0Swg17TztcK3p29lQm5+ak6wlU6hvvZyQS1PHL9rvRPj5APJt04cY6gmUXS7djZsfYcr
         73YMHREtfvSUXQmfuGKxr/dX8yWqzeFEFAaLbnefP1GBsBSC/S+Umesufo+NTFLOilB7
         ZUD62MQbu1lmDIDWQXBOM/PKe983yuMPnUtwq8AfRDBTyzj4+4fn/MIrE8Qne7jhWGeD
         R2LA==
X-Forwarded-Encrypted: i=1; AJvYcCW97Qnh/OoUlTYTZI9cNkxcAUzgsto1WDnw3W5HNoCIUlf41NpAIjeQs8anVOb39Q6M7qky17lH9Z8FPbuWcRWkbdENrugKpN9WGUubOBn+
X-Gm-Message-State: AOJu0Yz4U8KY2ZqjyAq1Rnq5vq0S3KtsHmVIETT7b32CYb75OfoNEkuC
	89DfQceWpb7zcwPYnBKCyIaiIM/M4h2T3puPk7ddtchqGe1p6Njh
X-Google-Smtp-Source: AGHT+IEX1Yl4DmsmzzdNoNze02IpPzWs9NOhtIoV+GjVXyhjDg3kt28K2sha83urXPLmjFKuEKK36Q==
X-Received: by 2002:a4a:98ed:0:b0:5aa:5206:30aa with SMTP id b42-20020a4a98ed000000b005aa520630aamr1882521ooj.7.1714102548735;
        Thu, 25 Apr 2024 20:35:48 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 187-20020a4a09c4000000b005a4b2172e48sm3669565ooa.41.2024.04.25.20.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 20:35:48 -0700 (PDT)
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
Subject: [PATCH v15 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Fri, 26 Apr 2024 11:35:42 +0800
Message-Id: <165c49ca3823043a14420e3001c2657f0a1b9802.1714101547.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714101547.git.unicorn_wang@outlook.com>
References: <cover.1714101547.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_203550_300095_B23087B4 
X-CRM114-Status: GOOD (  10.47  )
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
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 55 ++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

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
index 81fda312f988..34c802bd3f9b 100644
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
@@ -20,12 +22,60 @@ aliases {
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
+			clock-names = "cgi_main", "cgi_dpll0", "cgi_dpll1";
+			#clock-cells = <1>;
+		};
+
+		rpgate: clock-controller@7030010368 {
+			compatible = "sophgo,sg2042-rpgate";
+			reg = <0x70 0x30010368 0x0 0x98>;
+			clocks = <&clkgen GATE_CLK_RP_CPU_NORMAL>;
+			clock-names = "rpgate";
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
+			clock-names = "mpll",
+				      "fpll",
+				      "dpll0",
+				      "dpll1";
+			#clock-cells = <1>;
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
@@ -341,6 +391,9 @@ uart0: serial@7040000000 {
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
