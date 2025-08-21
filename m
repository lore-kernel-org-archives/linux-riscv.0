Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF13CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkjLRUipGDzcnHJppdXyidUWuyc57gnrG0QJL1QPTh4=; b=q2IFrSYUAaTUDd
	21FkoRkJ3Ve+t4dKX/8vftYT5LGYP1ZTzjEQY9XabyOGPh+fDWWZcXvkwrxn3cjqIDdsIB448nTp4
	tXALOg+9tO7KBgX6p/XNRaNBSByHlbDSadvtIGtu/+eO87/kQhy4EHhAkXb9l+mSoigXcjn+2Bihm
	wQQZU1hMSKVuObhpwo7g1Dmkh2s6mRE+1cQh+Gwehd695fQcDk/XFegUdb9vtRwjzZsUfJXdU4h+t
	t7T+qxOOBwO4DGPKIzqMLIori0qR8NIkwEYQqPoh97wnECBkr3NVMq5aInnlS7yRoH6NaTKjIThPS
	xShq3SoUIMW0bqsFF39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIJ0-00000001Mdp-2izh;
	Fri, 22 Aug 2025 03:19:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBbA-00000000OQl-0YPm
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkrXh5PHMEq3NY5i+0892fbAshOERsmwyMLhbVIa0Cc=;
	b=ArQO70iEy9QfzHSGpJbzt/hCMBAKPjREyqmVf6FC4YiqKLUgMsFRicbiZVlQRzmZ+Wac/Z
	WZYPFTefGPuAN9edj2yYEfpzZaN7n6R2eSvLK3MrZ9nIfSQ5SI58JReeOrD597US42Wtfk
	Xd9vqUOc9QcqpDeXsH9y75qLBztnPcs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-wVYJ7lNYOIefyGuKCHbAhA-1; Thu, 21 Aug 2025 16:07:44 -0400
X-MC-Unique: wVYJ7lNYOIefyGuKCHbAhA-1
X-Mimecast-MFC-AGG-ID: wVYJ7lNYOIefyGuKCHbAhA_1755806864
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9e4f039ecso759279f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806863; x=1756411663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkrXh5PHMEq3NY5i+0892fbAshOERsmwyMLhbVIa0Cc=;
        b=YhNtI8ir5IRh7T3tHB83gJ/ZJKRJ68g2KqxusUcCsfajpsEtzO87mvD6rJcusQm0Qs
         uLHamdn1iB5etoYs6YVe7su41hoJeBM8mdt+KGXe/bqVv+rSUAzdEWSl70sbkSoS3Shd
         OJ/SsiyO9hx+VM2b0IBAgGnZrV//dD90XFJoWE2Ol3A2UAgLN81AxHPS/yBKIiMzNmG2
         f7RwgpGY0Y93fBvR1DJITcO96XdQN+WjgMlxAvWp7MuVem2lRm8cu0vv7mKXqZrd/7uN
         bgyeaztwX7gNIQ/7SagUINdnniUHabwBs4psAYkIRc3K2mu7/A0CSAWETTG7SJRF/YWb
         9QWw==
X-Forwarded-Encrypted: i=1; AJvYcCXIcgtC7Vf2SRj68jlgPNejxAAXb/Fsgk8fEiDyng1JiQOgEHn6I5sTVWU8vKilmQVf1luliqXc+zTp6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/amo5s9DlUfrIQAFL1lE16uz+UjM6a2OT86ubwnXmmZQwe/I1
	JVoVcFJTE6+4945T08ZtLFvRriGS9e4WR+Dv7QaiObxjhtZzfJXNhTv5XXJFFLMyo2CbD3VS9wR
	FRND/nZfHlZiZyQDPCZU1mTu3ltm58hR5UV1dsewIMG2446wyA0eYguOc7WmGuc0/eD46Yg==
X-Gm-Gg: ASbGnctPyRBnP/loS7O7XiVsaJjWK5cl6+I3mwn8gzNLAKLQprZ0MFG1Khr1RX/pssV
	NlMUx0fcPaBmN0rASCpdhGpA0rjTIQ2mhOsiozTm4zTYa3lSwHa/QMzdJyQGl/hcjCTwyhAjYPj
	wCUjfy8SI82FPXELNmIsKYZHPrKFeLdcydegDXWk22EqC6y+NginQkxECQnVkqSRDOlhkZN0wS+
	shJG8P/WcKHWfOnNQYSbJzd5wrMSIAgCYOgtio9OzqgAiW+fa8FNoQhr4/5I6o+MlY6iHf18ao7
	ct6TRSyln7G9nxSLd8AfBTBMq2ZsU97sHCNyIiPO2NxSFy3cYXjznjbwu9qOtArDlCrmyHlQNRS
	CInu/mSxI80hE2x4g9Ezrgg==
X-Received: by 2002:a5d:5d0a:0:b0:3b9:14f2:7eea with SMTP id ffacd0b85a97d-3c5daefc2a3mr192537f8f.18.1755806863479;
        Thu, 21 Aug 2025 13:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB28V/U3gI+p1afMr2c1HujEN1g59N1A45YIj+RBO5vrtdOMlsNhrN6BtrkE7YShkW7nBB8Q==
X-Received: by 2002:a5d:5d0a:0:b0:3b9:14f2:7eea with SMTP id ffacd0b85a97d-3c5daefc2a3mr192518f8f.18.1755806862961;
        Thu, 21 Aug 2025 13:07:42 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b51b61256sm1742995e9.3.2025.08.21.13.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:42 -0700 (PDT)
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
Subject: [PATCH RFC 13/35] mm: simplify folio_page() and folio_page_idx()
Date: Thu, 21 Aug 2025 22:06:39 +0200
Message-ID: <20250821200701.1329277-14-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: veZQCSfk-ANwmKDFvCt5YNmmQBr7uV3tQ2zlRU6QEvQ_1755806864
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130924_264497_EFCBFDDC 
X-CRM114-Status: GOOD (  17.58  )
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

Now that a single folio/compound page can no longer span memory sections
in problematic kernel configurations, we can stop using nth_page().

While at it, turn both macros into static inline functions and add
kernel doc for folio_page_idx().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h         | 16 ++++++++++++++--
 include/linux/page-flags.h |  5 ++++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 48a985e17ef4e..ef360b72cb05c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -210,10 +210,8 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 
 #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
-#define folio_page_idx(folio, p)	(page_to_pfn(p) - folio_pfn(folio))
 #else
 #define nth_page(page,n) ((page) + (n))
-#define folio_page_idx(folio, p)	((p) - &(folio)->page)
 #endif
 
 /* to align the pointer to the (next) page boundary */
@@ -225,6 +223,20 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 /* test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE */
 #define PAGE_ALIGNED(addr)	IS_ALIGNED((unsigned long)(addr), PAGE_SIZE)
 
+/**
+ * folio_page_idx - Return the number of a page in a folio.
+ * @folio: The folio.
+ * @page: The folio page.
+ *
+ * This function expects that the page is actually part of the folio.
+ * The returned number is relative to the start of the folio.
+ */
+static inline unsigned long folio_page_idx(const struct folio *folio,
+		const struct page *page)
+{
+	return page - &folio->page;
+}
+
 static inline struct folio *lru_to_folio(struct list_head *head)
 {
 	return list_entry((head)->prev, struct folio, lru);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d53a86e68c89b..080ad10c0defc 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -316,7 +316,10 @@ static __always_inline unsigned long _compound_head(const struct page *page)
  * check that the page number lies within @folio; the caller is presumed
  * to have a reference to the page.
  */
-#define folio_page(folio, n)	nth_page(&(folio)->page, n)
+static inline struct page *folio_page(struct folio *folio, unsigned long nr)
+{
+	return &folio->page + nr;
+}
 
 static __always_inline int PageTail(const struct page *page)
 {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
