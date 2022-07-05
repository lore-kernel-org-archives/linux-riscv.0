Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ADFCCA47B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/c7l7mAKPFN/DkFVTKdjb9DKF9K9gGdq8fV7ElGMcw=; b=Ho/lLeLKqbWHVR
	qgXpbDPwzfZ0qwvWxZhh6Y9Hl/mXrGaLF3E/Y8CcRTr1v8MdqweAZ78LuDlbKlFXbIwpjh2/Z+Pmw
	yyjd/hiBg6Bcxus5GOIPRd4ewyrp8LbdqYQYciPhGh14KLi55EffMruhv7Ft1C5QJyvk2mQoJSNPU
	oHboWo2pOZXGdpxfdC0wE5USGQRGbozTfmbeKTGT/gS2mGmudQjHJuB9hQUuBn3E0UYaA35ZHYy7m
	FIsVzKDz7EEFm5j/cVqyNUzkRNTmFMvghHJk+aqRNNONSi21MwdslOfeVE+UJBj47b4IIssE3kIX/
	CtPSzeDMAXgzuP8OdNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTX-0030pr-LB; Tue, 05 Jul 2022 21:52:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTF-0030Sk-9S
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m184so7813950wme.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M74NHYWFVlubiyzjgBD3mtVBmUu/qEzBrtkUN6AlacI=;
        b=LbsmErJNj1SSPN0AV+Q9z9lT2N70/Up5BN2W8NH0wehmNKWQlNFrk5OqDzZYsXhdTQ
         Hls2B8wQmS6GVJiUmKU+y+yaAJc7rgO6Ud5AhtZzvidys3JAlk3J/1edTCp+TvTD957T
         42dzwHznCiQRrS/MgCgQeJ09qasxSpiV8miztZ7pEhH6qGce7h/pR1qJUNII4mzRjcPq
         g8TwWvnNrgB//oOp/UvWsKxjTFwctFHKdUfT4ZpyIYsUSVZYSvwFretmizy5s1OLt8wb
         YnUIbT3XDNd6vPA5xwOWmzcguEwV6zvMahHkg5IH0SkZmGb2HXJrkR3W9FnRywLNWmxh
         bGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M74NHYWFVlubiyzjgBD3mtVBmUu/qEzBrtkUN6AlacI=;
        b=K78NBWwk+Jppl8nW/b02pI3gnrWPWDckEkNa6Iijr2W7Vbx78ouw8gNAofPfSaCbW2
         A/2i3nOLL+8te3SzP9p/jX22hEMXbaNucDCR8gMmZJ7khvABwysNopPFl1r8wRe5fUqf
         jrglhcjuPlnBzO9QBZcbGyxhWGlfXSGUPyMX9fzqL4n+YWs5YQYRIZeP3btNiT9Yxolo
         rcxBGTIAzU3JEIzyH66RDyTsa5wyDlT2plGuDOy7sKDV1FXnwC7j8t9SHFy0WF5nn63T
         H1r1TfqL1sSYsLyA2Z3eQElsLzZKyjzKset1dM1952e+z+RSxBIAURoPKN32nZk4zUyb
         mJpw==
X-Gm-Message-State: AJIora8BJERY13+EdGPUF11AtNCPcnePgHTamq5aH8UaHNzBLUtUCPqY
	pMxjcac4XrtTFLkW6WfnqpnmTg==
X-Google-Smtp-Source: AGRyM1uO7vMG/o91hp3+JmOnC/LWvd4jQWu7ahaOiYX0BCambKOIE9rOv6ReR4Y7BVC7IcBtd6QPxw==
X-Received: by 2002:a05:600c:3788:b0:3a0:4279:5142 with SMTP id o8-20020a05600c378800b003a042795142mr36273470wmr.21.1657057953730;
        Tue, 05 Jul 2022 14:52:33 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:33 -0700 (PDT)
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
Subject: [PATCH v5 07/13] riscv: dts: canaan: fix mmc node names
Date: Tue,  5 Jul 2022 22:52:08 +0100
Message-Id: <20220705215213.1802496-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145237_416328_575FE9C3 
X-CRM114-Status: GOOD (  10.76  )
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

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
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
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
