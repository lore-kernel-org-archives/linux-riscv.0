Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E5BC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 20:23:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4563923104
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 20:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4563923104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8Ly+XOnKcYo3cBc4uf2Xx5HxjdXsAHzMgjHp0ty0OM=; b=rArd1UWvgCwo1xU+qhJ8g8oX9
	I5BVMSxOLcX/z4nH4bCeNWf9jtQJKUfOqoC/P6+kjj3V1pW5uMq+Xp2eWlrcrtFtpqqe7AlZd3fXU
	rSPMdz70OTz0NSGg2WyPuVO7bnMYReaxHUlJah8tpT3DQvSsqGRQgfFPuS3fiFjqhcqUsW3dQuuG4
	iZ72fXP8dEGUAKGRBC+9VdZN4oBuGeFrjkZHAfZO5F+ZfOVOYga5fGWAjIu1Knv8gDsBWgBoYsIPd
	hvvVXrkpOzzVPqENCU/6o3D7W8IK7G+qpFlrTfl5nAv6UU+Pq1eAWOyV7qmQuMTziKxPynPO9uId9
	KebP986uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1xX8-0007q1-Lx; Tue, 19 Jan 2021 20:23:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1xX6-0007pj-13; Tue, 19 Jan 2021 20:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3skarH8usgooZsIjjZg9m11Y8vaFLaunY8jfnB6wGPQ=; b=IcFHUlBLm4M8B7XITZrlaPwJZk
 PxLbfPfkfkOKcDtLlhfkXiUHka5CvTPb7hLgrgmT3Ja+UqcHjN9zY1H6Tmg+WZOu5IRktFRwdo/cS
 V9j3hg1Ow8RITENXtDtJLmBCwghrrgT8ZPHCKw/4HQvv4xpai+rfbtNKnht6rSRWFZHmep0AFdaLc
 WpT0BIFZXKaOI1hvNwPxLTcH2Gpj0LlBuWbpsOxA9rDZtRWPCXjXziJFZX6g2OZYB33LP00RMcFkb
 3de7nf3N03r6bUtfXPBA8XywS5tDj8kVNevPplCpPm+FZKgebPUFH+9MEl3Zc+oBbVK/fmh04LESS
 xKXNl/dg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l1xW1-00EmeP-RV; Tue, 19 Jan 2021 20:22:22 +0000
Date: Tue, 19 Jan 2021 20:22:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v14 05/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210119202213.GI2260413@casper.infradead.org>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203062949.5484-6-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 08:29:44AM +0200, Mike Rapoport wrote:
> +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> +{
> +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> +	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	pgoff_t offset = vmf->pgoff;
> +	vm_fault_t ret = 0;
> +	unsigned long addr;
> +	struct page *page;
> +	int err;
> +
> +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> +		return vmf_error(-EINVAL);
> +
> +	page = find_get_page(mapping, offset);
> +	if (!page) {
> +
> +		page = secretmem_alloc_page(vmf->gfp_mask);
> +		if (!page)
> +			return vmf_error(-ENOMEM);

Just use VM_FAULT_OOM directly.

> +		err = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);
> +		if (unlikely(err))
> +			goto err_put_page;

What if the error is EEXIST because somebody else raced with you to add
a new page to the page cache?

> +		err = set_direct_map_invalid_noflush(page, 1);
> +		if (err)
> +			goto err_del_page_cache;

Does this work correctly if somebody else has a reference to the page
in the meantime?

> +		addr = (unsigned long)page_address(page);
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +		__SetPageUptodate(page);

Once you've added it to the cache, somebody else can come along and try
to lock it.  They will set PageWaiter.  Now you call __SetPageUptodate
and wipe out their PageWaiter bit.  So you won't wake them up when you
unlock.

You can call __SetPageUptodate before adding it to the page cache,
but once it's visible to another thread, you can't do that.

> +		ret = VM_FAULT_LOCKED;
> +	}
> +
> +	vmf->page = page;

You're supposed to return the page locked, so use find_lock_page() instead
of find_get_page().

> +	return ret;
> +
> +err_del_page_cache:
> +	delete_from_page_cache(page);
> +err_put_page:
> +	put_page(page);
> +	return vmf_error(err);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
