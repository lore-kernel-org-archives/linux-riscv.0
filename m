Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6061DC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVE52OMzlTWNCkRrl32dn35FdNJXP0H/pvmBEJt/IDE=; b=k3MYZOqcWMvJg5
	/6x90DeMjseCJuYXT2ZGjrWGUmIg12YYsLUQ2536XsZ+FcYkCJP+7/FgmXzDvukb2KeeOxfJhQ3Is
	db0iiaaeRqyCnD9QEJexK5Iklsfq/PX8zuPreM6grW4XRsv16iFDUEO7k204ag8lk8rMI+kToEpFX
	LBjaeEIOM7xgRbiqsfHLP+VgeoEqzLgkzbsgkKth3FxMBwqUIj7SxDGlW4mN3ow6oXa1zAuL4uM8x
	KMcmTMqLnQGwiJ96ztHjIUv3AQPEak4aoQxvs2IUvg3uaEva42mVv5u4hQS3lm1MqHPzcK2nXCdwB
	AEoX34HYL4mduEObKG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDfn-000000040hm-0mIp;
	Thu, 02 Jul 2026 09:25:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDfk-000000040gr-2aei
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:25:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A7093595;
	Thu,  2 Jul 2026 02:25:23 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 948E63F85F;
	Thu,  2 Jul 2026 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782984327; bh=Xj0iHdFVkTFPJk2vepVkKt5+5aNwYyui+0eFZq9zgWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OGBAIqiyKGFHbYxKM8iXK0RmfoZsIcq1SDRTfQxlGRIvbIfQjnj8GfF1r9wU4kHYJ
	 nVPBX2aLyWjnrLaBCdo9cGvSpRNoLrUwcC4fAC4bQt7WVHz1K3VITG+F26l78FwWgo
	 8VNYrSY9GpbFfRrW3qdmpd7hCEIo+rZvv0hGvg8M=
Message-ID: <b71aeb67-fb48-42ed-a41d-d10274844a79@arm.com>
Date: Thu, 2 Jul 2026 14:55:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: David Carlier <devnexen@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260702091841.332318-1-devnexen@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260702091841.332318-1-devnexen@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022528_752777_43A7F678 
X-CRM114-Status: GOOD (  21.78  )
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



On 02/07/26 2:48 pm, David Carlier wrote:
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
> 
> On the read side walk_page_range_debug() walks the init_mm range in bounded
> chunks, taking rcu_read_lock() around each chunk and calling cond_resched()
> between them. A walker either sees the cleared PMD and skips, or keeps the
> page alive until it drops the lock; chunking keeps the read section short
> on a large kernel address space instead of holding RCU across the whole
> walk. The owned-range walkers are unchanged.
> 
> Drop the mmap_write_lock() in ptdump_walk_pgd(). It never guarded against
> this free -- most architectures free the collapsed PTE table without it --
> and RCU now provides the synchronisation.
> 
> ptdump callbacks run under RCU within a chunk, so they must not sleep. The
> arch note_page() and effective_prot() callbacks only format into the
> preallocated seq_file buffer; the only GFP_KERNEL marker setup runs before
> the walk, and cond_resched() happens between chunks, outside the read lock.
> 
> Fixes: 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
Please update the patch version. I believe it should be v7 by now. And, please have
a changelog so people have some context.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
