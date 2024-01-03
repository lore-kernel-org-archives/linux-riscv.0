Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF96C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvhSGA+CFGmoSEFCHrZwWmJepV2bWSgYWEzQSEJjjfI=; b=tLTMeXTSnBWB9v
	bijT9LZTj/tYQ6L73L+D7j7mucvytt5miMw0Khm7LgX5yc5Cmcox3s+F4Y/g1gAz4rLV+S40dnb93
	8rOVnZeLRiCWe6eNrMD+AtVmgp15XsQyxE3HN+4cKkaZ/PSDxdQ0MFJwiXvB3FKW257dJNqipuXL5
	R/qpd7XpxWldqA7l9Zsc6pMJ5FFP080VB1QKLKjeIFtLXblIhEjIXO3Ol5AxHqFhfLa2gAu8+RETg
	HCLQDgY5WY/e+lJPZxXyk6m01BVa/wzVBltbGpjElxS2w3CEUvBovmaEd1f/4uYRJwVmGzPoteq+d
	C7V58YbJj8a/moJsDg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxME-00ABkT-0O;
	Wed, 03 Jan 2024 09:16:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxMB-00ABhq-31
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 09:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w96HtEkzdknb+h0JjsHCRRCM9jOy1Kg+MIEx5UNvA1Y=;
	b=c21Pn/6/nCBSDLyAT3izS9wWdvVfGGVOM5wGNqk95M0KZWcjtTVKbYWRSwmsvWj/j064v4
	msXf4b4nv/rn8+z4GJbitHGjz8vYdKnELCNVBbUiuTn4RvUc8BXb2uz6k10LN1vdNZdKWO
	xFSEnTu2zlVET6OnmQsugQB7+sAqCFA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277--A0wl26XO_yPNePIDNUfuA-1; Wed,
 03 Jan 2024 04:16:06 -0500
X-MC-Unique: -A0wl26XO_yPNePIDNUfuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A993806714;
	Wed,  3 Jan 2024 09:16:04 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29D1F492BE6;
	Wed,  3 Jan 2024 09:15:52 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>,
	peterx@redhat.com,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Jones <andrew.jones@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 07/13] mm/gup: Refactor record_subpages() to find 1st small page
Date: Wed,  3 Jan 2024 17:14:17 +0800
Message-ID: <20240103091423.400294-8-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
References: <20240103091423.400294-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_011612_047719_1FD8C9F6 
X-CRM114-Status: GOOD (  11.33  )
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

All the fast-gup functions take a tail page to operate, always need to do
page mask calculations before feeding that into record_subpages().

Merge that logic into record_subpages(), so that it will do the nth_page()
calculation.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index fa93e14b7fca..3813aad79c4a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2767,13 +2767,16 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
 }
 #endif
 
-static int record_subpages(struct page *page, unsigned long addr,
-			   unsigned long end, struct page **pages)
+static int record_subpages(struct page *page, unsigned long sz,
+			   unsigned long addr, unsigned long end,
+			   struct page **pages)
 {
+	struct page *start_page;
 	int nr;
 
+	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(page, nr);
+		pages[nr] = nth_page(start_page, nr);
 
 	return nr;
 }
@@ -2808,8 +2811,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2882,8 +2885,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pmd_page(orig);
+	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2926,8 +2929,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pud_page(orig), (addr & ~PUD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pud_page(orig);
+	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2966,8 +2969,8 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 
 	BUILD_BUG_ON(pgd_devmap(orig));
 
-	page = nth_page(pgd_page(orig), (addr & ~PGDIR_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pgd_page(orig);
+	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
