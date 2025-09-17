Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60122CAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWj2t1YCBPXE4MMEZhkHkjpWLev+wj1Seeorb+klHDM=; b=Fn6LwcU7WqVw2S
	Ob6oSUqWL91G/3mzUOq3q/uvSsozaZGyFyfXVj9mHOcMDXbCpz3dOnlTQNlmz4JadwAZph8DNZ43C
	mZadgkfsXZVVhX3s5QAwnWmGKXCYpxb/KiYOFp36nOYpRHYzZ1c53PNMNntzlVR83PnzwTaulqpuZ
	jEEDtirPYRyb+akOzT6nI9Ub4R/AKsyqszIZ84KiqEnigjexVRujIN9z9vz4+iPh2irtNtEZY5V5L
	HUulfn0yl6QhuJhfcieyxwYPSnca4ZiPYv8/PVPS7TZc1c1pI1YlCnvkpl8BCxR/EPLrTatK470uw
	o+BKSqO4qVoAryhbC3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JP-0000000F9Go-2JYD;
	Wed, 17 Sep 2025 22:07:39 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JK-0000000F9BS-11qI
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 22:07:36 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-88432e27c77so14884539f.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758146853; x=1758751653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plxR1Q0OTlig1zTxHt8JGiXb5CbrsV82EqogeHId9hQ=;
        b=TFmgqbowHgGN/rrTosgjvlRscvVNQ+pLcTvlrt83a/739SsN4+zkixJ1IWnGMF7cbD
         iCGhMT4rc25BmmKL4pSf4/pQwrNmA90aX0wstUJ85azKxZzGBkm8hIhTYq6PVLbvnmeP
         dM1ewuJDDWnRRalNZ6ib72CSOQtEYKK38VVNCug/JrbA5PYFtQXl15LILRHmosmQYplG
         USFXvUqge/kSYS6sogunQpqr70vZ7PsyQLKwZtHA4uk7cG+ddYmHHEZMpSTxcweAAlAL
         sO6SIuTKXb5NrDC9crWSMq2VTvQtJpTfnMCfVcuMNqOQ5SlzS7Gx3MLXtnP5oQtihe1z
         Fy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146853; x=1758751653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plxR1Q0OTlig1zTxHt8JGiXb5CbrsV82EqogeHId9hQ=;
        b=qS/lU+goVQmdCnaPEotMXYjyWjRg7N6Hq4uVNMjJDcc9oPGUoKx3kyc81lv0JdNean
         qshwZYiEL+wK+zLcH4RUw70zMThNBbsWt35Pso0VfOKxj589VWR19a+pCXc04/Qj5Jgm
         9n6AJ2Qdd2TOzv3Y+rBA7YaduChXC3oaBf+q6OAGv8VxXTgA/MmjJ+XNVs3xfu/rD3dQ
         /32vZpP6tUjXIWsecj6mFri2JvZ/fceizzDE3MrgT7+CNW8DtspvxGucAWKI2GMZ3Zdl
         SilpymajWQ0aLFb5dLxF+W3Lcb+UBeWXRtWhgNXrXwysCCe/iNTdePJuMZRw4Ek0TbLD
         Q6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTHmFGxLGsgsIm9xO3s2KclpGNIzHeW0cSqyK9atbMA2IcHiXm0HKPyMAOQhAhRtNDsY/If6FcsXJimw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4wkcjS5EI5U7gI3cZxs+qe1UKw6eg1uWU62X+A4oLX7vAWmCt
	mytzYkrUGz5O4kNTh6bjddh8Z/rQyb69xFbaveS5574Id4FrPZhLEdPHCTYigLssE9E=
X-Gm-Gg: ASbGncvzKkQi1sYhnAiD5LV2ThzQMnbPzdq3cKyPYD5WRL4p8s1Fa9W9lmkPG12kb88
	jzNE3ms93dOTnO8ue8B5OSIkQoGSF838BrQ7uaXzZ4XisGo7lAHby6oVJGwNC4v/59Z4rxpdh/9
	JafIsEMTsRPuj1oNqgI8WmGcIRCFpbFGIKllEb6HjTAPeDYjkl9f+hCSFwUnrc7e+34vLzzUM/Z
	iBxKTXqJvoJ0Z1vHjHgv8pKld9BXS8GL/sbsipluOb7JiWZlQ6FmFkWUjvAy6xwi5fmL4DxBE7H
	rH/bRYo+IQb592C475SG5QVGOZQ6LpQHyO0tViui83xf6Feh677DHpbc4cUOgOWJFEZc5i4kSNz
	5yagMzFJLw+D7eqYSRMCDrO2YDOSxwu1CtB9C0bY9RBYzUP3g/AgJhz3vRimwBugDhNnqzxhr98
	YrEzuqQvp7
X-Google-Smtp-Source: AGHT+IEhEgpu/y6hcFx432FAALiFyoyiIEe7VNM4oad62y0XdESrMbIYe4L7CYQ1KsF8cTepL/COMg==
X-Received: by 2002:a05:6e02:164b:b0:3f0:7ad2:2bf5 with SMTP id e9e14a558f8ab-4241a4e1040mr57294085ab.12.1758146853240;
        Wed, 17 Sep 2025 15:07:33 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm2346335ab.22.2025.09.17.15.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:07:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Wed, 17 Sep 2025 17:07:23 -0500
Message-ID: <20250917220724.288127-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250917220724.288127-1-elder@riscstar.com>
References: <20250917220724.288127-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150734_326417_80C97476 
X-CRM114-Status: UNSURE (   9.82  )
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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 19 ++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 6013be2585428..380d475d2f3f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -44,6 +44,12 @@ &pdma {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssp3_0_cfg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..16c953eca2aaa 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -28,4 +28,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-no-pull-pins {
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
index 66b33a9110ccd..a826cc1ac83d5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -834,6 +834,25 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core",
+					      "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts-extended = <&plic 55>;
+				spacemit,k1-ssp-id = <3>;
+				dmas = <&pdma 20>,
+				       <&pdma 19>;
+				dma-names = "rx",
+					    "tx";
+				status = "disabled";
+			};
+
 			emmc: mmc@d4281000 {
 				compatible = "spacemit,k1-sdhci";
 				reg = <0x0 0xd4281000 0x0 0x200>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
