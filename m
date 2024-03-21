Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A2EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfZnqd4TffXVg89S++E+3o/cWViSYQW9xFcT938oyXA=; b=YjW2f00Qhpfv5Y
	WFpdX8pRVnTkYOEmrmNfKsezdGo0R+x65tXFY+XNF4Ka9dd1N4WqYpgf1d36QYz8UbKYgp+3N+bEB
	o7KVTTHpmUt9njGj47iZAilofcnHjb0lpLDgagt7p5s5gy1dl7SoF5uZOhLarMBwn26X3wcdqhHeD
	J9HRR8t8HaTWvbrWqh4W6pYkGcKJdBLG8h25zNqwCQY2zF5a3fIjK1VK98TWvIiWl6GznM8p3gU0x
	EQ1rVMtCMk0N+gyWOf09krQJIV82/Osxxq+pFevb/mW2Gp9SaiERq3J2Kw7pQGgH5DZFFiK5VAiYl
	h2VqycbrP+CUlLpZ3rWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQav-00000004qxo-1ghu;
	Thu, 21 Mar 2024 22:09:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaA-00000004qM1-0o5k
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUPAT0rXQJh3Nc2mzYzsdwstyixoWF7iCZ8XsZkm6u0=;
	b=M1RrXhhRspIvZd+9r5uYKzQTvq6cv6BXIuBBSvlblcR2Wju6znfH3x1j97oO3y9Cp2snab
	gSA8mzWZ74gbVx4BfU3AIhB6G0RBrgp1OcP3Og1uvCqcVf+eV+/i6ZP4TKg7e4EBUetifi
	jOSQ3PpRQ4xYQ5guZZgeypFcZjPdguk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-9R6p4aOdPZm8GOsuQWZ2Aw-1; Thu, 21 Mar 2024 18:08:15 -0400
X-MC-Unique: 9R6p4aOdPZm8GOsuQWZ2Aw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78a3986e95bso1842385a.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058895; x=1711663695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUPAT0rXQJh3Nc2mzYzsdwstyixoWF7iCZ8XsZkm6u0=;
        b=GslnUZtuuhMVOij8SBlDlTeiJzZvTOIceN/yCpblCc90qMI8oVQeQn0a8yr+t/aOhv
         VELBk72PkRiaqWPq76aHUqBEWp6N+QLpl87nRym7KS4eM75+GgDAJaTI/A1UjQddOtUH
         y7Ythm8zmiTNTaOreH6G+WIOSNj1FCojeozW0BDodgu8OSvZ576XJ1V9MArOkvHUQXX4
         N+3fVbWUjLxsbCvLpkbzkT5zIs/fhUSGqdJK2WF+ZuyLWwTMwlSx0QnOnRVGzYeevuhP
         aTkQ9gjshhn6BaCyfWMr9KcRi/nDqbgkjVJz11RDO4uIZw4ydGL+npM01A++b1qZ4IUL
         ynYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZmCZDU/LwUQmqq/2KadqU+woCKci7rlggVAONPixKFyndzc3Pugp/WRUgTrx+ZdQcvVNvz2JpY/7PkCYyNF7dyQ5CRIHLNXfsO7WN0E8p
X-Gm-Message-State: AOJu0Yy9sqA8AjlnQLMKJnakdP8jul6b2UU2TuLzhBR7ehdIhOQUPFww
	eeZs7B5IqHHIglpXEo53122QDJwF+cx0SOBgNiUBsHJJhMNetSu4UfNymwIDp1grYpfLn0MoyAt
	uyuvkPqxIhGpMAtx/DqqnzEs0Eqz4BMFnazdeVV2vzfxr6eE8bfdEpdStwBlTvm6EjQ==
X-Received: by 2002:a05:6214:3f89:b0:691:2524:2d87 with SMTP id ow9-20020a0562143f8900b0069125242d87mr214727qvb.2.1711058895193;
        Thu, 21 Mar 2024 15:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuIdayMB3K1ezoBSvCD0gJVl53LosR8J8AUw6cJS5L0fxLggs0ufmC9b8hoGFmk2jAJqKnIA==
X-Received: by 2002:a05:6214:3f89:b0:691:2524:2d87 with SMTP id ow9-20020a0562143f8900b0069125242d87mr214690qvb.2.1711058894780;
        Thu, 21 Mar 2024 15:08:14 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:14 -0700 (PDT)
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
Subject: [PATCH v3 05/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
Date: Thu, 21 Mar 2024 18:07:55 -0400
Message-ID: <20240321220802.679544-6-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150818_522894_70130E88 
X-CRM114-Status: GOOD (  15.70  )
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

Hugepd format for GUP is only used in PowerPC with hugetlbfs.  There are
some kernel usage of hugepd (can refer to hugepd_populate_kernel() for
PPC_8XX), however those pages are not candidates for GUP.

Commit a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
file-backed mappings") added a check to fail gup-fast if there's potential
risk of violating GUP over writeback file systems.  That should never apply
to hugepd.  Considering that hugepd is an old format (and even
software-only), there's no plan to extend hugepd into other file typed
memories that is prone to the same issue.

Drop that check, not only because it'll never be true for hugepd per any
known plan, but also it paves way for reusing the function outside
fast-gup.

To make sure we'll still remember this issue just in case hugepd will be
extended to support non-hugetlbfs memories, add a rich comment above
gup_huge_pd(), explaining the issue with proper references.

Cc: Christoph Hellwig <hch@infradead.org>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 484a7c70d121..9127ec5515ac 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2831,11 +2831,6 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
-	if (!folio_fast_pin_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
 	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
@@ -2846,6 +2841,14 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	return 1;
 }
 
+/*
+ * NOTE: currently GUP for a hugepd is only possible on hugetlbfs file
+ * systems on Power, which does not have issue with folio writeback against
+ * GUP updates.  When hugepd will be extended to support non-hugetlbfs or
+ * even anonymous memory, we need to do extra check as what we do with most
+ * of the other folios. See writable_file_mapping_allowed() and
+ * folio_fast_pin_allowed() for more information.
+ */
 static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 		unsigned int pdshift, unsigned long end, unsigned int flags,
 		struct page **pages, int *nr)
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
