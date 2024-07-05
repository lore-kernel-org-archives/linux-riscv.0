Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03843C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEmxNQe/yr8kAw/dsx8PrK9TskCK4OaaL8ODPiJOeJQ=; b=PJrI9kg3QpanaX
	FmoGyMBIrIRX4pFkaANApFrh3V6aoY86KYvCBUAY8/cEwir43pWJZWvDQmtrra4+zShnxRcfNpgv6
	J8AR4Qljc0bRrkYACn/9s8PI2RLcz5GRJgcaYngc2qiC54sWUCk8aw9mAp3G8b3HMUS6KstHDZZSL
	OqmM0CyzbS4rQ20PspPF27QnvIxAG6YaxZi8bwbOjLNqVBunsUBqkj/X0bVVGfwXpkZ1+AAFIkDIl
	g1J6+Xk4KYDqreFKeLZ4SgSLZi8gWZn8XZ1Hih8OBXDJVkIc6PI5OZKhfXBbQshY+xplxSXpfjkWB
	vmfL+aWBNP54cwzd+NVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfMD-0000000FT5x-1Wzv;
	Fri, 05 Jul 2024 09:35:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfM5-0000000FT3i-2VjG
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 09:35:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fb3e9e32ffso5951325ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jul 2024 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720172148; x=1720776948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgU+IA8XCyYsTrZ/mEf89X8FSGQS2g4Jad9S/srkmrA=;
        b=chTBAnILn4WpY0ZQJA8nzhSvDcic11ujicPu6Ei463e9rF+TVepq3mItl3DAJx3rB1
         vnrzkTK2x+dHTHyn2JXRDsMUCpDSd+99kRLUixw2mW2YfnCaio8AbL1O34P510jRPjOg
         lt0MbjS+fdpOza1wXpzkbefjLblwmPFZ1xkbKem3YtreAkB2PYLgvVp/AXJ2Dm0fuA5b
         pNuSKnOikRUu5o5D/sMfUyEfe8aas8p/MEy1JhjNpvdv+Jsv88onr6TWePN7fo7JonGw
         FV5XgbQyt+N9b+qh3FmpCDgXjiwFHqDkrFKRo4eCHcsBM8mu8SYPazopYuArIaKuWBgO
         OATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172148; x=1720776948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgU+IA8XCyYsTrZ/mEf89X8FSGQS2g4Jad9S/srkmrA=;
        b=aaG/HLNMsQqmIZgyyOQPmKMi5nYjQtU/wLb7pwZoiJyUw9doO0GiH4tRizA8enHi89
         b58s3OyuahVRgNmdz1Q2U5+cb/cjuZoQNxC2m/VrYyNFZn7DzOeYGWpV+4teJX6+Q6x8
         q+6KezYRCfMh2plKpjS8FRe/dEBJnNpnXOuT/jB5ugNG/lH2KOKfzRHD0EOvlIsUZq7b
         Ha+e1TuxaglwxYSpFFPeOkKrGZl+BR/L6E19dAcObO0zBBgqmgSfHT5VtDLwvtBuaVrL
         4pdOteeWOXwKsCEdI8Grmx76v+j3zUFzxsvATxAZU3n7BaL4Uh3v/heR54gXpYBlCmLl
         S0WA==
X-Forwarded-Encrypted: i=1; AJvYcCX31hYzLxSe9FUof0u7EcT0porsWGTLflk6reB3AFfaX21aC9EB0MW754GQbfNNwkdk87Sti5lmnTi4VPpyBeaELwlyqSMD6p/v+YODYpq9
X-Gm-Message-State: AOJu0Yzrjzh4+ckVfBB9xdP4CK0Sfb8V81BAqDM7fsPQmHhhj5Uj3KpC
	IwxKK0XXDzg30ctUE9WhZ+LbR+NWcOHBznQ6GWwW/+VvGsELBi0/FTCKdQ==
X-Google-Smtp-Source: AGHT+IFMHxZGAFRx7LiFI3EQg1iAL1RoITUrCiyfvZU4eDXWmlIajOZOFUQI6GbU/7XStDJfAA5iIg==
X-Received: by 2002:a17:902:e5ca:b0:1fb:e95:2993 with SMTP id d9443c01a7336-1fb33f32f3amr33039725ad.62.1720172148189;
        Fri, 05 Jul 2024 02:35:48 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1c28:7740:14cd:cbce:fd61:6413])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1fb167dd71esm48552005ad.238.2024.07.05.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:35:47 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH v3 1/1] riscv: dts: thead: add basic spi node
Date: Fri,  5 Jul 2024 15:04:59 +0530
Message-ID: <20240705093503.215787-2-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705093503.215787-1-kanakshilledar@gmail.com>
References: <20240705093503.215787-1-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_023549_666399_20149619 
X-CRM114-Status: GOOD (  13.02  )
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

created spi0 node with fixed clock. the spi0 node
uses synopsis designware driver and has the following
compatible "snps,dw-apb-ssi". the spi0 node is connected
to a SPI NOR flash pad which is left unpopulated on the back
side of the board.

Acked-by: Drew Fustini <drew@pdp7.com>
Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v3:
- Changed the position of "spi" to come after "serial" in
aliases for both the boards.
- Added Acked-by tag.
Changes in v2:
- Separated from a single patch file.
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
 .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
 arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..b4d2e1d69bdb 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -23,6 +23,7 @@ aliases {
 		serial3 = &uart3;
 		serial4 = &uart4;
 		serial5 = &uart5;
+		spi0 = &spi0;
 	};
 
 	chosen {
@@ -52,6 +53,10 @@ &sdhci_clk {
 	clock-frequency = <198000000>;
 };
 
+&spi_clk {
+	clock-frequency = <396000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
@@ -79,3 +84,7 @@ &sdio0 {
 &uart0 {
 	status = "okay";
 };
+
+&spi0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..6939bd36560c 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -33,6 +33,10 @@ &sdhci_clk {
 	clock-frequency = <198000000>;
 };
 
+&spi_clk {
+	clock-frequency = <396000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 9a3884a73e13..7738d2895c5a 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -20,6 +20,7 @@ aliases {
 		serial3 = &uart3;
 		serial4 = &uart4;
 		serial5 = &uart5;
+		spi0 = &spi0;
 	};
 
 	chosen {
@@ -30,3 +31,7 @@ chosen {
 &uart0 {
 	status = "okay";
 };
+
+&spi0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..f962de663e7e 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -140,6 +140,12 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	spi_clk: spi-clock {
+		compatible = "fixed-clock";
+		clock-output-names = "spi_clk";
+		#clock-cells = <0>;
+	};
+
 	uart_sclk: uart-sclk-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "uart_sclk";
@@ -183,6 +189,16 @@ clint: timer@ffdc000000 {
 					      <&cpu3_intc 3>, <&cpu3_intc 7>;
 		};
 
+		spi0: spi@ffe700c000 {
+			compatible = "thead,th1520-spi", "snps,dw-apb-ssi";
+			reg = <0xff 0xe700c000 0x0 0x1000>;
+			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&spi_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart0: serial@ffe7014000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7014000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
