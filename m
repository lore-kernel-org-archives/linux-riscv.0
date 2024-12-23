Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F8E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wGat9EQBcoYGkP0FZK1ZUuXT06ndFR5T/zBS6zQ7EE=; b=AErQR36PxiWj6r
	opZGnPIu9NGtWE3dYWCYPhh8/VCqImhCwO35KUhQyGa+rQfy24o5OMtUYg7uFUoVCxXCDdr21ugDU
	hUkEMFvsNMIq5WMn/rjmZvG6Fmpu+nEdV9Z7E964yAS3H/FEpE7AG3IEi79YvnlILht0eJOzPbpNP
	QHfyY9BIx5pQTjzzmSBs+d1wRj+ahHta67u5MW0Y06RLhyMGFHDyuEM5e+/grhx8RcBzj970O+Tnb
	fnkyNEBEBT7z4O8bi6rIcCESlTvMbrnxps7ArtxAqZkhv+T2GElk5BjyTMDptY5kRX8G1WTb7cSoV
	0s1JrEItL+7ECZe6up7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfGA-00000009kZp-2D0l;
	Mon, 23 Dec 2024 10:01:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf1Y-00000009huc-1Gmm
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Dec 2024 09:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=; b=oMg8rIs3MyoHBzFX/LyMFRSZFb
	ZFLwwFV2I7KkG54Rr1Gfktl1NSOy1TQrdz2zhblYHfq21hmZORw8vz/eX6x4BJDRfezU4G7T9Bnlg
	y37G6cG/BDVnu4t0lyDa/ZC4wAq+AK46xA7cyx58mNQvyY+evKFlqIQKZmRIJGQtnEe9P4ElHjLg/
	s4dEZsBlfJslzO8lK1aABGRnVlp6L/p8L1qgC+62wPhuT2iHEDxzgQAotMmjvQLfup8EtcPfXl5NF
	CLN38OAGn8D0wk1wrDqOZRtVIHkORL9fy17SmGyw0XUIBfn66Qe4rzlzSx5IXIGVBtWriaYtbg12d
	9cBOC0og==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf1V-00000006J30-0ie5
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:46:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725ed193c9eso3397022b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947200; x=1735552000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
        b=dWHNm1fTC93qpo09q3RNXZsq9eLA2tvIe04O6rsuA0e7WL8Vw8wY/D2DCJkVz1BO3S
         ++Uvx2GyRgkN8k68dWAx9tPXO1lGU3ZttjXoEOF3nPOyqsJJW3LGAR+kAC4xAPvkHlhY
         GI8GW7HKNdxlc8I1A4iRnhxSmSn2PaMe4AgUaed97R0eXEQRoxNTdqAlQOL+wFIQo87t
         /jhxUu/wewlWqDi6pArvsDpAjxopyZH9n2KKKsh9n72c60W5ScmRywDJ0dc0XIwP/5Y3
         6IFJ54sTcQPbszozMeyTGwSsuR182X3HqEunzg8nuhgpSYTlETxwz3kvUnxAn98eUXgn
         e15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947200; x=1735552000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
        b=CJUnWPcQn9VoERZYSKNMjk2/0d1KjKz+Srs17fbd1lltVZbK3Mi5teUb7JZzViiMoq
         HyYO3TFhbv/PW7bzIPODRxNUzmfO68Kzk6BqNtYA1hDYIYLDTtZS6a/+VTjheJH+2KW8
         57TU4NhT6pQTjSHMukjwm1rMz3RRXP/7Z3BAqi/ESMC4xhs3am2GsZPRBp1tv+JxxDyO
         ZrA/RIph0XMq6/3kc7bn8d3yq5Bv5WkFfTzm8BFEK5YDywdFDwDxBZWJ5UqvkknK9jmU
         Dlvdk25f2ZNu3V3P3p9hTssHcyl6XHPEgTZMfe4tMIU7sV7zJcfArugK/ARhmogMbYLR
         Kqkg==
X-Forwarded-Encrypted: i=1; AJvYcCUtkjw8mH0r/R1SeiqvYdrfHb2kiTCVQu9arQ2VM2a+Gu/MPkhqldZHpmFUcXbK+f4t3aPkrM/7CmHzpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHSIhUb9ndcHvnId0yCVAv+EkF7KIMeMdxa1vbTMR5sUyYv4Fk
	ljX+5SpvzVUFzeZJwKlH2Xq8KsH0gDnVsvK+M/7ydgvB5X62EHWNvC1MLmHGzxo=
X-Gm-Gg: ASbGncsmDZj8yYVcBgQqmY+JB1ZfMGTca/QZ2bfM8OQXTw2gvBOY1xR3B0udZhpwuCh
	P/WVfsD112VKyLtdR9iBxQkvtBQv4cG5bZqrveUB7/T6IS6oIvu9O7rHzEXtd42xnwMlZt/tgFQ
	GVnbuJNRQL/BVJjcb9t+7T9YcT7rzZgBbHvBwvTg9/F2SNSHDb59iEzWJixmn7gHvpkpM89uuYP
	B5gVOmKoRb7rDcM+bDy9oQ0t3ZsV9eH96X8M7ksSQ8nzCmqW5VFDL4ffwcK3UFGDKjN9/wHECYv
	It5CUAksX1zruW6JGzlQLg==
X-Google-Smtp-Source: AGHT+IHTlP+hesMysY/dnyw4k1T/aSGpJ0FSxzWG+ektln9VxnC2FaHlf9zeRwOgabkwOIXU2HSkPg==
X-Received: by 2002:a05:6a00:2407:b0:729:597:4faa with SMTP id d2e1a72fcca58-72abde9c004mr15027146b3a.16.1734947200520;
        Mon, 23 Dec 2024 01:46:40 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:40 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 17/17] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Mon, 23 Dec 2024 17:41:03 +0800
Message-Id: <3ade33c5049f465dc2f0b95edc2d68c80f2048c9.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_094649_327762_A315B356 
X-CRM114-Status: GOOD (  10.83  )
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

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 actually does the same
thing, so let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/s390/mm/pgalloc.c        | 18 ++++++------------
 include/asm-generic/pgalloc.h | 23 ++++-------------------
 include/asm-generic/tlb.h     |  5 +----
 include/linux/mm.h            |  8 ++++++++
 4 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..1e0727be48eaf 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,32 +180,26 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(table);
+	struct page *page = virt_to_page(table);
 
-	pagetable_dtor_free(ptdesc);
+	pagetable_dtor_free(page);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void pte_free_now(struct rcu_head *head)
 {
-	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	struct page *page = container_of(head, struct page, rcu_head);
 
-	pagetable_dtor_free(ptdesc);
+	pagetable_dtor_free(page);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
+	struct page *page = virt_to_page(pgtable);
 
-	call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
+	call_rcu(&page->rcu_head, pte_free_now);
 	/*
 	 * THPs are not allowed for KVM guests. Warn if pgste ever reaches here.
 	 * Turn to the generic pte_free_defer() version once gmap is removed.
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..7d327889df306 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -107,10 +107,7 @@ static inline pgtable_t pte_alloc_one_noprof(struct mm_struct *mm)
  */
 static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte_page);
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(pte_page);
 }
 
 
@@ -150,11 +147,7 @@ static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 #ifndef __HAVE_ARCH_PMD_FREE
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(pmd));
 }
 #endif
 
@@ -199,11 +192,7 @@ static inline pud_t *pud_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(pud));
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -245,11 +234,7 @@ static inline p4d_t *p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(p4d));
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 583e95568f52b..ef25169523602 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -211,10 +211,7 @@ struct mmu_table_batch {
 #ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
 static inline void __tlb_remove_table(void *table)
 {
-	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(table);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..cd078d51f47c7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,14 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(void *table)
+{
+	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
