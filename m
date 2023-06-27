Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF431C25B5F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 03:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUF1q5RL3IUUyahYXwI7IYAgr4Ht1fBFrBLX1nkH2Wg=; b=i8LprVOPz1GxDE
	uHNTF9duVwqCWNXVT7lTzLxvOvFHYWRmI6i+5hpuCll5Ts98/fVfVUazWUVai7kHrlVR2iT34TVd6
	Kf9Gj3PWUei3I3SCuWn8XkmFXpwVKJLzRoeUmgigqyH17T6ZYfJXQhkqZ3dBORHZz0SX5y3mumUmL
	CyhCPmYPp6KmYu2wM6ae40qrhcZcKIR2J0fsgS4dQ1eHAb79KvxK/VFBa7cQ5cRKqZIKVXLlqenr4
	f6XbZCeXzMEfJxM3hSiCE4mkfVnU1Ci2qSy7BriUAiwU9gC4gOoA+cdS4zOuGPSnnESvHwhbEX44a
	hUPQuInL+GLZICU+srPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDzBT-00BWAT-0c;
	Tue, 27 Jun 2023 03:16:03 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDzAn-00BVRs-31;
	Tue, 27 Jun 2023 03:15:24 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5701eaf0d04so39989287b3.2;
        Mon, 26 Jun 2023 20:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835720; x=1690427720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=GRJmT9zZCc6VZLx9VY+7Q8GbOsBn33lZq/FXBv0aXORmxRac0rj/lSqIwgsFHnmh66
         6cAHAx0KI5Lagl5OZRxl+lTWKC9rW3K7h91Q6uOR2njTfEcjIvHn1/QWkX3jlNssdRYv
         kPZ6iyIVFwiYJpTBLvXR9/yIre3tRTqt009ghcdse7E6cPjs19QO0aXvNJJOMDpClaY7
         t8HHPKKx/NAZrk3fhoJWolRioMxC3Zc40A+aLrsXlHiTMIf/9zaAkHOq7TYNlbv+VzGn
         jItTpyFNqlbWxSgJZgFIeDKcVXb95B0vXbDJ5HgCdgCt4hiGi9xgNTBoUpG/3ZX1ru9x
         fM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835720; x=1690427720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=DGWHEEgFCD7hZjQmI08PKQc+D1CY9nzTVxv4vrr4cRu7Im/pvaInNDbsmAjixca7aw
         YA3rzgyeIPDOfIIYGsX76LEbbXl8WyK3utuFuzujo0eDYZueTD7bnd/eqQYh5k/4Oewg
         Q7PAtfqfI9gAaE4y5X7Brzhb3OAKk92WS0SwCFLraLFJWN38W/oeBaLOaWOMHZepibXt
         OLXlcW/WyDV9Q7zuoASfWtiCn/q/oS3fo0RC4epuHs563oYwrwV4idVDkknqTKSWnvQB
         xjYLk5u4T+PrGAXvMnuY4NQyd63d6CR+5YSVSdcRoz2IVxcUhyz21DZgLapENVGUg07D
         qXjg==
X-Gm-Message-State: AC+VfDzlXSTwN0co6eePHh965NcwG7sNl93oFU7N/vtMusDn4oH8wVam
	bLSicXlbatJH2Up5BuG+NRo=
X-Google-Smtp-Source: ACHHUZ63yguTuEDNtqBAUu0oFztqBMiblJl9iKmWyGby1Nlfce/DGMkGkkGcggiUUjYXFR4C+z9ptA==
X-Received: by 2002:a0d:d78c:0:b0:56f:ff75:abcc with SMTP id z134-20020a0dd78c000000b0056fff75abccmr30306915ywd.29.1687835720566;
        Mon, 26 Jun 2023 20:15:20 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:20 -0700 (PDT)
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
Subject: [PATCH v6 06/33] mm: Convert ptlock_alloc() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:04 -0700
Message-Id: <20230627031431.29653-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_201521_975298_6A53872C 
X-CRM114-Status: GOOD (  11.95  )
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
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1511faf0263c..39b0a4661e44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2798,7 +2798,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2810,7 +2810,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2840,7 +2840,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 80faf3e76232..2ff14f50c7b3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5920,14 +5920,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
