Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3BC52D6D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YLz3FCzRTw9ozzEU72/aoGyn+ZHDhAG3kaVZUZxwKA=; b=h/H6mGHr9ufJWW
	JkqVDmAkoQFbIQsFiXfWX7B+AfqexOk0vTELBgSV33UPHcLoQCttRD/+IeR3NUIKikvy3VLubuKUK
	6Kxyfh4mYfdAKslshtiNB4aPfWlTSzEK9IUxSN4rPiHRMeyxvkZ3/u0oIWe1jBS0fYGFsNBcr5NDJ
	+WxLut6IqPE4scqgNvjPNluAE+xpkHnDGqPw7rClDaRMtXY6//KZSbxZR5dgul2atK48z/K63xHIm
	Bj43bpwbiOq3YgFZ6DOs7WyTEfp9tM2CSYikBjSqLJvoDSyHxIRN1wbGhlj6k5U3pHY6i/yTVfd6a
	1e6tjI5L3G45qT97AI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah2-00000006PZo-33ap;
	Thu, 01 Aug 2024 18:38:28 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah0-00000006PXr-0qg7
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:27 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7a2123e9ad5so1670585a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537505; x=1723142305; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKmhtaGRyEOGi2nd6GvoahBxNPaEwqWJrLn3nZw3XHE=;
        b=U/DTQParETOjyR2SxM7OZ/APvAKuNXO0NJRPMeuXxUaACcD0PZn9fhkmqOq9hs4som
         LcczBSwtFWTJ8fq2KJDAG49a/P5Y41PdBexN9/y2chINMeu07ywAC+qMLW7yEuS8kTFQ
         fNRHBwseogFDJfTghnatm+lTvgxzUyhgKzirqWv22EMq5A9XqqAcFJeHIk/N7GRJLZcw
         fL2BFIKQWGSljTHRT2IsCZwztq0qXHSRjqUpjfcCgDxzAHp0LMj1L3jtYjXEp7UG1hsI
         xQbkblhM3Zsq4M8Hbf582JgihkpoiVwTO3Pp25ebrHZZQZyDW3RoaS6NI8psNAbt5dWm
         S4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537505; x=1723142305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKmhtaGRyEOGi2nd6GvoahBxNPaEwqWJrLn3nZw3XHE=;
        b=GMXbMc7HVehiqC9w30nWPpJ/G2x1y6d7Cpv0d8o2jpccXKr7MO0hhliaC0sdDqiqWA
         3yvFKA5okzd1UyvxVbz53ye4vmK9RkJsnoCljGxWdBjzq4Jn3ZNP0QK7b5GQ/CGvkHk1
         4frYTuwwxXc1kIMindtvAaRooGAC1PTyB6oiTLJONoJCZ9sPAWfUUnbOiQL1AD8hUc6U
         xWMJrAXpYU1X4tDVOVvnEAc+qIcTIjiNFngLkuDAVI3lNJ3BWVl1CRsJ51wLw+1A9LM2
         0OsaQbyej1qVgVogGfPzTtWHpD49Z+VUmSSjtM5naCvStRPf7JMl38+pQOnlrLeDH0oZ
         4GRQ==
X-Gm-Message-State: AOJu0Yy+ORMtoh4jS/+UcHyGCQ3GGSwiKHx7p7IgNStZ/gQIyeVUKom4
	U8mtKOi5rZRexhe2yplHKAMHCYqb7dRUspgeh07KrwcOuotGLb5YkVq69ex965U=
X-Google-Smtp-Source: AGHT+IGBuAA4SywlPhra6w7AJzP3mKVHnrcaX+bRBBExitUVszi/sGsxxxRHqCZ4zJ+GBBej8SAVAw==
X-Received: by 2002:a17:90b:4b03:b0:2cb:5dbb:d394 with SMTP id 98e67ed59e1d1-2cff0904558mr3485163a91.4.1722537505482;
        Thu, 01 Aug 2024 11:38:25 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:25 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Thu, 01 Aug 2024 11:38:08 -0700
Subject: [PATCH 4/6] riscv: dts: thead: update TH1520 dma and timer nodes
 to use clock controller
MIME-Version: 1.0
Message-Id: <20240801-th1520-clk-dts-v1-4-71077a0614b8@pdp7.com>
References: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
In-Reply-To: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <drew@pdp7.com>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983; i=drew@pdp7.com;
 h=from:subject:message-id; bh=39TQlbKslvMloaaNbMx3AO4nAgflfRVN9+VBBv24ZBA=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStvia16RHD6S/rDnRVlqTz7fDvXp9k9J1hy4n7t2vuK
 QQlB4XbdpSyMIhxMMiKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8o2R4Z9Cq69huxxjfUzY
 1fWfhHK+RT5MWRQ3qeiBUeAmTVa5XUqMDP/3ssi+7hHInB+81v7t0jifv99+f2PNV/o368VBjWr
 jczwA
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113826_287511_3C4678D1 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Change the dma-controller and timer nodes to use the APB clock provided
by the AP_SUBSYS clock controller.

Remove apb_clk reference from BeagleV Ahead and LPI4a dts.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 ++++++++--------------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 5169a718f79c..425f07d73b32 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -45,10 +45,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&apb_clk {
-	clock-frequency = <62500000>;
-};
-
 &spi_clk {
 	clock-frequency = <396000000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index be982a3ac18c..077dbbe4abb6 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,10 +25,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&apb_clk {
-	clock-frequency = <62500000>;
-};
-
 &spi_clk {
 	clock-frequency = <396000000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index f3b2f8236096..6ea5cabbcf60 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -216,12 +216,6 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
-	apb_clk: apb-clk-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "apb_clk";
-		#clock-cells = <0>;
-	};
-
 	spi_clk: spi-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "spi_clk";
@@ -422,7 +416,7 @@ dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
 			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>, <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>, <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
 			dma-channels = <4>;
@@ -437,7 +431,7 @@ dmac0: dma-controller@ffefc00000 {
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -446,7 +440,7 @@ timer0: timer@ffefc32000 {
 		timer1: timer@ffefc32014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -455,7 +449,7 @@ timer1: timer@ffefc32014 {
 		timer2: timer@ffefc32028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -464,7 +458,7 @@ timer2: timer@ffefc32028 {
 		timer3: timer@ffefc3203c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc3203c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -495,7 +489,7 @@ uart5: serial@fff7f0c000 {
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -504,7 +498,7 @@ timer4: timer@ffffc33000 {
 		timer5: timer@ffffc33014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -513,7 +507,7 @@ timer5: timer@ffffc33014 {
 		timer6: timer@ffffc33028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -522,7 +516,7 @@ timer6: timer@ffffc33028 {
 		timer7: timer@ffffc3303c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc3303c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
