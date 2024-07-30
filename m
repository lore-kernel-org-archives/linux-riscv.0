Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF78C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuYlFh2aqATy3YcM9LNPpdBJwT69rOoP8GpsB9f90ag=; b=gAyRU3U+F/Gy6d
	DXsdC9XUAt/0wL0JIy3m7Ycw7DE0Z5UcKcLJPmyFqpkf7i0EsjbZ7x55JSkWdTqt+jz20V3Wp+fev
	4nqEZEY+xC6GpYibJI5UUG4h57Vz0JegkFGT2LVUFNlJkWUYNDYUNH/pvbZ/XHMFMIHLzlLAblmfw
	QgPU/afzkS2IzPv8ul6GEp5p0CKHh8QDa1JfSqMdiep9y8Te2z1xCv+/0jux1u4+OXq2NaebRMpUH
	kEtWl5T2/k86Tv/Bir1g/j0NRTA1UG1Z+f7goJX2m3vcrAzukqo602Rc1pxJebNkW1zYK4d5dOiDF
	5RiTzRgZDZCTybskhrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgap-0000000Dsfz-0EsB;
	Tue, 30 Jul 2024 06:44:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgai-0000000Dsas-1sV5;
	Tue, 30 Jul 2024 06:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83232CE0E51;
	Tue, 30 Jul 2024 06:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1846C4AF11;
	Tue, 30 Jul 2024 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321848;
	bh=PV8eOJ4vyzS4FxAkaZ5NDLLSz9ktugALPQl2HkO57GQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZEtbsRJnMf7Ux0oUP43wBe2ysz4FoXhhZTuwRiPtnQvwBzcF04hW3I71Xi5W3eYCz
	 vb88N88O7flGQsN6anDDUISBm6/xyE43fRkDhAbxLnCjDlVv82fGw6FotjAYvt6GYX
	 QFHcPrRinsx/+c7KPzDEsLxpolwpWompiMzb0pXGb0blFP07SEq1UyKFHAQv8XC/pa
	 pwgu/eKYgUvwjUgeNQmkj2V0n+sfCR/zx78ePeUsj8CmLWrWcX3OzbvvjpOQap3f7i
	 4IH69bYV6ej5Ph0nh99eBqc8supUb+vBuZOERYMAwubQqITEfEu+UKFYgdgEO9AhVB
	 gqDximJu4aCiQ==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 06/18] mm/thp: convert insert_pfn_pmd and its caller to use ptdesc
Date: Tue, 30 Jul 2024 14:47:00 +0800
Message-ID: <20240730064712.3714387-7-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_234412_876028_0AA9CC46 
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

From: Alex Shi <alexs@kernel.org>

Since we have ptdesc struct now, better to use replace pgtable_t, aka
'struct page *'. It's alaos a preparation for return ptdesc pointer
in pte_alloc_one series function.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/huge_memory.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d86108d81a99..a331d4504d52 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1136,7 +1136,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, pfn_t pfn, pgprot_t prot, bool write,
-		pgtable_t pgtable)
+		struct ptdesc *ptdesc)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
@@ -1166,10 +1166,10 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		entry = maybe_pmd_mkwrite(entry, vma);
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	if (ptdesc) {
+		pgtable_trans_huge_deposit(mm, pmd, ptdesc_page(ptdesc));
 		mm_inc_nr_ptes(mm);
-		pgtable = NULL;
+		ptdesc = NULL;
 	}
 
 	set_pmd_at(mm, addr, pmd, entry);
@@ -1177,8 +1177,8 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 out_unlock:
 	spin_unlock(ptl);
-	if (pgtable)
-		pte_free(mm, pgtable);
+	if (ptdesc)
+		pte_free(mm, ptdesc_page(ptdesc));
 }
 
 /**
@@ -1196,7 +1196,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	unsigned long addr = vmf->address & PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
-	pgtable_t pgtable = NULL;
+	struct ptdesc *ptdesc = NULL;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1213,14 +1213,14 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 		return VM_FAULT_SIGBUS;
 
 	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
+		ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+		if (!ptdesc)
 			return VM_FAULT_OOM;
 	}
 
 	track_pfn_insert(vma, &pgprot, pfn);
 
-	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, ptdesc);
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
