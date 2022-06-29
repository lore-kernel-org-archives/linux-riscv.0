Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60936C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xGbUu1vMRYkTJZxR9G3AoJuzOHKT8zNMK6uJS0z574=; b=bV+6BoMexc0zYa
	TLMEJSPCc6qYjOwx1RT5BbIwfVg5K9kbLDs0vU8iWtFtO1kxjIxugAQIDlb91BEUqz5TGpr9M7JTn
	1UkTPKdhxNuK8rKad1tbySpHrH3KSDapq8zm2Zo5TV5Qt4bTobhEaQl4kFWdg6iZKyc9bmRgRsdKR
	N8AhWS9KI/NTi3WIRlj2NRZTP0usB1E5WpKHjy/aAgGSymUXtjqWBALuY0S4wDVmtG+HJ/fa9x8Ea
	a9J/SU6bOmIBnQFtn8Wi8Q8aAzDk2RPPALQrZn13AJ/cwxA8uh/xIDwXziJ7zF+zYKDg+bSO2NvNI
	iFXRW16TVJBgNGFPhuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6chZ-00DbPV-0W; Wed, 29 Jun 2022 18:46:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgP-00DaPl-0I
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:45:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l68so4868547wml.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qoN7yg76UgsEFXHXaQt2AveJ+WlGKI9wi9pTAfeqlpQ=;
        b=e4CuTg/9p48DvSTUNdv17K46g3T0j+a8aeAGEEKwZCfJKs9OjS34vhGZ7HFoE764Hd
         j8xFaBJnEvmew0GGSReaaY9xNCu/fR2Sc34atEiERkguYgduxUnuc58gW9QTCtElfHoh
         +e4aG+8roo0EfND8Dp2rzL5lveRBxroMVkaiGySBPM8Qh9bYqkiTIqpFq/W5RA0SiiOj
         PkZRxnuQRLUqrKTYridgjCyNZyMdVCaIDrvKh8cbK07c3fQ7hSJhIcZF+zo6hofXTYZU
         rLSvEmCJJCmqf5LBxTtJA5BYCL/pC3D+iLf1VIJRxuvt++JTQuIt9u9ZtTRVQGNCwcNI
         LZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qoN7yg76UgsEFXHXaQt2AveJ+WlGKI9wi9pTAfeqlpQ=;
        b=2vbbBmm176+3XlKSrO3sRnACi1TDxOdFfh6qzttS6K2kQ4yjx4Wbmm/35OYLebn4Zu
         qmWoJLbsbReTKAqh8NbnuhHrFGBA/4EVmGvmBEnrQYTLnVn9wqc3qrcw7dIIBBO8o7UA
         0/VCe5iq7vTO/VspiLPJV5HEP5gq4yr6ikymxyEeUSHIURShzdFqz7EbPbv4iBpN1FeX
         paGGcWVuEGb1Ef47Ocenl4fgnzs6Ch+sxCcdGG9GaHA96kqippGUUmIc+JWSZyGuh7gg
         xxC9y7SNSmhWtO6TYWWT50wlN81zZCLqAUYbU7J79LQrUK7mtomqTMf5TLRgk3xkAedb
         9vyg==
X-Gm-Message-State: AJIora+TXMdgkFSkvdh1ODwXx5zMuHeV2KN3jcKTLko2EtAHcVfdQQ0U
	st6sh429l50c42t9fMwqVxkmPw==
X-Google-Smtp-Source: AGRyM1sAH2pQyXCWdny+eGMynhGGuuyXhbj2gCp3uhWDHvXjt8YqOA4VdUet5wJ8GqcAeQgDcQfsCA==
X-Received: by 2002:a7b:c1ca:0:b0:3a0:3b9e:fd96 with SMTP id a10-20020a7bc1ca000000b003a03b9efd96mr5210627wmj.86.1656528299365;
        Wed, 29 Jun 2022 11:44:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:58 -0700 (PDT)
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
Subject: [PATCH v3 14/15] riscv: dts: canaan: add specific compatible for kd233's LCD
Date: Wed, 29 Jun 2022 19:43:43 +0100
Message-Id: <20220629184343.3438856-15-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114501_126130_9E0D5E99 
X-CRM114-Status: GOOD (  12.80  )
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

Add the recently introduced compatible for the LCD on the Canaan KD233.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 4a540158f287..b0cd0105a5bd 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -127,7 +127,7 @@ &spi0 {
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 
 	panel@0 {
-		compatible = "ilitek,ili9341";
+		compatible = "canaan,kd233-tft", "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		spi-max-frequency = <10000000>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
