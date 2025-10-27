Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82769CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6A8uXmVc4yR7pSkJs1B9XPFT1pUPTG/SoZzXhB+vIU=; b=cVQSg4Uz7zfNoO
	/Y7FcyxUP2SCXFa+sGrOjpZpIJ5NCjzCvC3EExrVrq2vT5IW8+Xqx8Tp+kfaSVSHGx2o7uo6YLeks
	D+b9MHcxO7fp/ZE8jN0tGimSfV0Y28NHdz5m4iXC+2CepGxnsmvXFCAk1pPZrxdoIcO9Rhl3T10Xr
	yRTwtbrYkJ+ntsZuxn+d2khcV4jfV7f2glV0JgXbdNWONwXditxpLkHuCozwx2idkG7vRFWC+FZyg
	WkbaZFH0Uc6fd/C9/hVLaRp+dSzeYOfCAHI7wWz6seo7LgyofBBBkxkSSgZ0xU0ZbkRxXvyD1G7+c
	meNBRBwpspHixhR1Zp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMkp-0000000DwP5-0vJ8;
	Mon, 27 Oct 2025 12:55:19 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMkk-0000000DwM4-3MJJ
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 12:55:16 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-940d2b701a3so492830239f.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761569714; x=1762174514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZm4qLXyHnGCSJjs14timCrgYr+hiVUmvuC1ejayZQY=;
        b=G5zHUy+eEa8ofdY5OD/7dQ4eLuhvs2/hm91rjOsNBXME1koF+w7zfuMkyB4swVupXh
         126odaEpss6Fz0P1Br4GWjH/HWUwttdoHn2+F8aZI5ikGiysMXwEM5IWM2ecI6PAhjjB
         BYmQuE1/yt2J/NPyKuu2lVxhD/l4zPuNhDWuXUCkfW1tAuoNrjLXP5Y3gFuN2jjeKfiz
         sE6kqN72Ny/9weazEYhfR5IYQ7cUPoff7Sqs/SV8cinR5u90dFFeF08VXcPcck3NnVi1
         uJJS15VgNa41p/MSreexp7QLDrmyYDrQcKg00FBXe8QUAqW13s+up91TAmBxEFQV5TAS
         EUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569714; x=1762174514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZm4qLXyHnGCSJjs14timCrgYr+hiVUmvuC1ejayZQY=;
        b=o2RLjg1PnMEghyQ5odeRjB7tVvzrAV4ADwiAnlxcq4Ok7uJAFU+8B3TBj2EnNpBLt1
         4D62rKbevAWbCZwTRdndTMOSUZf2YI92QozIVfgWvncEMcBWq1zoDzZDIkzubHV62XUM
         P/JunQHw3HlMzcTZvj+zEFoFfEfMCJGNYJNH0YOVIvdkq6rme4TXxYDWbOR/oji5LUbb
         g7l/95vGvWUPwjQGLxH64aV715bSl2tsdXFalB7qLUmvIs5T47iT2Xsf449mOIY0tl9h
         hm9qsuT59H9r8Nj9b0CQyvgMhgTpfE5h3MqQU0sdpiBeoBtfRqDUA3+M3/vIKgZeTvAe
         nTRw==
X-Forwarded-Encrypted: i=1; AJvYcCVkqGJoP1QpdnhOwZW/sh3HPEHFjvsWgNNmYTX86IeHNUy8QxbpBF0fkXqn0QkHagx77JaPzhVctSFVHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsaseg/4ZcYZLcJgWkYKnl96zvBaYVprmYp6O5KinuFjCY8tRM
	n9qYtSBtFo2NmtI1kwKEl2BKgqg0BkndSgsSumkYTrtJtaJ6tzH44lGruPc+Cjvf4vS/s7H79il
	lB/3tuYM=
X-Gm-Gg: ASbGncs2imPb6Ioh0teHn7fgRG1juAXfRufmjRPHHiiiLapehnWhBoW0CVK041IfYJi
	WMsiFZT/dBobZ6OXgPKDIJG9D4UhBfcwG6TMU7HW9/jk2efPO4VhsyQd6N87wk1HrtObwn0DVsb
	TLWsIxif4jQJisxrSo6u4HUzxHPYi3D4/tqbUt+Vdx/N4Dd/uWE9t3uu2t1xpwnlSEkwBwcUQly
	0PQzEx75ZkftY0QJXA/epJSSDJJnitmppPcq7ET1vfQ+BSKZsc20hrIGXr1x3VuTb06uLw9mpOx
	dhXfcDZrlhjSpGKrUhT+tKoFGISz0AkyAI1uU7q/XnMQXwwHxZFffInsmKhlauInPeyY2/iOpBv
	4prAj+DdhzNFpHITU67UXSdzvaqLUInVjkKvdwAJgh3aKlkk7yXczCaBSnJLpvCO6s/QXYUeqlc
	OfuD/FqYFavMtRny5VSrKGlteyhNu2TykxQvKJQu1jSQs2ZboYpVYXzQ==
X-Google-Smtp-Source: AGHT+IFmmT522+C1SBtNjrGRDwvpDMmF/aXjZncAIPKX4af5yw9ZwOirXo4uSn/478nB9D2HnyXQgw==
X-Received: by 2002:a05:6602:6b89:b0:945:aa9b:4165 with SMTP id ca18e2360f4ac-945aa9b43c4mr414941839f.1.1761569713842;
        Mon, 27 Oct 2025 05:55:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359e742efsm249121639f.7.2025.10.27.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:55:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Mon, 27 Oct 2025 07:55:03 -0500
Message-ID: <20251027125504.297033-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027125504.297033-1-elder@riscstar.com>
References: <20251027125504.297033-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055514_843118_67AA5610 
X-CRM114-Status: GOOD (  10.50  )
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
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 15 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..0b0478c6f273d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -16,6 +16,7 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -258,6 +259,12 @@ dldo7 {
 	};
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
index 4eef81d583f3d..c4b9f6265a31a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -516,4 +516,24 @@ pwm14-1-pins {
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
index af35f9cd64351..990246a3b50ff 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -823,6 +823,21 @@ uart9: serial@d4017800 {
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
