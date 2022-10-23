Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A7CC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdayosKZXX+tyZ+KMwXV1O6fhO/ElKbMsX3e+kK/2hM=; b=CHduwAzMBf+dxT
	RMTr0uP1oiwBzsm6PYOOdbsNSzrO2uQ+WYyUxCfaKlBWWXQBssMKG6jnWKCNH+9p3TP826BUeLpir
	oCLtJWa9rHLPdHTgfJMRpyoBuVeNevPLuhHklo7MG0mtKAYGZ/BC8tdJdYu2mSLWA5PIlbLASV8Np
	EMF6EpdX0QQ2O91dnhUsH/7K00rLnnu/VUkmZI6J6RxozcSYYGuFqVuAm3YgTsAXt6VkSwEiWJq9K
	194j8WlRwGhURY3b5OD3Mdnyzy67hWEzhzeMx9z59i1Sq5ORbvTShX6D12T1+cgrUpMVe0GnhpSnS
	gJKRi3ZLrzMXNG9NuI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omb7A-00FM9I-HC; Sun, 23 Oct 2022 13:34:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omb76-00FM6U-QL
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 13:34:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A247B80D5E;
	Sun, 23 Oct 2022 13:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D109C43470;
	Sun, 23 Oct 2022 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666532040;
	bh=HgCI1fwpCRV6cbIVNToGS+BLd1ULTdQix8qchtvlux4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AVFtjHfSb8Pix+ZODNxlJQR5O5aUXDkMSRquLor3ywU7ifraASh1B9mCOEjvSpmhi
	 5pwloxojUVQPEPJ2nXi5g1JVDuDE1h3HpRLY42daghXEUPTF7NpE69kjP4CO1wc0ML
	 OzbFYnrf6HzV8oxKV1yp5MMhWhLI4SLmS2V+DRTzZxBvEFKaEvXBlJ6KnhO+lYL3dI
	 1IWrS6h4wVbfMAXen6V8wN5llaAW/lK3lOeEvN7oClwG3ggzWrMfgYvsVvCq5yv/EB
	 qeU0OFXs587rqByUX1KKY/7/nHUUujPncosY2MQnzIcadA2hayGkXIyo9eL+kUJ0RU
	 yMZXSDWBeTMUQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	arnd@arndb.de,
	songmuchun@bytedance.com,
	catalin.marinas@arm.com,
	chenhuacai@loongson.cn,
	Conor.Dooley@microchip.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/2] riscv: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
Date: Sun, 23 Oct 2022 09:32:05 -0400
Message-Id: <20221023133205.3493564-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221023133205.3493564-1-guoren@kernel.org>
References: <20221023133205.3493564-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_063405_005064_71609537 
X-CRM114-Status: GOOD (  12.66  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This patch enable the feature of "free some vmemmap pages of HugeTLB
page" [1]. To make it work correct, we also need fixup PG_dcache_clean
setting for huge page [2].

[1] https://lore.kernel.org/linux-doc/20210510030027.56044-1-songmuchun@bytedance.com/
[2] https://lore.kernel.org/linux-mm/20220302084624.33340-1-songmuchun@bytedance.com/

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Muchun Song <songmuchun@bytedance.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/Kconfig                  | 1 +
 arch/riscv/include/asm/cacheflush.h | 3 +++
 arch/riscv/mm/cacheflush.c          | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..81ac25b0e005 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8a5c246b0a21..96f7381aeeeb 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -17,6 +17,9 @@ static inline void local_flush_icache_all(void)
 
 static inline void flush_dcache_page(struct page *page)
 {
+	if (PageHuge(page))
+		page = compound_head(page);
+
 	if (test_bit(PG_dcache_clean, &page->flags))
 		clear_bit(PG_dcache_clean, &page->flags);
 }
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 7c9f97fa3938..ca35807cf185 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -82,6 +82,9 @@ void flush_icache_pte(pte_t pte)
 {
 	struct page *page = pte_page(pte);
 
+	if (PageHuge(page))
+		page = compound_head(page);
+
 	if (!test_bit(PG_dcache_clean, &page->flags)) {
 		flush_icache_all();
 		set_bit(PG_dcache_clean, &page->flags);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
