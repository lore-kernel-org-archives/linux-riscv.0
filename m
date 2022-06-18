Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14975C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEDAS8f/2I7XwhGM1pVCb08AwQvL1T5uALuIWG2ojOk=; b=SpQ8tqThT17KnE
	UsvYUfxxpCLcf7pKc/VBcYMWzRiYXhbajKf2O5R6RRK+SYp2vEVTtr8OIWX/Z6loabwDTRALR8LeJ
	PpS5GUqnIRx39tNIHi45qRjHxmkDcKCkeJcnrTanhVAnOZnlEShgNTS5BESW1j7JE3TUYaftHljl8
	d3otRA0vcnnAH6l8LyuREglQxPy3q8ggAxOI3caiOVpz1meWroqHZlJnVs/5ZVfBsONzFJCqMbhnn
	zJt4aHC+o/VnWDbqZOgF1oYD2wCTA5OSBBCtbzfSRf0SdL6PUnlBn6E6ImORvORR7NdhkQLovfKSL
	wCuPYLrw5etanYRNe5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XdF-00BICa-2J; Sat, 18 Jun 2022 12:32:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcn-00BHji-FB
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so3566908wme.0
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pg5EtL0V3UHrid7YbhvB+3zhrduzQGisX4A0SVhhM0E=;
        b=Pu1M106xN55HI9pfnOZNoRrDpjX1i4VH9bR0a4BhQ0DJdKnxN33JrDSsp8oMDBO6jp
         LVQ1VI+4atrButRPKUPNqCrIEigfT0IM8RSE/TM7b+yFCd8/4+xiDRZ3O7NsK9REtRLv
         84xM29eeccO+uGrixFZq0EZFXZEdycBvA0ECOB3ZQETpwQOJCmoI57SPRa91RH4Ybiwn
         DHwH4ld25Q7R0o4T9qzfzLsKmjYB53l8b9saZnSz3GnJD24tqYxXVFcv/kp23HP9PpCH
         I+j/f4rZISdty/aA/Vg0TKDsifyuWEt2DZv8kvr86VvPeWNfHBmzINiITLTKs1DLpX1a
         cUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pg5EtL0V3UHrid7YbhvB+3zhrduzQGisX4A0SVhhM0E=;
        b=S3CPOuRMqfNUGMJAkWn8FNjITlzK8aqtzOUeCeV4bTutrCjJjK0gbtEtCH3NRlKSOf
         LWPbk1U2F4lmoIqjjmnlJzW/F+bUd2iX6eHwv7dqwdUY13w11IPPeQIs3mj/LMZZVrtF
         HaVp83Or6WEdbExHDCcprz/+wML/XfcJAbnhk3MUoRvopSd5YtgzEJcTeNrz3KOmyqOS
         VTZFoAdU9rgnuVSooz/DrCEP5MU8pRrjb4wsPUwophmRmyYyUmbgSqRwhRvFH3dPAAxO
         upe7GbSZ1EFYYdrM2JbZdLe7Ak/7CUmTCjUcFram77nRyxSiG8JVjmS/9hrp8Tt7E5io
         IQHA==
X-Gm-Message-State: AJIora+7u7YuuaxZyBthxiCerv2LhOYnp3vSKKA/3ND4Aa8GNzEgbilI
	wDN38pwg+KlqmtudSOL2u3XLDg==
X-Google-Smtp-Source: AGRyM1t+D1hSYvVv2lyhJXTM8fnBYLleL1Z3z4M3dP8UVmVZwbcohvWxMo8SxFiBx5Zo6H6ulo6zQw==
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id i19-20020a05600c355300b0039c63a3f54amr15447271wmq.61.1655555543356;
        Sat, 18 Jun 2022 05:32:23 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:22 -0700 (PDT)
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
Subject: [PATCH 13/14] riscv: dts: canaan: remove spi-max-frequency from controllers
Date: Sat, 18 Jun 2022 13:30:35 +0100
Message-Id: <20220618123035.563070-14-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053225_621506_082DF58A 
X-CRM114-Status: GOOD (  11.51  )
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
index 5eb6b69c1170..ec290db4705c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -413,7 +413,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -429,7 +428,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -445,8 +443,7 @@ spi3: spi@54000000 {
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
