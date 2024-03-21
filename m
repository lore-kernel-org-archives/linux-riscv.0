Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B283BC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zRtEJgxO8NhcOg0nUQCG2u22McfYixTePQ8lG2IURA=; b=C9klOSg7L4PFmb
	S6XQwo3UkO6OvmUsLhCHc/kjTUULtygTkw6ZYo06MCY5A3mFlxqWeeBUT2uJPaBYtoIKc2ZMfQDaG
	1NrK22UNkxAgx3g7Gq/wIp8+7RgPn78aM4uo0dYbdUZZlEvfPyvk+gtHBb1UsviHH6hvGTsAnTjJi
	Ro8vs+dGw5mU955cekHt0QDqTy3N7OWD0EtAzbUo1DFD/7OmPBNUNjg5HfE4H2vZK2dK5TWSfTazz
	j1eik8Sh4rgQU6b4vXgy6RtlDG9wH0TJp+Fh37uCyyZPf1SoxjwUMxFbZPuq4b6DeMeqsVGdfIrnn
	JwQABeXCD6tsshLlMQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQcX-00000004s64-0cCC;
	Thu, 21 Mar 2024 22:10:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaR-00000004qar-1Zr1
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Mar 2024 22:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=; b=A+cIGCzHtLhFNB06Zk3hjO6Ru4
	xC+aJU1/pkzvY8l+B4/1HlF1dByNpMvHU8rBLNvvOk6tWJBDF6KbU4kUj0twTgkT5n2yTViUCOFBD
	LWrkLRN0GMiA+cossHx6RLBa66ePdFFm4ZddZdzWwhm50118/H/+40CriyNOENPx9/JBns+qke0K6
	DQa99AiTb1oGCXWP8B5NHtpu8OJn0FMuc3baWulgI6w8ETN9yyHt0Ejnc61JKKRXdtFPuKYo7L7hh
	Zw6MZl8VCfjnsRan10UYmKjD27l81pJFNDjvOFVnJHYpxNo69MtfpoZPPEB666GWUbrKWM600oUHK
	+mQrO3eg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaL-0000000ESZe-3NFx
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=;
	b=YulDxqZlYF8zbWj7Gm5KUiqaWX5R3raWvsWRr3q8DryctAdcJmFpon0eVYsia5gxrR1UUN
	P1aZ/6mdwgqVZ4oinMlmNsuqZbBO7Zo+HMKbtXkOQDlVlWIHXMXW0T4Sw8zpQdcQJ3bV5k
	05+o4svLKyVKvyx+BPZyH37C0fVJVkc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=;
	b=hB4+bvBNOg9naYc25t9fXECr0IEmJ1v/tdJ54roV7oq+7hRL2LFS6zyNOG/9q0tfZHUZAJ
	xxj7d+Hss6T3Jmyncrd3dP/naobb7ELqmMNdxt9+zeANP2Zned/3GRzziONicJ2bhIzsPl
	sjysMEO4CA6sU2kdOtFPaWjxhInum/w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-PLP8cqoKMwy526o-9Np_ng-1; Thu, 21 Mar 2024 18:08:23 -0400
X-MC-Unique: PLP8cqoKMwy526o-9Np_ng-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-690d3f5af86so3057176d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058903; x=1711663703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=;
        b=icX+lNbpHAr5B19HHFAdhmb48vKNzxmNNaBBmO6XrqREOeHSDLg0x29uqEdQ4me9Q5
         tvEUI/eHG2XfyGYwr4KutT5vvqhvJgL50O35WFeMlT11pSd7FNDp8jjwPnD+wpyRKgps
         aU79Lv1WJWOad4cheWSmbVYQi48aQ6g3S0l57zJl1dgEna9pBKPnDAMtJsXuVSC14mUk
         OvhSA+o2N/YZY/V7Yb4l65TsUo7Mb1DiLi30tDyeUMSPak8DsWgoA/BD7aUsWudcOn6F
         nJZLjW4SkA4B1OqoVqwUsWYsmGyUECc0TvZa/XI6522hwye129UHyXjaDM5WIpEVFbT1
         xKGw==
X-Forwarded-Encrypted: i=1; AJvYcCXML5qBqOITozxgdIxwSDLlcHu24KjGkGCHWLjU5uIGdlFRcQYtTyM5fi4Fi5hUWe/5FRo+HdnMay1SCubQw5rESXxZSibOaHGE19ue5ObK
X-Gm-Message-State: AOJu0Yxfm/bmm8dayZn87/cxYANQ9DDnVwCBb/y2C+W/e7m2fUxWjPdb
	qWLMLVyNm0zYkhQVaCZvrC3edtvrCYwg4TEPA9UpeqYexzDRzOUcnQGznzINkh2W2ZrE5KWpQi1
	GygUhpiRnDWHpfccwchUHi1+oWBYmxX0eRd4q583iobydnfbsOKnpgFhiAWOL+x9hZw==
X-Received: by 2002:a05:6214:4403:b0:690:b47e:60e3 with SMTP id oj3-20020a056214440300b00690b47e60e3mr171649qvb.5.1711058902748;
        Thu, 21 Mar 2024 15:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFefVkn71VpIW4uNQ3LlUv67q0iftDvBfI3myHkSibZanv1/17GTXunJ1XxyTP0oQ7cl/tpbA==
X-Received: by 2002:a05:6214:4403:b0:690:b47e:60e3 with SMTP id oj3-20020a056214440300b00690b47e60e3mr171615qvb.5.1711058902326;
        Thu, 21 Mar 2024 15:08:22 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:21 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	peterx@redhat.com,
	Yang Shi <shy828301@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH v3 09/12] mm/gup: Handle huge pud for follow_pud_mask()
Date: Thu, 21 Mar 2024 18:07:59 -0400
Message-ID: <20240321220802.679544-10-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_220830_568056_B78A187E 
X-CRM114-Status: GOOD (  24.14  )
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

From: Peter Xu <peterx@redhat.com>

Teach follow_pud_mask() to be able to handle normal PUD pages like hugetlb.

Rename follow_devmap_pud() to follow_huge_pud() so that it can process
either huge devmap or hugetlb. Move it out of TRANSPARENT_HUGEPAGE_PUD and
and huge_memory.c (which relies on CONFIG_THP).  Switch to pud_leaf() to
detect both cases in the slow gup.

In the new follow_huge_pud(), taking care of possible CoR for hugetlb if
necessary.  touch_pud() needs to be moved out of huge_memory.c to be
accessable from gup.c even if !THP.

Since at it, optimize the non-present check by adding a pud_present() early
check before taking the pgtable lock, failing the follow_page() early if
PUD is not present: that is required by both devmap or hugetlb.  Use
pud_huge() to also cover the pud_devmap() case.

One more trivial thing to mention is, introduce "pud_t pud" in the code
paths along the way, so the code doesn't dereference *pudp multiple time.
Not only because that looks less straightforward, but also because if the
dereference really happened, it's not clear whether there can be race to
see different *pudp values when it's being modified at the same time.

Setting ctx->page_mask properly for a PUD entry.  As a side effect, this
patch should also be able to optimize devmap GUP on PUD to be able to jump
over the whole PUD range, but not yet verified.  Hugetlb already can do so
prior to this patch.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h |  8 -----
 mm/gup.c                | 70 +++++++++++++++++++++++++++++++++++++++--
 mm/huge_memory.c        | 47 ++-------------------------
 mm/internal.h           |  2 ++
 4 files changed, 71 insertions(+), 56 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 3bcdfc7e5d57..39195f7c5269 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -346,8 +346,6 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, int flags, struct dev_pagemap **pgmap);
-struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, int flags, struct dev_pagemap **pgmap);
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
@@ -504,12 +502,6 @@ static inline struct page *follow_devmap_pmd(struct vm_area_struct *vma,
 	return NULL;
 }
 
-static inline struct page *follow_devmap_pud(struct vm_area_struct *vma,
-	unsigned long addr, pud_t *pud, int flags, struct dev_pagemap **pgmap)
-{
-	return NULL;
-}
-
 static inline bool thp_migration_supported(void)
 {
 	return false;
diff --git a/mm/gup.c b/mm/gup.c
index a338944e4425..ae21afb9434e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -525,6 +525,70 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
+static struct page *follow_huge_pud(struct vm_area_struct *vma,
+				    unsigned long addr, pud_t *pudp,
+				    int flags, struct follow_page_context *ctx)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
+	pud_t pud = *pudp;
+	unsigned long pfn = pud_pfn(pud);
+	int ret;
+
+	assert_spin_locked(pud_lockptr(mm, pudp));
+
+	if ((flags & FOLL_WRITE) && !pud_write(pud))
+		return NULL;
+
+	if (!pud_present(pud))
+		return NULL;
+
+	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
+
+	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
+	    pud_devmap(pud)) {
+		/*
+		 * device mapped pages can only be returned if the caller
+		 * will manage the page reference count.
+		 *
+		 * At least one of FOLL_GET | FOLL_PIN must be set, so
+		 * assert that here:
+		 */
+		if (!(flags & (FOLL_GET | FOLL_PIN)))
+			return ERR_PTR(-EEXIST);
+
+		if (flags & FOLL_TOUCH)
+			touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
+
+		ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
+		if (!ctx->pgmap)
+			return ERR_PTR(-EFAULT);
+	}
+
+	page = pfn_to_page(pfn);
+
+	if (!pud_devmap(pud) && !pud_write(pud) &&
+	    gup_must_unshare(vma, flags, page))
+		return ERR_PTR(-EMLINK);
+
+	ret = try_grab_page(page, flags);
+	if (ret)
+		page = ERR_PTR(ret);
+	else
+		ctx->page_mask = HPAGE_PUD_NR - 1;
+
+	return page;
+}
+#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
+static struct page *follow_huge_pud(struct vm_area_struct *vma,
+				    unsigned long addr, pud_t *pudp,
+				    int flags, struct follow_page_context *ctx)
+{
+	return NULL;
+}
+#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
+
 static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
 		pte_t *pte, unsigned int flags)
 {
@@ -760,11 +824,11 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 
 	pudp = pud_offset(p4dp, address);
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud))
+	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
-	if (pud_devmap(pud)) {
+	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
-		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
+		page = follow_huge_pud(vma, address, pudp, flags, ctx);
 		spin_unlock(ptl);
 		if (page)
 			return page;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index c77cedf45f3a..f8bd2012bc27 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1363,8 +1363,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 }
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
-		      pud_t *pud, bool write)
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write)
 {
 	pud_t _pud;
 
@@ -1376,49 +1376,6 @@ static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 		update_mmu_cache_pud(vma, addr, pud);
 }
 
-struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, int flags, struct dev_pagemap **pgmap)
-{
-	unsigned long pfn = pud_pfn(*pud);
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
-	int ret;
-
-	assert_spin_locked(pud_lockptr(mm, pud));
-
-	if (flags & FOLL_WRITE && !pud_write(*pud))
-		return NULL;
-
-	if (pud_present(*pud) && pud_devmap(*pud))
-		/* pass */;
-	else
-		return NULL;
-
-	if (flags & FOLL_TOUCH)
-		touch_pud(vma, addr, pud, flags & FOLL_WRITE);
-
-	/*
-	 * device mapped pages can only be returned if the
-	 * caller will manage the page reference count.
-	 *
-	 * At least one of FOLL_GET | FOLL_PIN must be set, so assert that here:
-	 */
-	if (!(flags & (FOLL_GET | FOLL_PIN)))
-		return ERR_PTR(-EEXIST);
-
-	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
-	*pgmap = get_dev_pagemap(pfn, *pgmap);
-	if (!*pgmap)
-		return ERR_PTR(-EFAULT);
-	page = pfn_to_page(pfn);
-
-	ret = try_grab_page(page, flags);
-	if (ret)
-		page = ERR_PTR(ret);
-
-	return page;
-}
-
 int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
 		  struct vm_area_struct *vma)
diff --git a/mm/internal.h b/mm/internal.h
index f8b31234c130..63e4f6e001be 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1102,6 +1102,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
 /*
  * mm/huge_memory.c
  */
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write);
 struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
 				   unsigned long addr, pmd_t *pmd,
 				   unsigned int flags);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
