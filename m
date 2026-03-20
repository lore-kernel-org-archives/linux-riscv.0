Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEDD1099B43
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCc5NyErBxa9dAzyuuOOF150KrL2HWcDXcLy/Xsch2I=; b=ZdZFcindvvx7dq
	vw4wY/xxyfydnQTwn8mUQFqBCuaE7IwQajC+BODUKZ6cOEk2dgOKMBn5bX/Jh+Z8AzTCdtbjT34eO
	v2aEoMf3dVOMfoOdIuCZGjtHlfivuizINTUd8yOnxnbLmsHNGohJfFmz7V9VBcyZnELsc5FsfGfBN
	NpUmxy6knxivh95tIAT5EPxs1+ogqGcxc1OqaNPvNHdSS75cvitiJF5smbITbGWYpKgjoMrGEOBPi
	mo39l5DzDLFW+Tehadsjz57WIZOm+uxgg84pciHwAYtMEVRYkhVmdSUA5DtKH47dcaLmm7GmLYipq
	xgsFGm/PZM7SNIJNV2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6m-0000000DfXb-2dsj;
	Fri, 20 Mar 2026 22:14:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6k-0000000DfVY-0F9h
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE2E840896;
	Fri, 20 Mar 2026 22:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CEAC2BC9E;
	Fri, 20 Mar 2026 22:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044857;
	bh=0oSe+G0ox51l+rDc5XWCPrdWsQFUFWnEkGK5VjFVki8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H0/W1BGD21v37hv/vshpWeZPJIUG7Z+PAKpQpegkE2rMSL3nV8vmemwLkEqmGAqKE
	 aIJLxod5bPaIFhk0JEsIr2N4weldzrcc3Zw0DZ3mmlFMdtwYshMcQDTU2fV+pEaEhl
	 ZxWCkhqP3o9gcshisQvElHE8kAh8IjNxbkSoQ9R9CtK3DOCzidXm/vTlDvzpBAi59j
	 6vFWDdibKp6aLhEqrtJX9ezac64PXtpbT0N87txVKuXyOR009EjU+zhfmYKViMllk5
	 vce7g6QiPvGzq04BJqmkHud3AcOGsiQQsI7+czklwG/3ApFXHs15UsEjogrRFAzOBr
	 KTMrQCRHHzHxQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:40 +0100
Subject: [PATCH v2 08/15] mm/bootmem_info: avoid using
 sparse_decode_mem_map()
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-8-096addc8800d@kernel.org>
References: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
In-Reply-To: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_151418_126223_017DCC8E 
X-CRM114-Status: GOOD (  11.41  )
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

With SPARSEMEM_VMEMMAP, we can just do a pfn_to_page(). It is not super
clear whether the start_pfn is properly aligned ... so let's just make
sure it is properly aligned to the start of the section.

We will soon might try to remove the bootmem info completely, for now,
just keep it working as is.

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/bootmem_info.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/mm/bootmem_info.c b/mm/bootmem_info.c
index e61e08e24924..3d7675a3ae04 100644
--- a/mm/bootmem_info.c
+++ b/mm/bootmem_info.c
@@ -44,17 +44,16 @@ static void __init register_page_bootmem_info_section(unsigned long start_pfn)
 {
 	unsigned long mapsize, section_nr, i;
 	struct mem_section *ms;
-	struct page *page, *memmap;
 	struct mem_section_usage *usage;
+	struct page *page;
 
+	start_pfn = SECTION_ALIGN_DOWN(start_pfn);
 	section_nr = pfn_to_section_nr(start_pfn);
 	ms = __nr_to_section(section_nr);
 
-	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
-
 	if (!preinited_vmemmap_section(ms))
-		register_page_bootmem_memmap(section_nr, memmap,
-				PAGES_PER_SECTION);
+		register_page_bootmem_memmap(section_nr, pfn_to_page(start_pfn),
+					     PAGES_PER_SECTION);
 
 	usage = ms->usage;
 	page = virt_to_page(usage);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
