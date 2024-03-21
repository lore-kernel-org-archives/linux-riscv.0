Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3DBCD11BF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gCaR2alkvlkeRRtFYl57iSfcBJvLC0kH2z44UvugW4=; b=EeYEm2QaMOhOii
	mWUgqFK/hgw/dEDuOPrPNOLCRylIIacuSRYbU8VAC9us3GrdzQ6bJCG4ul+JcgFN7aWetEICDaaBh
	L7JC6CEHFqBvf6tnABrUGhnsLwLCc/ITC01TJT4cFMXGsqzaRoV0KK195HBOaLIYapybgf/lkzb8+
	2I+rASfhJjCw2srUEgrvtrAiwiejVQK8RicRn5acwQJAv5c4bJ6ZYsgenCmUb9mVyNamGbnO6iNAQ
	zaAERdl+uN7f7qRR85TT/saNvRNt6m8c/kQh6ehMNgg/zr8XBTM3KCS7R32E5j5606vufmoTQkfny
	2nV6fubeQx/9I83Ornfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaE-00000004qRi-3PB7;
	Thu, 21 Mar 2024 22:08:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa5-00000004qGO-1liD
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jz9rMLZ3uXx9gi3+G5qYwalRYpIGEA6fjYlj3iYlq7A=;
	b=Y5OGlwCohUm85fF8pPE2ItbRk/dkc2xD/b+FM39jWqS9yqFh9RalXOBoTGsVYXywhGziP/
	fn8MLhnjSBgMR81+YDen+oMZ/BiMj5WIOf4l9vDu6Nmy/GS+f0uGoU7QabkNtkQar0CaPs
	hf72RG2rO9AntZdM2JMVAzKF7mrJXKw=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-CJG1rIkzP_WAvGO59ZLq_g-1; Thu, 21 Mar 2024 18:08:10 -0400
X-MC-Unique: CJG1rIkzP_WAvGO59ZLq_g-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4769277a5fbso157084137.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058889; x=1711663689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jz9rMLZ3uXx9gi3+G5qYwalRYpIGEA6fjYlj3iYlq7A=;
        b=npmOEgIyE2XIIOn3Lq9eo/Mf9LhvNptEhCn29dwcY86Iish1NtzjqrfePjivX3LZL/
         C6aZSSut4l7gtJgqFqo/OZ5l9I4T5XdnNU8PaRgPQDmuE0JqtNWEBEqa2eCcyr9DRFdx
         1GW4cigDJWf/NiIX66IILJKiUI8tYWD292AIPHTG+HMU1ft3jFfViiv8XyUajOCFUoAo
         FfY6FOcMNUICdyyaC9juJ7qQq8ZLaQwFKKHt6x2oSsehYzZsRLmUrMoVL/KPV+aRliru
         cMcHvdDzt9sZNPJ2JdyAVJ+1Ier62ufp4no/ciK/evbA0QDY/4AWyogOAjF6R5uihtwj
         0VTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6o13AI7y/AByF9vr962+5FiXvHYXB47SKHgjTer0UMon7I+IWTPdog9v02NRw6/TV+WroenqgS1OX3ozKyE8GirmHpAm10qAD0JMEdYdD
X-Gm-Message-State: AOJu0YyI1/lzA3fifZgjnOrc88kmWj67vxFwqU9ARELO5Y+MhVFYovRf
	DthgNzBQOOP16jAC5L+q33X8xJAOQ5EC3xULOb3eTLnQEUMIDpsA5vLcur4NLKDcmGO1jZ/zcZy
	pzRs9dgwST1tPHPErTWLLTu9jzhl84+gFRDX2jfy/uEQOR/mCIv9oSWtf+WLCwFQgAg==
X-Received: by 2002:a05:6122:6b2:b0:4d3:3a78:60e2 with SMTP id r18-20020a05612206b200b004d33a7860e2mr108409vkq.1.1711058889431;
        Thu, 21 Mar 2024 15:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYDbaW1J9E1O0bYtn9bzXmgf1WJ4RRo+0b7nGhM7jp1NUFRItVBXPR4HtJOs8C30IHezp50w==
X-Received: by 2002:a05:6122:6b2:b0:4d3:3a78:60e2 with SMTP id r18-20020a05612206b200b004d33a7860e2mr108396vkq.1.1711058889030;
        Thu, 21 Mar 2024 15:08:09 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:08 -0700 (PDT)
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
Subject: [PATCH v3 02/12] mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
Date: Thu, 21 Mar 2024 18:07:52 -0400
Message-ID: <20240321220802.679544-3-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150813_607855_7A9FC032 
X-CRM114-Status: GOOD (  11.95  )
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
index 300de33c6fde..52d9efcf1edf 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -174,6 +174,9 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx);
 
 pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, pud_t *pud);
+bool hugetlbfs_pagecache_present(struct hstate *h,
+				 struct vm_area_struct *vma,
+				 unsigned long address);
 
 struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage);
 
@@ -1197,6 +1200,12 @@ static inline void hugetlb_register_node(struct node *node)
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
index 23ef240ba48a..abec04575c89 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6129,8 +6129,8 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
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
