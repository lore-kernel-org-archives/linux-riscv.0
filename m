Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8800C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D94oaUuICFsGnBumMBTZDBa6o1h1kFmho+hUsTQGOWU=; b=xS1yVJha6V1rQa
	Nd/dbaM49OqyPU+r011flsdz89eBz5rp7GiJknORPKfUXNVXk0LbMKOAiKErpof5qrPHzEGpRWERs
	+DJY1bY1uynNAUOjWbOyjDcfb1/H8oDbAo40elvpJLmPRmi2KTgkNjU2o2qUBhA4Czh0QCTNSZkoI
	feTkqTWgBxGvZMrUtYWkVhjaMG/BRpQpOYgRtjG1H4tTnu7UbHEoe9NAA7c053AmjoXwCWea6H8CN
	6+a4V8+YtLuT4HUVvtFxgGnmFzJO83xxOkSCAwr1YxPfwLCd2lfUmE36TTuYftLq0yoOQITijS5yl
	Au02mAXSfAy6CGdyX+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTx-0031GE-8v; Tue, 05 Jul 2022 21:53:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTL-0030YJ-4t
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o4so19405443wrh.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j2Z7TaOJeXWEtVLR0e0XhsP1PHcFQhAlsDhisuCTI68=;
        b=XggLeeA/WTS9mEYdccjis5lFemn3ADc/NC/Rio0Njit6fDYwe4KqULiDHCG1BZE6D7
         xE1+PrCMW9skQC1G33FqTwwPeBVBm/URrT/J92o4sQSWXYea58XJ8ipPVetQcYT5JnKf
         mZMGjP9ep5bFp6GU9hORlbtT4huMBIwRMdf0/KPbAZpcIRuPjVBV3UH8TZOhacY8n4dM
         PAM8XYn2VU8Fb8hzhh1pfmCjiAz+jbVzQe5YMIidd2uNKPz+nr7Nw2qaI4Snuqv4SzxU
         fRbg2ISKK9sV333yjUBDG+pIjyUIkQl6puDYlat0+7RJr6DyNpJs9468VUk0tOPfCyhB
         qhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2Z7TaOJeXWEtVLR0e0XhsP1PHcFQhAlsDhisuCTI68=;
        b=31AWTfOSRnja+HPNHRxtOZV2AukLctT+LU2ow80SUly2j3qFr+KLjdvvqoV2r6Tmme
         oqwEDThwa8cURl0PJZX+n7EcEMP3ddAgtjLHyucfebJJaTrUhoHTR221MjRykqcGnS7F
         egimGaCfBHvmj+He5a5YX5ld5r6BLx/n+irNJZ6jxFFA7sOGjWU6cnTJ6h1TrmX1BHpU
         8Sfs2upzbZOFunVEIYilo+/9OS+6DnkyefLXT4J8/ZiwXE8+uIfMCrItoR5JwOLsow97
         bEo3XQYzXUuIvE6TP0fd8EpB9u9TK22UbRtH6NoiBNpI4M8oD2t12KN52BuUCbqo5PH2
         rY0g==
X-Gm-Message-State: AJIora/krVOcAU9KTf4sQ78RBNKkfYcZeHRpZPZ1YUz1ipTrHu1EebrT
	mKCD7Tpu0lv9FPKv3XW/NM25gA==
X-Google-Smtp-Source: AGRyM1tF/SegsE28614QkBK2sYVrZTXXYKFS981VORFpPqAQkmqnt12b3RBEdHc9eSvsFhzUnB+QyQ==
X-Received: by 2002:a5d:5292:0:b0:21d:6c3b:a30a with SMTP id c18-20020a5d5292000000b0021d6c3ba30amr10584330wrv.602.1657057959345;
        Tue, 05 Jul 2022 14:52:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:38 -0700 (PDT)
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
Subject: [PATCH v5 11/13] riscv: dts: canaan: fix bus {ranges,reg} warnings
Date: Tue,  5 Jul 2022 22:52:12 +0100
Message-Id: <20220705215213.1802496-12-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145243_312897_45CEED32 
X-CRM114-Status: GOOD (  10.56  )
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

The k210 devicetrees warn about missing/empty reg and/or ranges
properties:
arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property

Add a ranges properties that naively caps the buses after the
allocation of their last devices.

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 948dc235e39d..a515e5fb1af3 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -163,7 +163,7 @@ apb0: bus@50200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			ranges = <0x50200000 0x50200000 0x200000>;
 			clocks = <&sysclk K210_CLK_APB0>;
 
 			gpio1: gpio@50200000 {
@@ -382,7 +382,7 @@ apb1: bus@50400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			ranges = <0x50400000 0x50400000 0x40100>;
 			clocks = <&sysclk K210_CLK_APB1>;
 
 			wdt0: watchdog@50400000 {
@@ -437,7 +437,7 @@ apb2: bus@52000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			ranges = <0x52000000 0x52000000 0x2000200>;
 			clocks = <&sysclk K210_CLK_APB2>;
 
 			spi0: spi@52000000 {
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
