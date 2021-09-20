Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEB3C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:04:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2F26109E
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C2F26109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W24fUbXgkewQ6rrxhF++Gf18XuusvZVxIDTQPhr/ui8=; b=J30Q2PErGzJw4n
	ZpcmHZuhWPiCw/LG4RKZQwZhH5w/7xh8fBz6fERSfl+Y+SqfJyE9S6H5lO55NiNeGDeq/9x17AIkx
	YvZ0Qeg7/RIcWhXqwtLOZyLSI7/Yc/zwIU98sh/ATUfMc/K7KgDKKmY7+tasm+sVTBaV/dnREsG+5
	KaGt/JC6h0V9FQtShfYWhhN2vKI/aGUGSvDRMbtoWpl4E3GNB1CG0Mvu3FhFx9UTe36Zo9nx8f7j0
	sGFzQh8JB0el7eIH5vkGf1YmM1o10M5X3FXHjeuPyoXggCtO64ZRSH6dPiVq+NqzgQLIrRP8NKXUE
	iqCG8240Fs8aFKdvGWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIy6-001ihn-JF; Mon, 20 Sep 2021 13:04:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIy2-001ig9-V0
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:04:20 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C96623F4B9
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632143057;
 bh=KyQicLYMcvTUsuouhObsDgwfTY/CvChfVjl2/JZq64I=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=hDvX46djM7ZMcjesVpGssaknlbsN/pSpc9/S3qva4wVbVWgkZob5bGjGMAnfTDwE0
 1Q7YYQol2vEsvBlgUtvTFfSk8VxqYAMsFeWEwQ6fx1mdBXbj2C9PMzCmnNA6yf9CI5
 fuIgzME6zhZe56eEY64iVZRkTQT9HabhCuNeQF8h61TcejRqMfnSfxbbwK49OaPewy
 nUAD4gO29nYIYrdRiVs9QOVoCIvJGK8kDtdn4GitNp1lyN//QuYPBHkCz/PInY2USd
 97K2PL+qLuiwHjniH/c3dkkqhiR7IB0AdZKRSn0g4Yf6ASnv13j6scpjfkMHcQaUfs
 xnkKPNu6FklGA==
Received: by mail-wr1-f71.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so5995790wru.15
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyQicLYMcvTUsuouhObsDgwfTY/CvChfVjl2/JZq64I=;
 b=7xAtcs/srTOJyCISJ/XZTGLsegQU9NolfVHDviziRKnoBPxJ0l0isQ5dtJwZwpJB6G
 ke9PQRcyYWJ+TyK1dY3XYh7jnHNvpKzVJMy3kgEjcl4bxPyFCLh2F43Ti4Cnvd6zicvX
 fRfQLy/KcqNUARVOJeDAZHwH/JfZTmXU+nXPqMNlVk1ukPHDasFG9Tx8VzVSZzrhhZeL
 Ghlfxi2UTfDszG6HezkONr22NRcg/PsoK3VREafPDcIj1StJ7AcmBnvB2Aw38GfepM3q
 C1/gYqInX5mPGXT6jrsoBDC9h6k5P0OanuRBZGSZFPky2QIVvdCuCEFdxgNuvVGPLUqk
 Pqlw==
X-Gm-Message-State: AOAM531qyjefDaGr40Pb9ipzenz2foaNI5CUQkm4VVrZa8wEWAvbrUCM
 aPWg2bab+O8sjbRuRRwi+frvcnVSaEIkbhQ3fU0mwQ400LtHyP/V+9vAtqu67uiaBeHAj+ofbWK
 krx0V9esMTwNUbxkbu0d2DPzD++TLQbJTLV6+hvIw9V1g4w==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr24133074wmc.14.1632143057509; 
 Mon, 20 Sep 2021 06:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypg5QGxpLH5N2pakMgq9jvpjRG8kkva5Tcgev2sXz+0gx7PhG+53e0/fOPWDZYp26XzyqyLA==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr24133048wmc.14.1632143057361; 
 Mon, 20 Sep 2021 06:04:17 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id 25sm22965108wmo.9.2021.09.20.06.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:04:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 5/5] riscv: dts: sifive: add missing compatible for
 plic
Date: Mon, 20 Sep 2021 15:04:12 +0200
Message-Id: <20210920130412.145231-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_060419_194973_D290EADC 
X-CRM114-Status: GOOD (  12.07  )
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

Add proper compatible for Platform-Level Interrupt Controller to silence
dtbs_check warnings:

  interrupt-controller@c000000: compatible: ['sifive,plic-1.0.0'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 7db861053483..0655b5c4201d 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -141,7 +141,7 @@ soc {
 		ranges;
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <53>;
 			interrupt-controller;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
