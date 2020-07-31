Return-Path: <SRS0=O7qi=BK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB27C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 14:11:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644AB206DA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 14:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2L4g4d7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644AB206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UTOq5mFTFz2EAb65pNKjGb1rQEzcfVYPFr+EM06wluM=; b=H2L4g4d7okstVAN3+a/sKmupg
	y3YFCsinA3M5bUlxe7nRqvDi/taER/5xH63o9NV5OjAf1RfAZeQU6PTNN3+g0lCIWgPYlL4igmqBB
	mdJKnxWBMmZtR/I+U6tNmZAzPKVH+zXIrHG5hvJmCVAMJ7CHMVbal/xdgYLL+/DfQPcVH/bNuynmW
	dufqUsEBQwriDI3tIzmoeE2l9KCdw/e+WybzxwktwlcG0gAkEYL3fUk7UcLOJljkFQfE51wH7jkRF
	/Vn3UKfMhfprpKrjWgfznDg9xzKS/kuNP31OqOZ0Jsm/QYZw8CCRlbrDAQQwKjiN04tSBXWfGde5b
	oA55+2hBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1VkF-0005RI-6Q; Fri, 31 Jul 2020 14:10:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Vk7-0005OQ-Uq; Fri, 31 Jul 2020 14:10:40 +0000
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52369206DA;
 Fri, 31 Jul 2020 14:10:34 +0000 (UTC)
Date: Fri, 31 Jul 2020 15:10:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 3/7] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200731141031.GD29569@gaia>
References: <20200727162935.31714-1-rppt@kernel.org>
 <20200727162935.31714-4-rppt@kernel.org>
 <20200730162209.GB3128@gaia> <20200730204409.GB534153@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730204409.GB534153@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_101040_126789_DF9E38EB 
X-CRM114-Status: GOOD (  36.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2020 at 11:44:09PM +0300, Mike Rapoport wrote:
> On Thu, Jul 30, 2020 at 05:22:10PM +0100, Catalin Marinas wrote:
> > On Mon, Jul 27, 2020 at 07:29:31PM +0300, Mike Rapoport wrote:
> > > For instance, the following example will create an uncached mapping (error
> > > handling is omitted):
> > > 
> > > 	fd = memfd_secret(SECRETMEM_UNCACHED);
> > > 	ftruncate(fd, MAP_SIZE);
> > > 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
[...]
> > > +static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
> > > +{
> > > +	struct secretmem_ctx *ctx = file->private_data;
> > > +	unsigned long mode = ctx->mode;
> > > +	unsigned long len = vma->vm_end - vma->vm_start;
> > > +
> > > +	if (!mode)
> > > +		return -EINVAL;
> > > +
> > > +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> > > +		return -EINVAL;
> > > +
> > > +	if (mlock_future_check(vma->vm_mm, vma->vm_flags | VM_LOCKED, len))
> > > +		return -EAGAIN;
> > > +
> > > +	switch (mode) {
> > > +	case SECRETMEM_UNCACHED:
> > > +		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> > > +		fallthrough;
> > > +	case SECRETMEM_EXCLUSIVE:
> > > +		vma->vm_ops = &secretmem_vm_ops;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	vma->vm_flags |= VM_LOCKED;
> > > +
> > > +	return 0;
> > > +}
> > 
> > I think the uncached mapping is not the right thing for arm/arm64. First
> > of all, pgprot_noncached() gives us Strongly Ordered (Device memory)
> > semantics together with not allowing unaligned accesses. I suspect the
> > semantics are different on x86.
>  
> Hmm, on x86 it's also Strongly Ordered, but I didn't find any alignment
> restrictions. Is there a mode for arm64 that can provide similar
> semantics?
> 
> Would it make sence to use something like
> 
> #define pgprot_uncached(prot) \
> 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, \
> 			PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN)
> 
> or is it too weak?

Reading Elena's email, that's about preventing speculative loads. While
the arm64 Normal NC is non-cacheable (equivalent to write-combine), a
CPU is allowed to speculatively read from it. A carefully crafted gadget
could leave an imprint on a different part of the cache via speculative
execution based on a value in the secret memory. So IIUC, we want memory
that cannot be speculatively loaded from and that would be Device memory
on arm64 (with the alignment restrictions).

Now, I think we could relax this to Device_GRE. So maybe add a
pgprot_nospec() and allow architectures to define whatever they find
suitable. The exact semantics will be different between architectures.

> > The second, more serious problem, is that I can't find any place where
> > the caches are flushed for the page mapped on fault. When a page is
> > allocated, assuming GFP_ZERO, only the caches are guaranteed to be
> > zeroed. Exposing this subsequently to user space as uncached would allow
> > the user to read stale data prior to zeroing. The arm64
> > set_direct_map_default_noflush() doesn't do any cache maintenance.
> 
> Well, the idea of uncached mappings came from Elena [1] to prevent
> possibility of side channels that leak user space memory. So I think
> even without cache flushing after the allocation, user space is
> protected as all its memory accesses bypass cache so even after the page
> is freed there won't be stale data in the cache.
> 
> I think that it makes sense to limit SECRETMEM_UNCACHED only for
> architectures that define an appropriate protection, e.g.
> pgprot_uncahced(). For x86 it can be aliased to pgprot_noncached() and
> other architecures can define their versions.

Indeed, though as I said above, maybe use a name that suggests no
speculation since non-cacheable doesn't always guarantee that. Something
like pgprot_nospec() and SECRETMEM_NOSPEC.

However, your implementation still has the problem that such memory must
have the caches flushed before being mapped in user-space, otherwise we
leak other secrets via such pages to the caller. The only generic API we
have in the kernel for such things is the DMA one. If hch doesn't mind,
you could abuse it and call arch_dma_prep_coherent() prior to
set_direct_map_invalid_noflush() (if the mapping is non-cacheable).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
