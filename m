Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21875C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:10:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F9F610A3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8F9F610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSMHeJAZFIggtwOO15UAuTy53SKn+7pNyS3OKuAX8LM=; b=Kg3A5uVLw7f/6B
	U5Fq5rtsBh99eakfx+HZIYYWLamnUMNyEyGVzTdWsCrczAWY/N8dxqalDxj8b0xtQkkRELN5rNjRQ
	2rrOZleRg5kgYc0Dz13v7WOb14Ph0LIkFvrsBw6576gILGDQXID4SIe3TMIK5LtQFnq3Ld5IXQVGI
	Q1UC8Z7/VenOa6D9FFj/tr6XwaFNgCn6jcEXkzxJ7aMZYKtO7VNBd7xaoZBGyY6Ls/SvrDWIlJGaB
	N3U5Rwdj/ddmLIeZJjfL0dTWRXnf3FTiv50HQAO7NcCtxBO0sly8y5LFhIKyBs+XuDQGl/xjeUnuY
	kxZQsiNMpP8y9yRWC61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKvO-0029Zj-Lu; Mon, 20 Sep 2021 15:09:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKvM-0029Y2-0O
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 15:09:41 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C5E8A40293
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632150578;
 bh=O+npPoECYtJ/ZpzV1HLKddQ+EXO1NtYHdY0Cec4JU10=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=XIurkENSealZOqZ6bS/XUG279wah9P+Uj8f5pzELO9T1UUJcknaGth809N3jPVkEj
 y0n+hn55Ni1OJMtOYhyU5jYbQWQkMmqr0SNS0nJ7/X0Xi2o4Aza3TOXjBOgCsbaoea
 4sJrAd739R/NNjFEROJA0h/XyIjSNqBIUukA6iebdubT0UHwpvaXiDMcgxK3QJ47GE
 4X5ABGfL1Pe+WlmSM+gFPCqEicaiJIvjkSjnzimeTIGh6kJFbZ4xrjCLErQPvSaRaH
 ufsxZ7QWxRjhKYUHNMDXbWagmfPvjMm98lItpokxlIfEhzAKipG/DBRCOg0+N1Wwsg
 DCtq/JU5fQf/A==
Received: by mail-wr1-f69.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so6355184wrt.9
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 08:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+npPoECYtJ/ZpzV1HLKddQ+EXO1NtYHdY0Cec4JU10=;
 b=3f6B+/8Tf6emQaMhsgGLUraCDR46j4RpRBbUyqpgKQENFF7cUK3x+ar4HtYf/DiPKE
 9/6wOjUPIKUyvzM415fMN8XLdEnfJpgsnaOsiKDTvo3AYohK/DXZlTqTgx20qFdFBXU4
 mcz2AZ3qZt11EOhtHpW7oYLN0BZ/GV5ZVlA99Wtkg122Ps3repd3ctbzDAt4NKoNcbJA
 4EzrorRG5t/bviLbszmZaYdkSRvRtksY0zzYhNGeiCkY84OGip0ykHftGPDO6j/WJO+X
 IS/qEwrwz6/L1TFZcwCxpAKBjojr10Iw3Rhy0yAIw9ddFQWskk0RpMUItXjFH5wdsSvk
 D3fg==
X-Gm-Message-State: AOAM533BOvHybusL7gYsXwzxTQb1u6ilA8tfJSpGveg9FTXYVuYiCcn2
 W31ieQ9xedW7V+2mXBT9X28lrUdJL78b7JVVG2VL3Q5Rn1SRD7JHNMeN0IJRefHOorOh2iT41Lf
 ADbISP7MFeMk0/HPscU2vDf7wSq2+Q9CE5XT4ikSHLG/Gzg==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr29713722wrt.8.1632150578300;
 Mon, 20 Sep 2021 08:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8gNLJgi/hNpZH57Kj8vpJDclH4stPrZXvZVnMlKWrty7IW354pcwPOMxxaTmGpls2OU0c/g==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr29713701wrt.8.1632150578154;
 Mon, 20 Sep 2021 08:09:38 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i2sm15803136wrq.78.2021.09.20.08.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:09:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC node
Date: Mon, 20 Sep 2021 17:08:05 +0200
Message-Id: <20210920150807.164673-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_080940_229416_D6454BE7 
X-CRM114-Status: GOOD (  13.73  )
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

Changes since v1:
1. Move also bus-width, suggested by Geert.
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 11 +++++++-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 28 +------------------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 07f1f3cab686..fc1e5869df1b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -51,8 +51,17 @@ &serial3 {
 	status = "okay";
 };
 
-&sdcard {
+&mmc {
 	status = "okay";
+
+	bus-width = <4>;
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
index 5084b93188f0..83bc14860960 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -262,39 +262,13 @@ serial3: serial@20104000 {
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
 			interrupts = <88>;
 			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
-			bus-width = <4>;
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
