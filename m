Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E98606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lbrTCS8/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcA/LQZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v5J5FTyCfMabigPE5T0MzTT6K/AvOSXj4bPXSrbwVHY=; b=lbrTCS8/oQZxLZWy+Y4KdBvpoB
	vYqul1HYgKVRAivISdhit+KSUi0PdyhxhyCBUP3GOhf/hqhEVMFv4u8KGy4EQK6BYpppl2dAaBNOO
	nsw1ryJcrG5bvZfDrt4z8sLOVuDY7F/vIemAPJ7v8gZroyElB+nRYVJ4smXHG14poTchXT4frFQPr
	n+7ZIWwE+PXS1IBTuC+3iIuWWfVDVb/gTFtUakoYQHLOx0mEdqDTcsNVaWpc32K6lro5u5sQEPp+n
	0cq5DIAG7Sxjt0o8EqrU/95GFzIcT0/aX+YzvSU3DRqEUoKcevXGwkbx5encORA0LSS4WlMI8NH4P
	mo3/TWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXVD-0000000CuAf-3Ern;
	Thu, 26 Nov 2026 11:18:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXUc-0000000CtJZ-1sap;
	Thu, 26 Nov 2026 11:18:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FB18433ED;
	Thu, 26 Nov 2026 11:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612A11F000EB;
	Thu, 26 Nov 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691901;
	bh=ZILZfKisda6VydMd2eX+gp7jxSdYsZR8fHOcYz6Cqew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dcA/LQZJNTRxAXYiSO3ecetRk8UeUJ6G6eowyblPb3SceghWJPlB47dy81dO3ekpo
	 8zDVpbCPPwxS+gP2aWUtngwOLnVGrkWp3lbRZc00nMGGvENyrC+LUZsSkDTGn2a/Df
	 Ykat0AJi7F5ysyrmoP735e9b3JtJOJkyBZb/r31kMWVXdrscOhgdsETzfdXnYLy3Oa
	 9MLDBL0FuPwbh5GLhPshgP2x2ZO3LV6BIDUNOwy6XdbqpNWoRFGlguk+SsxHNgl76s
	 ing/lUECgznOONlhV/K97ITTVUhM1RAQes1Mo/It0ScWnHTtRza5jJ7IGIDCXcwDNm
	 NDSCBoaFdVjlw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:37 +0200
Subject: [PATCH RFC v2 24/54] x86/mm/pat: detect unchanged mappings by
 comparing protections
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-24-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CPA decides whether a mapping changes by encoding the new page table entry
and comparing it with the existing one.

It would be suboptimal to encode actual entries in the generic code for
every comparison of the existing, requested and new protections, as every
architecture would need one more out-of-line hook for it.

cpa_leaf by definition has the decoded protection which can be used in
comparisons.

Compare the new protection with the decoded one and encode only the page
table entries that are written, as the last step.

Encoding masks out the bits the CPU does not support and _PAGE_GLOBAL bit
of a non-present entry, comparing protections does not. set_memory_global()
on a CPU without PGE or on a non-present page now rewrites the PTEs with
the same value and flushes the TLB. Its only caller changes the kernel
text, which is always present, once at boot.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 0a2d19064f23..f4d3e2d9c3c9 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1917,26 +1917,18 @@ static int __change_page_attr(struct cpa_data *cpa)
 		return __cpa_process_fault(cpa, address);
 
 	if (leaf.level == PGTABLE_LEVEL_PTE) {
-		pte_t old_pte = *leaf.kpte;
 		pgprot_t new_prot;
 		unsigned long pfn = leaf.pfn;
-		pte_t new_pte;
 
 		cpa_inc_pte_install();
 		new_prot = cpa_new_prot(cpa, &leaf);
-
-		/*
-		 * We need to keep the pfn from the existing PTE,
-		 * after all we're only going to change its attributes
-		 * not the memory it points to
-		 */
-		new_pte = cpa_pte(leaf.level, pfn, new_prot);
 		cpa->pfn = pfn;
 		/*
 		 * Do we really change anything ?
 		 */
-		if (pte_val(old_pte) != pte_val(new_pte)) {
-			set_pte_atomic(leaf.kpte, new_pte);
+		if (pgprot_val(new_prot) != pgprot_val(leaf.prot)) {
+			set_pte_atomic(leaf.kpte,
+				       cpa_pte(leaf.level, pfn, new_prot));
 			cpa->state |= CPA_ST_FLUSHTLB;
 		}
 		cpa->numpages = 1;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
