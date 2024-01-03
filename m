Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE163C47074
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ft8s7RsFN4RVpoy+L494LgybuvjCR9ALKQbkAdmItso=; b=CSpe4h8CfiB2a0
	vM5AEIJYaBsafKcWNLRb0tIEjUKbjys364C7+nk//CCuVWWQfkxUFlJfu1yHKPOQzFsQo5ejQRHCm
	GnWql+iNNu6Z5Kx3TGIvKLB+5xHRaAmTpte7UlPPIjCpJwpVoOcYocMS1Ov2bHXTC2AgWCnLZAjG3
	wQLv07kEd5rZcPVQi1G8vGmipyMHI7Q7FQ8xWXqcaT6QOqwcAeHxquuSIsY1rmhXxZ0EG0mnJ1c0+
	4KYeFmdbeM22YhhZr4RjBrgxLYc3pBrmf/LdLcuDEVS7wi4Llo/XuEMrmo07kGKOnQUwtGkeBYQtR
	ExmojTm2jYX88Z9tViwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxLc-00ABFN-2Z;
	Wed, 03 Jan 2024 09:15:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKxLa-00ABD8-1M
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 09:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8fO7lBnC9by3RspplJseWzRvj3+WjzIcx8hEKl7Z7Y=;
	b=S0QepVL3cUuOd0GlvCoJcwvjvYaDqL7Q3XyL2bA3U33zjBhe75F2IzCtxaww0tWxwEI4kV
	sYhQdHCHav00GQ8ywiSMIrFKBApagMw7rTKQk73DnByYlSoQrSebDhy7ax0bO7n5nY6nQ6
	Smz0w5QlZRTPFaNm/m0lmBELEVphsdk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-l-IHSWebO-mu9VTGyPcb0Q-1; Wed, 03 Jan 2024 04:15:30 -0500
X-MC-Unique: l-IHSWebO-mu9VTGyPcb0Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFB6887DC01;
	Wed,  3 Jan 2024 09:15:28 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F290492BE6;
	Wed,  3 Jan 2024 09:15:16 +0000 (UTC)
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
Subject: [PATCH v2 04/13] mm: Make HPAGE_PXD_* macros even if !THP
Date: Wed,  3 Jan 2024 17:14:14 +0800
Message-ID: <20240103091423.400294-5-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
References: <20240103091423.400294-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_011534_551793_3EC6044A 
X-CRM114-Status: GOOD (  12.76  )
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
code.  Move them out and define them even if !THP.

We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
Reorganize these macros.

Reviewed-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 5adb86af35fc..96bd4b5d027e 100644
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
@@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define HPAGE_PMD_SHIFT PMD_SHIFT
 #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
+#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 
 #define HPAGE_PUD_SHIFT PUD_SHIFT
 #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
 #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
+#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 extern unsigned long transparent_hugepage_flags;
 extern unsigned long huge_anon_orders_always;
@@ -377,13 +379,6 @@ static inline bool thp_migration_supported(void)
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
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
