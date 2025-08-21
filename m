Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BBCA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B09Wt7EFYxai29dqDf+ur2rhtXESYN52cygbs8SEQ0=; b=v4ThynTh1AK0hy
	iUM/Gpw/NUT6fOdy9BcA+nJpvtpR0z44Ts820IHclI8OLAptHyEAu0wIrmbTVNEHK9VPAxUoITRKJ
	zo85SS9Ss5WG6KE+8NyccZB4wDT9seIRsLPqEqkiKVa2rzp56TbgUVygy3t7Gc5Ft9Z53AHpLzTeb
	9C5wXHSCG3rimtpyzS0wBDpxUQ4Ao8ob1fOZrb4PqauXI7KlFgnYUf2+3D4QKTzhkpI4nEPh2KFl4
	F5ta2JCeV2bPjon6srlcjo3ksBLIQtZQO5uJxKWKNLscKgN4w9XTfwMJe04blkTwBi0KfvuXwG6rB
	ZShcDuyltOokPIiLMw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcb-000000011by-0Lwx;
	Fri, 22 Aug 2025 00:27:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZh-00000000Nhn-05Ce
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
	b=U3k26lLojuRdCNgBwR1ZihkwkQjaEy8RQeTcjK1Z/GA3kx55Nm4vezg5ze72xWvFL2/0rS
	/3Lthet/wOUxegobDiOpW9bNNfn6tYj/R/dbQhLBvzN2p+BuvdEPDz+1b7dLs5SI6gUXg1
	G9ZEvz7H8hS51IH1Xw+Og7FGegbk1oA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-0vT0UlJ6M4yTIpKZP9q89Q-1; Thu, 21 Aug 2025 16:07:50 -0400
X-MC-Unique: 0vT0UlJ6M4yTIpKZP9q89Q-1
X-Mimecast-MFC-AGG-ID: 0vT0UlJ6M4yTIpKZP9q89Q_1755806869
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0514a5so6771445e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806869; x=1756411669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzMWVCGQW0mP4+/ULAfe7CdOmgWkAKLnoxAB4Fy092E=;
        b=CiubSVLdwFg9fApkiF7TYPUtMtNhrwo3CLvXvW8KD4GMSv2DpIxP3nyqmjVVMihKHx
         /oX8jYceh0AZVhJneuO+z1b7LJ6NJpy0V7cTQ//aSLMAP11yVzitqL12yCgHnPvAaJQB
         mJjIjSrnlDCKKl1Nh+bwUQK6N95lWMJDUqS+0AR+bED4ATKcMbZ42sSsbDZZ0Z0qPDiL
         cxUMgjq1anOQfd5/N1Ades1t+8uE4SYrilVnUmEjnfXk663lxPP056FGNYNOpB1ACfdD
         kHmi9MyT+Kjb4PU2EROIowkTzfdagIDonCUIU2hQACFvKIunDz+0r55M+Y7lTaWSJDy4
         vhOw==
X-Forwarded-Encrypted: i=1; AJvYcCXpEUBMDlhtnknuwEukvbkUrwFyvzDO9qqPF8/k07ZV4pXentxtqx+HWO5DYZ7THi/FWY3XE19nZ36S7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdRyZ8f/2XPPMi9s1UnUgIQmEtsFLpj2vYNiCM538noKSzOs6X
	LK+cNvGsWIMv8vvxkdvkzDNhVP7v2DkaLPb9pPDK5coorQSCS1o9o1i3bFF7FiPIJ23D6i52bNu
	KwsSUD9NuOGHisQ9QXgmAQu9WpWscIUSvaE4OtFy7sj7jzBTRKeAnF257NX3paLEzu7zQuQ==
X-Gm-Gg: ASbGncs/wZ5eXLm6UELG4yTh5F0KyQbUDvv9Y7AiH56GlYJGEIuqJUyK1AZ+NOmyR5U
	Ifze9WTaJ1FSAEFUHHroyB1PaVvfbFBmqcJGr3qgG+IaF9Q9alxl/R4tL9Tu6LUvHef++AZ/DaA
	+i3JBJIZ4c2yZ4OIEHfIwMvUT2SeWlwnWZVkEVN8cN/ld69i2I56mSw13atumOam8+KFhLDOH4q
	vg+K4EFkEsQY29yTRbDLtp32xpeR+iyj4boGhtQNIp73nuBXIryggFlwE+xkk+xfrOIaj8C0Dbv
	E2RHg0qGrulFIR1VBs0LYYgi7vcf7ixIoBAMkayZl1BTBJ7lU2Mwvgp0Lq+aiLFKWO+s+mutn8l
	WfmPpfeBxgxofrFdUYXGEzA==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3c5dcff5f3amr167798f8f.59.1755806868894;
        Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCm64ALptQrKyrLlaLt4xJ2vziBy3gZm4Q1WMVX6wnWhr2W2tRcHnZJHBwxpAOnTfL4mKx+A==
X-Received: by 2002:a05:6000:2901:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3c5dcff5f3amr167760f8f.59.1755806868453;
        Thu, 21 Aug 2025 13:07:48 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c5826751d5sm1323274f8f.14.2025.08.21.13.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
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
Subject: [PATCH RFC 15/35] fs: hugetlbfs: remove nth_page() usage within folio in adjust_range_hwpoison()
Date: Thu, 21 Aug 2025 22:06:41 +0200
Message-ID: <20250821200701.1329277-16-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9SKM0iWIj_V3ezFr00BZTzbWN8bCOCgE91Ulm5cHsjE_1755806869
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130753_128513_3C7EEE92 
X-CRM114-Status: GOOD (  15.27  )
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

The nth_page() is not really required anymore, so let's remove it.
While at it, cleanup and simplify the code a bit.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/hugetlbfs/inode.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 34d496a2b7de6..dc981509a7717 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -198,31 +198,22 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 static size_t adjust_range_hwpoison(struct folio *folio, size_t offset,
 		size_t bytes)
 {
-	struct page *page;
-	size_t n = 0;
-	size_t res = 0;
+	struct page *page = folio_page(folio, offset / PAGE_SIZE);
+	size_t n, safe_bytes;
 
-	/* First page to start the loop. */
-	page = folio_page(folio, offset / PAGE_SIZE);
 	offset %= PAGE_SIZE;
-	while (1) {
+	for (safe_bytes = 0; safe_bytes < bytes; safe_bytes += n) {
+
 		if (is_raw_hwpoison_page_in_hugepage(page))
 			break;
 
 		/* Safe to read n bytes without touching HWPOISON subpage. */
-		n = min(bytes, (size_t)PAGE_SIZE - offset);
-		res += n;
-		bytes -= n;
-		if (!bytes || !n)
-			break;
-		offset += n;
-		if (offset == PAGE_SIZE) {
-			page = nth_page(page, 1);
-			offset = 0;
-		}
+		n = min(bytes - safe_bytes, (size_t)PAGE_SIZE - offset);
+		offset = 0;
+		page++;
 	}
 
-	return res;
+	return safe_bytes;
 }
 
 /*
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
