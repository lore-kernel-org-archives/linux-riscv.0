Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C439C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:03:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBCBF60FE6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBCBF60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOJ/nC8Bw95IGdgZL4C/fMKFtm5fOukjtKe2X55AKnQ=; b=Oh7yGwqcLy9dMi
	4i5qyjRWvJwoenen6EUpR9M99XhYV5JzfVCNJWDQqovLSN2T4uYZzzCga+spJivyDG6El/M1RHoOI
	nIMrF7EqucagGa0ompF/+a0lFHx/6Jv+Ir2iR6DzYv6EPhV1N5J31wsNAslu+4f/uWtareLTGcDS1
	pd5KbzxL8FuSjL6ccBt1MNDWyz7cP54bsZQRakYLIuYknvcuDmCoH0UUtqU5n8+VnH5LlhJbGbWxD
	1RABJfHMt4LtnuMbRaykeV5rLn2jInX098xQjpg4IUTUTYeVa4VOnWnMHaJ/HpgDX/pCqmTv+KTZm
	T4133XKRuHN0fheJIl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlRS-0092QO-CW; Thu, 19 Aug 2021 17:02:58 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO0-0091Al-H0
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 16:59:34 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A9D8F411D1
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392360;
 bh=Y4VjdAw6i2XAmKpVIHlCuxlv3sz5tzJooO2Kj1Zm5KY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eDBA272Y2svg85DF9lw/MbX3WzKN4Xur5Wx2Pdx2BTgOOn4EESIj/hqlklcgYSM20
 gbzfUSfJQZdXEFEoaXQe4YoFWGZ9twXzmsXDvOMNL5SLG+sUdB3rpn9nHtom+DLikJ
 Am/wIIDUEGaP6hyzLR0axFiJflPXxiemdO7DysUHl9T4a7wvX4Nxkj1rOzCG3pm4nj
 MM5q25jHqSKMfMFBfZCW3cZPrqkwtAoTG+GcCYi+nLcy0jCENxN16H3e1RhXGC9by2
 7FegM4hKXRBkulA+BGeBUa1BPeBj202wbgsEASQGoL92xgoTt7/Ha6YfHHmyCjG+q+
 zqPC7zwCKmXxQ==
Received: by mail-ed1-f70.google.com with SMTP id
 o17-20020aa7d3d1000000b003beaf992d17so3127284edr.13
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 09:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4VjdAw6i2XAmKpVIHlCuxlv3sz5tzJooO2Kj1Zm5KY=;
 b=jnmH1Cv8wGnWCZcP9zb+MdKXnsRTpD7Dc5uXalMoPxfOzmEk8zeXqpgCyDwXylylJD
 Ml+rhUC9a9fANe0Pa7iwOTmq+8BaiJmObCZnZLOoN/UKDildWfQdX1jxxOLL28cl3T4Y
 JbVuPd8WSLeOxgjX1dRXAZwunTbRqkODaOqPCjrw6aLz9RY2WA2n5jc9O1qK/JywIfUn
 F4XUgXqbuzhQQ4DhKa+O2PVtDwXGlpN1OuIJPbyw9emlkvw9t0FnwUWl68sb3onakt0G
 h3VK6lrVNZOaucplQMJP1ZAP+Klyh1z8XtXKEg9Wq9v8kza37CbRbvSYsZfTUj5A6LEe
 N6Pg==
X-Gm-Message-State: AOAM531wXCjG4fEWTk3hLu6JhVx0vuNpba8fkx4dN+DaItPaL4/ZHnB7
 ArSZp5pje5n/yCDVKlzlVKR5R+SC39RvdHwy13GgwYIbCs2uQVBTSnaFh8aOC9J3tWEYoAPK4Bx
 kmj/lJWNCLRZs0Pnyehg1l8Ndr3Hz2bmo6HL/5b3PboSwyw==
X-Received: by 2002:a17:907:9844:: with SMTP id
 jj4mr11566643ejc.274.1629392360423; 
 Thu, 19 Aug 2021 09:59:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy43yi4cd7I0ui+CNEC5/97mRyJRHDDxkOUtMndNvJTXPpnkWSykdSV4XJEwgHTzH2mBfqKLQ==
X-Received: by 2002:a17:907:9844:: with SMTP id
 jj4mr11566632ejc.274.1629392360273; 
 Thu, 19 Aug 2021 09:59:20 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 3/5] riscv: dts: sifive: drop duplicated nodes and properties
 in sifive
Date: Thu, 19 Aug 2021 18:59:06 +0200
Message-Id: <20210819165908.135591-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095924_846480_2619EA3E 
X-CRM114-Status: GOOD (  11.36  )
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
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 -----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index c960e19cfa70..ed2c2429c6c2 100644
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
index 2e4ea84f27e7..960d65ca5d4f 100644
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
