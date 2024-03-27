Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA7CD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAvtCBq7FnzsJpxaasNC/NEBsPpyeIqmt2wgHaAZyrw=; b=WXHrIDFFsH8Q5I
	KjXRcmTweLeCOsNhlhWDH6qzVw95noBakBusMzWV/LyYvv95lUjn04v2XAcldM/RiHO+AB81ImQhN
	zrdkD3heoWHTJ17bJnAau2ItXq38/mn3W9qMG66gPSZc8JiIm1KfevfjJeqc+GEesLTLoVC84uqmu
	8Hdu3EqVy8i0TK8Ig0saoHNpCt044FNgAwnyRr2aubcfVR6H8JHhSrEMrqANeSCDIUfgIkvhyupP7
	uvlDZwnlxbhs/FHKUgWwYx0Q85KvH9qAyzjKCtXQIJn40wAx6PTtpTkICB5+VUDrqvCyHjsn7ABHl
	Figh72ILTH7J8lFK3AKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV84-00000009lMb-0LuT;
	Wed, 27 Mar 2024 15:23:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV7x-00000009lFD-0d8R
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/g69WjpU0rXeMHNQq0wHJ20ikWbVhFRACidICzEeTCE=;
	b=bkvBedbze8RVNVsEW+6xD5cM6TwuRhHYlCAAPcieiEM5mVWDPZ/MUSSoZ8et5+FudChwbr
	ll8o6EhgzahcYrgnrDilfqGB8eYJn6ogSYlPOLu6QF06a32wzXjE5AWzt5YD7LGKMXIRWl
	rFOHvUuSH01eEIpR8piDboLY6uhQGGs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-OJjPV9kzOn6hy-Jb7_BvCg-1; Wed, 27 Mar 2024 11:23:42 -0400
X-MC-Unique: OJjPV9kzOn6hy-Jb7_BvCg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-696a5972507so4145696d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553022; x=1712157822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g69WjpU0rXeMHNQq0wHJ20ikWbVhFRACidICzEeTCE=;
        b=XoPsAGOyFdynO37rJnzJ9MVfKDtROa6nfLPKpz5hX+X4aTxxvIid++yBYZnWUt5cZo
         PhO18h/VxP1l25nP28Vmsa2DA58P+RjQ6hKeh+rRtGKWxRd0Z7KFkcODP6YZpnWLb02v
         ELG3tTbU2NIEOohiGMuh0J0ZIa8yy8jS4RVk4sDByrdxuRrvAn+7Jin8s90d3hGAE0uh
         Nrq/sh/+0a5bA040G6KxL19nN0rVcCpNP08WpCQJDLOi2vL0OHX8OwLFCYjBTAj0zJOp
         36PTqqKpwZ2Dc5te33q/9+4kJ3E+1CJVvHJ2H9sS3uXBqzO7kVuLM3f/qct9YM0ZcIm6
         pTGA==
X-Forwarded-Encrypted: i=1; AJvYcCWjej2mqdeeU9HZ1A6gVDmaVBFZMxqiZ8GOWC9kLzjs4ghKhxge5G9xpyBeVFC9BkBHLpHTrlp2y1LxMpF38sdvqpTSn67I696MfCSzIQjj
X-Gm-Message-State: AOJu0YzzEDD2MUOZa9R4tUV9+GwHYcCf2fsn8WxDLHG7jgKH/keF5DNS
	anV8TpYQzKb9FQyPDvVLKrDfHdLRHAISrHDgpwWzwHarYpNSWhgxUdK6Ohu8XWRb+KYuYqTn081
	rE68Pm+PtqNB+4+p+UqU3tOeUrozVYMpQtVnCp8izADbl1FPUgm5AE9/3oWO/Xerv9g==
X-Received: by 2002:a05:6214:3187:b0:691:456f:415a with SMTP id lb7-20020a056214318700b00691456f415amr14772454qvb.4.1711553022242;
        Wed, 27 Mar 2024 08:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwFABTpt0oYC5XP41rgqaavJwjTuxekGLogedD16Vy17R/DxfwS2XqF10qrZ+lSq8ZmFvRzQ==
X-Received: by 2002:a05:6214:3187:b0:691:456f:415a with SMTP id lb7-20020a056214318700b00691456f415amr14772425qvb.4.1711553021719;
        Wed, 27 Mar 2024 08:23:41 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:40 -0700 (PDT)
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
Subject: [PATCH v4 03/13] mm: Make HPAGE_PXD_* macros even if !THP
Date: Wed, 27 Mar 2024 11:23:22 -0400
Message-ID: <20240327152332.950956-4-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_082345_374127_74AC2258 
X-CRM114-Status: GOOD (  11.85  )
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

These macros can be helpful when we plan to merge hugetlb code into generic
code.  Move them out and define them as long as PGTABLE_HAS_HUGE_LEAVES is
selected, because there are systems that only define HUGETLB_PAGE not THP.

One note here is HPAGE_PMD_SHIFT must be defined even if PMD_SHIFT is not
defined (e.g. !CONFIG_MMU case); it (or in other forms, like HPAGE_PMD_NR)
is already used in lots of common codes without ifdef guards.  Use the old
trick to let complations work.

Here we only need to differenciate HPAGE_PXD_SHIFT definitions. All the
rest macros will be defined based on it.  When at it, move HPAGE_PMD_NR /
HPAGE_PMD_ORDER over together.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 7576025db55d..d3bb25c39482 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
 				  enum transparent_hugepage_flag flag);
 extern struct kobj_attribute shmem_enabled_attr;
 
-#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
-#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
-
 /*
  * Mask of all large folio orders supported for anonymous THP; all orders up to
  * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
@@ -87,14 +84,25 @@ extern struct kobj_attribute shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 #define HPAGE_PMD_SHIFT PMD_SHIFT
-#define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
+#define HPAGE_PUD_SHIFT PUD_SHIFT
+#else
+#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
+#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
+#endif
+
+#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
+#define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
 
-#define HPAGE_PUD_SHIFT PUD_SHIFT
-#define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
+#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
 #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
+#define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 extern unsigned long transparent_hugepage_flags;
 extern unsigned long huge_anon_orders_always;
@@ -377,13 +385,6 @@ static inline bool thp_migration_supported(void)
 }
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
-#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
-#define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
-#define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
-
-#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
-#define HPAGE_PUD_MASK ({ BUILD_BUG(); 0; })
-#define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
 
 static inline bool folio_test_pmd_mappable(struct folio *folio)
 {
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
