Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6FBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/JqIbvx5WDkhnlGlCmsDC6qArAY5Hgh6TeLd3SExbwE=; b=lV7NDht4K96clU
	GsV7AWAKqljmlH/a9Lu928Bz3gbbh8Y4pdnXs4Q7QlU+1J9jVFf3KZ9EdK98/9lnAd00qH8ld2qBJ
	PBe3qSbOGoKKnXaQS6wN8bs0AGE3WcZxVHUof2O+vNk7vJtefh9ap3mUkFXa5gEHyPODp/lj+sF+F
	rXiGXLAXvPt4Ut2zHzS4UwPNmokGHbKZrVCKYGaDV5PwJnSewTkS1TTPCt+Bfj8d4bWIrojBHC1rR
	/OYNyg8zxt83FQBNnbnXdB2Vin4nC7wJ5E/QMrvbjmPS8TuImOTVwITjNqE5Px+rJ8CxMejAPsJsf
	ioFazi/fDjlnCywQR0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrEt5-000YFV-Gq; Wed, 18 May 2022 08:18:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEt2-000YCC-4z
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 08:18:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id w200so1452362pfc.10
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f22cXTNsoYn514XVAs+A0nZ4R63LnXxUaMnO5yshFsc=;
 b=mUJJaZznPXm2bEg7PPxlgx7o3QntT81XPFfYXi4PPvdVoRy4k1G9xOeSgyJt4jpWfg
 QE+A17kzFEKij01JyspqP1UXEAZaYitG0T4NmR7aoptr1Y3Ayr37p24GgnDWxynwDg2U
 bxOuwGcq90qqgJv8MdBu/3h123882KI1Kn4EHIBP2A9eu9LKGhXMIqc7W8rLmuuWQllt
 FESfWEd84TzBbbdEpYJcpcQL6ar4rpy+DlqZRBXS3kTiXWzW68YMR54dCwAeFO1wioca
 eIrnaqwuz3PPYImQlcs+d0J/C9PWbrxA9Jjy3LfC46XuO4BhqjJ1Gb8nalaWbrLhKbqw
 OMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f22cXTNsoYn514XVAs+A0nZ4R63LnXxUaMnO5yshFsc=;
 b=YRRyLv42wpY2HO2HgrjLduiDDZc53rqSm2UXXbXSjtL1q9Po85rPBOsUMLgldm56B8
 DQATXmpMypufRHq1J+wnKv2CIP/XIP/PzIAJyKl9yC5iaymeqECjI53vc+oyfSpDf8Ft
 xIvB1kLePSpjP14iUqiYjPLOHYGFDsdznwnS/IQwJmKBr8CZMXXUXAmWEFTRjdy+Jp/V
 EcgA32d6UxUJuzSp2KyvHk/LhBWAgzP7whQyH6tTvUrjlldSlfqFDivJNoznRehorFQR
 z6DJkTtf+Fls9DnbV75dpqWHzO8Bp9qZObtnFNc1I/kox9RxOPfqzrD6+/Ot26JMN+Ps
 1Klw==
X-Gm-Message-State: AOAM531Npg9WwBCjjMA4QmmydDf23IEEyk0gzGFObvO2Zd6l2YaJHP/7
 29Zi/Xba34zj9j9vLr9SizLEMQ==
X-Google-Smtp-Source: ABdhPJzx8V6y2Rr4Fth9lL0g63c1SH5CDRzTfNW+60mdSK5B8TxPN0VIhHLmLBbA2PUNJIH5856MJg==
X-Received: by 2002:a63:5b13:0:b0:3c2:163c:b9cb with SMTP id
 p19-20020a635b13000000b003c2163cb9cbmr22699800pgb.145.1652861904658; 
 Wed, 18 May 2022 01:18:24 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a1709027c9700b001619cebbad4sm989560pll.148.2022.05.18.01.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 01:18:24 -0700 (PDT)
From: Po-Kai Chi <po-kai.chi@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Po-Kai Chi <po-kai.chi@sifive.com>
Subject: [PATCH] riscv: Invalid instruction cache after copy the xol area
Date: Wed, 18 May 2022 16:17:53 +0800
Message-Id: <20220518081753.29589-1-po-kai.chi@sifive.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_011828_296643_F8D13C19 
X-CRM114-Status: GOOD (  11.01  )
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

We need to invalid the relevant instruction cache after
copying the xol area, to ensure the changes takes effect.

Signed-off-by: Po-Kai Chi <po-kai.chi@sifive.com>
---
 arch/riscv/kernel/probes/uprobes.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index 7a057b5f0adc..9d52beeac73c 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -165,6 +165,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	/* Initialize the slot */
 	void *kaddr = kmap_atomic(page);
 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
+	unsigned long addr = (unsigned long)dst;
 
 	memcpy(dst, src, len);
 
@@ -177,10 +178,9 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	kunmap_atomic(kaddr);
 
 	/*
-	 * We probably need flush_icache_user_page() but it needs vma.
-	 * This should work on most of architectures by default. If
-	 * architecture needs to do something different it can define
-	 * its own version of the function.
+	 * Flush both I/D cache to ensure instruction modification
+	 * takes effect.
 	 */
 	flush_dcache_page(page);
+	flush_icache_range(addr, addr + len);
 }
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
