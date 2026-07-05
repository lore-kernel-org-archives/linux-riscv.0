Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE84C43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FULy/d8JKUwkssgyuk54hIGOPyqWOZGlprs7dYomFh0=; b=qcaGf/Igp45gow
	3qOnoEexbBRtYMRVwjBVd6CmWXbAzoWSma5sOflVyiTwhFMbD31lQCVEJhmhrbfY4f09xqXjk2TmS
	zZvjVmJKHrkrIDq5OZtMfWbNz8uEiZQLOEYkuNDwjfxpnvrGIG5tvzTzw/g3w1IesDn66dD3BGu4j
	shTBZrU1AlcJp33OfD/GgzT4i4bhTnbd8v5wzfd4pfjk529t9EavWeyP/Y6iFYOG0BiKCH3CE3bXB
	YSNDXOHWT3xiAI2CfrShnyvFrtCjl/ApSg/0fY2ZP2bTn28ZYOcuymhUxRnhg6fhMsnnB9p8Vur2o
	wPtLNiIHJUzp6qJJ8Y5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTUz-00000009hqC-2D2k;
	Sun, 05 Jul 2026 20:31:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTUy-00000009hq1-0auN
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 20:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45A15436C1;
	Sun,  5 Jul 2026 20:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBB61F000E9;
	Sun,  5 Jul 2026 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783283490;
	bh=Z/shfTy2/IJB2wTTprOVJQY6HZudzX/XlXY2dxUeOSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Mn3IM1gOLuSx2CRIiw/WJHtJAo+egenKF8r82+OKr1WK+mLooaPGmNHINMAcwIXy0
	 5RFYgz2anWpmLvlH8Uf1hzQqxuNHCsyenTiSr87fB0mgdUFVglqB3KlQyPK5j6iqPB
	 YpA/2dzxBAqYR1+PIglQSO/nkrdxSjTSYWIleauQ=
Date: Sun, 5 Jul 2026 13:31:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Carlier <devnexen@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen
 <dave.hansen@linux.intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
Message-Id: <20260705133129.74b3bf92ed21c9bcddaf6174@linux-foundation.org>
In-Reply-To: <20260702093011.336036-1-devnexen@gmail.com>
References: <20260702093011.336036-1-devnexen@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Thu,  2 Jul 2026 10:30:11 +0100 David Carlier <devnexen@gmail.com> wrote:

> ptdump_walk_pgd() walks the kernel page tables under get_online_mems().
> That does not stop vmalloc from freeing a kernel PTE page underneath the
> walk.
> 
> When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
> existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
> powerpc this runs without the init_mm mmap lock; only arm64 takes it, and
> not on the block-split path. So ptdump can dereference a just-freed PTE
> page, which is the use after free syzbot hit in ptdump_pte_entry().
> 
> The race is not new. ptdump walks the whole kernel address space, including
> ranges other code is actively mapping, so it reads page tables it does not
> own. 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> only widened the window; the Fixes tag points there for that reason.
> 
> Every other walker works on a range it owns and is the only one mutating
> it: set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
> openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
> concurrently, so they cannot race and do not need RCU. ptdump is the only
> walker that traverses ranges it does not own.
> 
> Defer the free by an RCU grace period. pagetable_free_kernel() now frees
> via call_rcu() in both the async and non-async configs. The async path
> still flushes the TLB first, then queues the per-page RCU free. The page
> stays valid until any walk that may have observed it drops its RCU read
> lock.

Thanks.  A use-after-free is something we should attend to!

AI review had some thoughts, but in a strange manner:
	https://sashiko.dev/#/patchset/20260702093011.336036-1-devnexen@gmail.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
