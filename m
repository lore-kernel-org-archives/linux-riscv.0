Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24C8CD1287
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwFfK9DMqWpoyG/dQIXxgb6YPdUH39N3L60xhb6UPCQ=; b=gKR29UZEAuxkzS
	hUeLkC/oJZsMZYD2LESnGcPFqfyyXFilveqz44735rR4w+f5CgqEmp6zrdIm0RHXd9ngPOlJcmgM4
	uHmtyaCcCFVpjZwh7YuqeUWbiICWvrazy9ME7A73iKIK9vjFg2mhIgZ4PTQbMPmAIxwVO+wWXD2cw
	4ypVaww9x02wil2wIf7FeX/KEL7pSC3li0mu/WhEFAM3FUMAxju5xbtKAFEbmz5/cfA/+J92URTOs
	Cbs60tZ3hHkNLR/qXow50GEFjrMoIuLeGlb8O1W28zfY1i2PMk3h6jMTZgoLoyS83Ki/Iz71ntE8N
	woUqFVRim3AANs0gyBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV91-00000009m55-1k0k;
	Wed, 27 Mar 2024 15:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8B-00000009lU8-1rwy
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 15:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=; b=j7xhIlOY5EqvL7StU48eD4sq5C
	1Dd4XPcLoGjwQD/qyVgVP+38t0YmDXOlBVhHqhg3g7qiIzPj21nnHNEvH/xDveO1viuqnaTc26Zo9
	gI6Whcfz0WbANgXuyd4FfIK4kyNT/hAqrk1IFV9e4q7QOy7HIiq2uxuf3AgxBQ17wQm6wKjbTqjA5
	tI8USd7L9k3uG2B18hg17QdYHgw0/mDbMs1Qfy7kaLfsv4iIkT5+GJZOiYEdjf3UAg989xEdhW7rU
	bOanZFWJEkMksfmodAFk4AX8oEzmZ3hwKIMradlxbQw4baKk32oF3mBCHqogFFqGg+EMrOldkuTMY
	/ynoJtWA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV86-00000000L21-38bC
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=;
	b=NB2Jw+1/zvAUDFua4KIxw3i7AD/PZA6GWDGWzJ0BOo8NhKNLhoVNZ4t5ZOYTqMM4jwjott
	akyruVwwIJz9HdM2lfZuNGu9BD+q/8XAPf8tG0uVT5Lz2v4TIIbBqJ0lsIq6yzdmNVIk/C
	k2fko7R2N/jgiNf81F2rjkwGTTTbOWo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=;
	b=NB2Jw+1/zvAUDFua4KIxw3i7AD/PZA6GWDGWzJ0BOo8NhKNLhoVNZ4t5ZOYTqMM4jwjott
	akyruVwwIJz9HdM2lfZuNGu9BD+q/8XAPf8tG0uVT5Lz2v4TIIbBqJ0lsIq6yzdmNVIk/C
	k2fko7R2N/jgiNf81F2rjkwGTTTbOWo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-TGXJ9nKbNOGvS-3udUDLhQ-1; Wed, 27 Mar 2024 11:23:51 -0400
X-MC-Unique: TGXJ9nKbNOGvS-3udUDLhQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-696a5972507so4146156d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553031; x=1712157831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=;
        b=V7n3iRl/8xr/Q0Kd8u5xSazmjsYTGEBC+4P/2qtKk/Zv2HdK9xUHFawgDxLmTXLUoa
         KHzqe9x0pf5fKcX3jhbfFtUqCJb6phJekxw9fuNOBSCyayJZVulF15zNLya695Enkkz1
         1m241qjr4bCw04fQQrL/nA525Z2uLpvhfY9ZShnv9vGY23KMng+AN167ZeN8C6Z+2qT6
         85EPePUnUoYj7JJ6b26rZ7OoMwdKgmQAHbhEWADSBxZPQ5RBL/4WdVcfN8HF/kERvdm/
         pGC+31g8xdHU/8ocov3W/svz99LRnvhYFvsZVO1Xc4pz60QfhBhXIOaMYtmFX6cgzn2x
         zsYg==
X-Forwarded-Encrypted: i=1; AJvYcCWgHmR6QreMorQs60alZQWDa0CsfEA1qPr8ACZTH/2tbclfTYUZLUU/zpRta/tp7mgcHGd0ZYS14+dDn2zsOvg3skD5hTPvnjfVFlVhnRK8
X-Gm-Message-State: AOJu0Yxb2ZbBweVFuvzDDZxIL7ugE1Ev/vK8/3by5qA514khvoGX8AtQ
	foJQIijNKi2sj+sBL0Qvt4JaLLLHCSS73PLqAJ62+HMLbnagTujnaTCOhmbAoynMNiZE4hPMI+s
	fayFOgAH/TY2aweESOkg/a6h468Rwhqmj1mD+G6NaWC2MxfvLMjnB1pJPgyj2RKW/xw==
X-Received: by 2002:a05:6214:2b86:b0:690:de72:316f with SMTP id kr6-20020a0562142b8600b00690de72316fmr14582149qvb.1.1711553030740;
        Wed, 27 Mar 2024 08:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWXp2F9loH7HSDfuOw6HflxlC5J0wiBYnMNwM1iqpFTIhT0c0cqQhWkIb89hM3i5euenCqpA==
X-Received: by 2002:a05:6214:2b86:b0:690:de72:316f with SMTP id kr6-20020a0562142b8600b00690de72316fmr14582105qvb.1.1711553030174;
        Wed, 27 Mar 2024 08:23:50 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:49 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	peterx@redhat.com,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH v4 07/13] mm/gup: Refactor record_subpages() to find 1st small page
Date: Wed, 27 Mar 2024 11:23:26 -0400
Message-ID: <20240327152332.950956-8-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_152355_161781_EB13244E 
X-CRM114-Status: GOOD (  10.85  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index db35b056fc9a..c2881772216b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2779,13 +2779,16 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
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
@@ -2820,8 +2823,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2894,8 +2897,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pmd_page(orig);
+	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2938,8 +2941,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pud_page(orig), (addr & ~PUD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pud_page(orig);
+	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2978,8 +2981,8 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 
 	BUILD_BUG_ON(pgd_devmap(orig));
 
-	page = nth_page(pgd_page(orig), (addr & ~PGDIR_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pgd_page(orig);
+	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
