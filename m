Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D3CCA480
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TuRBeX7cGoQOZ6WATslKAPGswja6Qxst1yqSusywPM=; b=vFg/oq7xOyH9RS
	kIzC7uWsO8/Ga96fifZtgd82LPs24QkKfF+LXqcnuOA2WPFzDYPXWrH8iSev4xiZqLQ3oMjg5RoHp
	xNIr4X2YQQrEKx78e/b97urHsYCfelhCw+Ads2L8ak4XAyJsWpjlV9bl208tzpaqDv5TNpWpanzun
	c/qO4LEz3RwMWGe1TrsgGrEvMjscoYRywgkCedDPwKFVI/EPExCNK/13tQzuByAd88fRPS21KQl5q
	rNgPgWf+E070/rwr10SgjU7pT/sBwRSvT0hwSJSPTbcIgkrk/zdzZQPkxplvLTf52RInS/mhjCRis
	6QJA5+skkx3hNgPAdNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xck-00BHhq-4B; Sat, 18 Jun 2022 12:32:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xca-00BHWS-6s
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id m1so1046347wrb.2
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qmSWtWUd+mMy8ZYoZTgQjYDztLIGNDdvta+tk149+dY=;
        b=dM4LDKg5XtY0Inv2LgZSsQ50IPuzGfCzEsvHlFQ/2NLIm/6++fbLLGSB9koJgwMTjp
         07IF9XMy4P4HaeMA1yfSnaPY3CYXQ+u0Kv6ZrDa4GjATk93Wx2p5DeaQw29BenmArCiz
         I6simFjZ6ZTWhMpFS4z5vR9LZUvOOE+DqLAunuoSePBDY5dNABj/iCXgooJ7JUM1Gx2w
         oJTVRWFtg+XkkdFP3+9IwXZt69jucggKlNwGuChB7WxmXKdl5k9lj8f8ITLIpfckoFQS
         YaBPUVjvUVp7mpO9D9wZzFoEi6tceysbIOAoKo4R7lpk7QqiW4+Bkh5CqE2X/nDML5P4
         Wj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qmSWtWUd+mMy8ZYoZTgQjYDztLIGNDdvta+tk149+dY=;
        b=gCyR4MaOttv6ZiHg86Rh+gNvLBM0LADmn1r17BkeVG43S+2UIXYQk9sswoS/jTveKn
         kUvN1/kqPkqRsok0+Gj9Sz3QBZ5V0GolZjVsO/qeoJr8qLr1S8qkGh6VApmW6WbGNUv2
         K2p+JGgWqH8/bP7f8CdmyqpsqYv+6xn4xtFFtRf3FL+l6i5lUxsrKUNLYFz/qsQK2BqL
         Hhbt4Aaaqi5G/fbRgRK/88V7jhw5cQR+uipBJfFl2xKcu6dxuyiQtlWpovucdvURt8VC
         VCFYMUVmrswQtIi0WsQ5rc4tsVrnqgNJBvoYjGeSPlmMLjn1DPgzn725eTK+M34BSR8G
         yzLQ==
X-Gm-Message-State: AJIora+het3ed65Hx//Xvvc2sNWCkmBNwE1piATLPRWcVbnXF3CatYai
	h82dHw5fOgJn7GZJOldK83EE0Q==
X-Google-Smtp-Source: AGRyM1sfPQ5XTH8REWSlcNVbh+KVLu6pjXz8b6gchhSbSGxDuCamFh0CMH0mba5q/rzWCUN22eIJUA==
X-Received: by 2002:a05:6000:1b03:b0:210:3372:2bd9 with SMTP id f3-20020a0560001b0300b0021033722bd9mr14215037wrz.704.1655555531747;
        Sat, 18 Jun 2022 05:32:11 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:11 -0700 (PDT)
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
Subject: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Date: Sat, 18 Jun 2022 13:30:29 +0100
Message-Id: <20220618123035.563070-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053212_349861_4AD97B30 
X-CRM114-Status: GOOD (  10.65  )
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

The k210 memory node has a compatible string that does not match with
any driver or dt-binding & has several non standard properties.
Replace the reg names with a comment and delete the rest.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..287ea6eebe47 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
-		compatible = "canaan,k210-sram";
 		reg = <0x80000000 0x400000>,
 		      <0x80400000 0x200000>,
 		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
-		clocks = <&sysclk K210_CLK_SRAM0>,
-			 <&sysclk K210_CLK_SRAM1>,
-			 <&sysclk K210_CLK_AI>;
-		clock-names = "sram0", "sram1", "aisram";
 	};
 
 	clocks {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
