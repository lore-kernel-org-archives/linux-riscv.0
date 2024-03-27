Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79CEC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLh8A+xDcp+CSOEy45Lw5OWa17fp9NedIygzPyqhlSA=; b=hqKq8C/TMdOdLi
	vZ9UoL37sWBhXYsPnklic8ymC+q5LS6f3J3qnNS1Jf9Lxfqp9z0JUd8UXGhAg0Poz2K1C4xBM/65w
	1UZLcz3xUlWUupiWCVlFyzT/pxMcKpC5Q5Iq1a1Zmlu0w5016lVZRgeMPfFtftlwdhIwG9dse7MRt
	L+SuOG0SLXy8B8/JxIlwLRVQ6Mm2f/QajRMavWxvIPK2vi6dF/e4BY6hRKk94jgxfqNhFRycQGpY3
	gUA03aKhQmIwtmt7P0qgtSaj+n2OGHD0lfGcvik1uS/GSuGfQFcZnkzyMg9fnNdoDRddnp0qe6Fbl
	YDX7M/OdiNjKBtvWG6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8c-00000009lo6-2zlG;
	Wed, 27 Mar 2024 15:24:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV82-00000009lKK-0kxE
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkfUQlJiw2YmDi669w4oXgCkjfbnGDZMVpc2LJneNK4=;
	b=AVsJQ3oxZori/0jbiU/hEUHGTPyOIfF2KtXrxRs+X9qPY6bpKKg3pU3mS80iG+/rUMPxLq
	aQKTRNxV677HRcYDhyG05TlV3K7yqcgzl97J0robQAfWSrJEq7Qlz53NpFNy5DqVt8zadu
	G+7oNcVo6BMi+6axzYrp57Fo5oxz+yY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-JGIiTBSDOVCpjxwsl8XamA-1; Wed, 27 Mar 2024 11:23:47 -0400
X-MC-Unique: JGIiTBSDOVCpjxwsl8XamA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-690c19ee50bso2421816d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553027; x=1712157827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkfUQlJiw2YmDi669w4oXgCkjfbnGDZMVpc2LJneNK4=;
        b=MvwvRG/0h1JQdD3rMBnBRO4QLNe8ibPMpSBMkoWPFkDJ5daRKtudL8qyp7F/QYsQu7
         wPUZCfotSwYQ8aN4BX/UtY7rgyIUUYU47+ZWzatfTHFp5+XtQQj6g945ujMVm0lp85iw
         QW8f35hzMFfrfNtMZgMxizxnJ0HmnLO9ZSSWCnYsd00f+NV5s14aeqCOTW4qrIbxi2up
         b63plXAiw7AMaAMBloIdZHbIXw+PK8L0/LqpDYF+M7QqW9wBg5ALPHjRCL3F5O0EGqbQ
         Peh8uiXmZdceoI0ZGcroKJSsT4Cb5Qa9TDmfNPCynbbkv/+uJjAsmPZU8MNNBHXqLk/u
         vblw==
X-Forwarded-Encrypted: i=1; AJvYcCX77QGN711OUJjXtMiuuJDLo5/ju3WLxapSjEyqi3ncpXeptUAx2ZzZf7vpJ+ATmhb1cmrE6iVE9PiXpdQA02vk0LgCszfS/RZcUw/f+1bA
X-Gm-Message-State: AOJu0YwXhNJa1Ln7dBYPld/JRVKl800jT+Vucf+3pLQgY6GWiIsm7jHs
	zaJoovJvfB0HesTBnzg6WqCW1RlTNViHqUyi+Pm8UBkXmY1/syU0aPHaM5fVdIWUIeD+KaZczwv
	eTaxPiNNwobROKBAa78I3ZMYa8vMHMJKfVYZxH39IOxygeeFbOwpxkkXy+aAj38O6vA==
X-Received: by 2002:a05:6214:3105:b0:696:6f59:4d19 with SMTP id ks5-20020a056214310500b006966f594d19mr14917309qvb.1.1711553026951;
        Wed, 27 Mar 2024 08:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/cvaZbNzejgmgOgxRck5pBSr/g3hsLSZETHWpBhBPVR+VZkVf7lYhXdSr9+e3t1xSA2Wfog==
X-Received: by 2002:a05:6214:3105:b0:696:6f59:4d19 with SMTP id ks5-20020a056214310500b006966f594d19mr14917279qvb.1.1711553026413;
        Wed, 27 Mar 2024 08:23:46 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:45 -0700 (PDT)
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
Subject: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Date: Wed, 27 Mar 2024 11:23:24 -0400
Message-ID: <20240327152332.950956-6-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_082350_445291_D05517D5 
X-CRM114-Status: GOOD (  12.61  )
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

The comment in the code explains the reasons.  We took a different approach
comparing to pmd_pfn() by providing a fallback function.

Another option is to provide some lower level config options (compare to
HUGETLB_PAGE or THP) to identify which layer an arch can support for such
huge mappings.  However that can be an overkill.

Cc: Mike Rapoport (IBM) <rppt@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/riscv/include/asm/pgtable.h    |  1 +
 arch/s390/include/asm/pgtable.h     |  1 +
 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/x86/include/asm/pgtable.h      |  1 +
 include/linux/pgtable.h             | 10 ++++++++++
 5 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 20242402fc11..0ca28cc8e3fa 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -646,6 +646,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
 
 #define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 1a71cb19c089..6cbbe473f680 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1414,6 +1414,7 @@ static inline unsigned long pud_deref(pud_t pud)
 	return (unsigned long)__va(pud_val(pud) & origin_mask);
 }
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	return __pa(pud_deref(pud)) >> PAGE_SHIFT;
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 4d1bafaba942..26efc9bb644a 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -875,6 +875,7 @@ static inline bool pud_leaf(pud_t pud)
 	return pte_val(pte) & _PAGE_PMD_HUGE;
 }
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	pte_t pte = __pte(pud_val(pud));
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index cefc7a84f7a4..273f7557218c 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -234,6 +234,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
 	return (pfn & pmd_pfn_mask(pmd)) >> PAGE_SHIFT;
 }
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	phys_addr_t pfn = pud_val(pud);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 600e17d03659..75fe309a4e10 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1817,6 +1817,16 @@ typedef unsigned int pgtbl_mod_mask;
 #define pte_leaf_size(x) PAGE_SIZE
 #endif
 
+/*
+ * We always define pmd_pfn for all archs as it's used in lots of generic
+ * code.  Now it happens too for pud_pfn (and can happen for larger
+ * mappings too in the future; we're not there yet).  Instead of defining
+ * it for all archs (like pmd_pfn), provide a fallback.
+ */
+#ifndef pud_pfn
+#define pud_pfn(x) ({ BUILD_BUG(); 0; })
+#endif
+
 /*
  * Some architectures have MMUs that are configurable or selectable at boot
  * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
