Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D85C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGjOGatUVDxBroYpplynrx0N3gbElhNOEEZ2zDWmg/8=; b=uCQZ3XLxqG+6JP
	AIxUnaZVZmsFdxFKhqHVPy0PwuJ0TjQEqrXop9dlYDb78jWaM+GqcQEYYXTF0a21ZgCUbKcyO2cfy
	6Dlz9JRBx5H6nS9C55cPgncS/Egwbd37QSadP5Ot2R5MJzsab7+hjR1dosAzBBaXFIt+M/cmIMa9C
	aZ1nod7T1m2U2MXZnSxU9t/fNwtolJ7/m43NB4DoazSHSVjBVF2ClZXxSazvySQHK4Gy0Oiz/DT97
	bsu1BMKAvUVcHnmYQesLggXmYJ0N20Ji8rKDQLiOi7yGavQBafsjl/agSmPlpMeaDlpX/tXxopHK8
	0nRTMizPRX1MUgz1qglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucm-002bac-PM; Mon, 27 Jun 2022 19:42:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uc7-002agz-Uk
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e28so9326535wra.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ef3I7471zi7adAYmEZiBXZpXh9J/sRivupa07zlI37s=;
        b=HJumt5kWS06mWGiL+4OpEcLUtAC7SNNT45MpSDG001Qi8EIc3dVNUQkn+knFTjW69J
         R8mWOCqcz4e7Q/CPs83n2+HBdGAR/MzDo8iFe+iUMlIwG0BO4ENAltYbtbL4+2H5oDG3
         3WbwwkXTpMHcDzA4RGeRsnyQOybwev/kCCZNAV5bbmfuagFZNHAQw8fw3UnbgMKZLGK5
         KkQqCMzp90DxTnxWzxGdvNfo4Chy7TQO1QO4MitEFQ3DF547kU9BQECLyLo3Uaceo6W+
         sWjJxo+kCADRBxT1Zui4rHIfIWdahlWRan847eRFOyScrZ5BHz3b9KUA57p656/reecj
         FWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ef3I7471zi7adAYmEZiBXZpXh9J/sRivupa07zlI37s=;
        b=ekLivxbHB2qXSQLjRY/q2CVcSgzv0GVQKYjezsCXhigcf+tR25JvTSEBIc4rwvrqW2
         yK79ANEhYf9GwmCWjERGsxy2q1yQBmcl/+kwsn8xT8+FGRR+VK5vcIhqk+rbFDhbW8jy
         JRMSNknMELfNgYHK5fnIHhQEsl1q8ODwYIGymzrfxAUFG6pcdHOtsgSmjKeKzav+vJEs
         Kg9BVzRICtr7jUs5VQ/OVwmVyQ6wxlL45WX3ScJ4NFvSHa9AHP/i+7VFH+oDpMhelC33
         WfZUIg1hNiPE86zFlQDiDDPCqKRo8GRX7csYIWoRZjaypUvp2CxIEy9jBifibkwTQKB9
         6aEg==
X-Gm-Message-State: AJIora/7Qe8cmawebs8YlcFG5padWUbF7f4u6kiiDQjka+yy+IBJyBG/
	ij85o58w7UuZnamn/VpY7EtDDA==
X-Google-Smtp-Source: AGRyM1ttZZCmnyf7M6EsntZ4/SALGTw3iqAI7J+sn1WlB30nJAP/WNiYM9WiVd2M71fg6imXwScP2w==
X-Received: by 2002:a5d:64c1:0:b0:21b:981a:594e with SMTP id f1-20020a5d64c1000000b0021b981a594emr13681508wri.171.1656358899484;
        Mon, 27 Jun 2022 12:41:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:38 -0700 (PDT)
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
Subject: [PATCH v2 13/16] riscv: dts: canaan: use custom compatible for k210 i2s
Date: Mon, 27 Jun 2022 20:40:01 +0100
Message-Id: <20220627194003.2395484-14-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124140_061756_3832B837 
X-CRM114-Status: GOOD (  12.12  )
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
index be42c56e770c..10c2a1417deb 100644
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
