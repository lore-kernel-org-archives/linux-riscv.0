Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D6EC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 16:03:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1082339E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 16:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1082339E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7jYLltD0OA5Dj8UkCsrB7UUP5foqieiFblANp9yly8Y=; b=tcUGEmOHhPkAeijapYz6LKin3
	vkfCuQfLkApKaEIK1OTbcOskUaCcFtv9G3052bzqDanc5y88AC5a15/+w4cgIrnhT7XHYnHk3pWgK
	KvRbXluh2JbB2uWusWpMZpmMvV9Egsr7gAS5PMk8DEX9brR1Wu90hNW01+8sVRCUgKLoNgNyA8VPN
	DrSHSwqULHgJ7LKGGF5ygqwkfdyNMBjW5xZkaEciVgnUTbY/oiLUkwJMobpumkrL43ZocUA8dHsmd
	YmZ41ZTfOUv6FjN0+DscjT3JWWSryXqxQnhMXnN0X4HPPLLlv6Jk5wnFiyKMaqIImja/Z2bvgt5IS
	ydG3QHZ2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Fwf-0003No-Un; Wed, 20 Jan 2021 16:02:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Fwd-0003My-0V; Wed, 20 Jan 2021 16:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=saaFHJth3qz3xI0Dro7UHa0PgnHwAKKwZMU5+56dtJE=; b=ZACVPHDnW8nMnHToaApes5g3Rw
 YvejBi+ndU51oeSrxqqcYYLAwliMBGBXghPXPYc7XG0lsgIcf+/IvR9eJvgtCr1Y5bxBLOsNZcLBQ
 vxSb7WDqPTplOeChJJO0bdqf2couRLArJqCqj+JJHVlMqYUasnii5Ahu8a9pr17qMCP5jWMHxkGSS
 q6aEdJuVPlms8bTXRO0qZ2BUkaKlzq/5TxYAwU0Ad6+fh/jU8PXLs9HsRV6qDt9A/EPq+R0dOuJcM
 Lpx6Y1tpfz20HDKCh6YfbGEj7XSx+aNMkVsZzAS1FtW9RnCqIaJmYKn7ticVopJumXn3gPadcnzNH
 uNwqFTFw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l2Fvu-00Fsqd-9M; Wed, 20 Jan 2021 16:02:37 +0000
Date: Wed, 20 Jan 2021 16:02:10 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v14 05/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210120160210.GK2260413@casper.infradead.org>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-6-rppt@kernel.org>
 <20210119202213.GI2260413@casper.infradead.org>
 <20210120150510.GO1106298@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120150510.GO1106298@kernel.org>
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

On Wed, Jan 20, 2021 at 05:05:10PM +0200, Mike Rapoport wrote:
> On Tue, Jan 19, 2021 at 08:22:13PM +0000, Matthew Wilcox wrote:
> > On Thu, Dec 03, 2020 at 08:29:44AM +0200, Mike Rapoport wrote:
> > > +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> > > +{
> > > +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> > > +	struct inode *inode = file_inode(vmf->vma->vm_file);
> > > +	pgoff_t offset = vmf->pgoff;
> > > +	vm_fault_t ret = 0;
> > > +	unsigned long addr;
> > > +	struct page *page;
> > > +	int err;
> > > +
> > > +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> > > +		return vmf_error(-EINVAL);
> > > +
> > > +	page = find_get_page(mapping, offset);
> > > +	if (!page) {
> > > +
> > > +		page = secretmem_alloc_page(vmf->gfp_mask);
> > > +		if (!page)
> > > +			return vmf_error(-ENOMEM);
> > 
> > Just use VM_FAULT_OOM directly.
>  
> Ok.
> 
> > > +		err = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);
> > > +		if (unlikely(err))
> > > +			goto err_put_page;
> > 
> > What if the error is EEXIST because somebody else raced with you to add
> > a new page to the page cache?
> 
> Right, for -EEXIST I need a retry here, thanks.
> 
> > > +		err = set_direct_map_invalid_noflush(page, 1);
> > > +		if (err)
> > > +			goto err_del_page_cache;
> > 
> > Does this work correctly if somebody else has a reference to the page
> > in the meantime?
> 
> Yes, it does. If somebody else won the race that page was dropped from the
> direct map and this call would be essentially a nop. And anyway, the very
> next patch changes the way pages are removed from the direct map ;-)

What I'm thinking is:

thread A page faults
doesn't find page
allocates page
adds page to page cache
				thread B page faults
				does find page in page cache
set direct map invalid fails
deletes from page cache
				... ?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
