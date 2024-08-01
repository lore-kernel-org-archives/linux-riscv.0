Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B930C49EA1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWdliEXJzbmVex3yd6uERLUpfMZkY7kA6NuWxrTroq0=; b=a4VoNlLbwoLgZW
	B0s9Wh6F+I7euGtKnzKuSPtE6bbFeoEuol27hrbCC3frNObw2hIpwEzDv2dxYRdna0iq1uXbrfQDe
	k8kZL5o1xy0mGV3kXdn0azZ1Iecy2TbSnKsAmQRNfm0yex72pVFZBoOshRysOaXEIKZWzsuUl68Im
	3Y7hStEzOiZVKEzAiQcdvYFg/b2fGkFJD3ZsG1W2rqytkr4eHQQTW4p5zSttHUZ+iwNlq38zVwRMf
	TsrxUo9ldg8yuZ1LNkjysTfeNFqU05EYfnJVb3tloyQKEDwERh/6vrsITtzUc6psINv+ONT9mNFK/
	7Nbm6zLD914oJ6MzsXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah1-00000006PYR-1Sty;
	Thu, 01 Aug 2024 18:38:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZagy-00000006PWu-21qE
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2cb64529a36so5000625a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537503; x=1723142303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEw3dyBLm4whsP1APCKPqoAvXIJliR/Puks1ZjMePFE=;
        b=xe3TkVsqalflpDM8V/EaHzM3Z5S46ggt9HvUs7HBu4Ul6PeTdVKgYbzwkDQ9ZP5BlR
         eMbL/XUw4I/9M0UfJ8F8qZZ8hGFJb4XTa0IsJY8mQA4OWavEzPr6kDTQ33akhG6m41UD
         BmH+4JkvfENH0C/YgFkqUI4Nf1HpXha//duQq4j/spe6goe3e3FYbTkKqEEjsg56Eq7J
         RmkF8dQhhdNILAhQfLd4YMCiw10piqVo12h/twcBbGt8xao7cdEYCRiVdxLHmYQQQ4Rd
         eFIfnJjf3O16Uir36HGDpDqGH64CXrNKmEuUmuhmCdk5N9z+b/aVgut9M+IQaNDyl7zp
         hoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537503; x=1723142303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEw3dyBLm4whsP1APCKPqoAvXIJliR/Puks1ZjMePFE=;
        b=m2QZ9ubADJk0O6AcgUG/YCOwe1/kHh8d2RBZtYc3NGarUfsivEJXOAjGkwckng95aW
         xjX/mq6p331WDW52aKVhpiJHwaukZSsJGrx+Jt+OyLyLQYlOHuTwAoPPKiIh4OSs7ezW
         C5GghLgNuzdzYQChyXeHTIa5dcxhcH9uzsyGsLCnPrlqIH4q7jblj2J0JTtY0b2ocvFO
         JHF/B0gbOnJH0hwE1twaU+auQO68nKuBcsk+aXlUXbKANeS7qrOWa90r9E7LA/f8mDYS
         A5Z76W0Uk4m6zJLkHeQq6Z9s7GtPbxhQLyTeXwgUHex/aJW8+jNOzIBXRdc5zCSRJu/9
         yOTQ==
X-Gm-Message-State: AOJu0YxTZU4bLLDOoA7eW3e1XrUXvR53q/I7FrJAblDOi/iXw94h50CO
	KeruQgmgklj+NrQSmf2U29URT35aEYNm06XG6TrNY+jMGvRYBJEUELgDKAnTm3E=
X-Google-Smtp-Source: AGHT+IHULYcfJhgkY9uqTOBDbGPkre57En9YBbkpCwWlqnDcSy0euccsS6e1fapTeChG+4tg1pGf4g==
X-Received: by 2002:a17:90a:644b:b0:2c9:6514:39ff with SMTP id 98e67ed59e1d1-2cff952c35bmr1415423a91.33.1722537502847;
        Thu, 01 Aug 2024 11:38:22 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:22 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Thu, 01 Aug 2024 11:38:06 -0700
Subject: [PATCH 2/6] riscv: dts: thead: change TH1520 uart nodes to use
 clock controller
MIME-Version: 1.0
Message-Id: <20240801-th1520-clk-dts-v1-2-71077a0614b8@pdp7.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182; i=drew@pdp7.com;
 h=from:subject:message-id; bh=LEB/O6tBSHji0s/zln825HKghg4t/13zO0aXBDRHXqQ=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStviaZeERijtv6qz7z2/z/rPigN7lo4YKFez7k3JLUK
 ryo0rlEuaOUhUGMg0FWTJFl04e8C0u8Qr8umP9iG8wcViaQIQxcnAIwkeoARoaD2dO2L3a+auaj
 s4PrEOPPgImWnjZTtuk+FXy3Pj7+2TYpRoZV3Cncj1zzeR/3h2iprfFh4v01W6lRScSvr0cxpuI
 dBxcA
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113824_567644_58955D01 
X-CRM114-Status: UNSURE (   9.88  )
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

Change the clock property in TH1520 uart nodes to a clock provided by
AP_SUBSYS clock controller.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 +++++++++++-----------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index b4d2e1d69bdb..90585883b059 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -57,10 +57,6 @@ &spi_clk {
 	clock-frequency = <396000000>;
 };
 
-&uart_sclk {
-	clock-frequency = <100000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 6939bd36560c..1c5c7075ae17 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -37,10 +37,6 @@ &spi_clk {
 	clock-frequency = <396000000>;
 };
 
-&uart_sclk {
-	clock-frequency = <100000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 25ef5ee729e6..a543be8d6e37 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -228,12 +228,6 @@ spi_clk: spi-clock {
 		#clock-cells = <0>;
 	};
 
-	uart_sclk: uart-sclk-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "uart_sclk";
-		#clock-cells = <0>;
-	};
-
 	sdhci_clk: sdhci-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <198000000>;
@@ -285,7 +279,8 @@ uart0: serial@ffe7014000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7014000 0x0 0x100>;
 			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART0_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -322,7 +317,8 @@ uart1: serial@ffe7f00000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f00000 0x0 0x100>;
 			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART1_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -332,7 +328,8 @@ uart3: serial@ffe7f04000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f04000 0x0 0x100>;
 			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART3_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -414,7 +411,8 @@ uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
 			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART2_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -483,7 +481,8 @@ uart4: serial@fff7f08000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f08000 0x0 0x4000>;
 			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART4_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -493,7 +492,8 @@ uart5: serial@fff7f0c000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f0c000 0x0 0x4000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART5_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
