Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEEDC38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUF640eVPcQK5GMebUDYOJQ5kHKr7i4EytN6E6vgTzM=; b=BMML+9kKhhwfR/
	uiiZ3DH76veYKq99bQ9N+PBq2xR9u4KWzlwTH4NdrckPhnhKu93eSgn6PJplLiSjbWQT/xJpHW63d
	Qk7q3zDjeLDZz6Knl1EvwOxoRweKJbgUECMhbMaG/IrQjfdXa71pGO6mUoXLf076wdQT0D4KjYWL6
	x03pirm/Dsesz2QhQSNG7u3WOhlZqGsCllENQxEyotXhgLPoDrs2DboGj2VXhTlLg6PGhrFmyzFTV
	9+y3kE/vvKhEhPf/hLUiI9RhCJuRctqpVTub7JWyMW2aXSbX//Hg16Tqhrkvbk6euCouN99MlysNA
	aV2UJzsiWVo75OOVQ7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtef-000NUU-5K; Mon, 24 Oct 2022 09:21:57 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtea-000NPg-0K
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 09:21:53 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MwqJM5NTWzJn9s;
	Mon, 24 Oct 2022 17:18:59 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 17:21:44 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 17:21:43 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: [PATCH -next 1/2] riscv/mm: hugepage's PG_dcache_clean flag is only set in head page
Date: Mon, 24 Oct 2022 09:47:24 +0000
Message-ID: <20221024094725.3054311-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024094725.3054311-1-tongtiangen@huawei.com>
References: <20221024094725.3054311-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_022152_246290_BFB8EEB1 
X-CRM114-Status: UNSURE (   8.66  )
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

HugeTLB pages are always fully mapped, so only setting head page's
PG_dcache_clean flag is enough.

This refers to the following link:
https://lore.kernel.org/lkml/20220331065640.5777-2-songmuchun@bytedance.com/

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/include/asm/cacheflush.h | 7 +++++++
 arch/riscv/mm/cacheflush.c          | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8a5c246b0a21..c172d05de474 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -17,6 +17,13 @@ static inline void local_flush_icache_all(void)
 
 static inline void flush_dcache_page(struct page *page)
 {
+	/*
+	 * HugeTLB pages are always fully mapped and only head page will be
+	 * set PG_dcache_clean (see comments in flush_icache_pte()).
+	 */
+	if (PageHuge(page))
+		page = compound_head(page);
+
 	if (test_bit(PG_dcache_clean, &page->flags))
 		clear_bit(PG_dcache_clean, &page->flags);
 }
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..062559c04fc3 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -82,6 +82,13 @@ void flush_icache_pte(pte_t pte)
 {
 	struct page *page = pte_page(pte);
 
+	/*
+	 * HugeTLB pages are always fully mapped, so only setting head page's
+	 * PG_dcache_clean flag is enough.
+	 */
+	if (PageHuge(page))
+		page = compound_head(page);
+
 	if (!test_and_set_bit(PG_dcache_clean, &page->flags))
 		flush_icache_all();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
