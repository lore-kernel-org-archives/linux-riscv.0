Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C1910BA421
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 02:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7NyW1M8p6M0Nno5b63vpXY8wkvjkvgLyVYREmbyI9U=; b=fxchCmK3E4lCHv
	p0cHzODTUcTS33z2OUpwVNvftWITsVAzhojht3tMgw9kJC6pREgJ2ubwKJLgEnDLawoozcJCGYpSM
	Mgxb5toMBjLTPti06/VFjdyvlVFY4tVSa6F1V+ZRfi/mQ2/XcSqAl8Aq8NrXOByQf5PKwSavo0Iro
	uQklpw26e7DcKkwEtOEt0yUaKTyHy1N0T1yshV6x/3YY6DeeVjQjvxxSCMK3aQHvdZHKnvH49riNV
	6tDZd4evns8JQwGENBR+G2tgpNt2wXgdXpTEzCth1RESllPeDOnQPPf7JXHcDEc0ypvlZTw3hCiI0
	cTjSaKwFopyOQx+wr0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xOv-00000006aU9-2vAW;
	Fri, 27 Mar 2026 02:58:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xOs-00000006aTi-3ISx
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 02:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A14E4029E;
	Fri, 27 Mar 2026 02:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30C0C116C6;
	Fri, 27 Mar 2026 02:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774580297;
	bh=ZpNIEcUffsRq1bL9mSuUjHcLakM3o1+hxG4crvmOh68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j/Vo3ys2nroHY54igrcUEcoYgsxYsT3vxeiCyy/aOfXJa1yRgskAMVRG73QbfSFFf
	 JM5nLEh474y06NHY6UPYTi/omXySC/awZK0BmobSkQgM8axUdCr4bD26qAKb/5n4XZ
	 I6MCP8QNv6Ig+O/3PIioVHSyf2KK920H2p86r6uA=
Date: Thu, 26 Mar 2026 19:58:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Sidhartha Kumar
 <sidhartha.kumar@oracle.com>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 00/15] mm: memory hot(un)plug and SPARSEMEM cleanups
Message-Id: <20260326195816.60110f50cd464d0076aad0ff@linux-foundation.org>
In-Reply-To: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
References: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_195818_871838_C1CE0495 
X-CRM114-Status: GOOD (  18.30  )
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

On Fri, 20 Mar 2026 23:13:32 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> Some cleanups around memory hot(un)plug and SPARSEMEM. In essence,
> we can limit CONFIG_MEMORY_HOTPLUG to CONFIG_SPARSEMEM_VMEMMAP,
> remove some dead code, and move all the hotplug bits over to
> mm/sparse-vmemmap.c.
> 
> Some further/related cleanups around other unnecessary code
> (memory hole handling and complicated usemap allocation).

Sorry, for some (age-related) reason I've been sitting on v1 for nearly
a week.

Thanks, I've updated mm-unstable to this version.

Lorenzo, I've assumed that your conditional R-b on [01/15] is now
unconditional.

> v1 -> v2:
> * Added "mm/memory_hotplug: fix possible race in scan_movable_pages()"
> * Update the comment above section_deactivate()
> * Reordered the flags in sparse_init_one_section()
> * Patch description improvements

Here's how v2 altered mm.git:


 mm/internal.h       |    2 +-
 mm/memory_hotplug.c |   11 ++++++++---
 mm/sparse-vmemmap.c |    8 ++------
 3 files changed, 11 insertions(+), 10 deletions(-)

--- a/mm/internal.h~b
+++ a/mm/internal.h
@@ -985,7 +985,7 @@ static inline void sparse_init_one_secti
 
 	ms->section_mem_map &= ~SECTION_MAP_MASK;
 	ms->section_mem_map |= coded_mem_map;
-	ms->section_mem_map |= SECTION_HAS_MEM_MAP | flags;
+	ms->section_mem_map |= flags | SECTION_HAS_MEM_MAP;
 	ms->usage = usage;
 }
 
--- a/mm/memory_hotplug.c~b
+++ a/mm/memory_hotplug.c
@@ -1738,6 +1738,7 @@ static int scan_movable_pages(unsigned l
 	unsigned long pfn;
 
 	for (pfn = start; pfn < end; pfn++) {
+		unsigned long nr_pages;
 		struct page *page;
 		struct folio *folio;
 
@@ -1754,9 +1755,9 @@ static int scan_movable_pages(unsigned l
 		if (PageOffline(page) && page_count(page))
 			return -EBUSY;
 
-		if (!PageHuge(page))
-			continue;
 		folio = page_folio(page);
+		if (!folio_test_hugetlb(folio))
+			continue;
 		/*
 		 * This test is racy as we hold no reference or lock.  The
 		 * hugetlb page could have been free'ed and head is no longer
@@ -1766,7 +1767,11 @@ static int scan_movable_pages(unsigned l
 		 */
 		if (folio_test_hugetlb_migratable(folio))
 			goto found;
-		pfn |= folio_nr_pages(folio) - 1;
+		nr_pages = folio_nr_pages(folio);
+		if (unlikely(nr_pages < 1 || nr_pages > MAX_FOLIO_NR_PAGES ||
+			     !is_power_of_2(nr_pages)))
+			continue;
+		pfn |= nr_pages - 1;
 	}
 	return -ENOENT;
 found:
--- a/mm/sparse-vmemmap.c~b
+++ a/mm/sparse-vmemmap.c
@@ -725,11 +725,9 @@ static int fill_subsection_map(unsigned
 }
 
 /*
- * To deactivate a memory region, there are 3 cases to handle across
- * two configurations (SPARSEMEM_VMEMMAP={y,n}):
+ * To deactivate a memory region, there are 3 cases to handle:
  *
- * 1. deactivation of a partial hot-added section (only possible in
- *    the SPARSEMEM_VMEMMAP=y case).
+ * 1. deactivation of a partial hot-added section:
  *      a) section was present at memory init.
  *      b) section was hot-added post memory init.
  * 2. deactivation of a complete hot-added section.
@@ -737,8 +735,6 @@ static int fill_subsection_map(unsigned
  *
  * For 1, when subsection_map does not empty we will not be freeing the
  * usage map, but still need to free the vmemmap range.
- *
- * For 2 and 3, the SPARSEMEM_VMEMMAP={y,n} cases are unified
  */
 static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
 		struct vmem_altmap *altmap)
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
