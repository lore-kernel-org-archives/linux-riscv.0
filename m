Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B5BC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 07:49:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3242E20827
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 07:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WqKcMocA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aEbCUXsb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3242E20827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YU6qZuwPPK+WEEYRWXFl38h0rdQSbehLaoE66iq/oek=; b=WqKcMocAaXxl/O
	hXWzi3HNZ1h8IZ2D11RpnitJ/j79XuJ1tUbn7pPn+GwvRUFzBVYCqiwbNioTjAUUa9WN7KCfQTebi
	V0CxtefbJVCKL2MeA3b/07fS6YWWmATl52yz4yLLeYxLpulzSzhj7nbSIXIfgtUGBtgaMAX7khMFv
	qxvXPkscQ+YJBcb8BX1QyPDBYTzjMHVBfg43YJKthTNNB4D+v7kjDZjUmPz8G4Xdsf8n1WNAnxCii
	6fHlx/ktHt5pXS65uDqgx6EvDuJrvLVkJEpBvkQbsTiaNG2iCzIbLCnFY+jX+cEVJAzGS66irEIMr
	e7H2pRg9fVvn1NTLOLOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJw7I-0004ds-FI; Tue, 06 Nov 2018 07:49:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJw7G-0004dh-C1
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 07:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U8OCAPAJjh2KutaWEI53Ys9JO9WcRlVWdjrVTczDO9g=; b=aEbCUXsbTQ0c9uc2O1R+/+GwP
 u/daCXsgl4c2pOimfKMIzlwh7P3EBDVmgJ5Zz4eqAC5KOLv6AAavVWXXWvYG3G2bw8uG1ozy7P8qO
 J7LwP2B17rDH+j222s6idCHx6YEfzNprZHgQEEyGZvQLBkbFlNSk7ZzokyDqRx4Wn98nl5lAIs9BU
 QV6a3XSOrGDWd8HSnx3zxENXsgqoffUfBDbu0KT2ZizFsOdWjg5AJsgucZ/Rofb3BHzdJMLk8w0fg
 CiE89qOkCcC9++K3jNQ8BZ5ODxFphZrFBZ3tGe0kHAmFtTRv0CdKO8ocysU5SoY34DjPqmHQEUsNU
 /ODmk9uGQ==;
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJw7B-0005cq-K3
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 07:49:36 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id wA67nVwF088787;
 Tue, 6 Nov 2018 15:49:31 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 6 Nov 2018
 15:49:04 +0800
Date: Tue, 6 Nov 2018 15:49:05 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [sw-dev] About the Use of sfence.vma in Kernel
Message-ID: <20181106074905.GA25014@andestech.com>
References: <20181105004929.GA4735@andestech.com>
 <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com wA67nVwF088787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_074934_214536_8BAF3202 
X-CRM114-Status: GOOD (  42.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 greentime@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106074905.e1Gf23J-_SyY-5DIuOKlxdgixLecm6RUfGaLu8vm7MI@z>

Thanks for the response!

On Mon, Nov 05, 2018 at 06:33:23PM -0800, Palmer Dabbelt wrote:
> Sorry, I missedy our original email.
> 
> On Sun, 04 Nov 2018 16:49:29 PST (-0800), alankao@andestech.com wrote:
> >Hi Palmer,
> >
> >I believe the code in arch/riscv/mm/fault.c is mostly from you.
> >Do you have any comments on this?
> >
> >On Thu, Nov 01, 2018 at 05:00:15PM +0800, Alan Kao wrote:
> >>Hi all,
> >>
> >>As mentioned in the Privileged Spec about sfence.vma instruction:
> >>
> >>> The supervisor memory-management fence instruction SFENCE.VMA is used
> >>> to synchronize updates to in-memory memory-management data structures
> >>> with current execution.  Instruction execution causes implicit reads
> >>> and writes to these data structures;  however, these implicit references
> >>> are ordinarily not ordered with respect to loads and stores in the instruction
> >>> stream.
> >>>
> >>> Executing an SFENCE.VMA instruction guarantees that any stores in the
> >>> instruction stream prior to the SFENCE.VMA are ordered before all implicit
> >>> references subsequent to the SFENCE.VMA.
> >>
> >>It naturally follows that we should use sfence.vma once the page table is
> >>modified.  There are several examples in the kernel already, such as
> >>
> >>alloc_set_pte (in mm/memory.c):
> >>...
> >>        set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
> >>        /* no need to invalidate: a not-present page won't be cached */
> >>        update_mmu_cache(vma, vmf->address, vmf->pte);
> >>...
> >>where the update_mmu_cache function eventually issues a sfence.vma.
> >>
> >>I was interested if it is always the case and did some research.  RV64 uses
> >>3-level of page table entry, pud, pmd and pte, so I traced a little bit about
> >>the code flow after set_pud, set_pmd and set_pte.
> >>
> >>It turns out that some of the calls to them are not followed by a
> >>sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
> >>there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
> >>later.
> 
> This specific one looks like a bug: we're trying to fill out the page table
> for the vmalloc region, but we'll just continue trapping without an
> "sfence.vma".  The path between poking the page tables and the sret is
> pretty short and doesn't appear to ever have an "sfence.vma", so I'm not
> sure how this could work.

I have some discussion with our hardware guys and architects previously.
Their hypothesis is that, the translation hardware on your board could somehow
snoop dcache, so that a update like this seamlessly work out any subsequent
VA-to-PA process.  Would you like to help verify this?  

riscv_virt board on QEMU doesn't matter because translation is not modeled.

> >>
> >>Are they bugs or I just misunderstand the instruction?  As the kernel has
> >>already been stable for quite a while now, it is not likely to be a critical
> >>bug.
> >>
> >>Any clarification will highly appreciated.
> 
> Well, certainly from this it looks pretty broken -- and in a manner I'd
> expect to trigger frequently.  There are no fences in any of the other
> similar-looking implementations.
> 
> Maybe I'm missing something here?

Actually, this set_pud is just one instance of this problem.

As mentioned in the previous mail, I've traced the current codebase to see which
functions call either set_pte, set_pmd, or set_pud.  Under my compiler 
optimization setting and environment, I found the following functions containing 
inlined et_p** but no obvious sfence.vma follows, just for your information:

PUD cases:
__pmd_alloc
pud_clear_bad

PMD cases:
pmd_clear_bad
__pte_alloc_kernel

Both PUD and PMD:
free_pgd_range
do_page_fault

PTE cases:
unmap_page_range
remap_pfn_range
copy_page_range
vm_insert_page
change_protection_range
page_mkclean_one
try_to_unmap_one
vmap_page_range_noflush
madvise_free_pte_range
remove_migration_pte
ioremap_page_range

Some also falls in the grey area.  For example, finish_mkwrite_fault
has an instruction sequence like

> 	sd	s3,0(s1)       // *ptep = pte
> 	ld	a5,24(s2)
> sfence.vma	a5

in which sfence.vma cannot follow by the PTE update immediately because
we would like to load the PTE value into $a5, which stands for the leaf PTE.

> 
> FWIW, if I apply the following diff
> 
>    diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
>    index 2a53d26ffdd6..fbd132d388fb 100644
>    --- a/arch/riscv/kernel/reset.c
>    +++ b/arch/riscv/kernel/reset.c
>    @@ -15,6 +15,8 @@
>     #include <linux/export.h>
>     #include <asm/sbi.h>
>    +extern long vmalloc_faults;
>    +
>     void (*pm_power_off)(void) = machine_power_off;
>     EXPORT_SYMBOL(pm_power_off);
>    @@ -31,6 +33,7 @@ void machine_halt(void)
>     void machine_power_off(void)
>     {
>    +	printk("vmalloc faults: %ld\n", vmalloc_faults);
>     	sbi_shutdown();
>     	while (1);
>     }
>    diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>    index 88401d5125bc..61ef1128632c 100644
>    --- a/arch/riscv/mm/fault.c
>    +++ b/arch/riscv/mm/fault.c
>    @@ -30,6 +30,8 @@
>     #include <asm/pgalloc.h>
>     #include <asm/ptrace.h>
>    +long vmalloc_faults = 0;
>    +
>     /*
>      * This routine handles page faults.  It determines the address and the
>      * problem, and then passes it off to one of the appropriate routines.
>    @@ -281,6 +283,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>     		pte_k = pte_offset_kernel(pmd_k, addr);
>     		if (!pte_present(*pte_k))
>     			goto no_context;
>    +
>    +		vmalloc_faults++;
>     		return;
>     	}
>     }
> 
> I get only a single vmalloc fault when doing a boot+shutdown of Fedora in
> QEMU, so maybe this just slipped through the cracks?

Thanks for the experiment, but as there are many other cases listed above,
maybe the fastest way to figure this mysterious out is to check the details
from your hardware people?  IMHO the hypothesis sounds possible.  Once that
is determined, we can figure out what to do to these pagetable updates
with ease.

Alan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
