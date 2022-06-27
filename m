Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B07FC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajDmSTwETDCbOlwxJ6VKuuL0pP3FKD8xoePLn71Tj60=; b=GJLfaOmuNwgm3Q
	Nj4aJ67C78wGTtnAjmY+ew19JNLZ/TJiOGRSnT+up2jbVlY75o7yffbki2d65IxzeuEuwG6JRy3f6
	fmvACZzmM1NwgnkfOj3kMRIaUVz0SbpuPB4u551SFgW7fSlKSu/L2oZE3nyTCUolgsy5aJ0mhmdVy
	1yQ4UYpyvRvReGLztaY/jr2n2LnGG15QSjYhYF+XzBFAHJBYHOeTJ6VDCSdqp1vMtf4TVeRvU7Ihy
	k8XGHAZoweVEbzljpUTKiXqpt6xBlNE12PkHZ1rXWi3LCXI1AJdeC3eZpaeF+HbzWsAUf44hdxoG0
	xAA/h+NqAzYgRkFhHjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucx-002bit-J3; Mon, 27 Jun 2022 19:42:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uc9-002asM-5P
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id k22so14495662wrd.6
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRUbJk2nRy4s5CIJwi9VsR0jeyH/n7EOc4sICxWxXyQ=;
        b=f3n4VHobdA/S1U3PMsj9mVuABFefrCIwcK59qaWALhlmHRLKM87X9DDicfOZnexC7E
         CC5zQ+c4XkGWdMFvcNQAeAqIARsTArPP2GNT+g7Lnl3LIB0IwK4N2ib5ZL+cpSNJd/wC
         +zZIEd3gMjL5OHbtklB6jEGz5JSXLJprExRPVcYSOT6SeDPW3xTEEqt/FFSToCLia9if
         g/EUwZXJRv3syGH1emQGSCqaKeQU3KLm2ptPOki0ffKKySDKYJE5tj6s6UKPL3cCPS2o
         rnei2mO3djdRWw+oEc4cwgZBbt4q+WgPvEe8ITCqiiZ6hOsMOMiGkgFahEn2yfkxMOtn
         aPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRUbJk2nRy4s5CIJwi9VsR0jeyH/n7EOc4sICxWxXyQ=;
        b=MN3CjWbw1LqnAC0HmW3ONqng6FGKyjuq8iNnryYiyB+B1Mmg67YnRrqzYvlGyFD1i/
         UIJyEJyzgizPs271P1Rvbxz7DlbKKWhWgnYEBTqwf02vXKNZHCUJG9b8pN5wahHTOWgV
         sH0Irrcx3VvIRPK/tIiQ6Ampgo6rLkTjyGtfnx/K2bziJ8/OwfsLLGfCapRyt5SVQ0uR
         62eEa0C49AP3Iov9D/YPokIQmulkZTh+7Dot6dDZpKaaHDvCaSot40Qi516ZKamkG52j
         nmPLiOI7ABxWYjEf0w4ZwTupn543ZPVDV3sHUpJHb6Ye6ajBAxJlmoBSMf/Iib0+WIwk
         m/WQ==
X-Gm-Message-State: AJIora9sdWjCsXkhdxFOUhDfZ16y2MBKxoynP9tqpQECLoELyLVl0XAN
	iZFaGVNLesnDohhZ9AjILdMnsQ==
X-Google-Smtp-Source: AGRyM1uiqzgHKTEFjJwXYsJ3WrmUfzttmKiI4A3WKzdknew9D1dQNuq+OqoJ+KK/RQWWb6WYdXpfxA==
X-Received: by 2002:a5d:5234:0:b0:21b:829c:3058 with SMTP id i20-20020a5d5234000000b0021b829c3058mr13811895wra.13.1656358895759;
        Mon, 27 Jun 2022 12:41:35 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:35 -0700 (PDT)
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
Subject: [PATCH v2 11/16] riscv: dts: canaan: fix mmc node names
Date: Mon, 27 Jun 2022 20:39:59 +0100
Message-Id: <20220627194003.2395484-12-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124141_239344_32B29E7C 
X-CRM114-Status: GOOD (  12.22  )
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

The newly-converted-to-dt-schema binding expects the mmc node name to be
'^mmc(@.*)?$' so align the devicetree with the schema.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 039b92abf046..40992d495aa8 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -142,7 +142,7 @@ &spi1 {
 	cs-gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index b9e30df127fe..5e809d0e11fb 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -189,7 +189,7 @@ &spi1 {
 	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
index 8d23401b0bbb..4be5ffac6b4a 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
@@ -191,7 +191,7 @@ &spi1 {
 	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
index 24fd83b43d9d..5c63f79b18ec 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
@@ -199,7 +199,7 @@ &spi1 {
 	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
index 25341f38292a..59f7eaf74655 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -164,7 +164,7 @@ &spi1 {
 	cs-gpios = <&gpio1_0 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
