Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A3AC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 16:22:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F52120838
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 16:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUAeBsQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F52120838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6qBdGSmjoGeC0vQ5xvk/6fsvY8kdDbqVfjls6na6shc=; b=dUAeBsQZnexw1ikGkMqQRdj5g
	kT0liKp731y+Al3aB4AuiTHUSROqyHG/Br2alneH4Mh6kwKtn2WPWP60iiIx+UcYMa34qPjrtgOpF
	DtyycUlpqCKTcq1CFpDsnHtPHVL1eK9aO9od2hK4ZmYHDK1M7TGkyFJa0gA6eGKJXZA8/fHwf2izJ
	kn7AmedHAHYaAwTFk5YBm9emrNMpt8kicChdvzv1aMCL8ydJT2DH4aQRpeJ+ovCcv07hEGWTUmnd0
	Q8fqfkevk+J7Pl6gSJfN9zLYFqH8eCa0hOlptuzFDVKfIM16ZbgXIwXmrFTSGMoKHcFIfjjKb2S9a
	TqUOWqthA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1BK2-00035Q-K8; Thu, 30 Jul 2020 16:22:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1BJy-00033H-0S; Thu, 30 Jul 2020 16:22:19 +0000
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6264720838;
 Thu, 30 Jul 2020 16:22:12 +0000 (UTC)
Date: Thu, 30 Jul 2020 17:22:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 3/7] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200730162209.GB3128@gaia>
References: <20200727162935.31714-1-rppt@kernel.org>
 <20200727162935.31714-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727162935.31714-4-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_122218_190634_F11CB4BA 
X-CRM114-Status: GOOD (  23.45  )
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

Hi Mike,

On Mon, Jul 27, 2020 at 07:29:31PM +0300, Mike Rapoport wrote:
> For instance, the following example will create an uncached mapping (error
> handling is omitted):
> 
> 	fd = memfd_secret(SECRETMEM_UNCACHED);
> 	ftruncate(fd, MAP_SIZE);
> 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
[...]
> +static struct page *secretmem_alloc_page(gfp_t gfp)
> +{
> +	/*
> +	 * FIXME: use a cache of large pages to reduce the direct map
> +	 * fragmentation
> +	 */
> +	return alloc_page(gfp);
> +}
> +
> +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> +{
> +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> +	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	pgoff_t offset = vmf->pgoff;
> +	unsigned long addr;
> +	struct page *page;
> +	int ret = 0;
> +
> +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> +		return vmf_error(-EINVAL);
> +
> +	page = find_get_entry(mapping, offset);
> +	if (!page) {
> +		page = secretmem_alloc_page(vmf->gfp_mask);
> +		if (!page)
> +			return vmf_error(-ENOMEM);
> +
> +		ret = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);
> +		if (unlikely(ret))
> +			goto err_put_page;
> +
> +		ret = set_direct_map_invalid_noflush(page);
> +		if (ret)
> +			goto err_del_page_cache;
> +
> +		addr = (unsigned long)page_address(page);
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +		__SetPageUptodate(page);
> +
> +		ret = VM_FAULT_LOCKED;
> +	}
> +
> +	vmf->page = page;
> +	return ret;
> +
> +err_del_page_cache:
> +	delete_from_page_cache(page);
> +err_put_page:
> +	put_page(page);
> +	return vmf_error(ret);
> +}
> +
> +static const struct vm_operations_struct secretmem_vm_ops = {
> +	.fault = secretmem_fault,
> +};
> +
> +static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct secretmem_ctx *ctx = file->private_data;
> +	unsigned long mode = ctx->mode;
> +	unsigned long len = vma->vm_end - vma->vm_start;
> +
> +	if (!mode)
> +		return -EINVAL;
> +
> +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> +		return -EINVAL;
> +
> +	if (mlock_future_check(vma->vm_mm, vma->vm_flags | VM_LOCKED, len))
> +		return -EAGAIN;
> +
> +	switch (mode) {
> +	case SECRETMEM_UNCACHED:
> +		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +		fallthrough;
> +	case SECRETMEM_EXCLUSIVE:
> +		vma->vm_ops = &secretmem_vm_ops;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vma->vm_flags |= VM_LOCKED;
> +
> +	return 0;
> +}

I think the uncached mapping is not the right thing for arm/arm64. First
of all, pgprot_noncached() gives us Strongly Ordered (Device memory)
semantics together with not allowing unaligned accesses. I suspect the
semantics are different on x86.

The second, more serious problem, is that I can't find any place where
the caches are flushed for the page mapped on fault. When a page is
allocated, assuming GFP_ZERO, only the caches are guaranteed to be
zeroed. Exposing this subsequently to user space as uncached would allow
the user to read stale data prior to zeroing. The arm64
set_direct_map_default_noflush() doesn't do any cache maintenance.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
