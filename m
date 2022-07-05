Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiUJ8393QCuO72BFig/eXkOPnmpALSlHu/ohMic183Y=; b=jpUsZuV+QYTDiF
	8prceWMFuYzMb3G9yo2XMK0ZWXdVdx9f7YCrBtD/KzITxIMTY8xseEDFLJG7bLADP1dQZpoUn92/L
	xaPXgnjq6wOWSZEdjqAj5t5vLdtwH+hoBgv0FKhxmCLz0RRDpvF578IgBgQ0OUUPhfh9DrLsdxC6H
	AUEUMP1G4xh68bLNvhJwyHpVOCeBljoenK3TRA9upLs4NvDS3uMDKk4YdH0a3rKPHxhuqET8w9ecH
	c2H/G5ZStfImtAjjz9fCrlt6sLMwuCBcrPqonk/cHvlBJkkSvW+wSpEB6D3n9/KtZP1G30nIPlad7
	tY6/5KVc50tPDVdPFDKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTc-0030wc-QE; Tue, 05 Jul 2022 21:53:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTI-0030Vf-2L
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso10517167wma.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=btfD2ddLZTsrkxXM+5X0SlRWCSAFkc3crudlByDnEUI=;
        b=R2ZH0gVpmULNTv6IJcLMhpWIi94ZX23K1txij23UvjFeSzC3TosPXLd2Xl8x/lj8HQ
         9Y+0cd3VifBNPS8rtQtjRQbPZHdvl/w4dhwDPWCg0IXB58BUR6JYHlX9ZP1O+AhRmMgu
         B8d/QnrymSEjCT1MzHxmsr77lUPEBwyrqAC5UCUuROQwCAY/g7zB8dSBkrmbVIZd8gTU
         LjBB8oMchg8USlhrITWohYgE19TDziCHl77VuySNrjC2NTXP/bzmxACDHZEouWmEiU0B
         1v7K3pQ5V1polgAp3q7tYlG4glWe6iedMPE5oJAkp24Ur4XhLIAuE8ditoMQgWPaJojK
         TtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=btfD2ddLZTsrkxXM+5X0SlRWCSAFkc3crudlByDnEUI=;
        b=plJSJBhr8Eu1kwx220hND+yidYxUfekQEsMQp8w9aLslyM7Vtd4x/qHXeSfPWFgiCS
         jSSpifjmugodBeelCLD/5npvXeWhh+bbUhlk1ajz2JWlsRzs9qihQlQCgqdkjqwnp7ih
         t39pgE/x4uCEqpHMC1YK1pDWGHS77YVx9drPha58ywGqyMLbAEkg5UujhNr7cmhYCrjj
         sTcZwOv4eGdAjUU+CDD4H8Ch+P4cBQ5HjSnnvXutUQ8xEcAPXncRMonSIQ0ySf3ys8f1
         nUPbxyBtOyDD+yPg7NFMX4NBHWzCVW6zqMVMtzSKg+6qrKSkR4i+dUcHF7Vtju6ufOmh
         G2Ow==
X-Gm-Message-State: AJIora/x3M8z1vcOwYb9HWtA4P/te2KfOnsduf/Z8VFIamUlBnG3eFzg
	7XW/aJvA52+zK5a9p07iB0+Qsg==
X-Google-Smtp-Source: AGRyM1uXxyzForUKTAh74BBZRKGne5xPz5YmmHzkkj1xxpM+GNVio6fhXm02YyxzMkM3fk0zBgZL5g==
X-Received: by 2002:a7b:cd0d:0:b0:3a1:8f1e:cb2f with SMTP id f13-20020a7bcd0d000000b003a18f1ecb2fmr24066595wmj.10.1657057956434;
        Tue, 05 Jul 2022 14:52:36 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:36 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 09/13] riscv: dts: canaan: use custom compatible for k210 i2s
Date: Tue,  5 Jul 2022 22:52:10 +0100
Message-Id: <20220705215213.1802496-10-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145240_166676_A0AC2521 
X-CRM114-Status: GOOD (  10.66  )
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
index 72f70128d751..900dc629a945 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -251,7 +251,7 @@ spi2: spi@50240000 {
 			};
 
 			i2s0: i2s@50250000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50250000 0x200>;
 				interrupts = <5>;
 				clocks = <&sysclk K210_CLK_I2S0>;
@@ -260,7 +260,7 @@ i2s0: i2s@50250000 {
 			};
 
 			i2s1: i2s@50260000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50260000 0x200>;
 				interrupts = <6>;
 				clocks = <&sysclk K210_CLK_I2S1>;
@@ -269,7 +269,7 @@ i2s1: i2s@50260000 {
 			};
 
 			i2s2: i2s@50270000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50270000 0x200>;
 				interrupts = <7>;
 				clocks = <&sysclk K210_CLK_I2S2>;
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
