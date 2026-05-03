Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22AFCD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW/WYdQHjMdFpnu69O0di+huJEsTTub/JUwDkHnH8d0=; b=brKGMEBMCyopfn
	UN005mcX0Y0rfiQPIotUhTS5LXo9iMXuIibuXZdhIxZrNJvHhzPAE2LgbRvn5kLTHbEeuu62D4lVk
	IB4Su7vYXSm9qvKgfD1Fb6lIFFAAzot6mKVVDZbc+RTUbq9O8mgzxlXTfNF74gXLHGT9D5azBcTf1
	gGVfGm4STI5+EfJ6hqXujiIKzTL/nGNS7V9gA6l+4Da2o0tfqD9cDo9tb9EW67pd9IdoDD4gvN0Lv
	Iex7aJx0LvG90gIfDZDz6nBqTqd8ZEoOhxZKGRbx017B/ltR5WkaEdc6BmNvHNBCjXBIPgx1AzF7I
	y8QMHAefXhVZSezziDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJARs-000000094wo-39o7;
	Sat, 02 May 2026 13:32:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJARp-000000094vb-1Ykg
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 13:31:59 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-364eef1891dso934855a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777728717; x=1778333517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVhcCTnPlX7VHPRMEWLneWc1gnjPxqjBSj0V35oqvLw=;
        b=ZW5KmmeEQRvRNRudq9UqScYv8PqHmoE7qqpjavO4H5Zhek/BI5Q/q0fszSPP/VxAHG
         C9Veq5EDC9WhpD3PDQnN8nh1rQsipt88NaCJsuvdfEHBLuMhGYOfR47cIQgDCyORWMbg
         6QICmu7nxzwojiiCmvmenHpGd93R/AwTuitTWZ0gJmbl3lEVTVPvkN+2CFHbIWgmb2bT
         0G2DKcOO8+avCCoj/bSm2bR7aXBPX/8N7Mz40b4pNwOqRZfs2N4vyMOG7K9lIgAlDoTf
         4HlYEZTB/6q+ktLs6dHnqE/1/GHIHAFFFHFvKOb5rqqXEpzLqaMqG9SEGsOsVs32eslP
         iX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777728717; x=1778333517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVhcCTnPlX7VHPRMEWLneWc1gnjPxqjBSj0V35oqvLw=;
        b=U4laUN5sHtqRJiF9vrLf/eZ6luUHqzRbnqe4do5l1AXDOJPgGVgyoR3x+cs4/wfCQs
         B9ldy5VUP2Kjr8yLR0ij/esyELV5tF6K17v/CZcOCGhhKY3O/KjBTryEMRH1aErg9LC6
         GrUF8P4vjwJE8HTzSy1XpH074gvm/872dgiBwYJtZIkz6JwXA4L16G7W7bS3WovUDeLk
         VXp4cPWp5ITyVaMSSR3oEqYBoKwfL8+txnN9vc4S0noOhqhF/6Njm2Dtnl8l6qDKE2uW
         w1CjhYjIqS7YjRc+w/cnBzOL+7sIBTwfDyk9pxEwUeJ5ae5ecgqRxKlEGQVi9MOaMBY8
         zm4g==
X-Forwarded-Encrypted: i=1; AFNElJ/FFgKCJ5v4pEsTVOH3b7Y+pMBEeCz7Eo6+ptlPT6i0CozYCFyOX2uNIwAKsCkzjClvZg1iItfcIYj9xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmy1pE84QFAZQnvuEczUklNL2qaVpt2ionGIKyipHyku4u3Loj
	3BPSwkKJfKl35LGA2QXLtHizvFsp9repJ4ndafYtoWS3Z5AspfYfgZjXXNb97WuEou4=
X-Gm-Gg: AeBDieuhTFxs5uzTd5SqO589l+ND2deVDR+mGdAtVu5/M7JYSYwTOVJ6femWTFxvPHN
	zwutVk+M/qRGflNKdK94jsVuxNqj//K+hGoQwKwuZkqytvlSMm/I5ILfwe3K6C00nBL9U8nGDv8
	Tp6SBeQYGX69JqapoY8tVlw49qY2Di8ZVZ9ZqIWm6urra4zB6vz6Tzfm+QLcpbG0bhUhPoXsWrY
	XmYoxJXArFbkLPejJvF1YFroDlJAkLwDpke5NpgT+fs2Dla862Ip60Ktp42o94KWTisYDvM4IZk
	60VQgy8Ddnu+tgw7IgXcItsQ+3XddFVt99LYc+iT6zbBAJNydzkhoGi6iNN4knIdy07gLiSDQ3B
	nO4MQVltJVAxFNHPqpvbsbNpVrGasNyEIg94bLMV+5/Azrh1tKGxQDfIsVdqurowk/UNET7Vkng
	hAiDfsD6wj6E/jH1Eesay52atDxuyFrRtHbqpYmmM3FVsi4KHPaab82jYCxIzueJBu
X-Received: by 2002:a17:90a:da8e:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-3650ce70a0bmr2989866a91.24.1777728716810;
        Sat, 02 May 2026 06:31:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm5647937a91.14.2026.05.02.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:31:56 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 02 May 2026 21:30:53 -0400
Subject: [PATCH v10 3/3] riscv: dts: spacemit: define a SPI controller node
MIME-Version: 1.0
Message-Id: <20260502-spi-spacemit-k1-v10-3-f412e1ae8a34@riscstar.com>
References: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
In-Reply-To: <20260502-spi-spacemit-k1-v10-0-f412e1ae8a34@riscstar.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_063157_423693_1A118FFE 
X-CRM114-Status: GOOD (  10.23  )
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

From: Alex Elder <elder@riscstar.com>

Define a node for the fourth SoC SPI controller (number 3) on the
SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v10: No change
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 15 +++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93db..9429189354d6a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
 	};
@@ -335,6 +336,12 @@ &pcie2 {
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
index b13dcb10f4d66..34d88334e95e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,24 @@ pwm14-1-pins {
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
index f0bad6855c970..f8747190d2e12 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -983,6 +983,21 @@ qspi: spi@d420c000 {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
