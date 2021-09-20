Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E01DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4623860F5D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4623860F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm6iwAfBgo1c4bd0nR9ZVtcO5Qj1oM4uzXGq8wyYJeE=; b=cfaaj2yvSQ3G3i
	y/cd+UaRcxGNb0yw++WUylwy1/59dwJxad3rsgPy5gs14RwtGFndbWt9Bv9VjPZ9m1acX0XCI0opB
	dihKktlcTsl4IxWjn5ZriWphJ/wp3rTAtGpba9GtLN3tzsOD5K3vdXfwInckEr+tW9oR4G0cfT2sm
	UjTonrbv52Lmz7bvXrI6X4oEXMYbG+QwJ23pmzrVIqofOWG1sve7tr4LBraOoxOmDx7BErTqaViFb
	4SWEQL+CeNpcX7YRrGXqPimMFFhWW69v0rVs1hP5k3BKZnw50v89SnEbGDMeRGpjg0yJBX06Ge66A
	EhnDMwSUH6bSUBW6pahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIwu-001iOT-M2; Mon, 20 Sep 2021 13:03:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIwr-001iNR-Pk
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:03:07 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C3D13F320
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632142984;
 bh=UfizrBJBT6h793qifWAMSREo4JNWpi+qoZht6aRmJGE=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=h7msZLgID9c4U+hUwUlpY1qofWMd6qzPkpr1HLDN3FNyxY1ht5a+dr9FbUYWzr+cy
 YHVy01Lg8478g8wlAwOUu/K90BgaY3TZ+AANtsP53s1sQDKIsqsTpCbk7F2moJZiPR
 373Ku7AOhbperXQwXktKO8ZDzUB2uGwp1ZTGd2Zz6FuZ0khnyPoI6YS+P8dlNWKpww
 Ccx5X1C9+xM5YBbgQhml2+YTODtKDDTeZJrLQu0lM6Rw/CulIWzs+6AgC+VHPbrOmn
 Wh/ev8PeB4j51OJgbRtrewhFX8/RBappV4YO35E9sU/foA55EXzwpef4epvJOih3tj
 pGNKLOMH3MonA==
Received: by mail-wr1-f71.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so5992622wru.15
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfizrBJBT6h793qifWAMSREo4JNWpi+qoZht6aRmJGE=;
 b=OX9/xZKEs09GTRsdNGwlDVW7B7j6Oy83YleAVouGstRVhu43jDrb/F64KHvnsmmEBu
 MHC/kTdeBMXheo2oZCofOBLTIVblrJCBXWfH1PL3Llq13gYIjLTEz/5s8guRqQg/pyqW
 JMltaM6EGrs9QS/voQl88WaRR6ojw+mUhO4prjssezlHNaJo0fRg3h7DHT6zCLjO6Xr4
 6NoQoBm5XDDVmOL9LcDzyACYSqCHNqYg3olYthXTSZPhWjl+IoxBrGbwNewuyYH4j7XK
 xccPXU2gJoYgyLNsg3ggMsouLtEbFsY+RjchMLzUUz3xVdmaZIQsB14vRvibdz3QJ8Hs
 vYQw==
X-Gm-Message-State: AOAM533XIOu8LfzuC+PyLdNc0HVjVchM80LV2Mi+KvmLbEkV+8law1wk
 LbBzBP1xKJi5X1FKXP6oyCHHH6Uz41C0Fp4Fd1hRwwffi1w8EKXKAhQxiPOyDJl52QiYbmPL/5d
 aQddvMdsdC+sgVDes/YpFTe5xiLXzfxdfnot9ViWg7jmZvw==
X-Received: by 2002:a1c:228b:: with SMTP id
 i133mr29327832wmi.179.1632142982420; 
 Mon, 20 Sep 2021 06:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/BB9e96BfKaLLJbiEnOqtb29yH57oOh/zntshgoog9DQ8mK0SbPb2pcaq0hwTZ3DzpPLfZA==
X-Received: by 2002:a1c:228b:: with SMTP id
 i133mr29327794wmi.179.1632142982023; 
 Mon, 20 Sep 2021 06:03:02 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g22sm18015331wmp.39.2021.09.20.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 3/5] riscv: dts: sifive: drop duplicated nodes and
 properties in sifive
Date: Mon, 20 Sep 2021 15:02:46 +0200
Message-Id: <20210920130248.145058-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_060306_007556_339F8468 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 -----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 2b4af7b4cc2f..ba304d4c455c 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -8,8 +8,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "SiFive HiFive Unleashed A00";
 	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
 		     "sifive,fu540";
@@ -27,9 +25,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
 
-	soc {
-	};
-
 	hfclk: hfclk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 9b0b9b85040e..4f66919215f6 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -8,8 +8,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "SiFive HiFive Unmatched A00";
 	compatible = "sifive,hifive-unmatched-a00", "sifive,fu740-c000",
 		     "sifive,fu740";
@@ -27,9 +25,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x4 0x00000000>;
 	};
 
-	soc {
-	};
-
 	hfclk: hfclk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
