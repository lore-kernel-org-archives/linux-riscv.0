Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A631D10F22
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUyPzrR1+YB2AlOFp3G+pO/B6G5d/hdVl86RxX6YqLQ=; b=HJ17QFcbr5wpbf
	p85sf8/dbMWMjRutVQt5tGIN7VRPTiC0/M+ksMNw1GggQ/rII77/M/yB2gLdIw+tZQV3obTxav4A0
	//TEsP3HgYxBaweOPbeIIcdd0RmF4vyDw9IFJut2bkeh0BGzJ6x1QoAzF8RlredDiR60XPbHGqSVD
	E8hJbK+6g8PbT1Zu8OkDoFerxW32JbVf9B/jKLV9C2TrioVQktn9ivwbM1H6oELL6mlXneqhM8Mty
	c7ioAgi6TBbeIvSk1jLH5IIaXTQyDCFYsCrxgkmu7e+a03IBkVeXKwu1/MxsAHn4f0CZzC8RCe0Nq
	8I2dLaw/woGO/f0aNrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODPL-0000000Et94-154L;
	Wed, 26 Nov 2025 11:09:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODPI-0000000Et7v-0qOY
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 11:09:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47C0D168F;
	Wed, 26 Nov 2025 03:09:45 -0800 (PST)
Received: from [10.1.33.153] (unknown [10.1.33.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF653F66E;
	Wed, 26 Nov 2025 03:09:50 -0800 (PST)
Message-ID: <02e3b3bd-ae6a-4db4-b4a1-8cbc1bc0a1c8@arm.com>
Date: Wed, 26 Nov 2025 11:09:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Content-Language: en-GB
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-7-samuel.holland@sifive.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251113014656.2605447-7-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_030956_324658_087AD366 
X-CRM114-Status: GOOD (  43.88  )
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

On 13/11/2025 01:45, Samuel Holland wrote:
> Some platforms need to fix up the values when reading or writing page
> tables. Because of this, the accessors must always be used; it is not
> valid to simply dereference a pXX_t pointer.
> 
> Fix all of the instances of this pattern in generic code, mostly by
> applying the below coccinelle semantic patch, repeated for each page
> table level. Some additional fixes were applied manually, mostly to
> macros where type information is unavailable.
> 
> In a few places, a `pte_t *` or `pmd_t *` is actually a pointer to a PTE
> or PMDE value stored on the stack, not a pointer to a page table. In
> those cases, it is not appropriate to use the accessors, because the
> value is not globally visible, and any transformation from pXXp_get()
> has already been applied. Those places are marked by naming the pointer
> `ptentp` or `pmdvalp`, as opposed to `ptep` or `pmdp`.
> 
> @@
> pte_t *P;
> expression E;
> expression I;
> @@
> - P[I] = E
> + set_pte(P + I, E)
> 
> @@
> pte_t *P;
> expression E;
> @@
> (
> - WRITE_ONCE(*P, E)
> + set_pte(P, E)
> |
> - *P = E
> + set_pte(P, E)
> )

There should absolutely never be any instances of core code directly setting an
entry at any level. This *must* always go via the arch code helpers. Did you
find any instances of this? If so, I would consider these bugs and suggest
sending as a separate bugfix patch. Bad things could happen on arm64 because we
may need to break a contiguous mapping, which would not happen if the value is
set directly.

> 
> @@
> pte_t *P;
> expression I;
> @@
> (
>   &P[I]
> |
> - READ_ONCE(P[I])
> + ptep_get(P + I)
> |
> - P[I]
> + ptep_get(P + I)
> )
> 
> @@
> pte_t *P;
> @@
> (
> - READ_ONCE(*P)
> + ptep_get(P)
> |
> - *P
> + ptep_get(P)
> )

For reading the *PTE*, conversion over to ptep_get() should have already been
done (I did this a few years back when implementing support for arm64 contiguous
mappings). If you find any cases where direct dereference or READ_ONCE() is
being done in generic code for PTE, then that's a bug and should also be sent as
a separate patch.

FYI, my experience was that Coccinelle didn't find everything when I was
converting to ptep_get() - although it could have been that my Cochinelle skills
were not up to scratch! I ended up using an additional method where I did a
find/replace to convert "pte_t *" to "ptep_handle_t" and declared pte_handle_t
as a void* which causes a compiler error on dereference. Then in a few key
places I did a manual case from pte_handle_t to (pte_t *) and compiled allyesconfig.

I'm assuming the above Cocchinelle template was also used for pmd_t, pud_t,
p4d_t and pgd_t?

> 
> Additionally, the following semantic patch was used to convert PMD and
> PUD references inside struct vm_fault:
> 
> @@
> struct vm_fault vmf;
> @@
> (
> - *vmf.pmd
> + pmdp_get(vmf.pmd)
> |
> - *vmf.pud
> + pudp_get(vmf.pud)
> )
> 
> @@
> struct vm_fault *vmf;
> @@
> (
> - *vmf->pmd
> + pmdp_get(vmf->pmd)
> |
> - *vmf->pud
> + pudp_get(vmf->pud)
> )
> 
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> This commit covers some of the same changes as an existing series from
> Anshuman Khandual[1]. Unlike that series, this commit is a purely
> mechanical conversion to demonstrate the RISC-V changes, so it does not
> insert local variables to avoid redundant calls to the accessors. A
> manual conversion like in that series could improve performance.
> 
> [1]: https://lore.kernel.org/linux-mm/20240917073117.1531207-1-anshuman.khandual@arm.com/

Hi,

I've just come across this patch and wanted to mention that we could also
benefit from this improved absraction for some features we are looking at for
arm64. As you mention, Anshuman had a go but hit some roadblocks.

The main issue is that the compiler was unable to optimize away the READ_ONCE()s
for the case where certain levels of the pgtable are folded. But it can optimize
the plain C dereferences. There were complaints the the generated code for arm
(32) and powerpc was significantly impacted due to having many more (redundant)
loads.

Were you able to solve this problem?

I think it stems from there really being 2 types of access; READ_ONCE() and
plain C dereference. The existing READ_ONCE() accesses require the
single-copy-atomic guarantees but the plain c dereferences don't actually need
that; they are usually just checking "is the value the same as a value I
previously read?", "is the pXd none?", etc. so it doesn't matter if they get torn.

It would be nice to have only a single flavour of accessor, but in that case it
obviously needs to be the strongest (READ_ONCE()). Perhaps we should settle for
2 flavours, and the compiler should then be able to continue to optimize out the
c dereferences. There are already 2 flavours for pte (which never gets folded);
ptep_get() and ptep_get_lockless(), but the semantics don't quite match.

Perhaps:

pXdp_get() -> READ_ONCE()
pXdp_get_weak() -> c dereference?

or pXdp_deref()? I'm not great with names...


The other problem is that there is nothing preventing new code from introducing
new direct dereferences or READ_ONCE()s. One possible solution to this is to use
an opaque handle type (similar to what I described above with pte_handle_t). But
that introduces a lot more code churn. I think that's a nice-to-have/incremental
improvement that could be done later.

> 
> Changes in v3:
>  - Rebased on top of torvalds/master (v6.18-rc5+)
> 
> Changes in v2:
>  - New patch for v2
> 
>  fs/dax.c                |  4 +-
>  fs/proc/task_mmu.c      | 27 +++++++------
>  fs/userfaultfd.c        |  6 +--
>  include/linux/huge_mm.h |  8 ++--
>  include/linux/mm.h      | 14 +++----
>  include/linux/pgtable.h | 42 +++++++++----------
>  mm/damon/vaddr.c        |  2 +-
>  mm/debug_vm_pgtable.c   |  4 +-
>  mm/filemap.c            |  6 +--
>  mm/gup.c                | 24 +++++------
>  mm/huge_memory.c        | 90 ++++++++++++++++++++---------------------
>  mm/hugetlb.c            | 10 ++---
>  mm/hugetlb_vmemmap.c    |  4 +-
>  mm/kasan/init.c         | 39 +++++++++---------
>  mm/kasan/shadow.c       | 12 +++---
>  mm/khugepaged.c         |  4 +-
>  mm/ksm.c                |  2 +-
>  mm/madvise.c            |  8 ++--
>  mm/memory-failure.c     | 14 +++----
>  mm/memory.c             | 76 +++++++++++++++++-----------------
>  mm/mempolicy.c          |  4 +-
>  mm/migrate.c            |  4 +-
>  mm/migrate_device.c     | 10 ++---
>  mm/mlock.c              |  6 +--
>  mm/mprotect.c           |  2 +-
>  mm/mremap.c             | 30 +++++++-------
>  mm/page_table_check.c   |  4 +-
>  mm/page_vma_mapped.c    |  6 +--
>  mm/pagewalk.c           | 14 +++----
>  mm/percpu.c             |  8 ++--
>  mm/pgalloc-track.h      |  8 ++--
>  mm/pgtable-generic.c    | 23 ++++++-----
>  mm/rmap.c               |  8 ++--
>  mm/sparse-vmemmap.c     |  8 ++--
>  mm/userfaultfd.c        | 10 ++---
>  mm/vmalloc.c            | 49 +++++++++++-----------
>  mm/vmscan.c             | 14 +++----
>  37 files changed, 304 insertions(+), 300 deletions(-)
> 

[...]

> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -1322,7 +1322,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
>  
>  		set_pte_at(mm, pvmw.address, pvmw.pte, entry);
>  	}
> -	*orig_pte = entry;
> +	set_pte(orig_pte, entry);

This is incorrect. orig_pte points to a location on stack. Please revert.

>  	err = 0;
>  
>  out_unlock:

[...]

> @@ -1116,7 +1116,7 @@ static int guard_install_set_pte(unsigned long addr, unsigned long next,
>  	unsigned long *nr_pages = (unsigned long *)walk->private;
>  
>  	/* Simply install a PTE marker, this causes segfault on access. */
> -	*ptep = make_pte_marker(PTE_MARKER_GUARD);
> +	set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));

I tried "fixing" this before. But it's correct as is. ptep is pointing to a
value on the stack. See [2].

https://lore.kernel.org/linux-mm/2308a4d0-273e-4cf8-9c9f-3008c42b6d18@arm.com/

>  	(*nr_pages)++;

[...]

It's all very difficult to review at the moment since it is so big. Any chance
of at least splitting by level in future versions?

Thanks,
Ryan



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
