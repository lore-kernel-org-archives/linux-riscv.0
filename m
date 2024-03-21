Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF8AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIdSYgnG+6Rt5e6kRhKaO2Jjf5GkDLKg5iwaJO4mQCc=; b=eRYC1mNsqzjdmr
	5jyxIQIolawJ21KNQ8jfKHKxvVLWKHgj1sWqrFO4b/mV1hdIUFhLAYpNGl/SMvYqvZd+JIcMc519X
	vO9tLosunPJEiKS/Jn5lQ2/iIUBvFrS4bKM1/SM/bK7C1Oyk8K10xpkY36QkpKbfyVTApC81UHhGH
	WXWNRiyAuDxbW16SXmtsgebnHIzbgyIL29krHk0v2BOCRAP6t5cESmXrlMOTMva5VBsR0xIGYQCEL
	tlk5ywJCQAEvJcYXqXHTiB6bGnxOwa/kefoaLACx5M20S4fimFcYFzxMHVnEaJ16joes5QZ7qEDp+
	Qg16RrL039TkDHh1EQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQbS-00000004rFi-1Mex;
	Thu, 21 Mar 2024 22:09:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaC-00000004qOT-2vvy
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dI3BkO2nCtQEnBDt3PLoa+NL/Gig0J3ZsiByK6YiGEU=;
	b=Gq0YrZaZJDba3/oiLHQ5k0QmoQm24cQ+2uRUbyM7sQ1AQDcS7Dy2L/3pkR7wVjlqpxGD3z
	mcAbI1PWYLUrjrMR4xJKymVdTk2i//qVxoi6PSNXD+zK4MGzMyJGLIS+lin8FeDhv0Hmcl
	3dxdDIBhC+tRORZawc/LBLVRrZXzBG8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-kRwCnjsYOpqLXS7UsPO25A-1; Thu, 21 Mar 2024 18:08:17 -0400
X-MC-Unique: kRwCnjsYOpqLXS7UsPO25A-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7830635331bso30344785a.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058897; x=1711663697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI3BkO2nCtQEnBDt3PLoa+NL/Gig0J3ZsiByK6YiGEU=;
        b=QKZGcb0LrD1wE3N2jKJJLVse+UdTbLq4CeiIvoWXfWZRN8ln7Yu+nSjsvr4JiZyFET
         tQzWBbGhyQA1/WvfQUO4Gk10wsmNWVhplSGhdoQgR1oxkNkyEtPkNYdobaNyRfFwDxH0
         J7A0HulcIGLKtaXwUrFmR2wjteTQI2BUSn2G/Hz3EZ7Y0akn3Ulmfw0JkPxdkbWGY3kD
         bF+VcPsw7sieblfRJ9wadyIUZDZSR6DRvfv+BS4Z/VvAATloglKK9WRmmj5a0ZOxRKvk
         NN3MrrDCsEZcCjE5uk7HBS2SBrAW8rXdlBExdCAYkil0QNl0iWXqm82jL4b7HqMB0ofc
         mV0A==
X-Forwarded-Encrypted: i=1; AJvYcCULMZ/ZlYtFEuZF2w+qgMuaZ3CZr3N1F8EDgH/2rzIX0XuwotI0IYtihnftREQx8Z9uy8KNa2ke1XZptM8n6Gn2CltvdBm2gqt3W1kiPfNg
X-Gm-Message-State: AOJu0Yy1ImjQEwlbYjjj5ASk5mRDToU9aK8LrDi3P0binHq+cc6CZjyP
	RJCM+7g0tNrY/K7rVR3FF75xq8J7m0ckcs7KT9PE6Jo2WKPkam8uXWc0pBJN5GO9k7dZwfxXbDZ
	PqKWxj3oh1c6a0m3WdH9qlfPC0wAgnhQQZKaYDwikjKS2qExspHs20bboUbX1ov4mLQ==
X-Received: by 2002:a05:6214:4489:b0:68f:e779:70f2 with SMTP id on9-20020a056214448900b0068fe77970f2mr443538qvb.3.1711058897151;
        Thu, 21 Mar 2024 15:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGuIUGmtGDilXkO+Txm1IkzpifWGQBAYBHvb3QP196cSPWL36y2snARbq2rVPrLWqoQw6FQA==
X-Received: by 2002:a05:6214:4489:b0:68f:e779:70f2 with SMTP id on9-20020a056214448900b0068fe77970f2mr443515qvb.3.1711058896774;
        Thu, 21 Mar 2024 15:08:16 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:16 -0700 (PDT)
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
Subject: [PATCH v3 06/12] mm/gup: Refactor record_subpages() to find 1st small page
Date: Thu, 21 Mar 2024 18:07:56 -0400
Message-ID: <20240321220802.679544-7-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150820_997565_0E6EAAAC 
X-CRM114-Status: GOOD (  10.93  )
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
index 9127ec5515ac..f3ae8f6ce8a4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2778,13 +2778,16 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
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
@@ -2819,8 +2822,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2893,8 +2896,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pmd_page(orig);
+	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2937,8 +2940,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pud_page(orig), (addr & ~PUD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pud_page(orig);
+	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2977,8 +2980,8 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 
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
