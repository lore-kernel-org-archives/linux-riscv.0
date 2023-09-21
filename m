Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F5DE7D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faFx6n9DFiUHhtn1ezXHaWOzoMYUg5JcZi2xZKaesMU=; b=fCdu/pg2UxOHOw
	4A5acTgZu5Jne5i4gqldx0o/Y/2LGU3YYVHDj6UOknT4gxHvgIxUBGVspgtInKo+1W+G4ukwDVIMN
	llXAdrqNHuxPJmpPQf4i2lg8A7KHY/H6PyL1kLFiOta+6ZZkvP8cUhVzPYj5Vi24GE0USqNuD5xJd
	ew/uk8GtA9U2+XYAClQXcsXnFQJBmT42yraNtQnoKjmE9YGOuYEEAuK1GcVB8caVuFEwFf/9mTALR
	rRlJ7THIFBxtnPYRV5MecbBXwSeCAHpuKkTT7FcGiG4O1jWCUbYqzcHMwNhT+PpZJytnFNIBoQPh4
	t88WjceCBBNkkYSkKuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNWB-006es8-0q;
	Thu, 21 Sep 2023 17:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPu-006Ue0-1D;
	Thu, 21 Sep 2023 16:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5xwQSctMmYFo12y5XzlJUTq3tE56VCa/T5pbiR1D+lI=; b=NjijmveB9v+um7fjZHi+gD/L5b
	AZp7k8gqe4P3WFtq/csNM9fAcMFDdw+rUg1L7xHjrICLNeyhfPy0AoRm8U3j/d8CvE+qy6WNnrTjW
	iQh1CT2ndl07K4j6kYzSl2aDhCOOiLs+eTPsYZQKNnCxxTpuLQcutKOlsrMeXh9geEOee6huA9CmX
	1OodACcoDYSiAAWHTduWgTL5Ufw7atHAHDBDTyhr5C3beAlfNrF2R/LIi5IdIArP5TAmfFk9WJqGI
	v9Wlgwws6AOJKmrTuVbCrpgWw6FAGQuinzQYqfhHWUlMk42ELDqH/zBySDeGbnpdx+UOdAorXSeF8
	wiw8RWpQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPp-00FUe7-2C;
	Thu, 21 Sep 2023 16:20:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735E21756;
	Thu, 21 Sep 2023 09:21:10 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07CC83F59C;
	Thu, 21 Sep 2023 09:20:28 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:01 +0100
Message-Id: <20230921162007.1630149-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_172035_569528_3DFFB027 
X-CRM114-Status: GOOD (  13.39  )
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

In order to fix a bug, arm64 needs access to the vma inside it's
implementation of set_huge_pte_at(). Provide for this by converting the
mm parameter to be a vma. Any implementations that require the mm can
access it via vma->vm_mm.

This commit makes the required powerpc modifications. Separate commits
update the other arches and core code, before the actual bug is fixed in
arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h | 3 ++-
 arch/powerpc/mm/book3s64/hugetlbpage.c           | 2 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c     | 2 +-
 arch/powerpc/mm/nohash/8xx.c                     | 2 +-
 arch/powerpc/mm/pgtable.c                        | 7 ++++++-
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index de092b04ee1a..fff8cd726bc7 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -46,7 +46,8 @@ static inline int check_and_get_huge_psize(int shift)
 }
 
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep, pte_t pte);
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
 
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index 3bc0eb21b2a0..ae7fd7c90eb8 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -147,7 +147,7 @@ void huge_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr
 	if (radix_enabled())
 		return radix__huge_ptep_modify_prot_commit(vma, addr, ptep,
 							   old_pte, pte);
-	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+	set_huge_pte_at(vma, addr, ptep, pte);
 }
 
 void __init hugetlbpage_init_defaultsize(void)
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index 17075c78d4bc..7cd40a334c3a 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -58,5 +58,5 @@ void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 	    atomic_read(&mm->context.copros) > 0)
 		radix__flush_hugetlb_page(vma, addr);
 
-	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+	set_huge_pte_at(vma, addr, ptep, pte);
 }
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index dbbfe897455d..650a7a8496b6 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -91,7 +91,7 @@ static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
 	if (new && WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
 		return -EINVAL;
 
-	set_huge_pte_at(&init_mm, va, ptep, pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)));
+	__set_huge_pte_at(&init_mm, va, ptep, pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)));
 
 	return 0;
 }
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 3f86fd217690..9cbcb561a4d8 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -288,7 +288,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 }
 
 #if defined(CONFIG_PPC_8xx)
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
 {
 	pmd_t *pmd = pmd_off(mm, addr);
 	pte_basic_t val;
@@ -310,6 +310,11 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
 	for (i = 0; i < num; i++, entry++, val += SZ_4K)
 		*entry = val;
 }
+
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+}
 #endif
 #endif /* CONFIG_HUGETLB_PAGE */
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
