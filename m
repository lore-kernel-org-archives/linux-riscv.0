Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B54EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 03:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeGTw6rPSnMuXvmISxz6dDbmbGAO7u/Y6KPRFOw4A2w=; b=kI7VUWGlSzn1Rq
	Z+l/nGD8kyyfh58Vx5VSIpjCEnHU4MZ7ddk4znfV+BKyJNHhRCg9JS0hX2/lw1mUW2iREvy0aR0wa
	ltkdIWq544Fec1e6Mc6VVx5B/Wqh0qUXK3ghI0U8D/8dt1wNJ7X36S4/P2fz+aMjoiDkQIZ2dBkY4
	8L2hTh7cxB/M+Irj+Eg2GlXid1w96wsEgM1hAAj2GY/5PccpLu6dxuhxe0nKVtqqZo4TXpqK0HsGl
	104biimLncozaFYYzPNZFuna9aT0+qfnGhpPQk8qZ6+Km5XII5xwkwYVcqug6nEFlcwZN3UfFyuOj
	UfCkS9S9F8gNYqAyNYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDzBl-00BWUE-0l;
	Tue, 27 Jun 2023 03:16:21 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDzAq-00BVUC-2b;
	Tue, 27 Jun 2023 03:15:26 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-57026f4bccaso42387557b3.2;
        Mon, 26 Jun 2023 20:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835722; x=1690427722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Q71kHk0zB6vt5ahL9ZHs7069+SCA/PofhBzVdlAuY=;
        b=dOSQZ2OiXRbn7dKMKT1JXAgsN/C3jxCnB5LBHCK9iXILo1l4gDWq1J3cX5+exLYTxn
         wYoORsV8t6fPDceGwULdTPoZYpfiYfI04T4bOuvjwcHJfivuVIRVY0M+R3Uhc5iOpVeL
         0vND8iKDAhmvYQiXoqAJRaFlNkMa3Bk4ZwjVbqbFjHFv+wwgHdDhUknddaUHcnd7Lv+F
         XfvU3AUvFbk/B6hNpVu5vRnlx39aUpFS25FcgH8ICpzs8p4la51sSmvC+1TP3EUm2inI
         tzhySMFhH/VY7MUDkzq18xgDM3Cn6KetwRARgLmNOPJ/2w0oaiVuiWvL7GVUeKg27bSV
         B58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835722; x=1690427722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Q71kHk0zB6vt5ahL9ZHs7069+SCA/PofhBzVdlAuY=;
        b=IBWh5l1yubFWXCHk6JFbrITmm5a9r3n+mTSEjxm1BbjwWJPnz+o8eS11tFCw95zwie
         GAPx1ZwMTGqfryZfVOJy7Z/RmnGQAeEXBSqrZH4OJyUDa+UTswiuy9cMV1VLgm5W438/
         ekwhQG6o8vaEPzScmdvxafg44X2EZVtVNW0EbaAS0bx9P4CLALPICnI8S/p3gdS9/0QB
         IilSOuMvPucW4LR+fg2urJVQm1RRsR+cVNFMQ+ySB5//E8aMYyGXa6Ek8GJ81qo57b7P
         T2BicNwG3sageXVVjUxmqy0YeKRMF7scfYEfARo2qKDZ5DryETg5vGnjJUQQ6E4Fr7SX
         MUyg==
X-Gm-Message-State: AC+VfDxmK9pvv7T71mIS6EXkrLd6INXiXTbzipdMwcKYbIVDj+uEgvQ5
	NRQ/WTJrcs9Ej7lAhtgWRhk=
X-Google-Smtp-Source: ACHHUZ5sPmbirZ+Hp/U6Mh5uEO5OmHRgtgjjLF/hS5R/U+jD4/eUdYkFVTE6CQ/xsnAMAlWUQublhg==
X-Received: by 2002:a0d:ea89:0:b0:56c:e4b1:19f6 with SMTP id t131-20020a0dea89000000b0056ce4b119f6mr32348296ywe.44.1687835722632;
        Mon, 26 Jun 2023 20:15:22 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:22 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v6 07/33] mm: Convert ptlock_ptr() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:05 -0700
Message-Id: <20230627031431.29653-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_201524_876832_287A1E82 
X-CRM114-Status: GOOD (  11.76  )
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/x86/xen/mmu_pv.c |  2 +-
 include/linux/mm.h    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e0a975165de7..8796ec310483 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -667,7 +667,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 	spinlock_t *ptl = NULL;
 
 #if USE_SPLIT_PTE_PTLOCKS
-	ptl = ptlock_ptr(page);
+	ptl = ptlock_ptr(page_ptdesc(page));
 	spin_lock_nest_lock(ptl, &mm->page_table_lock);
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 39b0a4661e44..0b230d5d229a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2801,9 +2801,9 @@ void __init ptlock_cache_init(void);
 bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return page->ptl;
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
@@ -2819,15 +2819,15 @@ static inline void ptlock_free(struct page *page)
 {
 }
 
-static inline spinlock_t *ptlock_ptr(struct page *page)
+static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &page->ptl;
+	return &ptdesc->ptl;
 }
 #endif /* ALLOC_SPLIT_PTLOCKS */
 
 static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_page(*pmd));
+	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
 }
 
 static inline bool ptlock_init(struct page *page)
@@ -2842,7 +2842,7 @@ static inline bool ptlock_init(struct page *page)
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
 	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
-	spin_lock_init(ptlock_ptr(page));
+	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
 	return true;
 }
 
@@ -2923,7 +2923,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
+	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
