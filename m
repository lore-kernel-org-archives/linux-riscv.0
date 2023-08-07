Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D42CC04A94
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDX6oQm7jMYSQVwAWkCYZLhhGwBoXHy4XXEk6mSOEr4=; b=oEuAZIo2KY1Lfm
	Feud5lLeQym6gQylPGuDDWG9/kfaTFe2K75SvvBxn1nXMS+a22mbViKAGVt1cji/X7EghTmb1tCYv
	Jivs7SaDyhws+F1GpJ+YOimTEpT5s88OH2tubvx8nHjJ60a/IWWCNVD06faiQx6hAUt1YfSEQq4w8
	ovhi2+CCuGGZZRiN/JuYY9iN3UOCVTLy0j3y/9FDR6Xm61FBQLPvpwtNh8Dj5Lwa9RyU61K5VxzSU
	2IQ48VzVqI4XH9Axec2O0PHy8/YI8WgV+7l6Z/0OZWKGa3d4cYb5L5FvNyi9ewXld4WsB+pDM7OzU
	N6mIRdEo3UX8NYPvcmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT9Id-0015CZ-0Y;
	Mon, 07 Aug 2023 23:06:07 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT9I7-0014XW-2m;
	Mon, 07 Aug 2023 23:05:37 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d465b3d50efso2114007276.1;
        Mon, 07 Aug 2023 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449532; x=1692054332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV51lKtiOhMWQgAl7GNvRpOxJtkn3o5Ia4Rm5PKGOL0=;
        b=WW7U9RxJoy+3YY4y3qa+Z9OsxlwmyOU3wMBaX5rDPLFmIEHt/X6v4NdYOpBq8PRkh5
         HGAvbPPuVPcaXp+7bIkcS5zKLOts7aoRAq2rmpfhl809GhQ5Z7qhyD2D1O9jUw02JT8D
         ByQrQ+74LtD1rxejz5iV5Ji3t3biqjBaLILP+cGmcXMABNbKMRqAqcPv+Q5eVbDOwvco
         pnySxrcubM/hR4SWo6309aJr0ghUYXqxorm9LprpxBDG4pKG7rw8FnMSIxuCIl+L3G3f
         pQ7sJFVehZ1e4LudKLyLwUTD+K2Hcr+cYbBqgmDPIUau/hEmU0pgvAzvLPGNFfNzyEIP
         WwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449532; x=1692054332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV51lKtiOhMWQgAl7GNvRpOxJtkn3o5Ia4Rm5PKGOL0=;
        b=dQ4qSfmDfKHNrGL3zc9grEtB+jUb+ykGJz26hyPf0I+ECgOJFQWhLHGNLZtYQegFgN
         4oTg+/kASwJ0p1jjhwWJYFTqkmFNDvlE/B5OONmP9pNzP2vE7Ne3nC4pMUjmKTDk20GU
         QhdOpt5VSYuDUOzy1mb7lg12preOAy7+4jbuITYN5+GvHMkFUvqQUucajCjL3WU5Ywzt
         Zt3PVpNwA0VpY6B8i8jNv9S5bW8JzWoVd7lMe4jmsRDQe4L9LIXps/0lKDzR3ynsDjbS
         XXcbDLjjpXeYTLcDxyHUQkNS6ua5VtibF2mzW3g63abvP0Iik3HBP3xEepaKllK5uoY1
         mf/w==
X-Gm-Message-State: AOJu0YzBRsRTIOyw4hDBkAEjeCwSz+fC9qg0H50TztTc3APzgaQS+PHx
	ZI1XloSjFTHM4ToWZxPCn5t32qP058UQcA==
X-Google-Smtp-Source: AGHT+IEvrDCY+UE05HZYU4gf4n6Ovk9myxbAlbrTcNmkwiJKi0vLSKG9giGoSfLWvI4ILhQ42gUDlQ==
X-Received: by 2002:a25:bd7:0:b0:d14:6e28:69a4 with SMTP id 206-20020a250bd7000000b00d146e2869a4mr9317696ybl.29.1691449532541;
        Mon, 07 Aug 2023 16:05:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:32 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 07/31] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon,  7 Aug 2023 16:04:49 -0700
Message-Id: <20230807230513.102486-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_160535_989926_95755751 
X-CRM114-Status: GOOD (  10.39  )
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

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc82a64e5f01..040982fe9063 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2993,12 +2993,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -3018,7 +3018,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -3034,7 +3034,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
