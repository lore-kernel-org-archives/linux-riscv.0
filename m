Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97DDC87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anM7UMf/90dpj0HdLpbt2KhKR7ca8rgS0rs7NjS7TjM=; b=Mz/ycodlAGiStF
	K29D5PNt2CPNWwtxx0g2dxJ7UaEq9UAcnnW6j5VNre6gBov5i50H4Nl6gEs7wPOYtseViefcELifX
	BARM/XQEvi1EnlTishxmosj4efTYyb25/PaGcH7/VgmcNr03uuO6rTnoHLo+O3kPjDuz+PzxMcAPw
	IYi+pEiVXkdVnp2D/JhKSKW70W+SzkW2b2sDDnUFPcHb3Sp3lYZnBkAX196sJ7L4Jxzvo2G8gt0gO
	WrG61dQduGnUR6s1b4eGpa0WkxBPdh8BHjSdwXNotiIg9cKjjp8p2+rw3IOD94TkvmWfi48X2L+8J
	zu56vE+r0ZpkLuuK5FPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VO-00000008NwU-1Q4Q;
	Thu, 24 Jul 2025 20:25:30 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VL-00000008Nub-1uiQ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:28 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-87c11fd5364so59459339f.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388727; x=1753993527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZU8vkaDk2qb4Gs1NhAs//+b9ebi++Ho3LYwlzWZCXY=;
        b=d/INPNWGc3BlqkyWFtl3JCkopVg2GjfCYCaY4sl8XUnphFkOq1sgsQRUFGMbvH1nwA
         pKnpq8xUB2ErMjQQ/WUgENFIi4BKTDKvquJom1iR9jR2KzbOvSRMME8dLiSH4xq9Dabg
         i8xGTbsBRWEPHIqQ4H0OWfatsUXfZDP6aoM3ZigQcwoItketp/06d4VAjx0dyUfAsEZF
         R054HeMUCgAfcWgFSejoWLYC7KCAbWNEyKnK/rSjFoqB9sWM1LmvjZm78Y+h3BIrPjcN
         kHbhQIAwTeOCESJD8fdnRYu7Ah7DbNxQX3kcOL4ZSfw0XaS4CgL8yv1Qq3MMCc7oxfWB
         aQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388727; x=1753993527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZU8vkaDk2qb4Gs1NhAs//+b9ebi++Ho3LYwlzWZCXY=;
        b=kBgQxNPROJWelYBy8kCf41OifF0cmtcY2bD7aEfWAvWPbzPvRxEAEVlDBWugtGyl7m
         /pU1fD1OqFuhBbDaHI4mB1T0IlyMgQm5PzT0S6K/JbY3qrabDIw28wnEtJmXXpB96M5D
         W4bPGSQYeApT/pgHVBnbz8z7RZNn+HDNz4BJ4s0g8NJjGOHHLX16ZAbcaQtMnFYwxXob
         0OnfFnNDaqCtpIWRiClsCFU3b2vrj11LLx24KnCkNPQV68dO8OJOML7tRDlZohmx9GES
         EXZPqQwiBYO4uMjnLMXZ95JePKyXDzGRA/K4PnUiqc5l/pQYglAVLhotBdxLmEyBB0LV
         q2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqE8mGiG3MOhKRnr7AZkqYKSgm314i782IBBz5OzeMk99+/JXWdIrEH4h6WWQFeoVKrBGDrNForJHzdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC72W9DtRe1WRvPkkMAjK4iH5WzhpJi6EcsTZcj7KH2cQS2zRk
	Ngn3rC8X+MWRbLlY5OUNrVdzKpf8Wdr7c6odnBpCLk7Ci6Xu3oLsKieKnjchCPGsc4M=
X-Gm-Gg: ASbGnctse+ncsvEdEq3OXF8jOYrbm4/dNPEcGA57NUt6748UX+GSubH1eu7ZT2/hIa0
	RzT/QOKnu8/F165j+c9kN8DLbe7kRgg5t98C3CovVJH6IDsafdB188BIOI/0HaIqX6437kUu1An
	IKnew6jP9AiwlC4XCMqvz3WZ7HYYAKyW37gHwnR1JvR6H2VQK18Wc126aEYq3bmjfx9sI1JNWNG
	1AVf+oYywSbqLoHK9MHaXKHjfNmHd5WLojmKK5G3ouSchGFT415VCd78fxFHaxXDyTLK/PGn6PC
	wziuW2zNAC/7/DoQBSfUCEFCgfLy2BYtkI1ZydKdvpoQ7uV30gzt5liBY49YYqvKF3pQHYA0P0k
	22POw3m2/kbuja069KNubjmL1FMOnlvC8G0ZZ/GAXVpG+LVU9m6w=
X-Google-Smtp-Source: AGHT+IGsD3HwADo3Oj0KCwtP/jsKopOJoqzhN2wHyyLonxBBo4A1qnAS9cZXjozcGyBbHnw7RWwe/A==
X-Received: by 2002:a05:6602:358f:b0:87c:d3b:a358 with SMTP id ca18e2360f4ac-87c64fdc182mr1615756739f.8.1753388726816;
        Thu, 24 Jul 2025 13:25:26 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 24 Jul 2025 15:25:07 -0500
Message-ID: <20250724202511.499288-7-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132527_492577_7B4C7BB2 
X-CRM114-Status: UNSURE (   9.03  )
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

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..96d7a46d4bf77 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c..2a5a132d5a774 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
