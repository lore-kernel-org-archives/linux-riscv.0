Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D61C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuvEk2lX9KJzbyQjsUY6NtevbLTkNGcvyU/S5HbQ8Vg=; b=RxgN3yllaCdYqQ
	CL79QvXfHgDmgH+ytbKlWdKI+Exgq4IT/hr+XEUw+c4pW84ohTENyr2rQrZGZvzxwNw+iqTg/j1tF
	qJTBfMRowMoRBAQdQnDF1czZwvXyhXd6FA57mzxEiCHVS2+gaJ1tUryspXNrLA8nm05iKwqBNfnc7
	iet0Z1E6bvbUIsMKCdHAFCAvtQlWIdCVTjYZmI08FPp1pmOv9XucZ9nZFJ0QMqcfd8vtzKB94eqJ2
	TBl9dwZCiq1D1KLLLWMd+0YQa0i7suy3qFrZL6WoBcnogY3eF2sJsnhmBsl1bWx+PpqKuqgdwF93X
	3xzyGiW0YB39PciFJREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYga6-0000000DsFu-1hvF;
	Tue, 30 Jul 2024 06:43:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYga1-0000000DsCU-34ne;
	Tue, 30 Jul 2024 06:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88F4661D65;
	Tue, 30 Jul 2024 06:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D8BC4AF10;
	Tue, 30 Jul 2024 06:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321808;
	bh=zlev6U+OoFjkfoKmEXM32LjGGbg3IzN8MVfe5YQ2ABk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WjS+HiBAB8GnrP16+FWhPBhBioxJ8kmlN6GNWX0t7MoSEgpFt9udUClAwzyOYEIxt
	 GLWwkGU4O6zyc/VGIYKFle6KtAV0AVQ6WLPz1ptPTAt/cK1x1zSGjLfSPVGHaFL7Aw
	 Y4AKOOT2SpoOjc/Wbh1+/cP2W5ZkFPUFKciWkTsqP4dtf5muBEfTCKVF7OjlDaXXFP
	 Mk1LMgQy97vcUdIahsxWds+dQ+j5TRS6Lhw6QAeYu9XrrqZGdvSMQyXycNkwaPempx
	 E3DYobdwtOelveqsy4Y98Iq66A3nNqzOwW6shcZICnV51PmNjmCB9mjEsRRSoolbPG
	 qB3gp0EMlnwSw==
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
	nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 03/18] fs/dax: use ptdesc in dax_pmd_load_hole
Date: Tue, 30 Jul 2024 14:46:57 +0800
Message-ID: <20240730064712.3714387-4-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_234329_909498_7A7A6066 
X-CRM114-Status: GOOD (  11.84  )
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
'struct page *'.
It's a prepare for return ptdesc pointer in pte_alloc_one series
function.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: nvdimm@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index becb4a6920c6..6f7cea248206 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1206,7 +1206,7 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 	unsigned long pmd_addr = vmf->address & PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	struct inode *inode = mapping->host;
-	pgtable_t pgtable = NULL;
+	struct ptdesc *ptdesc = NULL;
 	struct folio *zero_folio;
 	spinlock_t *ptl;
 	pmd_t pmd_entry;
@@ -1222,8 +1222,8 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 				  DAX_PMD | DAX_ZERO_PAGE);
 
 	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
+		ptdesc = page_ptdesc(pte_alloc_one(vma->vm_mm));
+		if (!ptdesc)
 			return VM_FAULT_OOM;
 	}
 
@@ -1233,8 +1233,8 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 		goto fallback;
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
+	if (ptdesc) {
+		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc_page(ptdesc));
 		mm_inc_nr_ptes(vma->vm_mm);
 	}
 	pmd_entry = mk_pmd(&zero_folio->page, vmf->vma->vm_page_prot);
@@ -1245,8 +1245,8 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 	return VM_FAULT_NOPAGE;
 
 fallback:
-	if (pgtable)
-		pte_free(vma->vm_mm, pgtable);
+	if (ptdesc)
+		pte_free(vma->vm_mm, ptdesc_page(ptdesc));
 	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
 	return VM_FAULT_FALLBACK;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
