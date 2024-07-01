Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E49CC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHZ801/ZTGJ+to2Gnhwqe3AFHnXFNWWhMt78a4lVpaI=; b=ud4HCkMId/AE+B
	pVE19hUQQiw8Vl0OUzN4xaL2w8AaDSxe/rrjFLyUaOGHrJqCRHL3KTfqQh6yvRvQ50zkNI6LUX5hv
	3I6GGmKdmexDqAF5GqCkaAS9QqrQRE9MzeSJwlzbwaK1opW6GvSWge5VMqRTsc+IohWpe6S9wqYEs
	bJxYwHGWCp1kFEuHfEYSaFvaCxLVZIW8GWPyA/8mDYzKT6EIZ7AeHi8OuzRsb1b04b/TaZnv4gLRj
	VJibejze0OAqW3slYCHSgldEkXnKxiXeTY5Bn3ua/PmInUTtMZI13sbt8TuSVixtKkXp3SXz81Qw1
	PlzZoHpZEtOEoVZ3tBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGGZ-00000003G4E-1XgP;
	Mon, 01 Jul 2024 12:36:19 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFvv-000000035xj-1InX
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:15:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-713fa1aea36so894687a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719836098; x=1720440898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZGF+hSKAfpUu0JnRW8V7jeP7SMQ/BQAWzymiuvR/t0=;
        b=B4TqS/im2cxNaI840khWtHZk5M2S+ZFGhgfAlXVYH+kMLh7sugh852usca+F7cku2E
         WoyoTZY2vG+uGSTq+t832uLIqUKxO/bgBpO7mzilXDWxHzgw+O9HRFIs1SktFpQyy9Nw
         MqSu5vkq+qQFDSd2bDO2SX1vOkzA9aVHsdBV9JYtZTGifCaGKbP/IhEXnGu2+36CkmB5
         sN5bHBqR/OJMhwktUOylxKZesnkHqoLI92++sSUyesDCcNoS5gB3a9G746z8BYTs0brO
         A2i7kmSiYMM8b0VFKvrwAr7nt9hrSeEP8wjUuXH5mpIyl0i8Dc2ZEfeLuox24D8Bnvni
         pHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836098; x=1720440898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZGF+hSKAfpUu0JnRW8V7jeP7SMQ/BQAWzymiuvR/t0=;
        b=EMJ0ebdYmOLeciRSo8F0mt+bXxLp1beaiwL8Ve0Jl1zSr3df0ZNvOYwgcokV05jgoV
         AjIRPCLKP2wiyt9uisVjtJjPKiL2GPQdysT7grN2UmwKsqosCkZOaxtoZdKTVa/jvYwi
         0bFKw0qCEhbG/75igOcyS0x9NbnbnQK7xTV0155nq+tjuiS0e77B2Xf1rfdpTo4k4UoG
         SmMlclOl0vHFHsy9wyU664OMngcLPS8f+7PoFUiyqgKPyaGsmEq4F9DOif3B/oooJj84
         wMbXgP0/zCZ5y/4twDBkgSFYGVymj+79QVYzXJr+ZRvLMWaVSDzUuDw/wfzwP6KEqEU2
         r5rg==
X-Forwarded-Encrypted: i=1; AJvYcCXqteTr+WfKvS2pZSE4fMSB8Wl9d32PVbb1Q2whnLdOQ7L6KloQ+1ILhb29eS8taIbYNGkjNfbmpZIZdIb8zhzVdiTJivsCXc0Q1dYag/yA
X-Gm-Message-State: AOJu0YyfkSh3oZnIpZ8NrD+26OBMpY0UZv2MJZIxp0ZUq85wYTaSIu3l
	ilAVhufjXhlrURAME1VLhbUi5QppqjxDkgZlLZhCR6k1FoN0Z2Un
X-Google-Smtp-Source: AGHT+IHw+TJdLcLvIGB0OVy2rxLeDd/zmLr5mcFmlnJl7GUR+T4SLoYKO4G/3uCq247sGd7XaGdgBA==
X-Received: by 2002:a17:90a:c394:b0:2c3:514:e0 with SMTP id 98e67ed59e1d1-2c93d76765dmr2671731a91.35.1719836098208;
        Mon, 01 Jul 2024 05:14:58 -0700 (PDT)
Received: from ga401ii.. ([223.178.83.109])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a77sm6613098a91.6.2024.07.01.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:14:57 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
Date: Mon,  1 Jul 2024 17:43:54 +0530
Message-ID: <20240701121355.262259-5-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701121355.262259-2-kanakshilledar@gmail.com>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_051459_374636_E7B9987A 
X-CRM114-Status: GOOD (  13.96  )
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

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v2:
- Separated from a single patch file
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
 .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
 arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..3103b74e0288 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -17,6 +17,7 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
+		spi0 = &spi0;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
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
index 9a3884a73e13..14b06dd81a9a 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -14,6 +14,7 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
+		spi0 = &spi0;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
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
