Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF455C432BE
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:07:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7268F6108F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7268F6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm6iwAfBgo1c4bd0nR9ZVtcO5Qj1oM4uzXGq8wyYJeE=; b=c3mPZeVXOghi0/
	o7F/Krt3gyIkOVJQbG18agreB2YHagQ286ZQdE/hGVqnyh0g0EQ28v5lkgHaOLPz6CuR25viuM5OE
	Hr1uToBUhrzJeRN1MB7Cn5m6bSrxaTWlgczBxOXhew4VuXj4YKDDM4J4tnUfCx4GzrydCiT6mBJw1
	WhlOAuBToo6LXLojfFa3g52niZX34j0CcREpqKno7y41eK5MJAuFVRUPjUZRiUadrwToVYAw7Kl3j
	ItFa9A5mTUQbcbg3/ybaV7NdT6y+F6K7+4sWQH4wJxUwqcKuT5cQ7nhLUyE3HyTcTaJyRQs/31T8o
	bqLtDaD4ZjHgdi72d1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIscX-0071L5-1J; Wed, 25 Aug 2021 13:07:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIscH-0071JD-Ke
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 13:06:57 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 69A1140763
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896812;
 bh=UfizrBJBT6h793qifWAMSREo4JNWpi+qoZht6aRmJGE=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=F52aDyd3IE7G8cVWvkFMBsWztlEwh6L+o7LMd7WLh33m0qQXNqaY9MVMbRW0DeMs2
 +BUPdElHzBe4Y7Yd0Dha7R1M+mwiHMLOaXl29as/UaEmrrdXs9AKGRwwvzpDj1KKNf
 CImgSEmgSGdekbm/f7irAFtQBCgNENzkPXjWp67pHWf9M/PGZ0yO87A8fKQHNIJQNs
 yqP6wxscVpheR2fwjkoI4XF8xBHMzaLS36LrFi2q4KFrhu0Mtz5SRV3clYYATWtV/M
 SfGQXZoBpQdPn2DeumlWaEGrhqQGy3oMFDnQcFQSb9M6Ewb786Vx7Z7DkYSaGunq9x
 pxsAo8GDAtjUw==
Received: by mail-wr1-f71.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so3209260wro.10
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 06:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfizrBJBT6h793qifWAMSREo4JNWpi+qoZht6aRmJGE=;
 b=XscIyEzmLbfwlOgTsrx4UAR1vG7J/59Jpe5Cd0qSmWKYd7W9p8uM2gsIuZP/kcwarw
 cLFaK03wMpZZSOfMRBHa3RaV9UM+qjj65xb8otdXOb9d+57yVemQRobeX+6o+IKLBWb0
 9OTffoiKZPnpdIDF4BFGcCDiE0vEbVtQqTF9luxBpRgdC+eQyW7Lt3mhWQ48dGdMVHTL
 tKGYX54We5tQDqP9FtJ75p7ch0IP41tUb6wmm4aVvYpfREPq8sinqRJd0X38Fc3pYFhI
 JJ5l7OmGJUy7JNT+YMO3R+ROis81TcXD448BVZQZWBVpMTfjclkJL8BjTzaCBfPw7gWN
 nw6g==
X-Gm-Message-State: AOAM532nvhNz5TN8+0eX8My4Xy0sDi7RhBKDBskPpjLeZNjgUcdhYC1i
 ymAwz39eZIoWiSpat5WQ+KoPJIEnyzlT/QKcyKvr+UIny5kMakK5GgvfVsO8dx02/esG7yqLDF3
 fNynbhuQ6U1WwYHWdVij23Tctpk4deGmmYJzRT9S2y1fHJQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr9149924wme.158.1629896811089;
 Wed, 25 Aug 2021 06:06:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzixd6QysPlsvWL7nertMLrUP2YTQueOD1OTVHyup8rVWyTa/PXx9YKm+yhpgfRrSNjfxxakQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr9149906wme.158.1629896810959;
 Wed, 25 Aug 2021 06:06:50 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.15])
 by smtp.gmail.com with ESMTPSA id r20sm13300842wrr.47.2021.08.25.06.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:06:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] riscv: dts: sifive: drop duplicated nodes and
 properties in sifive
Date: Wed, 25 Aug 2021 15:06:04 +0200
Message-Id: <20210825130604.203601-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
References: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_060653_837884_E962FA58 
X-CRM114-Status: GOOD (  10.40  )
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
