Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C970FC61D97
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYnV1DSVrL2cqE8XR8wlF3/QtMDANXFPNVIER76J1fI=; b=dSvO1CSoBxuwtE
	44n5i7XZ8IgaPz035G20AKk0sHGKXmqXcpsS6T6FfB6sNwkkEqlzLJK9DrABPo/6eml1/J9A3Gvso
	8AXs4vlVSOLjPoqTg3Yvyxf6f9+k8JoFiIb9IpGK7hBZB3g3QYKN9bNAZiRt5CFNXheu04lIiu0gs
	aaMySMJqX5HCE111kc/extYCIR+HJWTJtt0SNTukZLPlHlMKw0X5zKFL6eipBXFgdw3001JDu5doO
	6bdNNCY+0vRuQD0YjOPzNiAd901FbthsMob3w8XmfiDzoC1sYiXW7n+uTjW2ONZWBVidtee+ZM/sq
	kOxCgXVkt6Z/eAjbiA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eZ-003xE3-1u;
	Thu, 23 Nov 2023 06:57:35 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eW-003xCV-2i
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:57:34 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b84402923fso329219b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722651; x=1701327451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WCHkg8EwYgV8K7NhoHBdWRiWjVGGiMNhMP8Dvq/T3c=;
        b=MnLAIqbAb0iZvNvD7tmygn81i3W04X7qiKNvcbWD4WH5dSzaT/XqPA9RJ2aj91zEiB
         NKnSXYslBS7WFZq0ls7hDW1NcxDnKFGz5mTJZf+nN5YqKjLQFFnwJGdjpSQSS5hhTzyN
         onH9e9hrV5yo2zXKPuzmE5v4SPsWmxNf6KWPK6FJbR3/bqT9lL1AaVEEtsK9ru9e8YyD
         crxIDUFlJWZt3EvNlIjqPMkymBucpjtygBwBhjh2uDK8sAycT+i7fG/o/AxBHVnI1l91
         1xyOtW+76mIQh/T1rYnPlASEPkLSN4NWzH7akTSdM+e/pDbLca4BHKG0bQT1XPcWIeh6
         JfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722651; x=1701327451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WCHkg8EwYgV8K7NhoHBdWRiWjVGGiMNhMP8Dvq/T3c=;
        b=fmZSVOILLMLrEjvTfdXMSwiJtJZ697TXpLlNSlkKR5RH53GI7gl+Yo8vzK6tMYN/Y0
         hWx6gYliJuHXnhsQOEJf/3cEGqZph5vKbpBn08GtgBnHzszwHtqunJuiTsaA2MOXswjd
         hQCQxurWncImplPtcui6CRGDAUC+ps/+jLbMSw9UZEWk6tqTKBgZJ7egt7FrB41jj6nL
         hVr6dpL1VJhG1nlC73NtpPJYl+GRwq66gRg4iJCgt7+T/DGK++xu6WFfzBrW/BFMdsuJ
         NeBgabliYCXOUIAuD8PVQIATfwTEG7t7gjRh2BS2ZweUAf1ZGgEV98B1QAZrD0gDyfzz
         AtIw==
X-Gm-Message-State: AOJu0Yy5/LJ3LLtUDyzCXZXxhjW3Jn0L2+7kqDPVr511lvYLI1C27S/P
	xxEeJiIHky+Q9mhFj6JMSF2UtA==
X-Google-Smtp-Source: AGHT+IF+JUV2qs3GxZcMJ8mDN8tfMhVpkCkyXhPxn9II1VI5nQr9SgqkEEhOwu5qk/0BmZa46AiHEg==
X-Received: by 2002:a05:6808:2096:b0:3b2:e461:bcfc with SMTP id s22-20020a056808209600b003b2e461bcfcmr5671424oiw.20.1700722651004;
        Wed, 22 Nov 2023 22:57:31 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:30 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 01/11] mm: Fix misused APIs on huge pte
Date: Thu, 23 Nov 2023 14:56:58 +0800
Message-Id: <20231123065708.91345-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225732_885709_ED57477A 
X-CRM114-Status: GOOD (  12.05  )
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

There exist some paths that try to get value of huge pte via normal
pte API ptep_get instead of huge pte API huge_ptep_get. This commit
corrects these misused APIs.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/hugetlbpage.c   |  2 +-
 fs/proc/task_mmu.c            |  2 +-
 include/asm-generic/hugetlb.h |  7 +++++++
 mm/hugetlb.c                  |  2 +-
 mm/migrate.c                  |  5 ++++-
 mm/mprotect.c                 |  2 +-
 mm/rmap.c                     | 10 ++++++++--
 mm/vmalloc.c                  |  3 ++-
 8 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index b52f0210481f..d7cf8e2d3c5b 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -74,7 +74,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 
 out:
 	if (pte) {
-		pte_t pteval = ptep_get_lockless(pte);
+		pte_t pteval = huge_ptep_get_lockless(pte);
 
 		WARN_ON_ONCE(pte_present(pteval) && !pte_huge(pteval));
 	}
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index ef2eb12906da..0fe9d23aa062 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -726,7 +726,7 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 	struct mem_size_stats *mss = walk->private;
 	struct vm_area_struct *vma = walk->vma;
 	struct page *page = NULL;
-	pte_t ptent = ptep_get(pte);
+	pte_t ptent = huge_ptep_get(pte);
 
 	if (pte_present(ptent)) {
 		page = vm_normal_page(vma, addr, ptent);
diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 6dcf4d576970..52c299db971a 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -150,6 +150,13 @@ static inline pte_t huge_ptep_get(pte_t *ptep)
 }
 #endif
 
+#ifndef __HAVE_ARCH_HUGE_PTEP_GET_LOCKLESS
+static inline pte_t huge_ptep_get_lockless(pte_t *ptep)
+{
+	return huge_ptep_get(ptep);
+}
+#endif
+
 #ifndef __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED
 static inline bool gigantic_page_runtime_supported(void)
 {
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1169ef2f2176..9f773eb95b3b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7406,7 +7406,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	}
 
 	if (pte) {
-		pte_t pteval = ptep_get_lockless(pte);
+		pte_t pteval = huge_ptep_get_lockless(pte);
 
 		BUG_ON(pte_present(pteval) && !pte_huge(pteval));
 	}
diff --git a/mm/migrate.c b/mm/migrate.c
index 35a88334bb3c..d0daf58e486e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -210,7 +210,10 @@ static bool remove_migration_pte(struct folio *folio,
 
 		folio_get(folio);
 		pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
-		old_pte = ptep_get(pvmw.pte);
+		if (folio_test_hugetlb(folio))
+			old_pte = huge_ptep_get(pvmw.pte);
+		else
+			old_pte = ptep_get(pvmw.pte);
 		if (pte_swp_soft_dirty(old_pte))
 			pte = pte_mksoft_dirty(pte);
 
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 81991102f785..b9129c03f451 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -555,7 +555,7 @@ static int prot_none_hugetlb_entry(pte_t *pte, unsigned long hmask,
 				   unsigned long addr, unsigned long next,
 				   struct mm_walk *walk)
 {
-	return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
+	return pfn_modify_allowed(pte_pfn(huge_ptep_get(pte)),
 				  *(pgprot_t *)(walk->private)) ?
 		0 : -EACCES;
 }
diff --git a/mm/rmap.c b/mm/rmap.c
index 7a27a2b41802..d93c6dabbdf4 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1577,7 +1577,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			break;
 		}
 
-		pfn = pte_pfn(ptep_get(pvmw.pte));
+		if (folio_test_hugetlb(folio))
+			pfn = pte_pfn(huge_ptep_get(pvmw.pte));
+		else
+			pfn = pte_pfn(ptep_get(pvmw.pte));
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
 		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
@@ -1931,7 +1934,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		pfn = pte_pfn(ptep_get(pvmw.pte));
+		if (folio_test_hugetlb(folio))
+			pfn = pte_pfn(huge_ptep_get(pvmw.pte));
+		else
+			pfn = pte_pfn(ptep_get(pvmw.pte));
 
 		if (folio_is_zone_device(folio)) {
 			/*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d12a17fc0c17..1a451b82a7ac 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -103,7 +103,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	if (!pte)
 		return -ENOMEM;
 	do {
-		BUG_ON(!pte_none(ptep_get(pte)));
 
 #ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
@@ -111,11 +110,13 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			pte_t entry = pfn_pte(pfn, prot);
 
 			entry = arch_make_huge_pte(entry, ilog2(size), 0);
+			BUG_ON(!pte_none(huge_ptep_get(pte)));
 			set_huge_pte_at(&init_mm, addr, pte, entry, size);
 			pfn += PFN_DOWN(size);
 			continue;
 		}
 #endif
+		BUG_ON(!pte_none(ptep_get(pte)));
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
