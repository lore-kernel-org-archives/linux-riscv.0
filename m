Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38CDC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajDmSTwETDCbOlwxJ6VKuuL0pP3FKD8xoePLn71Tj60=; b=n3kds70hsFmeor
	UvyJwo+TSyBhs4TxxaQ+cIPCk8YvUQSb1JdFyksU/0E1esrjynlslrHVhxh9nIP9dCmXQcfOPL24h
	7OdhpTCActg4x5fcnLJZUg9W944oshTH7N7lN4JhnUW9IgGnnxXvFHNegIEeV0Zwp3pG+dhEnEvUM
	t8lPz+K99c0otpEOqd52KWPjtODcFhKADYKX5z46UB6kGOipiYhnH6BUIUHBV5dXpej/xfUvRSRk7
	wNiOcyhArJqkfXDlfta1wQAOo8mQ9oFfq1Hh6DXWFVjiwBiORT0JAyKdQaZtvYl05sLzPxjhfMIlY
	m7oHpTem4w/5hZAhfb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xd2-00BI04-BB; Sat, 18 Jun 2022 12:32:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xci-00BHeN-RT
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id p6-20020a05600c1d8600b0039c630b8d96so5160886wms.1
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRUbJk2nRy4s5CIJwi9VsR0jeyH/n7EOc4sICxWxXyQ=;
        b=bhD31hG1IqRZiTVI7PGE75Ozpn0ZL75oApBble/77rs/x6j7Yj0P44fPfNnU7vhVUY
         nCjZMXxWsTk0A61dgIyHtvcMlkUKqozbRvB64rHl/1QTd2jL/SWVTA2Y2ndXS0ZqhK4S
         r9aFcMkRXpG9sUoBVLmgJheYo4olnTUwQPZVfeHRImZxUkokJecGSOgHC/rYW/i1Ng8a
         J62jSu9bj5d3BTplW1G7IvlHfdW0zGfdAEhQ8IJXKKHoaeeUEsv3cwY2C56pbw+EFDRT
         Px2zfYaeM76WmKCsR+FKXUs2W3XDiaxFj/ATwEYBX9PdDmUTbV3rwLoFdXHfn/aL4RDD
         bpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRUbJk2nRy4s5CIJwi9VsR0jeyH/n7EOc4sICxWxXyQ=;
        b=KdLWxWPXs7YJ2Nayk7R0NeStsnbLQ9wYAEyUiuj9/j/Usl+dFF7i4UgBLQkB0S0vuk
         9q2RKN5D8GealsOT8DG5ahMhDL9wSbdUx4eQWa2h6cFynerLteO41qTktJXa+mThFAHM
         xjr9cZss+zkIj2UtaenH9loMutanyGK8dxbw7o1FNWON7olZUFYEcPEaEvmOPRingVMT
         xH+nXvGdQoOz5NleraGKQ4cRsAFaDH/1qG9crhgLHe36Fk2r9J1pn7B4r5nepnqtnadf
         ojT/pbSVbthF3Ei50No4Bu3rgUMxBRVhpdQQAswRrdEOnw7yY297paLZ4y4Zx2tgslX7
         BhZg==
X-Gm-Message-State: AJIora9FDji38VPn2aaSUH8kbLzn/mlvM6e/A/MTEPb31IUhqH7LXSVt
	aLutMjVBPUkBXFw39460b6V1qA==
X-Google-Smtp-Source: AGRyM1vrfCLD3Ztbth3Hr/dYyMBMcGJMbeidx+6HhuS1VFlnoKH5xZoqGBvj1wkYgukALt4oQZ1Dvg==
X-Received: by 2002:a05:600c:3ba8:b0:39c:5bba:5406 with SMTP id n40-20020a05600c3ba800b0039c5bba5406mr15029119wms.120.1655555537181;
        Sat, 18 Jun 2022 05:32:17 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:16 -0700 (PDT)
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
Subject: [PATCH 10/14] riscv: dts: canaan: fix mmc node names
Date: Sat, 18 Jun 2022 13:30:32 +0100
Message-Id: <20220618123035.563070-11-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053220_943688_29438F5E 
X-CRM114-Status: GOOD (  11.87  )
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
