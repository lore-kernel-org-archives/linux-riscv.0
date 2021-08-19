Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02260C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFDF160FE6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFDF160FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Y53MKCeoWSpe5h0qB2FdHJUtRd8DGFebaC4g1MqOz8=; b=MM1QCcONm0nYPH
	ojJnJk0mKKZ4Dr/HxYpUNCsIirO+cgocbJxlB/qNXuVNJiH0xWWsCKomA1r8ui+6dNGo9i8B0fz9x
	29m/h6WnMEONAsyYF61P5tA4ZYqoVDqErMhR2PWVSgVsb8yTLMJVGheDXGhZBGMw3SFfiTVrfGIj2
	EPqQjJsvhSeOCtQdT6npe5e+gOK4Jo3BHKcDQPwQ+MTWJl+96CLzC3NOv61aV6laVVBgu08rSW1XK
	OFWGbkWnDDOp8jF5++G2KGvuzf3a1JWwKiOe63ARY1cfZL7OsTLcyjKNw0vvumTA53ESDYvHYDE9L
	HzP/IWzBQtHngHK7vvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkEc-008qxY-GP; Thu, 19 Aug 2021 15:45:38 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkEP-008qqs-U3
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 15:45:32 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3ABC7411F2
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629387923;
 bh=njwgOg9JKn80yhYbvXIAT/SFdeE7ctVHz3eviacs2wI=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=vCErhSEhYlrj6wQ2Oktlr5gUQBkcD5poJ4KNcis3Fq3FfqbJgv7JipyOWuZjAiHKX
 /dMVERRxdodpVoUQzr14Kzz8xByPH0tMjNiNiM9ob5W+b/ah7pF9tS2ZhkHBt7N/37
 sDPLIae17UE+rVbS5fgWn+l34hJ3+MgqpQHeNYjM/5D6IhFoj7Zv+kXlT3ClBWNW3/
 IyTzYi7r4bN8o98XcIsZOC3YWdrIE9WKHiQIEJbR0VHPuE6HQZI4pEUPIcw3UHcQ/N
 QYAKyWbVBDt/1OMcerRLAfDDv4pM/IVVG59sC01INTjL5jkXnRgWGPa5Hs4T4cFsxm
 LfDXVbslBDaSw==
Received: by mail-ej1-f69.google.com with SMTP id
 ne21-20020a1709077b95b029057eb61c6fdfso2403011ejc.22
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 08:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njwgOg9JKn80yhYbvXIAT/SFdeE7ctVHz3eviacs2wI=;
 b=sriCXbZIu9+FgwIzBL0V8vbez0hrCvPRd9FrOurFrDDmLm44xQxA0DtYS6djRvINNk
 BDF8Kmh3QsbHOApBqzopnAj1XdW+ARcGrnvRnYBAlmfP0n6sIqbPFKv3hm6mf94Jr3ZR
 RiV6KVdfyMZWYcbDmKM9wk1bNB5hYY35aot7xryoY307A5UN2toDmPcwOqHmQ1tEudLB
 xcGTePMBk/T0oqFa+xSlXkBAN0p3obkV+3wt5t07yFT27BpoSImdh9wu/nUE3Wy3PTCk
 laFB0S1JvPxZe1W+KwDX5OB1cXqt2cjH1ELuK7CdltfnOiwevKEwM4uw1j4BLjNUjKsS
 3bdw==
X-Gm-Message-State: AOAM533FM+AVGJ2oS/rS2YVYi+TlqQUzOJ9XafbLPoWuITrliRJ4Uxcv
 Saa/gVtr2bZ5r4iL0IE+5kGIc/f7Z6XFISMSqK1nWWyhQrCN5ez+BIT/NswpiMr2sfOg/p54c9i
 vq/15SZJvqXTGas9sHzJMNRBoL6o/ha7Lh8ri1t0vwQnBkA==
X-Received: by 2002:aa7:d388:: with SMTP id x8mr17405661edq.254.1629387923011; 
 Thu, 19 Aug 2021 08:45:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjjgc+MlbW3WgtXD5d1JgTS06sxNFURI2vP+cBd1uncao3bHmqg3HObd04dkwqF/n5zuGX8g==
X-Received: by 2002:aa7:d388:: with SMTP id x8mr17405630edq.254.1629387922833; 
 Thu, 19 Aug 2021 08:45:22 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f16sm1925373edw.79.2021.08.19.08.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:45:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 5/6] riscv: microchip: mpfs: drop duplicated MMC/SDHC node
Date: Thu, 19 Aug 2021 17:44:35 +0200
Message-Id: <20210819154436.117798-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084526_120258_9F71AB68 
X-CRM114-Status: GOOD (  14.27  )
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

Devicetree source is a description of hardware and hardware has only one
block @20008000 which can be configured either as eMMC or SDHC.  Having
two node for different modes is an obscure, unusual and confusing way to
configure it.  Instead the board file is supposed to customize the block
to its needs, e.g. to SDHC mode.

This fixes dtbs_check warning:
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: $nodename:0: 'sdhc@20008000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 10 ++++++-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 27 +------------------
 2 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 62f7651de538..ac6083c76083 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -43,8 +43,16 @@ &serial3 {
 	status = "okay";
 };
 
-&sdcard {
+&mmc {
 	status = "okay";
+
+	disable-wp;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 };
 
 &emac0 {
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index cb54da0cc3c4..c4ccd7e4d3eb 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -262,25 +262,7 @@ serial3: serial@20104000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@20008000 {
-			compatible = "cdns,sd4hc";
-			reg = <0x0 0x20008000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
-			interrupts = <88 89>;
-			pinctrl-names = "default";
-			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			cap-mmc-highspeed;
-			mmc-ddr-3_3v;
-			max-frequency = <200000000>;
-			non-removable;
-			no-sd;
-			no-sdio;
-			voltage-ranges = <3300 3300>;
-			status = "disabled";
-		};
-
-		sdcard: sdhc@20008000 {
+		mmc: mmc@20008000 {
 			compatible = "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
@@ -288,13 +270,6 @@ sdcard: sdhc@20008000 {
 			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
 			bus-width = <4>;
-			disable-wp;
-			cap-sd-highspeed;
-			card-detect-delay = <200>;
-			sd-uhs-sdr12;
-			sd-uhs-sdr25;
-			sd-uhs-sdr50;
-			sd-uhs-sdr104;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
