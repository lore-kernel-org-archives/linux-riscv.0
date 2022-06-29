Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1594C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSluVxaQCtoxZpVW9lWnlvQV8Nqhc2CPrBCvOa6JA9I=; b=rxVxV9/8w8k8Tj
	C7abX3Jxy46TaWogn2L47TQgrB52rHnmeqXLv89o5jHR0ol8rcBAegauau6QYY6y1ZU5k0bkgsswJ
	dkmAe5PM7J51VMEkoMRyNEsXQid7e7liNnEKbj9n5dUOrToEQcmb5yo3PQPaT5kgUB/4n0QFawZ2P
	wyjUA5u6L1KLDIE+IoN6wMRXmGxPO/fxdOJjWgoxxJbgGcdn+7hM42ZHJSb1x9jOSEhhpnq7fq5aX
	yt9X81HJziIsRpGhc64YAVI65NrmAV2i5z2HjAF+TQ7waVoqHTvsxTLvWFa1HMsQG+8dLfQyBNHgV
	+/d8KKDPyK+13GiTC6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ch2-00Davr-AA; Wed, 29 Jun 2022 18:45:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgF-00DaH1-B4
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id d17so18142239wrc.10
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Juzz+Ngk10Ta05//fxfH00O+jv/gMrP+Bqb9Q3jKosQ=;
        b=ZA8y7P8hKKrPtisjdtqQq+qA1CID6TRmuw8f26eSBGt1WTJeML7gtXTyV7fNJDHMK3
         uuo7s6uFAg+bbTdr6RVne+0z6egOsvto5QiZ6mK0zZwxu/+Wi7VHR3Sih2KhTPitJxxv
         lTfuAXeyZvMxoG6sYUHkPFi0QiV+MOFey0wVpULURsN00zFfHAxuzQa2wJRk2MJYufak
         ZBER6WKxnutHozCshebTmqJ5yG6ZaDruFHXsj5/te+pMua81k77zKXbcbZvi+jh9fqcm
         2tlxPmKfOjotnkDLVyD5TXiHh4tRn3SOWxgppXhFA3DURAdXDHGX1ICJCnx8LDK9p3Ha
         1wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Juzz+Ngk10Ta05//fxfH00O+jv/gMrP+Bqb9Q3jKosQ=;
        b=1HTjpnTJ3K2uBEtfbdPvynZzcU8X8sjOQDAXqrNFDNKk81m7OOE3ZEF0ptQNfWFZIS
         DUTo3rWCYgjFepsA6MUTWe+cNC4p8OxINFwe8UC+DjSNCQUL5mVIoaWeuiBXETDmPBGk
         iHOTSVjnJsx1q07L/pxtbNynPVx1lNXlGj79Ns1gHlL26nGdQZo8S5D4F6Hc48sN530h
         uACFJveuA20NmRWNuN5GFm/sK8QoB84oKxKUVfLt9r8Q0aTCRXUV1ROwpfin4K4mv0Qk
         71SVBqwH3Je5ywm0yu5zfhgRCXRF23Z48JSCl++Nz5Muf3Fjd8qFst0Eb0lSjUJwtxpl
         hlVg==
X-Gm-Message-State: AJIora/vuYFXdXrmmGMRJjSb2hD7Du/MV4OCGjxd1ua8IAz3z5NWqyK0
	C1rhaL4ZypM/QXRUeSGAWqa38g==
X-Google-Smtp-Source: AGRyM1s0I5FJ4BJCXP+3NEy7+7xMkTJben+77vrmXua6sh2SuaEOzmm9e8Tj0lFsY/ZmuWdd66mstA==
X-Received: by 2002:a5d:6d45:0:b0:21a:2f43:cb76 with SMTP id k5-20020a5d6d45000000b0021a2f43cb76mr4604259wri.254.1656528289159;
        Wed, 29 Jun 2022 11:44:49 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:48 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 08/15] riscv: dts: canaan: fix the k210's timer nodes
Date: Wed, 29 Jun 2022 19:43:37 +0100
Message-Id: <20220629184343.3438856-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114451_476571_984DE424 
X-CRM114-Status: GOOD (  12.40  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The timers on the k210 have non standard interrupt configurations,
which leads to dtbs_check warnings:

k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml

Split the timer nodes in two, so that the second timer in the IP block
can actually be accessed & in the process solve the dtbs_check warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 46 +++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index cd4eae82d8b2..72f70128d751 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -319,28 +319,58 @@ fpioa: pinmux@502b0000 {
 
 			timer0: timer@502d0000 {
 				compatible = "snps,dw-apb-timer";
-				reg = <0x502D0000 0x100>;
-				interrupts = <14>, <15>;
+				reg = <0x502D0000 0x14>;
+				interrupts = <14>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
 				resets = <&sysrst K210_RST_TIMER0>;
 			};
 
-			timer1: timer@502e0000 {
+			timer1: timer@502d0014 {
 				compatible = "snps,dw-apb-timer";
-				reg = <0x502E0000 0x100>;
-				interrupts = <16>, <17>;
+				reg = <0x502D0014 0x14>;
+				interrupts = <15>;
+				clocks = <&sysclk K210_CLK_TIMER0>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER0>;
+			};
+
+			timer2: timer@502e0000 {
+				compatible = "snps,dw-apb-timer";
+				reg = <0x502E0000 0x14>;
+				interrupts = <16>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
 				resets = <&sysrst K210_RST_TIMER1>;
 			};
 
-			timer2: timer@502f0000 {
+			timer3: timer@502e0014 {
+				compatible = "snps,dw-apb-timer";
+				reg = <0x502E0014 0x114>;
+				interrupts = <17>;
+				clocks = <&sysclk K210_CLK_TIMER1>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER1>;
+			};
+
+			timer4: timer@502f0000 {
+				compatible = "snps,dw-apb-timer";
+				reg = <0x502F0000 0x14>;
+				interrupts = <18>;
+				clocks = <&sysclk K210_CLK_TIMER2>,
+					 <&sysclk K210_CLK_APB0>;
+				clock-names = "timer", "pclk";
+				resets = <&sysrst K210_RST_TIMER2>;
+			};
+
+			timer5: timer@502f0014 {
 				compatible = "snps,dw-apb-timer";
-				reg = <0x502F0000 0x100>;
-				interrupts = <18>, <19>;
+				reg = <0x502F0014 0x14>;
+				interrupts = <19>;
 				clocks = <&sysclk K210_CLK_TIMER2>,
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "timer", "pclk";
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
