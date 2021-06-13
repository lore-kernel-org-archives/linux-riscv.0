Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F274C48BE8
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:48:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4566101B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4566101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2zZomKPT9WoB8bQUP8S0KxCmRsCm9NDc6GSZ2TMjPas=; b=QsuL48KRmDZc0L
	k0mQv3D7Osz3fsy5blLX6W7RMVo/A5SBS4d3tspSJCYHpcdtsgdqUGvx2GTSjixpS+93uvEceSCDW
	wynlJ3lAHW9ytaKhPpbZdLkIJqi6f480yKERaAiio9brbwCac5XF/RhdDWqqCuj5ksey+LXmhLC9p
	r7huvoHH0ANvZbwyMK088lKuZ4v0qkk8sUjI/NwxSpkwrPS4bq+lRrwpeG1vmAqzRvBB6JNT6p0wU
	5mTM49vn4aIcxVapgfMnAX840H2MDL+/yNVaf7ofPpxHMcMJIsHtogcTpe9j/gV2tG/lwEIKjFypg
	FG37NylHAHGVNC5BVp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsEI3-009Oku-H7; Sun, 13 Jun 2021 00:47:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsEI0-009OkF-D5
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 00:47:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 go18-20020a17090b03d2b029016e4ae973f7so6984605pjb.0
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 17:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=M1E/KqCrqBw8na7d8YIMW+xmxN0lavHYzwrAJ6gdNyE=;
 b=aJ4vaMntnYLgO+AgqInAT3oip05GQ9+gNzo1FF0RO3y0ROVmsEO59Kf6M9WRmKNexd
 Im3aqEwp2V9tWPw5sEBgAubEpA3Ugl/hA9ynMewPB7KygbAOo+im7/kZdwReYgA3EiO1
 pxfp9s5vuQAFDvv1Hm5XHiqmTrof5qiMxTFuln8RzviTRkDT8oqAiwMawXo4xej5eqdH
 aH4u9/o27P4ylT3Rd2/lmmeTIIyryMt/sTtCCk64WQa8kIFc1BUR9ATxnxxxhXMNegLQ
 E3K+D+4GZjAyoMdufCAj4/KdgoPEFGhciRSWg79FPFUUPfwnCaLXiJQYEXQKahBoWMVl
 sIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=M1E/KqCrqBw8na7d8YIMW+xmxN0lavHYzwrAJ6gdNyE=;
 b=jopFX6NFu5joywj+2ol2lvP3CMWxSJa34mjYuef7LyDMyhfYakjBtN2HdevSER8ZTu
 GSCz4Guw2mW9kGzqq4D8MpaI1eJVckySz1R5NR2C1WsEiDfP+1acg8hBrHcmZQB1uXd2
 epDIrE8srGDIbuUTglH9PmDXFFaZSrZ1U+9F4L9n5M/miFRKAPD4s2cD3NzwXDDskYs4
 3jjtBLWs0PoNuUyxQyfZBiUWISrMKem/r/VDhzD5mHEyx0OTXXWo+syXX6HnjJegMGsJ
 htFDX77o3yOmmxSqJpVzADz99Pl8a596slCAX21UDLABraB1MnFqkPpq4QHppyWq5jkI
 KSQQ==
X-Gm-Message-State: AOAM5323fGPgbsrIBsD5n2f8tBg/VmSiPvIPlyx8cbugCFVtHcbsjViH
 QYU1JoPJysd90YpVE2WgIXnbLQ==
X-Google-Smtp-Source: ABdhPJxIgIF6EZ1OZi/YZBMXsbuk9BT5FZqb5enbN/qDJXSDgc7aIaGWEWdDmWC73fybobAJGHJ9Dw==
X-Received: by 2002:a17:902:c78a:b029:109:edbb:44de with SMTP id
 w10-20020a170902c78ab0290109edbb44demr10408698pla.6.1623545263470; 
 Sat, 12 Jun 2021 17:47:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q18sm8900032pfj.5.2021.06.12.17.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 17:47:42 -0700 (PDT)
Subject: [PATCH] riscv: dts: fu740: fix cache-controller interrupts
Date: Sat, 12 Jun 2021 17:43:57 -0700
Message-Id: <20210613004356.3503995-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Cc: robh+dt@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 greentime.hu@sifive.com, lorenzo.pieralisi@arm.com, 
 yash.shah@sifive.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: david.abdurachmanov@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_174748_470332_3F9949C4 
X-CRM114-Status: GOOD (  14.51  )
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

From: David Abdurachmanov <david.abdurachmanov@sifive.com>

The order of interrupt numbers is incorrect.

The order for FU740 is: DirError, DataError, DataFail, DirFail

From SiFive FU740-C000 Manual:
19 - L2 Cache DirError
20 - L2 Cache DirFail
21 - L2 Cache DataError
22 - L2 Cache DataFail

Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
Olof pointed me to
https://raw.githubusercontent.com/sifive/meta-sifive/2021.03/recipes-kernel/linux/files/unmatched/0009-riscv-dts-fu740-fix-cache-controller-interrupts.patch

This appears necessary to make the FU740 function properly, but hasn't been
posted on the mailing lists.  Given the age I'm hoping it's just slipped
through the cracks somewhere, but I figured I'd send it out to give David a
chance to comment if there's a different plan.
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 8eef82e4199f..abbb960f90a0 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -273,7 +273,7 @@ ccache: cache-controller@2010000 {
 			cache-size = <2097152>;
 			cache-unified;
 			interrupt-parent = <&plic0>;
-			interrupts = <19 20 21 22>;
+			interrupts = <19 21 22 20>;
 			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 		gpio: gpio@10060000 {
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
