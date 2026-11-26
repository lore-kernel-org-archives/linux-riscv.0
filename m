Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC78606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8y77q4u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpOHDK1p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=io7eBnFIiqv1+Mgh1dgfHgUbgBKzqaAUq+kpYLGiyhE=; b=C8y77q4uB/4Qd1/NcQDcD1Vipi
	njduS+V4CMCjMjABCN2KCF4mfVKIVFTfyLZ4Sga2cOhzqwvdMu3IT34RR9jqwEC4aPi8F3kTWAtOl
	jqYG3QSESV3Xk2EgvwJavAQnuYXYJqZZHZWGBwGUzR+hj51OqWUcMq82o/wAGXpMBQRY51qiw/Bu4
	+N3pFqePQduMuPz2MhOjK9TcMets4MHAy7V59Ws4H4eOUeEV0jKQ7lz8oePvMEuz001mxQDNXx0FO
	kAreForcmLCLqhlt6YXNyOlRrhz/imfdYl09YFh9ElieX3nuwtL/KzzNVBqN5f9XWH75sCIN3Px3E
	UclFoGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXSF-0000000CqaB-13Cd;
	Thu, 26 Nov 2026 11:15:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRs-0000000CqC1-2xg2;
	Thu, 26 Nov 2026 11:15:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EC5362207;
	Thu, 26 Nov 2026 11:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09C61F000D2;
	Thu, 26 Nov 2026 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691731;
	bh=zeebKmC4zt9ER//cYViWMCf8JsX3wxI4858CYnYyK4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jpOHDK1p/+2ScS6pTVO+ve0hzKh3+qSBP1nb5Vo1QtiyTil/tUQdCXZMRsYDRurOy
	 nMF/zy+gS4188OPxfP1dbbUtm+m7Mbb3agYHHWCFSW/9xowa+DkAE83MKuY9hDAkqA
	 ItEVaA3iu0i8LkNX5qaBFoxmSBaMSJa5GjeFeFbHrDP1yDt7Xa8NpovnofVLg6cOXu
	 bNWOrmmtPlvK3xASh9BYQyxFxh9UZ6m9Q/FzKh+Tf+65DDVfs6EAdM5wsnWYU8bmLp
	 xbkIwTMBdgKK2iqJ7731qo0G/kIPc14YdSl9AIEpGPAuz1H6cnQpuM/SzPPuBFjms7
	 Wg91I2Upldwwg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:19 +0200
Subject: [PATCH RFC v2 06/54] x86/mm/pat: don't count kernel image splits
 as direct map splits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-6-723f1e33c3d8@kernel.org>
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

The DirectMap lines of /proc/meminfo count only the direct map. The kernel
image mapping is never added to them.

CPA counts a split if virt_addr_valid() accepts the address and its pfn is
mapped in the direct map. On 64-bit virt_addr_valid() accepts the kernel
image mapping too, and its pfns are in the direct map, so the splits of the
kernel image mapping are counted as well.

Such splits can happen when mark_rodata_ro() updates the protections of the
kernel image.

Each split of the kernel image mapping moves 2M from DirectMap2M to
DirectMap4k, although the direct map does not change.

Count splits and collapses only for addresses in the direct map.

Fixes: 8eb5779f6b9c ("x86, mm: use pfn_range_is_mapped() with CPA")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 2ff37ff1cecd..42f27d60adf3 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1190,12 +1190,9 @@ __split_large_page(struct cpa_data *cpa, pte_t *kpte, unsigned long address,
 	for (i = 0; i < PTRS_PER_PTE; i++, pfn += pfninc, lpaddr += lpinc)
 		split_set_pte(cpa, pbase + i, pfn, ref_prot, lpaddr, lpinc);
 
-	if (virt_addr_valid(address)) {
-		unsigned long pfn = PFN_DOWN(__pa(address));
-
-		if (pfn_range_is_mapped(pfn, pfn + 1))
-			split_page_count(level);
-	}
+	if (within(address, PAGE_OFFSET,
+		   PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))
+		split_page_count(level);
 
 	/*
 	 * Install the new, split up pagetable.
@@ -1314,7 +1311,8 @@ static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
 		}
 	}
 
-	if (virt_addr_valid(addr) && pfn_range_is_mapped(pfn, pfn + 1))
+	if (within(addr, PAGE_OFFSET,
+		   PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))
 		collapse_page_count(PG_LEVEL_2M);
 
 	return 1;
@@ -1361,7 +1359,8 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
 	list_add(&page_ptdesc(pud_page(*pud))->pt_list, pgtables);
 	set_pud(pud, pfn_pud(pfn, pmd_pgprot(first)));
 
-	if (virt_addr_valid(addr) && pfn_range_is_mapped(pfn, pfn + 1))
+	if (within(addr, PAGE_OFFSET,
+		   PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))
 		collapse_page_count(PG_LEVEL_1G);
 
 	return 1;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
