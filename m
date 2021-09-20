Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B79C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 275B8610A3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 275B8610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2nfrfH1Ijbxua9DlYBybhqMK7TiVF3/31fIin43xlQ=; b=iC64slSEw54cNt
	siVdmR8Xeo/6jhKIsnoT4B8j8/nws5Ig2ZE63+JasgZRoNJHxC/GpNFgaNnwTVN2ED3YoSVsJX10c
	bXMyDOFeFfrQNxOhDZ5gufHXqhg4zo5uSID2EWaL2TTXswGhe+1i2B28mphNyXJPr1b9JPHCZnpYp
	Zgc47AdTmyh/MNzNjSEVfegdJTTfNKAgJulYrNHFcrGVYaaRA3jIJM33KrAnhIfOkA6NEXkMH6H69
	ckhT2YeCsaHElr+JK+ilS2+kLnMYX+IAZ5yIwqbjpNWEdE5WO9sDbCbUNBEYib9Kf7w9/OWb+TPrV
	d/3rTLLX6ylMlHPQNRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIy4-001ih0-LL; Mon, 20 Sep 2021 13:04:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIy1-001ifm-Di
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:04:18 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 400CA3F048
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632143056;
 bh=0ATfDdcwsrHvOMt7UcUsCUZb24XVeT4uIjZC4PxjuPM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=VNM9nSn84DUxsbPw8KPvsn3Ycro1jz/Amakls8NDwCw39O0DTnnOFECx8UxyQ6MXN
 46taKoMVlOr66xlGpaAsZ3N/9VvAlfG8v+/c9Yn5BZrfbb56hfc1TNyxsdjBw4A+LB
 FoDLvDAaTK1WII7Tx4FW75Ijdod2rofeZ/lBlVIhq+hUynHrc7ZIIrJ3T1mxd6gWt3
 hNJTvnpDKLtKiYchX9b0q+SqLoRu9hgSQI2sZw8+z8T7dm7ER4oz4BzmLq+CiTVCcX
 DRnpK695UHH6WRyOUbECfYeJnrCeSDCBk8tp1inwWi6r2KzPZIqEWWTj78pbv31+/W
 eWEYmJVRSB89w==
Received: by mail-wr1-f72.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so6006002wrt.21
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ATfDdcwsrHvOMt7UcUsCUZb24XVeT4uIjZC4PxjuPM=;
 b=F6WGKPH+iJKVtCdYiHtoPx0znaAk8+JaWeeGCCoTLqCQoRKeLclHxfzwEaoqb9BDkp
 0lpDXjNj33Lma4BGj7JsCHlZ6ebtOQpKhNt/trPFkt7jPtfsaI/waKGO3QS30GbWNekY
 qI08y2bT2U9P7AJ1M4OfnhvFRVRddYwD2oVIEokIe/Zb2ykpfIeg7ARbwXxIJe9Y5pyH
 ZFt1sOMQM33VJh0m0BxxxqBZ+coP5gaqCyyBvn7q/YB4doI1k3Ge6fNU3cQwDbYicLfQ
 mEdciN8P1Yx3UcTIPW5D3aj6DhIrMNOgnXyo7rZu6xpBg/4K1/yWqPx5t2tvY6dug+0s
 fhrQ==
X-Gm-Message-State: AOAM531iPF0DN3kkgWHX7Xkwt+YQUobV+ewrKMttF3CpIX0viYKnW73V
 2BsiHLP3g80Mia7vw0vgj+8F7JR8fjvkIYKGaacztOoGnhBiSLYtFAexlZFQtOfpqQt4Ug6KahW
 XzUl7seKjzyNs05ZK4tqb5+1JfTBDFHrQatAM8WGUJ9Gfng==
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr29418522wmg.19.1632143055970; 
 Mon, 20 Sep 2021 06:04:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcqxuu711f17EArSGcqHrFTFt+IrQxhxwvK11lX7/O4LWkLse5Xc9k93FZpJKe13HKkvmLbA==
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr29418508wmg.19.1632143055827; 
 Mon, 20 Sep 2021 06:04:15 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id 25sm22965108wmo.9.2021.09.20.06.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:04:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND PATCH v2 4/5] riscv: dts: microchip: add missing compatibles
 for clint and plic
Date: Mon, 20 Sep 2021 15:04:11 +0200
Message-Id: <20210920130412.145231-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_060417_634751_666E3362 
X-CRM114-Status: GOOD (  12.48  )
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

The Microchip Icicle kit uses SiFive E51 and U54 cores, so it looks that
also Core Local Interruptor and Platform-Level Interrupt Controller are
coming from SiFive.  Add proper compatibles to silence dtbs_check
warnings:

  clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'canaan,k210-clint']
  interrupt-controller@c000000: compatible:0: 'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'canaan,k210-plic']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b14275a9a59d..eb8b475b8611 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -161,7 +161,7 @@ cache-controller@2010000 {
 		};
 
 		clint@2000000 {
-			compatible = "sifive,clint0";
+			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
 			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
 						&cpu1_intc 3 &cpu1_intc 7
@@ -172,7 +172,7 @@ &cpu3_intc 3 &cpu3_intc 7
 
 		plic: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <186>;
 			interrupt-controller;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
