Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B4DCE8D6F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Or6+GDdxUP4lA66yt+glgStM7tvF0RD7rCqGnbYTFNY=; b=X4Rx+2BW21KTY5
	hsCzMm7YrrOqvnMDl21hPYJNznEus5nIPrdyriwt6xgv958ByNEn/pUwdeFHcDMy/p4W21khJCF38
	sp2+LUz43ev1CXJrUF669jn9Rk/T6GliuhoWfVou2s57WRDt9KzCicyCkRTVou+3xM1KGikjsR2pt
	lVh7xYKX0f2Kk+Vxc5fYsFQpjNTIZwP5W6fWJq8W/+hh0ivAz/MBmALD7/I7BOgy2BzMh4ju5YRZG
	yF42rqxuIyGtvn4WFf/mSOjyBPEcTEnpzbwxNXd9zWjTsCuKCHm0LwPtg6cgj5e8Pg1RPQijv/HIb
	3lDBMRFle9R984nClHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyzc-0000000Cyu8-3zlj;
	Fri, 14 Nov 2025 18:57:56 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyza-0000000CysW-0zzg
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 18:57:55 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-43320988dcfso9586075ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 10:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763146673; x=1763751473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47nLDEud9cutefmnYtbk4Jyt3tQUkcCO1JkM1y5jd8g=;
        b=QTB7+whysAcWjP/Cggi5MOdVWL9dww6yMbPleUmC0cUNDVfeFyfF9nmsEqfPpr3NWl
         igo61kjGa+NC01vI8vZUDUx8H4ac51iY2uoXzMUc+fzShPoQa9QGYy+zpl2tuWAAPVej
         +MhUnjzFByOEsz4PQqZQj3PAkpOxxJCthIxYCvVW6ZEC6lAPc88r03fLiwz6qEelnHcx
         2rTVJxSIRJwUZRLeAOMe3yZ/YorF0eC0rhKQbGK2x4QwltN8FkHFoK9Kfuk0YcC4ObfE
         jm18ECL3B5Sqgqr3RfxNRPZZK/1wC+SSjn8wE39J6YTHd+Qvz+HvNC1RKD3mLx6AsMy2
         URWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146673; x=1763751473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47nLDEud9cutefmnYtbk4Jyt3tQUkcCO1JkM1y5jd8g=;
        b=XPRCbKB39y4Q/TbSucomiWjdTiMwvl0SOrZURetE6Of7N+FlepWsxiXAOC0BzP1u8d
         5yJ4lwrTN7g/apCIAMWWk3Twtbtk85pA8JzlaanDgm9VYg7w6kM8BRyf7VzCi1sacjMJ
         AYqFOnUcB0l7j7HJKU9nTUiHCly/G98y0TVLpCHv2GbRQ5NbYjo06xyR/Z+FAXFIy+/+
         h5554t8aDKDDl3bXN6vK8q2BDU5OLxSk+6Ar5raI4DANXp2nrM6lz3hmjOks+WPNCA6v
         YFe3mOy2pIRz7BSo1advgMlU4yHwZ8OmOkKMxlul8uAFQpqzaq1jrVqeh4gwSwQAZnOm
         GhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2JUA4zu+PDliTi8hJFm6WQl+NArMuxaIujJ/h08d9tmJEUiC0To/54d3B399ZLJ1pxZqfyqYsUKEuPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLyEJE+WbLx43hjXzwj7c2/lB1pMYukMMCiDVH6lePjp5xa05d
	7k2m/43Cl9Ad+CJfiC2lr5a7EfYiMJbJ3OHkK3PQr2UgG8BvLn9H5fbbNE/MwvUxbPc=
X-Gm-Gg: ASbGnctc1ZbvrJlnxtzPE0N/aK1a2rRQjncTKj6tSza7K5VnTpJeCVI+3P0QjWHs9bT
	XuCicju6iYLesuMn7bcGIfg9WS5siCQpegg63729a6k73ijEdGzxX7w+IykVdEX7bIJ3SGRhsy2
	HjDkcyxKzdPGdxz37os60n1E6HnuVka/qU3Q19petsZ+wNQGJp3Fk1WEygKJ5B+JnphJ/ny8Gr8
	f4qw9c6Z+Q1DvOcF8RoBiXm6M3OKYFhqFj1lCJttA0dd5vnj8f5FvJ0M0dQHgYiH+akJdxB6Eof
	yS3M7+N2FGsL1tglXAZCHUtBTMTkMdx74qaQr7jOfO3sEu4aM8EuZ19EvRS96G7xqeKV3s7fqeY
	UEGvNggrtW+ooyzRzDPGACVikPuOSBH3Gfc2hYLqlUznFoPLWKoFjMECKldTCTTmeiapCeBd0DD
	jFd6pyNd1IKJnxHU28/EosG2E1si4sNkZ07Vm02JPcdyOKbggkOLElaXgA8CsHiQhY
X-Google-Smtp-Source: AGHT+IGklmek1a+ItyhFNeG/XvSxFlD6/UKZNxaoYFczYzwMLuJVkw1H46zy3vMhyxY+BDXWCfMh9A==
X-Received: by 2002:a05:6e02:154e:b0:433:7f57:22fd with SMTP id e9e14a558f8ab-4348c949b8bmr56721165ab.30.1763146673263;
        Fri, 14 Nov 2025 10:57:53 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2ba690bsm278679339f.8.2025.11.14.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:57:52 -0800 (PST)
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
Subject: [PATCH v7 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Fri, 14 Nov 2025 12:57:44 -0600
Message-ID: <20251114185745.2838358-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251114185745.2838358-1-elder@riscstar.com>
References: <20251114185745.2838358-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_105754_286484_1BCB9466 
X-CRM114-Status: GOOD (  10.22  )
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
index 02f218a16318e..bdbfd04f21853 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -16,6 +16,7 @@ aliases {
 		serial0 = &uart0;
 		i2c2 = &i2c2;
 		i2c8 = &i2c8;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -264,6 +265,12 @@ dldo7 {
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
index e922e05ff856d..9b4f4949412f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -537,4 +537,24 @@ pwm14-1-pins {
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
index 7818ca4979b6a..cb4016886861e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -919,6 +919,21 @@ qspi: spi@d420c000 {
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
