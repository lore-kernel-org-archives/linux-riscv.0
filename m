Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24259C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SXAjIyBdcGKeKhKp4Bda3uuJj4OExkev/46skI1EmPc=; b=Cm3bj+xiPiUbkQ
	5G0iE5YJV6lOnDht78Uxxr8fMfqXT80f616gFccligdNw3DGPP/szeMprqgk49t7nEoDw0vuB3N9A
	jGY40xPfLmQN8AMipIB9exmDvJ7TSY7XyObV1+PAy/gbLZu2rkB+/1/m6e+XRWfl0HeN7iXvIUU0E
	4EcHOuP5E8O+aF9zSFrfV2yACZiZ4BoccqiiToe4jOVQpfA6Utkoc6VVJtLLNKoB4k5rLQTeGIHdH
	8ar/ag7QJPkCaUCxrHMLJq5wBfkfuTJHg95KfBv0IXuDWQ1c0QVVIRVo9/L1tkUrGlrgCDuwHtusx
	HVVrzHTkKy9cPNY3RJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk6CR-00000001Omk-32Rf;
	Thu, 07 Aug 2025 19:22:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk68g-00000001ORL-28SQ
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 19:19:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b7910123a0so1163960f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Aug 2025 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1754594336; x=1755199136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMojSpDs0TkBAWsUruscamCHlztjGhkLSL63bamzheI=;
        b=JJ5enHjFySTvwgYbS1FWjoLR+IioWE8JTIrrJEGiG8oP82T1RKy8qGjqZgHdequ1IR
         l5tZnIX9ychDa9JJ9Fw2Rs1a81jsmTTYJKwwI9qmBUcN2aoLEVptrbcgkDg7GRy/gFcI
         WfJgQQlkGqrjwE6TwDxuIjg1L7BcOB7Tqw+n7pq82bSoOSm/SvHchfG5ahjXsYoEsZIZ
         jcYEU7dJou/p72RUZsyKlJtIWxhszsH+DGG7gGJ5TdU0hr3DbksYJ5w6SXzOjO6gbNG0
         EukT05Tko3iISk73EYoi0cM2UDKAiEPv4l77jwxgdiM7untW0YeWhb3sPYbhAb1+sdZ4
         Q2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754594336; x=1755199136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMojSpDs0TkBAWsUruscamCHlztjGhkLSL63bamzheI=;
        b=qfiZlOr66oGKWbtGfmsPNYeKcv9rxmHpkiiXy5YCGv9Ev1GVoV485smQitRCJNes6L
         KWWoOBQ3adhS3Q3Kh0wnqeY43XbpFCKRxo8/rXpSfMZ5Ej1TqbWuzZnLrNePjzFILPbP
         vF4ALDYt7aUZIyK8kjcQ+oyUzDceGoGu+yX32NXeZX+WIee89zNg2fwtDlrOtebK9yAB
         jzRJDE/OEwX72Iw8l4OJ2w2JEEPZcmee/MZagxK0NBVUewz+bZ880ltmeBQUojfltbaP
         JR22OehexeEf86BCLebU98Y+PdrOzSOM+6ZsE9PObvj8rsDSlUdRrhyjWK61uQlp89Fp
         sN2g==
X-Forwarded-Encrypted: i=1; AJvYcCUW/t+ek7Q78avpyOP/P7Ft0R10rVLjhYkpkti1YmwD/NyOSG3t81fVJwNDM9CfY41cz+uZa5VDUmYlbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxwmB9C25h3mlR8dSm8R439txDMJk+jUAjsKnAoch2DOlj0VeZ
	tBW+2mBtyzMSvjM/KI3iLqQlbxSVXORVzmxSRQbXrMQJnwfJt/3A/j9oQ6K7f6sohsg=
X-Gm-Gg: ASbGncv4+NCGaYeoH+gZ0ndUc2sLsVrv1lefY+nLmun5HSbrqSpvKfScQTK+wjv5xR8
	fZaCsbf6OE9buWXJxd1BU962wPC1qzqZLIMVVt2ECVLQtL0j/UYO6sW3zunT0m0SfnaodnT7r+V
	OvplPGHlYOnUR6XpMKP6V6yRmidsNdQ6XsBG1rXK7iZEdHmio8OrS0iacAD2Rc5YdAiZpIrQtMl
	RrGmTQnsL+DBMC+jNg+R4KChjR+SzqTy+XY+qyK2EgnmqYorUq8h6eKJMiFF+9KA6TT2TM/YUr6
	7/zA3YWx9Oq7IZF1YB0e7HjpXRQBRgoOY27UL5cPnFKHkCnSPAo1NPKhOGipuSDszKZHq7Hapsb
	auxXctGbCI0r1sEftbRBa9CdtqWCRPWFfcw6JiJqyvAlDEJNozw==
X-Google-Smtp-Source: AGHT+IGmsZp5QGEdNPY5skMi/ehXySxn/2GJ+zanQmX1/LX2oBeqJ3fxjEoYN3cf/lF9eTayqWyhUQ==
X-Received: by 2002:a05:6000:40ce:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3b900b54b20mr297294f8f.26.1754594335784;
        Thu, 07 Aug 2025 12:18:55 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:3bcd:db43:406c:324d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4d02sm26988589f8f.33.2025.08.07.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:18:54 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
Date: Thu,  7 Aug 2025 21:18:17 +0200
Message-ID: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_121858_633109_8F8A5D8C 
X-CRM114-Status: GOOD (  11.26  )
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

Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
UART0 was functional as it did not need a reset. But the other UARTs were
unable to access their registers without the reset being applied.

Although perhaps not needed I did add the reset for UART0 as well,
to ensure consistency across all UARTs. With the current-speed set to
112500 baud rate, it matches the factory U-Boot settings.
This should not give issues with early console usage. But perhaps it could
be a good idea to let somebody else confirm this as well.

Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
I enabled the UART9 and was able to use it successfully.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95..7a5196a98085 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -667,6 +667,8 @@ uart0: serial@d4017000 {
 				clocks = <&syscon_apbc CLK_UART0>,
 					 <&syscon_apbc CLK_UART0_BUS>;
 				clock-names = "core", "bus";
+				current-speed = <115200>;
+				resets = <&syscon_apbc RESET_UART0>;
 				interrupts = <42>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -680,6 +682,7 @@ uart2: serial@d4017100 {
 				clocks = <&syscon_apbc CLK_UART2>,
 					 <&syscon_apbc CLK_UART2_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART2>;
 				interrupts = <44>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -693,6 +696,7 @@ uart3: serial@d4017200 {
 				clocks = <&syscon_apbc CLK_UART3>,
 					 <&syscon_apbc CLK_UART3_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART3>;
 				interrupts = <45>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -706,6 +710,7 @@ uart4: serial@d4017300 {
 				clocks = <&syscon_apbc CLK_UART4>,
 					 <&syscon_apbc CLK_UART4_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART4>;
 				interrupts = <46>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -719,6 +724,7 @@ uart5: serial@d4017400 {
 				clocks = <&syscon_apbc CLK_UART5>,
 					 <&syscon_apbc CLK_UART5_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART5>;
 				interrupts = <47>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -732,6 +738,7 @@ uart6: serial@d4017500 {
 				clocks = <&syscon_apbc CLK_UART6>,
 					 <&syscon_apbc CLK_UART6_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART6>;
 				interrupts = <48>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -745,6 +752,7 @@ uart7: serial@d4017600 {
 				clocks = <&syscon_apbc CLK_UART7>,
 					 <&syscon_apbc CLK_UART7_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART7>;
 				interrupts = <49>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -758,6 +766,7 @@ uart8: serial@d4017700 {
 				clocks = <&syscon_apbc CLK_UART8>,
 					 <&syscon_apbc CLK_UART8_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART8>;
 				interrupts = <50>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
@@ -771,6 +780,7 @@ uart9: serial@d4017800 {
 				clocks = <&syscon_apbc CLK_UART9>,
 					 <&syscon_apbc CLK_UART9_BUS>;
 				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_UART9>;
 				interrupts = <51>;
 				reg-shift = <2>;
 				reg-io-width = <4>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
