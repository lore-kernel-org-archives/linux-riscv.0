Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECB9CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EhJuq5zVkXogZiDHIlv6DHnhPtV4FLOYbTiHYZ+kt4=; b=ssEmfP78Id5GRF
	unwixlCmZLntfOIh4p14aOfCaCVS+b6ud2Yia2QZTUgI9/W5mXWOpHYSqPFD+FshX5zRfHYcH2otS
	SOPQAdkCwDD+q6SOXFtUlcgfxWfIaAlH15yPzBnHLqkOrGmGPBAnsuqjBecvYcsTQPoeLQLOPZUC+
	jXpqRfLpEq7Na6Xfsk7AqnIsl7CfiRHkiLhAuEbQiLmX2piPtVCxRUClT15M0EwQRuabBarcm7nxV
	5BPpjbn+kfkiKstRXc4AtlnBLlv/8PamktUHz0s4wBQHSC8TmYo9gu4H34J5dptzxtw87FThZA6sW
	Nv0P28qEXptTvHFi4Ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1H-000000015ms-48b1;
	Fri, 22 Aug 2025 00:52:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBag-00000000OFC-0QNj
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=; b=KATIC5F861x3XpMQFjd7smbkJf
	zeuESi5dIWEBAL/km7wpexOCDbU1lKHMDgIlISr0JjrVY40J1V1DzWRVDU4OSQKlErm+eeW8Lstqe
	HwjR76ITXCFqMAY5ITvpiLW0BzGKL3qPjT/jedrLbcDwJkYdYLUfwUKnC90243haLHQycKSBeFhTp
	QUYNeQaIB6z5YnXWcxM8alzLaw6EHl/1YR4m/tjQIXfs/zSFXzutRWJgWXkTpazvyqsnnpQZ6XTvG
	Fj3KR/7RgMgX7Bp++DtV1prngpjjXuPvnVsvnAp1MaBqvY8iHBDOlHuT/sq25jYPuGMp0e9Rjl3Rg
	DX4O6zSg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaZ-00000000fGX-0LBw
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
	b=cTWsbsAt7GWYHIYKURD1Pyw7M0tD3fRjasIPIX2VqOmtlhJp4Ez6qCZWU1vBbq95EqTvvH
	Y+2UxVqCHZyWNbAY+Ym1j+pecnexuqVQSrmuiOJXwQ6b8ZIVh28sVmR+f8i3dBqmR92AHL
	v1zd2kpbSKN3qo17pgZUpO+OKYEoyR0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
	b=cTWsbsAt7GWYHIYKURD1Pyw7M0tD3fRjasIPIX2VqOmtlhJp4Ez6qCZWU1vBbq95EqTvvH
	Y+2UxVqCHZyWNbAY+Ym1j+pecnexuqVQSrmuiOJXwQ6b8ZIVh28sVmR+f8i3dBqmR92AHL
	v1zd2kpbSKN3qo17pgZUpO+OKYEoyR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Gf-vbERfNwCKWgl-60HXag-1; Thu, 21 Aug 2025 16:07:25 -0400
X-MC-Unique: Gf-vbERfNwCKWgl-60HXag-1
X-Mimecast-MFC-AGG-ID: Gf-vbERfNwCKWgl-60HXag_1755806845
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1ba17bbcso7094505e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806845; x=1756411645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
        b=gw5XNdihJkqMAZKQ97Q/yJRJKu3w0H/SekdBUnT/VWiRdh2/sy2NvojDaeIKiHncc+
         kcvS4YLyrXJRT+CZ8dEWS3y7WBfJvWi3bSfJZSwgukTiLkhKVrqdp/sUYxMOxpIHqUMn
         5qhyJiqf3DYvNVMmtbdUTfNde3KyHz1t4YIBP6CLlz8aC1IGiIOgwk8V9GMNzSwpiUob
         lJg3QL3ciuwXGzxOrsG8iJggKW9Vx+/TvGdbUkhb57DbIsatV4wAElLEYW7pZUHp1Jdz
         CmQTmuxTv7zlTegyNgEwxdt5LMMzGrDf//rUF5+Vybt1Ks5IwWCIUCV378b/MDn7+Kie
         Y0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKzGzcPEuUo1zmOf58e1W1JZyKxPiMkWwy1aj2kI/IGY1vuZnC5XnYxrOPFZB94c/riGKl4PTSojonNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzomQgnsZiOx9+6Rm6dG0D6/B2BZ2VsXRlMrX51kUo9lQFqUN3
	ywtnBQu1mGRk593As+xgY5c2h/7TPSIxOYuy93yo8+OIoq5VIFIyui9FafmjsBmSzexOmOSP3ff
	hTD26bgC+aJIsc6PWIWAL0zp7iHJMezHIJRJd8EQu3U0uIpnfa/3lmtGTiEE53gnQT7jLQg==
X-Gm-Gg: ASbGnct2A63ZPjfZQFTvRkcfIum0OBO1fB0rSLfgfpFPQBWz0Cz+MtWILJeaLAGhZB/
	QOcvqCz4BvcgaQvuGseoLsV0MXXR2lCI7b49TuhOXgNipCfg0j/yJE9CVIhWek9PoAlLkt3ZMoF
	nF4rEHLH6QtReQvirOjEbcxp+jHinnZ2JgtznSWmUF+sJG2TjRKTgqAIvgF36qjmiwSHHeZtCQT
	78RE/FIjoDCGqh69UxcQEN2NJeMYfKuBFx0HSrWCp4VXsVvxS5hdSzwG+kxJAGEQS8EJXQatrSI
	qNqszrlvgzmGI3DUbf0N3W7YZR9Ze1pf62vCJBGAF+l9u2IoDEwmBRxFnPv4FnVEmOzOFjuMQpw
	UdMTlZBY6ol5/ldI8LLvxrg==
X-Received: by 2002:a05:600c:35c3:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-45b5178e768mr3050325e9.3.1755806844565;
        Thu, 21 Aug 2025 13:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwjTyvRglWWHHllkR7aRLdEFYS2lmKXV2DYH9bn4L7+YG6UNdB0HbBuiJbZZ1vy18QyYWFNg==
X-Received: by 2002:a05:600c:35c3:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-45b5178e768mr3049835e9.3.1755806844048;
        Thu, 21 Aug 2025 13:07:24 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074e38d65sm12980909f8f.27.2025.08.21.13.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:23 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 06/35] mm/page_alloc: reject unreasonable folio/compound page sizes in alloc_contig_range_noprof()
Date: Thu, 21 Aug 2025 22:06:32 +0200
Message-ID: <20250821200701.1329277-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AzFvy_aagVAaiczQdaoMr-Bxxruu-le8hcm_V63jEoM_1755806845
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210847_501505_FB780F13 
X-CRM114-Status: GOOD (  14.69  )
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

Let's reject them early, which in turn makes folio_alloc_gigantic() reject
them properly.

To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
and calculate MAX_FOLIO_NR_PAGES based on that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 6 ++++--
 mm/page_alloc.c    | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 00c8a54127d37..77737cbf2216a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2055,11 +2055,13 @@ static inline long folio_nr_pages(const struct folio *folio)
 
 /* Only hugetlbfs can allocate folios larger than MAX_ORDER */
 #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
-#define MAX_FOLIO_NR_PAGES	(1UL << PUD_ORDER)
+#define MAX_FOLIO_ORDER		PUD_ORDER
 #else
-#define MAX_FOLIO_NR_PAGES	MAX_ORDER_NR_PAGES
+#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
 #endif
 
+#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+
 /*
  * compound_nr() returns the number of pages in this potentially compound
  * page.  compound_nr() can be called on a tail page, and is defined to
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ca9e6b9633f79..1e6ae4c395b30 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6833,6 +6833,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
+	const unsigned int order = ilog2(end - start);
 	unsigned long outer_start, outer_end;
 	int ret = 0;
 
@@ -6850,6 +6851,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 					    PB_ISOLATE_MODE_CMA_ALLOC :
 					    PB_ISOLATE_MODE_OTHER;
 
+	if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
+		return -EINVAL;
+
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
 		return -EINVAL;
@@ -6947,7 +6951,6 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			free_contig_range(end, outer_end - end);
 	} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
 		struct page *head = pfn_to_page(start);
-		int order = ilog2(end - start);
 
 		check_new_pages(head, order);
 		prep_new_page(head, order, gfp_mask, 0);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
