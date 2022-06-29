Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B94C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rziti+GHbTMUgZjWkBQ6P4XMDB9nOktvwob4NrU096s=; b=D6kuLjqLAJAK0s
	/3p2UsZmDUDKnLzij33w6Yyc18pQ7CpRLQG3zlJ58cyeH7nlSeMpZx9O072hUT6/lRd5SRD5kpYjp
	fui+u9RQqFxFCS/swG40Nbp+++Iwi2P1n7o7s7SmIusmFC6L3law+xpML2i723K4C8qvlBCmiioc+
	irHYk4PnYUo6hSmMdZNgiqD5hymvYCI16Yp72RzbVFgtpybYqKQRgXNazjjdRLdRJsWDNk1pRxiy7
	peRCLJtJwq+dtzk6di2wxLxU7ISbiAzzqRAaAEbmtwh6i8uBsvoheNFuL8BbxEf8i6fJByryfy3Hc
	D4jEc1gLM060Bh5t2Rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6chD-00Db6O-Oc; Wed, 29 Jun 2022 18:45:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgI-00DaA3-Gn
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so203153wmq.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gc2vKH3KC5MkBHyxjlffpbpmjSYGhMGK8SuLLVbLMmA=;
        b=b1HmM61mdW8GYiqxKQWSEMxCNUDxJBTTrlRtl15fqNYIuCkZc0o2CJdTeGIajSwT7X
         u7/zOLw3G6g6qk7W2pP9C3CQg/YA4QDwKXxQMrOAFOIojMwCO5d2ivXFP3OKepL8vOrF
         i3WcjcHbDjI30K+2b7eP7wJDRUdhrnDeDzRa50oEfXZTzW0Ic8RRtaW04pEbNja6qUT/
         bCjIKRloecgdHSLASblaD+5TKC4S8bh/hwR54jV1iqeGBFZH+pojBdoaqMRd3VHtqb8k
         aKuNrjFgo2M7HEKDHx0EAotjuGjsu78spyPlqsDURW+PCQz8XYT/XjNBhIQ6xvLK6pHA
         ju7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gc2vKH3KC5MkBHyxjlffpbpmjSYGhMGK8SuLLVbLMmA=;
        b=c87f3OvQcSGOUoPYOMzmtjgg37P3i/gknAQ6p056W8r4wxdUxxNq3lGesgVB+nonRA
         +uvj1fiHVfl04pQuNtw4Q9TGQ5jAIZ+Te7kuIXh/0zhq+4hz9MjZlON06QE/mVE/PWdE
         vpSSXnS4LMzBYUC0b2asf4yjFsPtetFn0pmzMdUv36Ee4nMMz5/RlAlnWH/xL05vUEuk
         W22g2/MStHNcEI9kcKXFC+RMg8qutUQCst40frwP0A4drgf4z/zp6Eso1ZZJcBataCR+
         H1nF17coGqcjQQnIrT8nmCtERqmyewkdQaGUmWh6XKiwLYYRYaIggm1qIKx70pQfHzWg
         Ro2w==
X-Gm-Message-State: AJIora9RyyosbfzKseUR1OXxRb7ZW1/8q7SffD422dPMx4jhOgj40/As
	cp6BZ8hrGk86csNPjHZHIkyIHA==
X-Google-Smtp-Source: AGRyM1tiQTiUML69pSH/X379WColqfSCa/BD0WFCrjuoimppJGuQP+xpNrdH6dUuJmGqYoVcprXwFA==
X-Received: by 2002:a05:600c:34ce:b0:3a0:3240:92ca with SMTP id d14-20020a05600c34ce00b003a0324092camr7157169wmq.130.1656528294078;
        Wed, 29 Jun 2022 11:44:54 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:53 -0700 (PDT)
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
Subject: [PATCH v3 11/15] riscv: dts: canaan: use custom compatible for k210 i2s
Date: Wed, 29 Jun 2022 19:43:40 +0100
Message-Id: <20220629184343.3438856-12-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114455_003575_587CAC2C 
X-CRM114-Status: GOOD (  12.20  )
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
