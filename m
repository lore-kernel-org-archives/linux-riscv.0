Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705CAC433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:05:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 274DE23381
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 274DE23381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HrSTYlRkURKY3bobLybzJHrXejybcqquT5uzob7pvkY=; b=193JW7xiPvYfeTuaVL5AtP5+E
	H270EebKxD6aQN/gc/I89t1ynWQ5UQETNe2vAguaugo2umbCVweOAvbaGEV76+xIpRtuq0OcjGYku
	3O1+NREaBvGSgsSeHzky3eqV64uvr8rcZLvyvPyQXSqH24rCRYiFUJpMu5ajZUQXsIA9yeumxG4PG
	+IDhhHyBpnP54eiovfvaLFTycgU6e0OF0YiHQRRognuVnlG8k2C8/kIquRoiJ45Ob51DcI3lm9tML
	Q04Ojn/ldm9ve9pLWvSnLDkt45jyiTXWMnQ8zqOx18ehqWgiBNx+iENTw1CtATlhW8owAHcLc8K4d
	YfwsgAPow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2F35-0003LN-Nb; Wed, 20 Jan 2021 15:05:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2F31-0003JE-DI; Wed, 20 Jan 2021 15:05:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A01A23356;
 Wed, 20 Jan 2021 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611155125;
 bh=9874V4EQF8pGhQeRtiLlHuHTZWGypK1q+CZx02TXhZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVer5+wzd/VviGPx62NgeNadLX736EMkLOQOVHuy+k8sx0BcR+ivCEkKsnZIoxtnT
 GpWkXKSHUVrX3tMi+iQiZNVYUchhp0zB4TrjPy0CuHAyWgurs4kWeeuPwxfawgBGve
 xWg9JGEgJG54bZgaB141RZ4cuaX9zxlmp5uYxxVFC9vITcsuqfvwAakLkytsiWOGfL
 pNtcU5EE62T/qNQ15LxVmcJccjD7XRVg6hOvj3C8536te+4LBKab+YM8J44PRYhLZX
 NgPhXfCDCBlcUFMljfwDktrV1a/D2LNFJaqimj3Xi9rVUzUTR1HHM4iQVtrs0WE0Q2
 /+v3XgxNylKfQ==
Date: Wed, 20 Jan 2021 17:05:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v14 05/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210120150510.GO1106298@kernel.org>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-6-rppt@kernel.org>
 <20210119202213.GI2260413@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119202213.GI2260413@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_100527_575159_DFC27BBA 
X-CRM114-Status: GOOD (  24.48  )
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

On Tue, Jan 19, 2021 at 08:22:13PM +0000, Matthew Wilcox wrote:
> On Thu, Dec 03, 2020 at 08:29:44AM +0200, Mike Rapoport wrote:
> > +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> > +{
> > +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> > +	struct inode *inode = file_inode(vmf->vma->vm_file);
> > +	pgoff_t offset = vmf->pgoff;
> > +	vm_fault_t ret = 0;
> > +	unsigned long addr;
> > +	struct page *page;
> > +	int err;
> > +
> > +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> > +		return vmf_error(-EINVAL);
> > +
> > +	page = find_get_page(mapping, offset);
> > +	if (!page) {
> > +
> > +		page = secretmem_alloc_page(vmf->gfp_mask);
> > +		if (!page)
> > +			return vmf_error(-ENOMEM);
> 
> Just use VM_FAULT_OOM directly.
 
Ok.

> > +		err = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);
> > +		if (unlikely(err))
> > +			goto err_put_page;
> 
> What if the error is EEXIST because somebody else raced with you to add
> a new page to the page cache?

Right, for -EEXIST I need a retry here, thanks.

> > +		err = set_direct_map_invalid_noflush(page, 1);
> > +		if (err)
> > +			goto err_del_page_cache;
> 
> Does this work correctly if somebody else has a reference to the page
> in the meantime?

Yes, it does. If somebody else won the race that page was dropped from the
direct map and this call would be essentially a nop. And anyway, the very
next patch changes the way pages are removed from the direct map ;-)

> > +		addr = (unsigned long)page_address(page);
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +		__SetPageUptodate(page);
> 
> Once you've added it to the cache, somebody else can come along and try
> to lock it.  They will set PageWaiter.  Now you call __SetPageUptodate
> and wipe out their PageWaiter bit.  So you won't wake them up when you
> unlock.
> 
> You can call __SetPageUptodate before adding it to the page cache,
> but once it's visible to another thread, you can't do that.

Will fix.

> > +		ret = VM_FAULT_LOCKED;
> > +	}
> > +
> > +	vmf->page = page;
> 
> You're supposed to return the page locked, so use find_lock_page() instead
> of find_get_page().

Ok/
 
> > +	return ret;
> > +
> > +err_del_page_cache:
> > +	delete_from_page_cache(page);
> > +err_put_page:
> > +	put_page(page);
> > +	return vmf_error(err);
> > +}

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
