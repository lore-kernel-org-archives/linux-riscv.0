Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24D3C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:06:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D88610A6
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76D88610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm6iwAfBgo1c4bd0nR9ZVtcO5Qj1oM4uzXGq8wyYJeE=; b=yb937sYBdD6X8Q
	JuScFFqhK+7f5tV/wMG+CorpwACRU72XRKbOe6bpZsCXdsXtz+7/6QpYMGQoIf2AesAIAd2cPZpfn
	NWtz7Kn812QtNLUDqfklMkUEnR8/LJ01AKry5/2x5iDRvipknUZuIALZniPgsVJJ6TRWZh8Jqzvb9
	5vNTWTe1BTIJT9BIWM4m3O4mSH5nhujInx++rd5Kxr48yqEtkC1742sbOCdNJO+63B1H7ayaXS5QV
	MazTzxMfSVJVYVVjwEZPDrU1+zckNnwt6m0VWa95N5+OPx45noqLidjIrNcoMVZGoqZrBJhJ0tEnB
	Jki8bW+NbVapCm2UokGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIsbZ-00713q-TV; Wed, 25 Aug 2021 13:06:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIsbB-0070xi-GH
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 13:05:49 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 052994079D
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 13:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896736;
 bh=UfizrBJBT6h793qifWAMSREo4JNWpi+qoZht6aRmJGE=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ZM4WRgEKiFu4emREJsvcpdegETCZbnTLHsMvMgsj4DUKF4e+E8tXzsBYqs8a4bpYj
 gBZZyIbV9Z0Nt8G9TzuiWRNMIna3E442zJRjcpuMr4oZ6+N7fJ3JD6CP0xt6OGCLgF
 uoh5UCwvR067+lUeBzVTNQ8kbC8BEfGMoM1cOCu+KwxiqoaHocsD5wYVcUZEIXM1kJ
 Bow4mbyrC2l1CYUU2WAcmG1fWBZ+T+yU1L6/1Elsrxl2YorXojo4QtkJynsl1HrDs+
 pEr+Ej7N/IUERoAangvQO10m/0is/wQk3iyW0TL7DRbqJVC64iUKCVEYnArWoMyCTT
 PazJpyJWlwAsA==
Received: by mail-wr1-f72.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so2610976wrm.15
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 06:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UfizrBJBT6h793qifWAMSREo4JNWpi+qoZht6aRmJGE=;
 b=jBv6xAJG8fgVaH2ms486Df/6vkkR370F7cXDSavHElOEi6xQDZDPKOKmlSqfT1a6tg
 LhWgE755Nv1m8dve2VTTCWfvUvd5I9XIyiTS4c3ofklhTpKczkg2I4bjojOpEvxzR6RQ
 JUk1H8eMxEG2viVfpIbq3r78xZdRdbYLFYgDUQqoSaWluu8J+0KkNQEi35uS7ZNgyZK8
 yrUF0lSXOmQ18dnBqYDQbwz2PkfvT52a8rkkJ/IhiwIDkvDI5DtnnmLzJ30Dl9ZdBmuo
 Xa2UrERNgllRHgqTDcNO8HUhx+HyDj367AnP5z7LCvFx11odwuc7K8XCHRechF0cMuGv
 hv1w==
X-Gm-Message-State: AOAM532wfn+w528nX2NaqyDdaF5DFi8oMnRBl3hKLlwTb8jffBXY7odt
 NB60m/vKHO0/aKwiIV0a2MVv812eKaNy+nbqzRbq+N82fuw38+ps0Pejk8p8fQRXbpv2kA+/MIc
 wtyUdzvBF8CClP24Fz+LJZRfenoxjf596XBNZ4SBX6X/Eow==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr18711694wrx.293.1629896734660; 
 Wed, 25 Aug 2021 06:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLGSV31y+kVM+3CidhWNxCQ29UIuSq21ADvfXfOGHO2Gp5VvBVX5SwObpLHLgExu1hCrgJxw==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr18711663wrx.293.1629896734471; 
 Wed, 25 Aug 2021 06:05:34 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
 by smtp.gmail.com with ESMTPSA id 11sm5338828wmi.15.2021.08.25.06.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:05:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] riscv: dts: sifive: drop duplicated nodes and
 properties in sifive
Date: Wed, 25 Aug 2021 15:04:50 +0200
Message-Id: <20210825130452.203407-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
References: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_060545_745085_C6F1E208 
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
