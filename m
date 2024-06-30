Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A9C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1wfE0Snty2xkCmmqEyT0dlG9J59G3iY4pfpAJ9az1RY=; b=kzEcVmNP9M0YE8
	SNHoRuF8+ITexONdQc1kcqvhSgtArVamkw1wqZaS7kizljNOSBOksOQFjFU/xZp1jmarh1TmupeWo
	6FwOdbTNh4aAEdLW50UoI0x5IvPkZaGDqeVbmWKFbJNqRyzN7oC+6RaEnwSHXF8MGnxQIsZjfE7cm
	MC7iNbS39w8HaRuseZzSXWKGmZnNfo8n2G6S5Fz197n4vJLW+sW0UL2e4auazmhwH1tKAUxRJ0s9Q
	LjCx0M9ZRUfvR2neDfIGLEoeFv5ppYYepo64X3Qaupm2II0pLh9FMoyZngc9QWKNHd9nKghbujb/U
	mVSXO1/jIX6tqkjKGlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNoDE-0000000HVAu-1Hew;
	Sun, 30 Jun 2024 06:39:00 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNoDC-0000000HVAT-0y7O
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jun 2024 06:38:59 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-25982aa59efso1007206fac.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Jun 2024 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719729535; x=1720334335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcY18BrD0/gIItoUlZh8XyBfrX5yv5R+UNZ4yG5hJ04=;
        b=VXCWniSfg/X3dMVO4TBIHj1Rfx2CFRxY5bGRd3q0JGyY0QfmlWCqMTQko4wmWPFUA5
         JsLm13tpwNgalVmo4Dp0mc0uLhJ4cdG/1mHxsTe1Dpgyr33U1PIX7m0tYkWvPbhkN0En
         ZzBX0STKRG+VDLQB79J4TBUQoHty1FgDWaQ9CKq9WPyLkAvjRK9GolMhOmA94MvbxBUS
         XcGPeT41vIcdxVFYnurjdxhLnD98JNo2RUILZHW9lz4g81iqytW8Oa3EC7lrXVOdvAu/
         dbZE8enGdIsexJeVL/3ePxZozn1OeeHHEMAfp1sgVbksHDVLMCtFEIQ0ztbyZl9hqF5d
         hFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719729535; x=1720334335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcY18BrD0/gIItoUlZh8XyBfrX5yv5R+UNZ4yG5hJ04=;
        b=EqWPUx1qj1shqvEeaYvyr/uPxAyhRWg4vQ9AE97xXzl9XnTVhJ0M7Sq+zcWtYMLLKR
         utWLYEITpHo3QJ8ZdWk3xZwQ2UCIRIvo7Jjte73zSMaLWictVeFhP8TqUvY8ivwHqHPB
         zrNVDsZGMO+BYegqRzGOrsyLTwHXxDVrDxb6CigAhys5pGXbWgz99k9asGJy4kJoU36V
         a6/09+D6keQFZ6VtuId9S/6BhR9jimzd7OyevKSVv1Htehday6hjqAFrNbuRm0utRY5H
         eIhcbiL5HYDdTplRVlZflD6AFKS7INmW3BNQf6Dwa1kc16U5iGMtCVAgdPJP8VNuV4OX
         EbsA==
X-Forwarded-Encrypted: i=1; AJvYcCVPfB+HMR4oewLWN0hZSB8mjTUaqMNwM9oRHCFhoyX9qs12sSZhGHBwZZY/Flziok5HmTrLxSc7aPBHgjLTIHGqdtotQbe15UwV8FkG719m
X-Gm-Message-State: AOJu0YwglSVZcYv9gkYSIIqhNkfaDX/iGD6INi6yCAoEBFja06sYwf45
	0Hx7d2j6o9ENk54mmC9CTxEClOKdl2UXvU4dCT1ILrROkM/cgqiX
X-Google-Smtp-Source: AGHT+IHV1EFyJxWJPau3gYXlLOEE5X8O10yturZa5h2xV6cnNt8lNgwXIjAPH9L3av1Etv9r9X8Qcg==
X-Received: by 2002:a05:6870:d6a5:b0:254:a217:f8b9 with SMTP id 586e51a60fabf-25db344283dmr2390728fac.31.1719729534620;
        Sat, 29 Jun 2024 23:38:54 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc9:59f2:a68f:8261:cbcf:3139])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-70804989399sm4164149b3a.193.2024.06.29.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 23:38:54 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: kanakshilledar111@protonmail.com,
	Kanak Shilledar <kanakshilledar@gmail.com>,
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
Subject: [PATCH] arch: riscv: thead: implement basic spi
Date: Sun, 30 Jun 2024 12:08:20 +0530
Message-ID: <20240630063845.116307-1-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_233858_280084_993CDAB1 
X-CRM114-Status: GOOD (  13.80  )
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

implemented basic spi support for TH1520 SoC.
created a fixed clock and a simple spi0 node.
updated the matching binding to include thead,th1520-spi as compatible.
added a spidev device in devicetree which will utilise the spi0 node.
this is usually reserved for a SPI NOR flash which is left unpopulated
underneath the carrier board. I performed a SPI self loop test using
tools/spi/spidev_test.c and tried sending `\xDE\xAD\xBE\xEF` and verified
it is being received correctly. i updated the of_device_id struct in
drivers/spi/spi-dw-mmio.c to include "thead,th1520-spi" as the compatible.
this patch also adds basic spi support on beaglev ahead which shares the
same TH1520 SoC. i have only tested on LicheePi 4A.

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml |  4 ++++
 .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
 .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 10 ++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
 drivers/spi/spi-dw-mmio.c                        |  1 +
 6 files changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index fde3776a558b..bccd00a1ddd0 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -88,6 +88,10 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
+      - description: T-HEAD TH1520 SoC SPI Controller
+        items:
+          - const: thead,th1520-spi
+          - const: snps,dw-apb-ssi
 
   reg:
     minItems: 1
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
index 9a3884a73e13..26f82fe91489 100644
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
@@ -30,3 +31,12 @@ chosen {
 &uart0 {
 	status = "okay";
 };
+
+&spi0 {
+	status = "okay";
+	spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <500000>;
+	};
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
diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 819907e332c4..39e3d46ebf5d 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -419,6 +419,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
 	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
 	{ .compatible = "canaan,k210-spi", dw_spi_canaan_k210_init},
 	{ .compatible = "amd,pensando-elba-spi", .data = dw_spi_elba_init},
+	{ .compatible = "thead,th1520-spi", .data = dw_spi_pssi_init},
 	{ /* end of table */}
 };
 MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
