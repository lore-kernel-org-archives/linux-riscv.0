Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267A2CCD18E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpLZ/n+jwjTGoijGlPTEsBlwC2X9AyNeCSHp9P5aqu4=; b=uP4N5DB4+pvz1W
	C/Vyq8shNyRpQQ28R8lwc0hkpR/j8gV+SezyJ0yiLxhgKIrjgH9cknSOtWnYlnqJSMTYh4NjcqDPu
	uQQc6CzBYXgjl81pZNWXoA3CmQLwXr780jgFgBe4k2+bjg70wkjXVaVetCUP8NJxXwlIaZbGUF4Hm
	Wwhhl0Ix8gu3RkmtampOQC9nkHRK/LpDbpj+iQsM66Teitp4N9+SUcL47hJr2/ElrSZKrljMpsIqQ
	HoaH43DWSz+P6kyqfdYJgN0S64IiFPfxl1kxpjtZHWjzDY+sEzEep0v/78rEE1VNw5nJU0T03YTUC
	53Ujq1ugchRxo9Y8h1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hju-0000000D842-02LP;
	Mon, 13 Oct 2025 12:33:22 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hjr-0000000D82b-1OlP
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 12:33:20 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-930cfdfabb3so225560439f.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760358798; x=1760963598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH1v0rpYCArgbrLYKpreuIoN+Gm6oJddlVx2jUGumJY=;
        b=gOKhkW/R/zS26S0PYuvEZb/AQ9xaVxlpigmdJ5bYDk4pHn/YjAWn5O3vIUz77IVUpi
         ipio3brmkGlrLHUSkAqSlzNfbVBlTnwocYymUhKjwOEBDev6bFPOpPRxaKhVBJNWVGNz
         fb8UPtbejxS+DPpGD2VOeMKPTfS4UZMh19tvGXww7BmBj6hDOT0J2DaXEgsgUKwHSId2
         sz0kDUbX3K07M77Q721EbYFr/J/ffRW048WA3Y0QXxE6BCRlvARVny3TWhXyrHDxwcDA
         JeS5nZPLYCMUwvXJTIZBR73gFInMh2LFF7bYSlyUN6UaQ7AmK3If42MCf8sNlQ/+rrlZ
         RhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358798; x=1760963598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH1v0rpYCArgbrLYKpreuIoN+Gm6oJddlVx2jUGumJY=;
        b=MjKjhavuoOB6nrE+EgJd5RosyWEQIjKtEq3CXbuPq61cGgC6WehPXelGQ6o7eZ21+f
         +4vtKo3jCYrkXj2tXhuevvwseXkDv/wM/aUlRrLaLDscVxfE2CbgF149NtaCrYoFmTBi
         DvB8p3E93O5aemj9J6C0AUB6tgqxk0vyZf/iJ9Mf7EvB9gZfrZL2/1Le+a1sdBYSqN7I
         RLEGGZbnu8Ydhuoqju5itva/KhPU811+jqYDlrx9s52dDnbiqNskfcazuSa0yIIBFnsl
         tsHM/KITV0CIBGcC4pejOWhm6zbeR+Fvg2r0qZ2Grai6vv7I5qxXiZ9QMPha8uQtrmPj
         MeEA==
X-Forwarded-Encrypted: i=1; AJvYcCXlfCXCsFHXNZDL6yewYByH2/p9AeRDCF5LFiu41sIZ8M51/7qdCHmWztsXwue2Qxtnz7efoI6qf2WSGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcg7ThvV+emgJr6x8U1BzSVizDOcP14pHpZiLs/NlbAGVMqSqX
	Q5wJ13Aknbx2RGlSQ0JdrB9vxV1zwo+XtGifE60kY7d8FoGeqBKtiS0Z4cu2761NTLQ=
X-Gm-Gg: ASbGncu/Ob9CNWbaZ4cFx2acykC3lGYlwg1d1FVwB7AHlOqZSjxayd5a6lldaA6HEji
	Wn8vTJ+ZEtBAwCxs9hwopEPwOlwfXAaM9o5k5eUle6RzY8EYtG+C0r3Kff35fv7QyvPzqEYa2vr
	/E7yMI64PwOUK3lw5HYaQaw5oHeslYWB7dfdpm+I+O0jv+vPfNseUTDvC64T7zeSKxc3af4TPo4
	wV7gh8t8JGgJRCMa62Inn2tHBNa8sI1sU1RlwHyCxgqIiRjd+K/z/SO9DYIqEQ+wptUaEZLnwAI
	l5g0avBLsovaAQPG2jDYFXXhmyzFkWENM4VD5haJA4TS5TlMx6/Ssm9SCaGxbLjlK9uQ7RGJrqm
	9eJyefvd95s9a8YHeDawLoojfrp6HaP2TEMkuluO5erSJWEUzIHnIl/Hu5NsoLNabCriCsmMd0F
	11qIBE3dPLYwq98v+qVAg=
X-Google-Smtp-Source: AGHT+IHl+kdG7KX32xkfhYQaqxRv069N0+qssQtZvAYRJCWtVjC/Z307urfNlq0x0wqsqA/KnCtbeg==
X-Received: by 2002:a05:6e02:1529:b0:42d:87c1:da2e with SMTP id e9e14a558f8ab-42f87497a42mr227386585ab.13.1760358798387;
        Mon, 13 Oct 2025 05:33:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9037e344sm51529815ab.34.2025.10.13.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:33:18 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Mon, 13 Oct 2025 07:33:08 -0500
Message-ID: <20251013123309.2252042-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013123309.2252042-1-elder@riscstar.com>
References: <20251013123309.2252042-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_053319_398422_6C86049F 
X-CRM114-Status: UNSURE (   9.67  )
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
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v5: - Added Yixun's Reviewed-by tag

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
