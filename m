Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0503BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:03:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C314E6109D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C314E6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AoDw8P6FYeSSbvFmDH4KRcJ570uovXYwLb3e6qQs0YY=; b=l6S91LLsYeiM8c
	t6yz7IsQrOXWcR3xwTYiRcyvSHbhdWtc6Dpu17Tq90Vgg+LlMGAqnb464uj/Slq4SpjFQy8OPTE8b
	9fItuMTQpRkhJj5UQJcGVJTJYqSDUqCLRw/Z+InZXPjI5SsdbkR9LC+6PG8Av2G6WxDZltRnyek3p
	qieY+7iA6+qYoDaIGmbCMoB69Hay5PHwulL9+r3UfW6kIzuZITzORzabdYdbVzs4w30mE/f/R/NgB
	y2pFKBwqicahd78OLDhBPihJHvk1Mx8C2z/E48hwFzwbgAZkMiexy6ztNvtZhd2lDezV4V3Cfj/zH
	UVFuj5kqnoXiXpZ7u4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIwq-001iNJ-6K; Mon, 20 Sep 2021 13:03:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIwl-001iLB-HM
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:03:01 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F020A3F226
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632142973;
 bh=lrFOqJg8K+1XmVsF/GpvrcRXBvTi8X1Jdxp9tcz+qM4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=ZHVvs8Q1F311/kUryIZ79yr5LdkKVr6nd1dCk2xrOGKvFcnACd6yiIy9nbQtcP/h8
 kJMdHtKPTnPn/n7B2tw6G07e6j5raGedBJIK3rfsXgnT1pQRaAOlo2p5QrCgxQsi8k
 iYpuNQDa+kbaxxxr7j013JMu52epB2wES9NSbTZfyqpp9ZNGhhO4eozmIWnKcsJ+W5
 izUA/hQ+XzQPTfjGNagBadUFlQO5qVb/sGvm5dfOUXgnrf1PSXXKmlH/BZMHYgxbST
 nrWRVYOYK6WUMbTfk194vMZSJfsd32bZLYl0+4t1fB21uVzidO4O8a7KvNw3R6iQBT
 5J3co8GOnYhoQ==
Received: by mail-wr1-f71.google.com with SMTP id
 i4-20020a5d5224000000b0015b14db14deso5999396wra.23
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrFOqJg8K+1XmVsF/GpvrcRXBvTi8X1Jdxp9tcz+qM4=;
 b=yC8jZ6/Den8et4qEdJ0EVAsRUhNxg93Kl4+mvCA15uGX7xA7iBGWPt3F6v/NcgLNng
 Kcr3VkhIWRRzmPfIBsrgpDkpUP4ucoJSBi/3G+eVKHvvAevopKffc+UzZhnW0qbXj60H
 0eVUkKLX7K56OnAsR9WoJXGgAigfDEVLIsejKLVV9lDxgC6AtSsEzMAWuBDi45uWia2+
 eGxd3K2sAaE+IIzpbTscoAlbvy4Mo1P3qOr28MSq1vREGRcabyun9uGj4HazqkDfK4dR
 eYtp+41kMTp2bT7Idrjh9djWFV6oBV5wVbMHx6PH8hbTeEbAhm6AiO4nCplfTvd1+Bf1
 xt6Q==
X-Gm-Message-State: AOAM532vMLTVYuFLhbw0IwRI/MJI5dlwF5qDtXENKaVGUNqbKRjPhsF6
 4+ANxsZIvzttcZtAb5XhRku6zNEfcsfhMetfjQ0cbXJA6hxuprCGbdJJ0oLtGr13n4Cb4cCFEjT
 4tshqu0AAfm00l9+C9C64m7N26hvcWge0pW6RD0YwGvRV1A==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr3932485wrb.77.1632142973681;
 Mon, 20 Sep 2021 06:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4z2ke3Qhl/DSE5AFOSSTAPUbioVfuMUlpXHmyMu5916vuc/RnrB5lx9wUQ6orRPoYBFGojg==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr3932471wrb.77.1632142973545;
 Mon, 20 Sep 2021 06:02:53 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g22sm18015331wmp.39.2021.09.20.06.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 1/5] riscv: dts: sifive: use only generic JEDEC SPI
 NOR flash compatible
Date: Mon, 20 Sep 2021 15:02:44 +0200
Message-Id: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_060259_762566_CD046E77 
X-CRM114-Status: GOOD (  12.29  )
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

The compatible "issi,is25wp256" is undocumented and instead only a
generic jedec,spi-nor should be used (if appropriate).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 +-
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 60846e88ae4b..633b31b6e25c 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -63,7 +63,7 @@ &i2c0 {
 &qspi0 {
 	status = "okay";
 	flash@0 {
-		compatible = "issi,is25wp256", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 2e4ea84f27e7..9b0b9b85040e 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -211,7 +211,7 @@ vdd_ldo11: ldo11 {
 &qspi0 {
 	status = "okay";
 	flash@0 {
-		compatible = "issi,is25wp256", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
