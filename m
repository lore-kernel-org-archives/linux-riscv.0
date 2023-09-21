Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033FE71094
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNIybESvQYuVj63Z/Rt23536s411/rWQTAlXvKV+hdI=; b=wRXt90ULn6tQvw
	bd9bX6n9YVEpAC0OEG5zDYBWLm3QJWx5Klpg0ERZ5NdCmFJskMD2LwxY98LJmY+IbJuwQ4oURf/iq
	bH8mrdOWzgJRSWMl4zzqAUzD7PyM+ZwigKXTvxhFzvc+EH264qL/U76i4CEQY+Oa3+1CIJBqH+Eyx
	53n17IZAH16Iv+C7ZEp/wcxrnPS3bGMUJxfdHMDMFzY1Fynz6HYWUs3jm3GBd326QqHiCrEbNydBM
	UwVWjU9RaB6mvU/c+C1AJ9bfgbNK3MlaBls1Qv/8T3ZuvJV7mW8iH5WgMIyGYJt5VZ3+h/39wVIAD
	98f4yASEoEBfPY+CvKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMQH-006Ulr-02;
	Thu, 21 Sep 2023 16:21:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMQ3-006Uh8-0k;
	Thu, 21 Sep 2023 16:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vypF7oeKU3Uje4sDoCk7NF4kdS/Y+VzjMg+SzT44ILc=; b=qghikm4bp6vRvNOf2Yi17Pp95E
	Sejp+GNezKYU6siUi5mxDE0ZxvTNiReGSh57ER4xTH/C1vCyzkln16Nt0yOiiJBw+2KBZyaIzJklU
	/UQQnjp3Jxg1lsCE9l75qgtCs3cSUXjYlkWdelYWT+k7X3nnvUm62eNpsraXF1viIKc7Xljvum45O
	hNngITB9YqAwlnsYrAC+I8F2x/6J4egRNonz7a6WsK3IXu8C58d3qj6+6R07WaJik8s5adfdgKZqK
	oeXGnY7OsamO0op0piRFiDCWlzbHGT6G1T0fmhoXRa29whs0mG57xZjKzqxev6oM77XdzIE90iNAU
	TlTARDDg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPx-00FUej-1c;
	Thu, 21 Sep 2023 16:20:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75302175A;
	Thu, 21 Sep 2023 09:21:19 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09E233F59C;
	Thu, 21 Sep 2023 09:20:37 -0700 (PDT)
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
Subject: [PATCH v1 4/8] s390: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:03 +0100
Message-Id: <20230921162007.1630149-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_172043_371600_B78B4DF5 
X-CRM114-Status: GOOD (  12.30  )
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

This commit makes the required s390 modifications. Separate commits
update the other arches and core code, before the actual bug is fixed in
arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/s390/include/asm/hugetlb.h | 8 +++++---
 arch/s390/mm/hugetlbpage.c      | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index f07267875a19..da7f43b1871f 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -15,7 +15,9 @@
 #define hugetlb_free_pgd_range			free_pgd_range
 #define hugepages_supported()			(MACHINE_HAS_EDAT1)
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
+		     pte_t *ptep, pte_t pte);
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte);
 pte_t huge_ptep_get(pte_t *ptep);
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
@@ -65,7 +67,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	int changed = !pte_same(huge_ptep_get(ptep), pte);
 	if (changed) {
 		huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
-		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
 	}
 	return changed;
 }
@@ -74,7 +76,7 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 					   unsigned long addr, pte_t *ptep)
 {
 	pte_t pte = huge_ptep_get_and_clear(mm, addr, ptep);
-	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
+	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
 }
 
 static inline pte_t mk_huge_pte(struct page *page, pgprot_t pgprot)
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index c718f2a0de94..d69e2dc6e508 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -142,7 +142,7 @@ static void clear_huge_pte_skeys(struct mm_struct *mm, unsigned long rste)
 		__storage_key_init_range(paddr, paddr + size - 1);
 }
 
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte)
 {
 	unsigned long rste;
@@ -163,6 +163,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	set_pte(ptep, __pte(rste));
 }
 
+void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
+		     pte_t *ptep, pte_t pte)
+{
+	__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+}
+
 pte_t huge_ptep_get(pte_t *ptep)
 {
 	return __rste_to_pte(pte_val(*ptep));
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
