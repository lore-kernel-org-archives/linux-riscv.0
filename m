Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6428FF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NADnQyhZqISTjFJfb8T0fz7zgoEqtcD4V6bTPXuEDTU=; b=eIV/4QZaNaIgFS
	lg4ea+FvKriBCr/zV02yLQdGtk9KIj/w6BfZVKXFzR+ZRQuE8/Boc7iVcgCr15UIeX304z+I0YMlD
	gxhkqDL3Alozz/dmPt+sY+0pjOY4jkn7xwCx1Vhhgcbxt0aLv+RtD0+8IBdrdt6NDstRxYjzpT6OR
	RvtfhjQii9mLDPwLVssTiDtBAEHGrLZWGjDfOSPtxQ4qDfnhrPBVEgS/s9tRlX7vZm89YOwEoqe0q
	Uad2W+Sw4TODjVbkqderq0V9OGfHp+CU+5qm9FOw6DDE10S+zvjlDI0WGemI8u7ZIa8WG7q5MxRNb
	LCnK2DCKUG9AUeTHxqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXc-0000000H32f-0GjY;
	Mon, 27 Apr 2026 14:02:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXV-0000000H2z4-0pfF
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:02:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b2503753efso106019745ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777298540; x=1777903340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zn1VHf2vGq/Rgp6tmVMmYAtaKJKXMEkXpNhjeJ8VMM=;
        b=UI1EdZCFbe/HNIT+0wEhtF8d2gNk3+4izEOObBe1G8nzznBoDsMXsJy7VliDJqrfMp
         NzBq/C/lyXO29x5bZ0HNmvzqJyxXGg63rT/DONZg2j/0vfC6mok0oIVnmO3whjure4XQ
         tILzs9Xg+dUkYjcWoNQvUQ2jVdtYtXdmLRRjzXO80JtXq/NyazkJlak8CLTDvcGECntB
         M29v4+W+6TZgb3hOcQnY+1XP8h0OnDdFA92LZFtceHYqnHMtS8h38NoKdUPM/16GwZqB
         +BxkLMRV6i/uC5Dd+nMnwikCjKAcGo5E273nBiXn/gL7Hs/d/KoTE6+IB+BvfBQlN1Gj
         N95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298540; x=1777903340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Zn1VHf2vGq/Rgp6tmVMmYAtaKJKXMEkXpNhjeJ8VMM=;
        b=J7VhQZ+rLcGbvQSiMflGZU4Xh654m/eiVcUlMiMvB/U1ryw01OgLb3iUDex8gEIfA1
         f7UHWTJAS8Dgu/bjQE+gk0KSlsjcJFHQ6+PvqeHJu7uECxciizEt4G78ZpN+yr/cVLA8
         2tnOwNLn5bIdgnwUjZZWnlWoZgDkf83VoXAqsV9WwG9yTTfG2H09tXbncYBt2SMxadId
         dXEYXejfX6Uf6obRmP9DiYByGmHpdQ26WaNgMh7FL+XoB2jmqUurSE3iGYS6tNlOZLzr
         gjj94DKK/PRVm62LE+AqeX/ocwl0SW0v6IvyIX+D/0K4VZnJITha+NlcY2F+fMB2sZkY
         2m7w==
X-Forwarded-Encrypted: i=1; AFNElJ/I3dyDMNjm6muL5TdJscwXKOGFzzJSZDGWsAeJYd7pxM9MV9iMtIDOEWlbX/PWdl7t74A1r0aRigAScQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwEBpjOmgUbs0TNsKNqOryviNg7mfoeQ5rWdzYwhUx0ORNO3Oe
	7//KrPmGdmoRCsDL8vMMRmu49snfdS7hTmLLBoY8PdBHNn4LBRrm0CqZgwCgXEcFeeYZrElLSte
	eZ73boGuZEg==
X-Gm-Gg: AeBDieuuHxLcGe2Jj8QkincowhNx7GA+5ekeaP3yDkXXe4M7LYMyXIFpAW0NHrEat/Z
	raacaHB0cibLPFqnjN9N52s4If95oPn1hC+LIqrYUtyFP6QzPKoqu2CmYoTF6e0oUAdwpMGGKgj
	+WYgGsAeHYlURFniaboSX8Tj+OoFalLD9ENknuonTJUIB9Q42f9Qq+K8MrpAvRgMzNiG97AYpHU
	/fWoA8/i9te8BWf0LqhBt4zqOPV8aoDLvwfTfy+fx8CMd98d91FML8WNKkmQGPFDG5uYjzP/yW+
	MddFTXQUhNS6ucYBMOhrZxFlsDluc/19XnlLA3ADvhpWqzo+CYmCOyPpF8S7On4PAA1nPVnIGj9
	SRlXoq4Lqi0gQJjzfz7Hzne/Qo6S8fZI6EXcGzeDnqf1gyvP7c46XKZcs1VvssvYZlr1ERiv+6i
	3Az5DbUl6x4yWauC7M066e7Y/Suowo35Dkan+Kdu+sZrBEenSvTyruNA==
X-Received: by 2002:a17:903:3db3:b0:2b2:58a2:c8a with SMTP id d9443c01a7336-2b5f9d68827mr300145985ad.0.1777298539927;
        Mon, 27 Apr 2026 07:02:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm307143625ad.3.2026.04.27.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:02:19 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 27 Apr 2026 22:01:29 -0400
Subject: [PATCH v9 3/3] riscv: dts: spacemit: define a SPI controller node
MIME-Version: 1.0
Message-Id: <20260427-spi-spacemit-k1-v9-3-ff753b551302@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
In-Reply-To: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
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
X-CRM114-CacheID: sfid-20260427_070221_250976_6E5AC4F1 
X-CRM114-Status: GOOD (  10.08  )
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
