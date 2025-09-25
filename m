Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A2FCAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zR7zguvOMzFGmPJKZTS0pzGtabyjdvJUtP42+FIL+j8=; b=MCAW0CzjVdw7oI
	Gnz+yHMvSO3354tg9G97mht2Up4ZIjG0EkVzfTcCbqwXDhbCYrPAYb/nfH7wtCuSVvfGe+bCdt+uv
	krstJrrlgpMMSHSBAS+EoOeap5mtEOCb72nfyXUvcHymRdysiiLGqv7ma9+CNCL5SAgfab2zZZpAH
	edrTtWEazvOz7tlU3rR6qFDPgqdKvuPBSRQ4DbF6FDPLUZ9TWSP6/drNpi9j4+STo3O+mXaDm5/5o
	TRSjkQoJy2F/eSk2c83kaqntCsY9OzbmNixHgJMmKJqMZCXnprjDlvkNkeXCzSC4gTycHn6UXVUJh
	xg5zlc896vZ07uVnyF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kue-00000008syv-1RAt;
	Thu, 25 Sep 2025 12:17:28 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kub-00000008svc-4A6a
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:17:27 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-8f3dafc7217so108174239f.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802645; x=1759407445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aUdb5J2bZ3LCDFWJY9eLS9X+bRVmSq7qRBdOrt16bI=;
        b=B4RLrBIGfirIoJEEIrZO6mzT5bd3QPyhNr/fG8oeWdhJKuibMXBa1mJTja/JVcITdy
         9kS/rkjBaEm3sZVTiXIN3URw1i8egEq9a3SxZE6Svn5wl/h8nUl6f8FbvyNXv4yw1PzZ
         ihTKg9VwNI5MwWfUtkicqe7AY2Ew/YT+mjLDeDRD2+lEsIMs+9RVXdwjkF7ulvnNYy3/
         ZgsbG2du9vJWtFK69fFgspywSjye2aUKlH6CoSRDKc8ieGPxwrG1NEGVUmGXar7OX8zL
         xETQji06noT3QdVWvoQjI1CoXUtbufulaWyU1WLB6OgSMfYwwCW7stCjfLsmTOcLLHx0
         sMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802645; x=1759407445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aUdb5J2bZ3LCDFWJY9eLS9X+bRVmSq7qRBdOrt16bI=;
        b=AyfdyE1y4A2k9rKoBE9vuLBUHfkMHPDxHGOTdDcdKf5shaabRraXivAejQ+zoSxIk3
         A/ICVX3EbcJHMUjmiP1yzhVV4d6II3cGTGM9y2y/9/28DwCiDiKHtNFKC6buGVF23q9N
         G2OlYg+z/W+sEgC+OUstHeqnLNCgLkhFI1bb4M3EshuXkIf7bVpcPB1i4MevypD2QeL5
         DKRUElWRTFkiuvGZWeeaI3Qlyc+Duwh2CLqMClSedHwmZUCLMXP/IGRJ3DNA3vMgtGy0
         GTC8LIz6SCeXhehKkLdubwwAm/Lw9KNfBRYyR2ls/FV/l2muVmUrQQgaSxfiD7Hveo9M
         UxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuFsGzQudtUFLGeoAdOWrJ3rZwZlRL3dnogcR4+aMfPjwD1khnE5m2FuOdErBaQAv/ssnlW/jM91phDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Em4p7EMU8N9VG/yGaBrO/utuMZz81CdMAcAvc94Y/8YrUn/g
	r0Up9yVBa0iafM0aQ//b+UM+XCiQoiNDGHDJfBk/s3guE1k+Dh4KIBPOcka9sQaiLno=
X-Gm-Gg: ASbGnctsQV9rmpU5XwoheJ2GufWd2b1/o6DPMQjIUa6HbyglyUX5QL0hvb91GtyKMpk
	wrEst6f9MG8hFVjUK0UBR8j8NVjesMG9e1OyblSx3GDohGyRB64cPE0X4w6IuJrJOY3BzysRwPt
	3RQfMlW62f8f/merqhCn6YA1c4KpFBZ1nztXxOqppDkOzt28VjCXM1kTYSsjmo0YPSG01M+hvbn
	BYXCHxMmN5VRZXvDSf2pcEbWnbffCDOEqXiKBSNIoSqMPayWV0zlhAh4klwBELV2/NX9gCcgiFw
	n4fezRHXXtkUeBoDftFP2yg2KtjfGftAg3Eyjy7rPyymSlK0H/iJjM/U4VygoCUOvFnNUhimeT9
	TYalVNa//oqrmPVP32COm2MbMF7Z4oTu3axRg9l7CTASdhQHBwocQr74CXRmiE/pVYw==
X-Google-Smtp-Source: AGHT+IEjFx3AHkVzoNPeHiWmx7pPFWYjcoRPK4j3eY6oFpbVIi6PpgfcNkjAzfPEtCd6T08qkTPNsw==
X-Received: by 2002:a05:6602:3cf:b0:8fc:4226:5d2a with SMTP id ca18e2360f4ac-90152604875mr506586639f.5.1758802645032;
        Thu, 25 Sep 2025 05:17:25 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040c57fa59sm66918439f.16.2025.09.25.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:17:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Thu, 25 Sep 2025 07:17:13 -0500
Message-ID: <20250925121714.2514932-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925121714.2514932-1-elder@riscstar.com>
References: <20250925121714.2514932-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_051726_032780_E01D4E6C 
X-CRM114-Status: GOOD (  10.83  )
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

Define a node for the fourth SoC SPI controller (number 3) on
the SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Formatted dmas and dma-names properties on one line
    - Renamed a pinctrl node

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 15 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..d9d865fbe320e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -92,6 +93,12 @@ &pdma {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index aff19c86d5ff3..6ce56584ff473 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -76,4 +76,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6cdcd80a7c83b..ce55897d34fac 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -797,6 +797,21 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>, <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
