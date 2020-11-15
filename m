Return-Path: <SRS0=pUzR=EV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA1CC2D0E4
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 08:53:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BD32242E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2020 08:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vn1NGUJo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX2fpz59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1BD32242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Phx/1QZtPqLdbNYsQjPolTqi51NhVRrmMKPXsNQ9AyY=; b=vn1NGUJo4U4KRHH2FkYF6WTir
	V4j5wMHMYBIKdoRvi9KcA3k51b07duFaDtzgo/989kex7NqQj6H1Kf2Kdgp0El4OuJgOd7DGkVgSr
	+IPcc0HKwbr/mNb9ctUYhMI0SNIIZAEu+B1pC6eWBruZliyLoM6vk7CO4W11y+AuK+spPLO6xlict
	+g8mWlaxdIKArQOczMXU06Adlo5kIk1G69RRJf2QgA+PMRV1QB/XxoSibgffXEWvlRgHNX1pOkFQ9
	51svt51aoKZjqUK3u8d8Wai05+xBamcMRsK3L62d+4L6cX5+UrDuJAvboT5lgOIYE1eQtfWpMPl9p
	Wg4hRcWIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keDmt-0001Zk-H2; Sun, 15 Nov 2020 08:53:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keDmm-0001Xi-IT; Sun, 15 Nov 2020 08:53:26 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E7962242E;
 Sun, 15 Nov 2020 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605430403;
 bh=zogKbmLR5WuYYhS1A9PyjE2BBFUNYgIBXxOPOFu4jUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lX2fpz594y7d/5i/mEef+AbbnIJzikgvOzNnoqSfFlQrJb9q90Elp66aOiMYcs1zs
 TTHjnJQu5Da13GIKSCOa/J3DAETZs6oYZ3AL3AqwfPmxmxZFENcF3lAkHuh559m70/
 7Mni0kOKQphJSxWriCKyHTtX74+IDbuZ2lYSWHfw=
Date: Sun, 15 Nov 2020 10:53:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v8 4/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201115085307.GV4758@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-5-rppt@kernel.org>
 <20201113135848.GF17076@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113135848.GF17076@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_035325_024668_783609F3 
X-CRM114-Status: GOOD (  24.87  )
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
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 01:58:48PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 10, 2020 at 05:14:39PM +0200, Mike Rapoport wrote:
> > +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> > +{
> > +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> > +	struct inode *inode = file_inode(vmf->vma->vm_file);
> > +	pgoff_t offset = vmf->pgoff;
> > +	unsigned long addr;
> > +	struct page *page;
> > +	int ret = 0;
> > +
> > +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> > +		return vmf_error(-EINVAL);
> > +
> > +	page = find_get_entry(mapping, offset);
> 
> Why did you decide to use find_get_entry() here?  You don't handle
> swap or shadow entries.

Right, I've missed that. 

> > +	if (!page) {
> > +		page = secretmem_alloc_page(vmf->gfp_mask);
> > +		if (!page)
> > +			return vmf_error(-EINVAL);
> 
> Why is this EINVAL and not ENOMEM?

Ah, I was annoyed by OOMs I got when I simulated various allocation
failures, so I changed it to get SIGBUS instead and than forgot to restore.
Will fix.

> > +		ret = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);
> > +		if (unlikely(ret))
> > +			goto err_put_page;
> > +
> > +		ret = set_direct_map_invalid_noflush(page, 1);
> > +		if (ret)
> > +			goto err_del_page_cache;
> > +
> > +		addr = (unsigned long)page_address(page);
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +		__SetPageUptodate(page);
> > +
> > +		ret = VM_FAULT_LOCKED;
> > +	}
> > +
> > +	vmf->page = page;
> > +	return ret;
> 
> Does sparse not warn you about this abuse of vm_fault_t?  Separate out
> 'ret' and 'err'.
 
Will fix.

> Andrew, please fold in this fix.  I suspect Mike will want to fix
> the other things I mention above.
> 
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 3dfdbd85ba00..09ca27f21661 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -172,7 +172,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>  	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
>  		return vmf_error(-EINVAL);
>  
> -	page = find_get_entry(mapping, offset);
> +	page = find_get_page(mapping, offset);
>  	if (!page) {
>  		page = secretmem_alloc_page(ctx, vmf->gfp_mask);
>  		if (!page)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
