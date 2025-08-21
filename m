Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71005CA0FE2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iH/XSxw6FN+w9xNZMYLBpuwvcg4o1YDG/4o01YaX5C4=; b=zh4az+M7lXc7Lf
	CyXI9UdN29dst5Uv3zGrwkbouV8o2fIMN3EE4d7XGtNKOdLxUsb/BYN2M6dET7W1pRFYBAJNTnwma
	+WPtmmUFhnlsf7BGODDl6BZwicrNe3FG0d6zATUIJJc6qbHSIimTrUoFYAxurAdOfhI1q1Rw51bmi
	dBaabdvnAIRI9coB3/dHBLixx54m7LsB6+CNNnocp4EKPkCV69KXQBh+OSeu7XqdjYZM6l3WokBHi
	9iq183J93guFVLBHDHoUbwlmnJ7j0WmX8WYir5lUXn+nDGkHwzqPmHP6OcXC7joqTqTjJUldq1kIN
	lTHamey2bjZt/T3ptNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFui-000000014Bo-0oey;
	Fri, 22 Aug 2025 00:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa7-00000000Nwv-1eLr
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=; b=RywJ54gRl1c1LpaHbN/kGzMtB0
	pf0GspOqzqQCq8l1fOyg1W8ZTiJi338ClnHEHRTz4hKvqqlMjscDevdAq3z8VU1W8LpceKTPcPps+
	EOKEdTLTFAKjK0EycBY1QfvzFlP3zE8+PI6xMyqmE+5qhnftvwQnNi3/LDjcfPwmeTiaR4YuBmqlX
	8p8xeta+wvtxUFqrTX3K+HX/f2V+nBi7Vdrll1K/J4PxXqwFUmZsoESCwNlbgy9Lq7KTC+PNaSLU9
	tkzz3Ao+Se0SewsS2QxousraN8M7JY2yND6E+mWtVGc8wI4njGkKXQ1fLczPFuQsHrD67DUsJG13m
	ZlbcTREw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa3-00000000eyh-1RS5
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
	b=Asgvc2nRe+TJEI/uMByKO0brPcrRkTx89JxKNv/DzB0ld+4mIl0YJFypNHpcqTdk7x3Vbu
	0xnohi5l3C7ieinDW9UAB/Y4J6Pyq6TeJ5iZ2kNUsH1yFrKBwpCY9USfDDICSpbEYpzpOf
	bmBgtmyzF4u/4vr9Pyaua/G5SjzFLjw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
	b=Asgvc2nRe+TJEI/uMByKO0brPcrRkTx89JxKNv/DzB0ld+4mIl0YJFypNHpcqTdk7x3Vbu
	0xnohi5l3C7ieinDW9UAB/Y4J6Pyq6TeJ5iZ2kNUsH1yFrKBwpCY9USfDDICSpbEYpzpOf
	bmBgtmyzF4u/4vr9Pyaua/G5SjzFLjw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Mq8SuITZNXaJDE-IyunRCA-1; Thu, 21 Aug 2025 16:08:13 -0400
X-MC-Unique: Mq8SuITZNXaJDE-IyunRCA-1
X-Mimecast-MFC-AGG-ID: Mq8SuITZNXaJDE-IyunRCA_1755806892
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b05d251so7744115e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806892; x=1756411692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKFS9/TuG2v9AIcAoooIJr3bGKW6zmP0XL+5izT5Y+4=;
        b=iK/56za+nGvvLC/l53teLJmijOf3EJF2r6mw+ggR66MTxAJTOgYAi6dLrlCya4mr9Z
         lNCgVtL5SPKuKt4bw12TbdFWVBMRQ8DWasy+hHWJumBE3K/dCKbv9w+EAs7/1i5Y6v7f
         T2UxVats4aiN2LBthOY8HyphRtkYArPndkR9S9DPLKU/MEY9qFbULn+GV3OLhCwJzV7t
         fhpKNeZ0rVGd4WPcNd8SeeG+MiGQx/YYVC12GBvdCV5/ChRKdrN2HLfLoX0XVf3NcrdC
         As8y1E7V+3XE8Sxx/DV0D5AMKW3+X88LsYz6FcKLIscfORlTlVgl4X2DsxozsYUtCgzG
         IzEA==
X-Forwarded-Encrypted: i=1; AJvYcCXtJXMvPXnce8RCTHD++LnuHrXh60iT73BXgXGK4zrtzJGNp+C9xNi57Ae9q963UL1EQYFuFYb137lEQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRHnbMGlUQUB9LTbZWzV8hg/70C3vHMr0raPBX3AGonThY8e7L
	qHSdKV+mysom4uwnsXpUyKh09oavFdvCVYhDyi/2UOToF2q6igk681SFNDIQJci9xoo+6SO3Wgm
	8ZFWL8EQF6GhSZVlMYpp4rOuVnZeYA5R11rqscgLDC/3OwVBrHIMJ5aBOVnhKmpnxR4yQXg==
X-Gm-Gg: ASbGncssyWY2gKPu4Vvr5DCE58JDQ3+vMFxN3tJ+bzZumrd0Mk58ApmFP5zWKbI4Rt4
	a67RoBLq/g5OjkjZQgf9yU0JMvdMKKoAcFnK9P1ux9JrpOhb9hnD7+5YRScflpw1mQW5dG12K+D
	XkdHtQgOR3cRy+5l9btDXa3wEn7C0ZT4c0B7HZPuULMC1VH4M7YTYni3nzg66R6CCrxxSYcsKSf
	OaqwqQDqzOZNMgg1gM+tNrO24V14asQRgA8IgKDSvsB0BTwavP+8HZvqGRuzpV73Hl9NnLOSW1i
	IXrtsBO/STvGExmlatyAePr3CGGDr8u5vfrTVak9iISWhZzwv404No67iuC1pygWgHexrcG5eBl
	OJv/9NWXee4eFQF6EhVyU7A==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45b517cbee2mr2552575e9.34.1755806891771;
        Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/z26sBz7JGLAktk/cnLNnmvA2KmHoRy5M1TseKC0NpCNohvOWfWbiwnk6fyruz4Gv4BdEig==
X-Received: by 2002:a05:600c:1f1a:b0:45b:43cc:e557 with SMTP id 5b1f17b1804b1-45b517cbee2mr2552235e9.34.1755806891155;
        Thu, 21 Aug 2025 13:08:11 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0748797acsm12277591f8f.10.2025.08.21.13.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:10 -0700 (PDT)
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
Subject: [PATCH RFC 23/35] scatterlist: disallow non-contigous page ranges in a single SG entry
Date: Thu, 21 Aug 2025 22:06:49 +0200
Message-ID: <20250821200701.1329277-24-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YQ3ggBnh6zGFCFgCgUOzemN4BpQkVvz_fyDQFA_81lQ_1755806892
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210815_802822_91B6C950 
X-CRM114-Status: GOOD (  14.72  )
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

The expectation is that there is currently no user that would pass in
non-contigous page ranges: no allocator, not even VMA, will hand these
out.

The only problematic part would be if someone would provide a range
obtained directly from memblock, or manually merge problematic ranges.
If we find such cases, we should fix them to create separate
SG entries.

Let's check in sg_set_page() that this is really the case. No need to
check in sg_set_folio(), as pages in a folio are guaranteed to be
contiguous.

We can now drop the nth_page() usage in sg_page_iter_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/scatterlist.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6f8a4965f9b98..8196949dfc82c 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/bug.h>
 #include <linux/mm.h>
+#include <linux/mm_inline.h>
 #include <asm/io.h>
 
 struct scatterlist {
@@ -158,6 +159,7 @@ static inline void sg_assign_page(struct scatterlist *sg, struct page *page)
 static inline void sg_set_page(struct scatterlist *sg, struct page *page,
 			       unsigned int len, unsigned int offset)
 {
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
 	sg_assign_page(sg, page);
 	sg->offset = offset;
 	sg->length = len;
@@ -600,7 +602,7 @@ void __sg_page_iter_start(struct sg_page_iter *piter,
  */
 static inline struct page *sg_page_iter_page(struct sg_page_iter *piter)
 {
-	return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
+	return sg_page(piter->sg) + piter->sg_pgoffset;
 }
 
 /**
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
