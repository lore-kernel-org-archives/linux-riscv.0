Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB04C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32lMYT/tj5oFzJE3dUzyGVyfHPm3/WlySNZXiq6Q4W0=; b=CqLMQgHhnrKoQh
	+zEmaGJitd6fs5zW3UIsY04oZpUSKbdcV24mw3P9mgQtI77d82QZzkGnuuFuSPjGkbH+jwVPpIsNY
	+DwsnZb97ykrdtqv5BLlTHiD80S5XUCUmCwN9Kg9WN6MsEFoiMS2HaMTikEGXe+3TueXQAproAg9e
	xxcKCSVq396tPVrhOdvGjM0bR8DoKJG8ANfzrfWnIX1r74B6+dfQRPKyoF7E859E1ZGEwwS4wLk0H
	Sx9xwvVgYJfRpixO+SV1yUrl0S9cB5ALeQ8UZng8pmdInJbbNN6EM1Snf9dMPLGLx3Pa36NhEZtiB
	A1HoeihGLjB62JjDPLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV86-00000009lPK-0t2c;
	Wed, 27 Mar 2024 15:23:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV7x-00000009lFC-0QSO
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DKy2rskdC2Yvy4b+7pXCefd1yMSUUO/lg/gxYCRDGA=;
	b=HkL6HdFudmHPYI0SRUc12MVWwkkzPc3uYl4T7jXedqkDXA+b0Kq+UBVj670S/In+fugDhj
	nhtF02jGFeQb4+eTsM98bZjgZlI5QQvdna94QDvkKB0qvRcCGV7mBmB80e7li0vUQx2d08
	ldrt45S3QBPR0JQoWklJMQjsd8YWKdg=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-cYDEYGHlOT6TxBi0oMLYBw-1; Wed, 27 Mar 2024 11:23:41 -0400
X-MC-Unique: cYDEYGHlOT6TxBi0oMLYBw-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c22fa01f9dso321880b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553020; x=1712157820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DKy2rskdC2Yvy4b+7pXCefd1yMSUUO/lg/gxYCRDGA=;
        b=LyTtlBgGFCZo4LzPtBX5SfGsAbPbG/Y5EQn339LqDzPHeVadKGGujyD1pttu6gVdii
         PduYmV5LhhFK01fO5sNatJHNmNpAsTUiDw5dkERjgnPvtjOY6xDxVaxrxx+NfRcf2jkD
         d66gevde9I6rK8Y2Eb+7mcLdvzG7uS+jlMYuyzyGeUHxCijkKD6Mf4yRBcmMS7F/sS2w
         wgYZ4hZP9SXJUdy5TMlMb9+ZBLU7MZVxuw5rvoV8CRkg53pZ0x8vA25DNSJIA3vAcBxJ
         1gwyVLPJJAx+SPJy26vDfkgYw8WLEElRnWOiGcIYLs+1fgzTA5OY/822OcvyKwqhK5Nq
         7piA==
X-Forwarded-Encrypted: i=1; AJvYcCWa54ti9Y6W9jrh6P2douti/jKidD6E795+CplFEWnZARflTy4L56L6svN2wuwv7yigxAaL+kjRkNGHMJz7+Pa9GLnMxDZrQZw+4pDIDqjK
X-Gm-Message-State: AOJu0YzyZJMJ0UOjwx3t4m9vqclKBnnH0YUP2EluseJrMxAzjbgHME5v
	35Iu1iZcOa4WcF2oSTHdZ9zwQiq1rdKhq3Y1k4XCNRriZaDTF+jiEHuAQ+YH8LYJByrpO+1gAbp
	wTzScf/MAq92Pr3HiMkCTrFGifWoaQsr9XALyaFRmuX22YAegl+7DeOCMNbFIhlGkWg==
X-Received: by 2002:a05:6808:1814:b0:3c3:d28a:b1a8 with SMTP id bh20-20020a056808181400b003c3d28ab1a8mr370353oib.0.1711553020024;
        Wed, 27 Mar 2024 08:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUSCRMAKzeIW51sHYtQ4kGfBJ1LCcy7xm5bPm4kr5W7dAQlFQDGhJMDaaF/OcaFnro9iqkpQ==
X-Received: by 2002:a05:6808:1814:b0:3c3:d28a:b1a8 with SMTP id bh20-20020a056808181400b003c3d28ab1a8mr370311oib.0.1711553019443;
        Wed, 27 Mar 2024 08:23:39 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:38 -0700 (PDT)
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
Subject: [PATCH v4 02/13] mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
Date: Wed, 27 Mar 2024 11:23:21 -0400
Message-ID: <20240327152332.950956-3-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_082345_382841_E6E4C11C 
X-CRM114-Status: GOOD (  11.93  )
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

It will be used outside hugetlb.c soon.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h | 9 +++++++++
 mm/hugetlb.c            | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index d748628efc5e..294c78b3549f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -174,6 +174,9 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx);
 
 pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, pud_t *pud);
+bool hugetlbfs_pagecache_present(struct hstate *h,
+				 struct vm_area_struct *vma,
+				 unsigned long address);
 
 struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage);
 
@@ -1228,6 +1231,12 @@ static inline void hugetlb_register_node(struct node *node)
 static inline void hugetlb_unregister_node(struct node *node)
 {
 }
+
+static inline bool hugetlbfs_pagecache_present(
+    struct hstate *h, struct vm_area_struct *vma, unsigned long address)
+{
+	return false;
+}
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f9640a81226e..65b9c9a48fd2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6110,8 +6110,8 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 /*
  * Return whether there is a pagecache page to back given address within VMA.
  */
-static bool hugetlbfs_pagecache_present(struct hstate *h,
-			struct vm_area_struct *vma, unsigned long address)
+bool hugetlbfs_pagecache_present(struct hstate *h,
+				 struct vm_area_struct *vma, unsigned long address)
 {
 	struct address_space *mapping = vma->vm_file->f_mapping;
 	pgoff_t idx = linear_page_index(vma, address);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
