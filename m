Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B18C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41nWquj9ZU9VGvCCXdil5nrT+742NTTbC3nmhqlqKf0=; b=BTS6DD4nsFFYsD
	OavL51CrM9X5wL3C62A1EkumW3w2/Nly0rBSTr7cIAvuiC6ApOb8HpIB42GzcLlK59FeU4/2xq0QW
	7wRijJr/8rcgg/JIrXshkFq89HUujltettTcMovS5FuPt8WosgYwhZhiBmtMf/WRs9zOxfmCzOu+s
	z8kAJJRqetK3CXrDLkcZqg1JOmdFcEnfYDDYrf1McLZvpid6CeyguU1CSCgsuaUSPNQ/D7Wmse3hb
	qJy3P8Hyygvf5NoEhO2XDrL7TgD6dFz4s0HfJ9LWP4B4zN+Tnlr6J/GT9AfSruMIHjO49dsSVlHqo
	91Q5JHxo6XyonypGGTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8dA-00000008rxi-3eDx;
	Thu, 06 Jun 2024 08:37:57 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8d1-00000008rtL-3wgL
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 08:37:51 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6f94086e1ccso380836a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663066; x=1718267866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXXhn+viEW5QNpw1s0JwBzkpEksiOVn61xZJPP4n0t4=;
        b=Jsigebdbs6eFMTL+JsPKLAGG3rdUMKYfVpVP1wHfRVrGKeBfLj+9IouqG88oI1fWrl
         KFPxe48KVbfwFdP9N8XPx4BuSatnt9IqXmIV8n3WLF9zYu5YANAhXyPxbYVkimVNOPVK
         USzq9K7ZRhtWZEepB1VY4u50vA5vFlrfNCNQlbD7NrReYoFh0g+USSODtvd0shb4pFJZ
         r7sNepLrqy+PtC8DWjwYIt3X/ofbwtUvASZuF9Fz1iMccFOUD8VorP4Kq53RyDNYptmx
         /oZl+M2d1Arl8Xh4p2d+JyuqF89tkVuYmev1PK9ioipjxpVdtSbg4BMDCQsdGNrbItO+
         iyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663066; x=1718267866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXXhn+viEW5QNpw1s0JwBzkpEksiOVn61xZJPP4n0t4=;
        b=kr2S4qH9MQIipiBBfrwvEaT8A5GqzMFeAcx+IlXBslZ4cLkmi5s6iJcgYgwRhoU+G0
         njFBXvF6RJ2TeTXhaMNv0gHXT2CbESLcNUlX7yDCCFIYlbr+ATNis5Ba5rX7i6OuORD1
         tqBkZnGVM3Ht+/oPIDaUu2IsRtdtK5SBCrCSWwlQtSbSt/lLULO56H1iTO0vNNcoc6XK
         ySH/S/3GZbSeYnNPQo3bmmGA8+WMpNMO9KzXXG869B2c+GYdgGlkZc3QucJ5I5CN7n1W
         WkNBppxv9sCawMlCs4LJavRPz9M7NTvOf5SeZ8Feo9wSFhRzlFViAeFQ5YbwcDZ4DE35
         vYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn3/6AcPKh6oTZIPxG/d/wkWRDH3bPBJvCxdGVBndR5oYgQvy0s8Y5204TvHh9Qp6OyLGBhvT6GTpecrFPfeBl2OVpmKV3cIQlmlQCBVSC
X-Gm-Message-State: AOJu0YyaB9sBeIFJamqbDoURYLts4HHf70BgkhcaQlCBdsKnQU5vIBj1
	X6BFP2Jp4MejINkFG7MlOOa6yclLBHvWBpECIQqL6kuMlF2DYlLt
X-Google-Smtp-Source: AGHT+IGZlEYKLCxi0RKiEtXK7Ckj+6l6wKfH5lX8OsZs2LFvUkmtRa+80HPxCK7UHmoLIlW9SGRzaw==
X-Received: by 2002:a05:6830:148d:b0:6f0:444c:d534 with SMTP id 46e09a7af769-6f94341474cmr5168489a34.5.1717663065958;
        Thu, 06 Jun 2024 01:37:45 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dcf4ffcsm210863a34.63.2024.06.06.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:37:45 -0700 (PDT)
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
Subject: [PATCH v16 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Thu,  6 Jun 2024 16:37:39 +0800
Message-Id: <9ff7c8917a2125319316d59973a54ac12c311a19.1717661798.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717661798.git.unicorn_wang@outlook.com>
References: <cover.1717661798.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_013748_043386_4E94BFFE 
X-CRM114-Status: GOOD (  10.54  )
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
