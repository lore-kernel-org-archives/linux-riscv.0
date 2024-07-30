Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22756C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+WD4obSJr0MimLsV8ZUk3WS4YreuXojvzWE+N+lERE=; b=j0sbgm2CzGFogm
	RhxOnj3ATHPqEQ7SfmNhr7Yz+N74edOrvp1R49MUBaZQFsrsuU0F/dSLT99+d8Sas/VxdUegzhtre
	Wn0cfRvsHo81mGuhUkigR0YG4gsFSE53RutC851lj8yyJvJ8Hc3N/x0/t5G8YMO8Y6b8FsMgjJV4+
	IdEVzzVUjhFi6bTh8ZDryKlrsuetwQWFnmSl/6nxW8bl9WsjlBALJtceG+UKwfPOWzD6d2idKobon
	c6bGJfOnrWWs7GX5TGxtn6GhSOtOPWz/2MUYCyyQ2Cko7z8aZ3OPet5sZdrfIgcu3XFTMdX1RrR1s
	hNQpR197SRPveIaZMYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhD6-0000000E0P3-2LVZ;
	Tue, 30 Jul 2024 07:23:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhD0-0000000E0K8-2zB0;
	Tue, 30 Jul 2024 07:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 919D4CE0EC5;
	Tue, 30 Jul 2024 07:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8986AC32782;
	Tue, 30 Jul 2024 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722324223;
	bh=MBumahwIovMrLM2xijUGbqbzC8eqefcbVCDPjO9VQdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VS2i0h4StkfC64c/JDyScKsNP0M1q1w3AGB7FpchDWYE3z1M10NJVKgdKsS8NCbiy
	 d2uHvMiSRGm1FVHaBK8eFwUvEtY7QsciTEUxncVwivItvrAAyaZKX/UrzKXDsx80fB
	 hdVzmcvfXZq0cq838KL/IIOuw5o6htAm35hjuefbFnaeXbpXlVepWunB9D2y1XoH/P
	 DOr/E3Jc/8HLWb1qhmvVZLFWhR2A9Ugp62gjlZlG+ibYdl1NrFjQKylKux8BJ7W6+i
	 nRKNxS68jjsmSHjYUvwPjztBhfwuSyjjuZuFnGp5UzkRLxjYlH9kVNt7n3/xt5EXtO
	 i4Za4M6sm1W+Q==
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
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 16/18] mm/pgtable: pass ptdesc to pmd_install
Date: Tue, 30 Jul 2024 15:27:17 +0800
Message-ID: <20240730072719.3715016-6-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730072719.3715016-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <20240730072719.3715016-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_002347_138196_4A46C21B 
X-CRM114-Status: GOOD (  13.42  )
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

A new step to replace pgtable_t by ptdesc, also a preparation to change
vmf.prealloc_pte to ptdesc too.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox  <willy@infradead.org>
---
 mm/filemap.c  | 2 +-
 mm/internal.h | 2 +-
 mm/memory.c   | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index d62150418b91..3708ef71182e 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3453,7 +3453,7 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct folio *folio,
 	}
 
 	if (pmd_none(*vmf->pmd) && vmf->prealloc_pte)
-		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
+		pmd_install(mm, vmf->pmd, (struct ptdesc **)&vmf->prealloc_pte);
 
 	return false;
 }
diff --git a/mm/internal.h b/mm/internal.h
index 7a3bcc6d95e7..e4bc64d5176a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -320,7 +320,7 @@ void folio_activate(struct folio *folio);
 void free_pgtables(struct mmu_gather *tlb, struct ma_state *mas,
 		   struct vm_area_struct *start_vma, unsigned long floor,
 		   unsigned long ceiling, bool mm_wr_locked);
-void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
+void pmd_install(struct mm_struct *mm, pmd_t *pmd, struct ptdesc **pte);
 
 struct zap_details;
 void unmap_page_range(struct mmu_gather *tlb,
diff --git a/mm/memory.c b/mm/memory.c
index cbed8824059f..79685600d23f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -418,7 +418,7 @@ void free_pgtables(struct mmu_gather *tlb, struct ma_state *mas,
 	} while (vma);
 }
 
-void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
+void pmd_install(struct mm_struct *mm, pmd_t *pmd, struct ptdesc **pte)
 {
 	spinlock_t *ptl = pmd_lock(mm, pmd);
 
@@ -438,7 +438,7 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
 		 * smp_rmb() barriers in page table walking code.
 		 */
 		smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
-		pmd_populate(mm, pmd, (struct ptdesc *)(*pte));
+		pmd_populate(mm, pmd, *pte);
 		*pte = NULL;
 	}
 	spin_unlock(ptl);
@@ -450,7 +450,7 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 	if (!ptdesc)
 		return -ENOMEM;
 
-	pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
+	pmd_install(mm, pmd, &ptdesc);
 	if (ptdesc)
 		pte_free(mm, ptdesc);
 	return 0;
@@ -4868,7 +4868,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 		}
 
 		if (vmf->prealloc_pte)
-			pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte);
+			pmd_install(vma->vm_mm, vmf->pmd, (struct ptdesc **)&vmf->prealloc_pte);
 		else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
 			return VM_FAULT_OOM;
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
