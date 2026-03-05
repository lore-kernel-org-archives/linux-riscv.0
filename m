Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E1F3092A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6MKDGnX8y7f34JShKwZJIqOqunpXHfaR1Lo1IkIaPs=; b=ocTyEmLRjg8Zem
	V4uqlSL3PjjgHqCIapBYf2cxlUqzxbZYe4hl/GR5DrYapiDbhOkDWT/xyS0lO4N161fUPBd7BbP/F
	YNxKxExab0+sgMfrdrF4Y7CbEhXiQjY/z3MnSZmcNa6KHNQpCeY6dbKlt8rhoirNTdTDH/RuohZ11
	bHdkXxN2Mybg1MwN83fKr5kiNDZzI95fNHzn+0I0Dp0YyWU+Py4L7ps38mnKZJvfw21oE2L8+Kbpq
	zM/WluDQoQey8ph+BFfuu5LsVFm6jlrremS/iDKM845fPmW3rD1QDjGdp50IJpyF61U279Qc2/jWE
	McbgalwF3bbNEFg4g1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy67D-00000001arp-3RVe;
	Thu, 05 Mar 2026 10:39:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy67D-00000001arg-0thN
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 10:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 180F761344;
	Thu,  5 Mar 2026 10:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AA6C116C6;
	Thu,  5 Mar 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707173;
	bh=yLfptqTDk4ppieFzMpM96UgVSqab44mE8I9wfLOH+bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQbCwe5Ngtpjc11y94f+iiN0bnx2c6hl5J9XXzGCcGX5Ek/NgjSyC6js5DKRzdIRW
	 gfofayEar1e+FGrRJjJZ8J4hGI6Jc4d3HEysbPobJ6KbR9bepk8mYYNRsdMuNNfhER
	 V8uO2ZExYPS3uS5ncQsdOW/mVOpIu+dxbq0zOm0fgkKf3Ue1nbrE1CxOkZqfNwFFzh
	 JeUTDD9DDcdMJ2a2RqXgJKAKUAQNVaxDCeNSpcatjVu0b3R700v6+VuqYcy4EFKKg/
	 3v5j0nmNtuk8N4pINihLyhRnfFdYYz0evRLP1BaSa0rFuzt6rFPh78W49y2/cZUfXo
	 5bXuXtwxubnHg==
Message-ID: <6b95ce49-383a-4a73-bdea-c3b8c36e9686@kernel.org>
Date: Thu, 5 Mar 2026 11:39:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 12/18] mm/hugetlb: Remove fake head pages
Content-Language: en-US
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-13-kas@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260227194302.274384-13-kas@kernel.org>
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

On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> vmemmap pages for huge pages and remapping the freed range to a single
> page containing the struct page metadata.
> 
> With the new mask-based compound_info encoding (for power-of-2 struct
> page sizes), all tail pages of the same order are now identical
> regardless of which compound page they belong to. This means the tail
> pages can be truly shared without fake heads.
> 
> Allocate a single page of initialized tail struct pages per zone
> per order in the vmemmap_tails[] array in struct zone. All huge pages of
> that order in the zone share this tail page, mapped read-only into their
> vmemmap. The head page remains unique per huge page.
> 
> Redefine MAX_FOLIO_ORDER using ilog2(). The define has to produce a
> compile-constant as it is used to specify vmemmap_tail array size.
> For some reason, compiler is not able to solve get_order() at
> compile-time, but ilog2() works.
> 
> Avoid PUD_ORDER to define MAX_FOLIO_ORDER as it adds dependency to
> <linux/pgtable.h> which generates hard-to-break include loop.
> 
> This eliminates fake heads while maintaining the same memory savings,
> and simplifies compound_head() by removing fake head detection.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

LGTM, glad you found a way to do the per-zone tails and not pessimize
page_zonenum().

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
