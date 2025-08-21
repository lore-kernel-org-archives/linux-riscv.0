Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F15CA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDiOWYD5XcbxHzZTto+U9V3IrgfKK4h7Gy1YJHriC1s=; b=F1WaAbt2jkQWnV
	I4NzhZ8bve8QPlmSZ7ufcXkIpwGVNQY9mooVKoVXaGfZUlviwMVBZltyJN4bm8nvX5LcoFPs9kUMv
	A9+qD3Nb9XAfg1nrH8KBuz7xMS3Aw4NusmIQfq/qONU72+gNQHMSx0Zp4apNEPnkqCiQtgnKe/XTT
	NxP2qx28K7qWMxEw/38kkc0v9RbLVRMGYfhICB0L4q0jq1XQpZqfld47b7RgJJ0G3pHanbZa+ODNi
	nYlbfqGIIxzb6i9c/bwmy6GGjSNuRE9TPB9ktGph7l2zgTNupqOfCEsRqMAaxjWVReToVV41kwuon
	X7kJcUmNZwDlj6+E+YKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI4U-00000001Kbv-2eX4;
	Fri, 22 Aug 2025 03:04:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBab-00000000OEA-3vDS
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=; b=gzW/guhTVJxFLAc9NVC/wIJawW
	IhJJSUTr7R0Pfv6CDpWI5puFgADXxBvAAnm5H0YSAzvtBNduo5SlWnfpRnwejdgFzN2A/3RhEIUZ5
	vGqFrHoPvcOWhR52u2J+azGcvxrUPJreqNbE7m75WyQwQo7/gXxiBucCk6d45HYaQ/oalB4TvugWT
	I221RBYNONgQKV2XGbhFSl9VQRmIJSTntuTu7nZYkG8FJwt2/zR0YTIUh7JyxpQ+V4v5Ktr2fXGiu
	cgdsUOqF6YuRmLMDwRUBJomMNNaxXl4Jd0V1WZHHvEdQSWYwsc1xDaOiqzcJWd7A0du5Ns4wAEjy8
	rDMpjUiA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaV-00000000fE7-2X8q
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
	b=NbCFXHhbl7F8nCT3qz4reEAUDlamu2nUfuqGTXVMftG8wbwfoRvC1Xakoyq3sQjNR/VLc8
	z67Yu1yr1OMyUOLZQTrera6NL3sUZvOjWFBvfKIQr63IcppAnmeq63Jw8zetE6cELxGQhd
	lj/M7yhBSPu+MCBpvmFqxjz3lV7fyCA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
	b=NbCFXHhbl7F8nCT3qz4reEAUDlamu2nUfuqGTXVMftG8wbwfoRvC1Xakoyq3sQjNR/VLc8
	z67Yu1yr1OMyUOLZQTrera6NL3sUZvOjWFBvfKIQr63IcppAnmeq63Jw8zetE6cELxGQhd
	lj/M7yhBSPu+MCBpvmFqxjz3lV7fyCA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-C3Cbf0TdNJC5ts7Et08VQA-1; Thu, 21 Aug 2025 16:08:39 -0400
X-MC-Unique: C3Cbf0TdNJC5ts7Et08VQA-1
X-Mimecast-MFC-AGG-ID: C3Cbf0TdNJC5ts7Et08VQA_1755806918
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9d41b88ffso838825f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806918; x=1756411718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
        b=R82bX50nq+JyM9O5Y+TiCumrjX5/QcHRtKUNAtuvj+wsNqmRK121wdHHDh3M9BtKDW
         VH/LA7/VRBxyzA57fjupXDB1djBXtmY3iidnkSR7QK5BKFVQ71U5p4iWEq8itNdKpuPy
         OzbVQ67wcwRFl0jN6dkEcQf4sSZN728G9ZTo/Wz5A7T79xTnOZ3Tifx9dZZvbFgRATEV
         NkWOjR/m6yQklRFpLa1+9Z6ItKsWi6j3dqOrE9GBqN9ORIMWIi5VvOQkkLDWoQts3p3g
         baM29WQ5Nxp/JSdZRWpwMluRmFFCJwiVWGHsVs809VND4n2cKiEmqisQWBWmqPXkmbuQ
         p4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfT2TaZ9LDDtj6sdQ/IykGYD8mrR08La418ghY085eXX2yzGZsKKxblYbkR8iKqkfKoY/Qiv63l7XmPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtowVSlVO2hjn9+ZRS25NE7eyLC3STBWab9uv+wXT9H9DjyRP
	4j6GBn2uQhLqe8u8ynvZEv8tkuPL94hPG5wSzcZ+ckhMpwJs0nE5VuF/o23uPj8++Pw3opboAcp
	NDfDgJ2Owt3RYL2zqWMMrA5PkuAYSrTVh7jFjyD9Js44OUXOIdSnNbEy5rZs9Ne+TelgaIQ==
X-Gm-Gg: ASbGnctgCyTLW0mPv3o2FkGhhIGMu/sciItUwcbGtaiyfWVwIDyHe08hVd5vndp6YAN
	WE7Y1eAEcH81kGvP9ih6rzHTjZczZI5oYBk5J+q6YHML+6YiFQXKCjx2GbyPsuiIHZTxtp+nFEM
	or5/NvF4xMtU3EWUBKJaZzM7Xf2dGlS3mOJVr+V37Hj5jkQFHR9FMXB8+SeVP34D9YRhBTgRXiQ
	8lJ3+siJ5c1JOoJwVvmM6eoc82HmI8GG7ys9JRnaDL24U1h+Lv1mTWJy4dFPiQ9DTZuCG8uyt1o
	K1HOGV5XS/yGSB+ykTMseuv3H8A7chWI2BJMkABiynkpBMXdmbkIngrbiWAFVeirRbieTdlExLI
	jtO3SQGoSxjh9vEmSnblRPg==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3c5daefc298mr218336f8f.16.1755806917870;
        Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBfJ8klmP3LMs+G3FmlUfLKA9Qlb/rzelQ5gyETYamNwKefh2PCq6Da3p1XS4Ia+K1NPGrw==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3c5daefc298mr218279f8f.16.1755806917364;
        Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c4ccbf04fasm3355197f8f.7.2025.08.21.13.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:36 -0700 (PDT)
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
Subject: [PATCH RFC 32/35] mm/gup: drop nth_page() usage in unpin_user_page_range_dirty_lock()
Date: Thu, 21 Aug 2025 22:06:58 +0200
Message-ID: <20250821200701.1329277-33-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mFWGoFB9QdJ8jH5KXmE5YmFehYO5UEYKJgiqKwzXjgQ_1755806918
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210843_960155_B564C6AC 
X-CRM114-Status: GOOD (  15.75  )
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

There is the concern that unpin_user_page_range_dirty_lock() might do
some weird merging of PFN ranges -- either now or in the future -- such
that PFN range is contiguous but the page range might not be.

Let's sanity-check for that and drop the nth_page() usage.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index f017ff6d7d61a..0a669a766204b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -237,7 +237,7 @@ void folio_add_pin(struct folio *folio)
 static inline struct folio *gup_folio_range_next(struct page *start,
 		unsigned long npages, unsigned long i, unsigned int *ntails)
 {
-	struct page *next = nth_page(start, i);
+	struct page *next = start + i;
 	struct folio *folio = page_folio(next);
 	unsigned int nr = 1;
 
@@ -342,6 +342,9 @@ EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
  * "gup-pinned page range" refers to a range of pages that has had one of the
  * pin_user_pages() variants called on that page.
  *
+ * The page range must be truly contiguous: the page range corresponds
+ * to a contiguous PFN range and all pages can be iterated naturally.
+ *
  * For the page ranges defined by [page .. page+npages], make that range (or
  * its head pages, if a compound page) dirty, if @make_dirty is true, and if the
  * page range was previously listed as clean.
@@ -359,6 +362,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 	struct folio *folio;
 	unsigned int nr;
 
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, npages));
+
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
 		if (make_dirty && !folio_test_dirty(folio)) {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
