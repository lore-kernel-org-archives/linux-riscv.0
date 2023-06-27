Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D8EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 03:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qchKoB4u705S9a8ND8v/Hyl0dRRbjqvmSTGBLeB2Kiw=; b=fZRezSs2zCrlNB
	r6UMZgtnE5mMW1Zr0YgJblxJEY+2yHP0TcwjEH6Vz/vDqGt8cadlSBRk952fScNBEjWAk8y3DdY9T
	7C0N9owKECQeqKpx5NrSS3hIXM16F0X98S9SWHCE8qPUYhWISla2qmIaW25zArXkzkZcRD92WOD+c
	+BeNMgB0L0SYvao95V8lL8ZHqmbXNze2c3ZNHUyID04jJZPITcq1QxnPnzvY8P325BvWnS11Q/EJL
	Fs11SG8IL76lokwZThVP2vxnpG1ypn/vXgiZFVk8tKRh0paaK7wPalhDe4OVrOqSl3DKe+u+xgIYH
	T7O5S9zR5BK/o9nmq4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDzCQ-00BX5N-0u;
	Tue, 27 Jun 2023 03:17:02 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDzAz-00BVeQ-2u;
	Tue, 27 Jun 2023 03:15:36 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-57338656a8aso30875577b3.0;
        Mon, 26 Jun 2023 20:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835733; x=1690427733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnNdr5PDFTKJu1h5zX1p1xVUKJvhUfKvVUh/w7ZbrdI=;
        b=GTe2EUys5qOsmL9h+39HkmdbRnOOR/ecm3IZWO97nmipqYf9WxPQOFqim+diknH7FN
         cktZXimy2BTWcqn/5d10bb15uuq3PUdsia+9j36BiOqVzXj30Geeor6rYSL1Rhj9WqCn
         LmJ9N5OLeEYa/H4vUyKvc7Otfz8SqaPNrXVtQODdE9ilutCJ24KAZJChe9ZmvWB1bUx1
         7bpUWrAZkpPXIiT5JcrWxhsn1qZ9K0WItSWhparWMs+/rm9Q3PdTkYO+KF0D1GfwN1hv
         0eQBee2svyGNdGSpwEO15WqpXr0WlpHBW3JMLWAP0NGZGcgLzbwqXYAJu19e1eeZo9JE
         G7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835733; x=1690427733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnNdr5PDFTKJu1h5zX1p1xVUKJvhUfKvVUh/w7ZbrdI=;
        b=Jsr319zuOkfDGIMadT7j0B0YFU/3t1bcm2OdkjgVsjDh2EdLib3eZqpGd3jemXvKZr
         G5OJ8t5RmDxIkoY7Dn4RotjN6/uZV2vMs1SbDCDkYNiWGpf0wy9PikS4kJliI6ZiyQlX
         5CotfA2fFPq8WPnFttKnmLXJ0lHeJLP+q2PM2QZZIjdzYqbpMtIFemwxkVcpWo3f0B5+
         TqHLOHmvFbtyldcGMcJUyOUxmlLFk1w7uMdlcafZzjXRx75aXnwO8ebwtLdCe33VqF0G
         LSxgcYVUgFsSZkSm4Lt9pFdf7CtUztW/qBqaiMrLtAHvIyJkv14xlRQwfpI6h6Hs9mbD
         bokQ==
X-Gm-Message-State: AC+VfDwYklkTWir943H/m21RWZvGkthfg+wTPyT2zfqSf8qHzkkgSnzg
	QPGIEFGmQZuep4rWV/1Iuso=
X-Google-Smtp-Source: ACHHUZ42Y/0xAZG9OHSM8VrbwgLQ6VZ3weOziZPodRcVkI1essgSTHJwJyadoUyqzcMtcD2kr7P2zg==
X-Received: by 2002:a0d:e005:0:b0:573:4d89:ecb5 with SMTP id j5-20020a0de005000000b005734d89ecb5mr19780303ywe.39.1687835732948;
        Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
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
Subject: [PATCH v6 12/33] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
Date: Mon, 26 Jun 2023 20:14:10 -0700
Message-Id: <20230627031431.29653-13-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_201533_969159_F7A82463 
X-CRM114-Status: UNSURE (   9.84  )
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

Create pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
and pagetable_pmd_dtor() and make the original pgtable
constructor/destructors wrappers.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 69e6d6696c44..356e79984cf9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2859,20 +2859,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* USE_SPLIT_PTE_PTLOCKS */
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
+static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
-	if (!ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pte_page_ctor(struct page *page)
+{
+	return pagetable_pte_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pte_page_dtor(struct page *page)
 {
-	ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pte_dtor(page_ptdesc(page));
 }
 
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
@@ -2965,20 +2979,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 	return ptl;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(page_ptdesc(page)))
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	if (!pmd_ptlock_init(ptdesc))
 		return false;
-	__SetPageTable(page);
-	inc_lruvec_page_state(page, NR_PAGETABLE);
+	__folio_set_pgtable(folio);
+	lruvec_stat_add_folio(folio, NR_PAGETABLE);
 	return true;
 }
 
+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+	return pagetable_pmd_ctor(page_ptdesc(page));
+}
+
+static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
+{
+	struct folio *folio = ptdesc_folio(ptdesc);
+
+	pmd_ptlock_free(ptdesc);
+	__folio_clear_pgtable(folio);
+	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+}
+
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page_ptdesc(page));
-	__ClearPageTable(page);
-	dec_lruvec_page_state(page, NR_PAGETABLE);
+	pagetable_pmd_dtor(page_ptdesc(page));
 }
 
 /*
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
