Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C84C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nf8dBn+jrYYDFrZGtMC2EgGb8eOoi088Yv+fM6eeVQg=; b=siZ9EQoj935xBs
	fO+dSeNrEBL8UOLVnRxw0asDGdr5/UGR9S9zkGOTfVRkJwaDtB9N8pmBEeKHAzlp/uwlVcxpn6Hx0
	nixw/l2KwWgt4zdpwx9Rw30YfBnwBwV6hY+S1julSudCzBM+0Y/RWf6Z2EXTEUc29p4iExA2+FG3x
	wnUQZcYQNOmnrWXjJX1TlpZKHP2BRQeJJrUeR0HFx8NN3z4WMaBYXP62X05drzjf39KyNGyF+ZVln
	luESkpPr0DWHkAp1ugBzqSznHFrD32g5ZVUO7wgM5Lt2EX9nusKYM90Zpc1eC3t+aJnzzfXqFDPaK
	ODQKRFSVi8HAYUinEZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xd7-00BI4D-Bi; Sat, 18 Jun 2022 12:32:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcl-00BHhn-GL
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c21so8821163wrb.1
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xINpJVKkZcc5JKohFXfQpBMJJJBAJkhRdFvXLAdWINc=;
        b=V5PCq8ERofmOM5w5PRA0gL0n8OYBdm40lWb/asUOIntNfey82bGRsIn/7z+pxrNbjf
         4HTP30/j7DUAESFSB807hhF4Bn26V6IuYZIKFHoYEcp2foIsgjbMA8wAurn/dzRXLewU
         52ItLX9xQP38z8uMvLEfCM20A/gU6lUTh3j5F2TLw9cN7r3egdv+mFSv6ttkSKGiktCM
         4cZy3+rmKIWV13Hk4eddQtK9JA4//kbz9TiLmNmn6H/45fTkDeYaDf5zd/9LWbt7E4MA
         qvUYvHicfErpLqf59Y2120u88J/KmXmj/YaQstAYe0YdqaXfHU8uztd1zwCarccd64Pm
         J8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xINpJVKkZcc5JKohFXfQpBMJJJBAJkhRdFvXLAdWINc=;
        b=63VGKcAtNtDZ7fPK2cCCRbDRNZGpu6wAmcwhomyHHzACEQD1PKmSA0tA3v3lxW2Ys4
         4MmK2uEJPsTUDkjgVGDex6MwCXL8kGRHz2ObICGtrFT3D2q8sK5BIlbh4jIJ+4M72pI5
         fnYlxROuqoydWtJw8jVHxqC9iob016npv8T+SnGBK9YAgq0FuSNl+BsPVBJcGxS+Onkn
         mEvLukjeHoeBs17YT0PdOlkwSSJa9X6yGcN6VJvqnX2O2po4YLkoN0D16FlxS6FKYAzi
         FrB8yhWt9J9WxHzBRQR7ETFDRDxpf5dWeZAsX9/+kXz+Pk0ps5mbyrdLlmBFDlqm4sRC
         U5eA==
X-Gm-Message-State: AJIora9QBd/eUxIoWtQ6Ygc6Ij1j7QuF6Q+diGutRS31tfmC9oc3lDnz
	PVCOMXcS3DuP6PkzqBCfFl/nag==
X-Google-Smtp-Source: AGRyM1v9n76uzuiNQWIsMBMB4JQ7qpatVYHsEQGM4nI7CyfeZc8UgP+B/KjNDavOA6Fd5fJcVw4QCQ==
X-Received: by 2002:a05:6000:1b03:b0:216:43b4:82f1 with SMTP id f3-20020a0560001b0300b0021643b482f1mr13888381wrz.232.1655555541458;
        Sat, 18 Jun 2022 05:32:21 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:20 -0700 (PDT)
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
Subject: [PATCH 12/14] riscv: dts: canaan: use custom compatible for k210 i2s
Date: Sat, 18 Jun 2022 13:30:34 +0100
Message-Id: <20220618123035.563070-13-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053223_593709_6EF44405 
X-CRM114-Status: GOOD (  11.56  )
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

The devicetrees using the Canaan k210 all have a sound-dai-cells value
of 1, whereas the standard binding example for the DesignWare i2s and
other use cases suggest 0. Use a k210 specific compatible which
supports this difference.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index ef46ddf3c00c..5eb6b69c1170 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -243,7 +243,7 @@ spi2: spi@50240000 {
 			};
 
 			i2s0: i2s@50250000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50250000 0x200>;
 				interrupts = <5>;
 				clocks = <&sysclk K210_CLK_I2S0>;
@@ -252,7 +252,7 @@ i2s0: i2s@50250000 {
 			};
 
 			i2s1: i2s@50260000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50260000 0x200>;
 				interrupts = <6>;
 				clocks = <&sysclk K210_CLK_I2S1>;
@@ -261,7 +261,7 @@ i2s1: i2s@50260000 {
 			};
 
 			i2s2: i2s@50270000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50270000 0x200>;
 				interrupts = <7>;
 				clocks = <&sysclk K210_CLK_I2S2>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
