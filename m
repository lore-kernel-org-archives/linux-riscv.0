Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8A8C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4Nt3i3HgEu+OEF/aUKpORG89EHIP4XPI+EWe4Pedlc=; b=pMTZzvCr3KKg2V
	nCjB9rgCv5tw07k8QwOBolnscd8C2Dqg5/ljw0oqHU6rgcpqKLZvZMqSGvBE1c9fcE2deBpR/W9JB
	0FIHojjq9zow92UBoCyIJsP5RbEPLOOn7V7nKmXhxLPj/nSWt6iKX/jp/GexU2wGNZ21ZTq9tyjSk
	HhCUhuR2UBr3aBZy4ir6I0c7LyZK/BRd8zrLLX7HphIh/PdMewH6XNZ5SfeSHx2i8DgBqdHy9HGPV
	uG+2r7WwBGUrAkcskC2suvDJUqha0SxHPo/1nf8Cgr65k8cr8Ue8zzBq4wGi3xvsBgG/el1B/zbzJ
	PB1BCWINT2hwD2O9nnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5udE-002bwc-45; Mon, 27 Jun 2022 19:42:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucA-002awp-KP
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id f190so5765383wma.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g7fNGijI+hr0dTmXMpnscpCDFPOlTGyo8sAtxEfEzZU=;
        b=GerFAD3YrJ4xNZUZH9wuFBjhPGLtwU4LMQ9xLZDfyPgID9HmkvjLT2X70Dv7RK45sE
         Rl7UcLZKjjBEXn6gMFFPFGKqGU8YKteSUBRZgT3q2KCTELbPxEugPVPhsRUTxI6EEFTP
         U7pEG27DbQT4d6LjDNzc6tWTonPRp0kqfUVnKPpDnLikqRJRWZ9vVsU6JuLkkdfI6FCf
         DH8VhTtnOJRQfz2jcXuMHBAiiw2x3DbsLEgNHmVpboCY7IizIW/K+BGFbjzLsujm+vCI
         IHgUW86u00ZgFljJlptTSCnVffs7mtC3wTbTmAl0NcpYIRCtY2jbecDSSyPjyUsCLT2h
         rnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7fNGijI+hr0dTmXMpnscpCDFPOlTGyo8sAtxEfEzZU=;
        b=ROz7E3Tr62dYv+tCVBh5wpvL5psMhn894o4sadIRl3hzM0hoKo0tX9kAdvIZXcJEuC
         JPsWPL0bM2tpuWYZkr5pRku2A1K+Y6HVvGYRAeiS0yYUxQ+TN3JBE8zpv5sg5Rx/GCpA
         LPq8fElF5iyvRY8Mml+EvenV6mOhAaxD3NmF/lRgFpGXrIxLLP0U4/j9zNV6VTIv//wG
         JyOKOC1+nnQcETXxIwdpl5k/KtN24xkeWR/AzmNNEBwCKwG/lohsjvlmud382NfWaxSd
         WH3zOsV6viwdyVJRlL6InQiDt6QwxAV+UUoVyf9ke9Z+ER7bYSDbeM1u1tEF0nX/bjYn
         S72Q==
X-Gm-Message-State: AJIora9terw0WC/cJk8/KO5AWk+osSjDr1QIhZiRGCP/gmhmNkrqdZac
	B4NCV8OWO6Iw1hWPY7Jd+i96Cg==
X-Google-Smtp-Source: AGRyM1vfR8BzEtMkEDzJdyFBjP72bU2FypIWvUEsm3mPIw919lu8Jm/Nyc6yvHG4q/vyYSVc9E5JZg==
X-Received: by 2002:a05:600c:1c04:b0:3a0:512f:b9e5 with SMTP id j4-20020a05600c1c0400b003a0512fb9e5mr333292wms.85.1656358901364;
        Mon, 27 Jun 2022 12:41:41 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:40 -0700 (PDT)
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
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 14/16] riscv: dts: canaan: remove spi-max-frequency from controllers
Date: Mon, 27 Jun 2022 20:40:02 +0100
Message-Id: <20220627194003.2395484-15-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124142_721240_78F3DBA4 
X-CRM114-Status: GOOD (  11.97  )
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

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 10c2a1417deb..84a7ab363d72 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -421,7 +421,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -437,7 +436,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -453,8 +451,7 @@ spi3: spi@54000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI3>;
 				reset-names = "spi";
-				/* Could possibly go up to 200 MHz */
-				spi-max-frequency = <100000000>;
+
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
