Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA24AC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 21:43:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C6F2360D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 21:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C6F2360D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ol7QA2kz/QCVpl+nkSN94sdNOo3XJ52yfSLbFWURjfc=; b=yE2xSt3LyBjtcYuYMzY6qldfL
	balYDHrcON0ZguQL3S06mUa9tUvzrC2KdhfA61eKpi+3zHMtvYK2oP1K5Vi8jiN7roPjhFXOc5weI
	+cqXZd4E1clqoj7/DcVVCalT6/xT1S/0U2Hoz59+c6n7FduDfeYRKaKD4sa3wAQFqMSdKBhFnqwx5
	sX4fE8vtQA86qyZvASNocFdGHdaEZg78zqiviEe0S/cnT0trG29DK5UGpqS5y3muNQYNppAuHNakg
	edjcNvQxsfD87zTyrXWtmaRwTwLcDlINHBSyJ8n+5KYO1sjHpZxuy07dvR5fMrG1j654Vel5auitW
	WEXU1gTEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2LFk-0001wS-Ol; Wed, 20 Jan 2021 21:43:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2LFf-0001uG-9r; Wed, 20 Jan 2021 21:42:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E57F23600;
 Wed, 20 Jan 2021 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611178974;
 bh=ZemV/+dUIhWWETHuwU5pHRPb6MkbPLkRamXfzO/LwBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzb7oUqqqTl6faKktid0R1cfCdzOhvge6hefHpP1hVsOrRWHUIRjtRR24feMvviBV
 qSPgQ0BpNLkdq1Dh3XK99XOPci+LskNVcWHz5989GtZRhQv44Gf357HRSoLSYk494t
 IKjF5/HIb64hJBLOgZxf/YfAPKv47GTkUJBbd7DJcJTd2tSyzQVNhz0mzFh7G7vSAC
 QsPumwQssV3QVC+8stgE0LaJa76huTme80dU3hSp8RBkxnlwydBxS3gUzVaX1cLjEk
 zdGWVnOXpFdtYn/+WUm8E0F8/cTMAueXosEUkqwcn7jAPBJAPaxvqXgAzRBJ8CwIBD
 wQMKvnyLvI9vA==
Date: Wed, 20 Jan 2021 23:42:39 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v15 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210120214239.GR1106298@kernel.org>
References: <20210120180612.1058-1-rppt@kernel.org>
 <20210120180612.1058-7-rppt@kernel.org>
 <20210120203504.GM2260413@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120203504.GM2260413@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_164255_552660_3D39F999 
X-CRM114-Status: GOOD (  21.21  )
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
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Wed, Jan 20, 2021 at 08:35:04PM +0000, Matthew Wilcox wrote:
> On Wed, Jan 20, 2021 at 08:06:07PM +0200, Mike Rapoport wrote:
> > +static struct page *secretmem_alloc_page(gfp_t gfp)
> > +{
> > +	/*
> > +	 * FIXME: use a cache of large pages to reduce the direct map
> > +	 * fragmentation
> > +	 */
> > +	return alloc_page(gfp);
> > +}
> > +
> > +static vm_fault_t secretmem_fault(struct vm_fault *vmf)
> > +{
> > +	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> > +	struct inode *inode = file_inode(vmf->vma->vm_file);
> > +	pgoff_t offset = vmf->pgoff;
> > +	unsigned long addr;
> > +	struct page *page;
> > +	int err;
> > +
> > +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> > +		return vmf_error(-EINVAL);
> > +
> > +retry:
> > +	page = find_lock_page(mapping, offset);
> > +	if (!page) {
> > +		page = secretmem_alloc_page(vmf->gfp_mask);
> > +		if (!page)
> > +			return VM_FAULT_OOM;
> > +
> > +		err = set_direct_map_invalid_noflush(page, 1);
> > +		if (err)
> > +			return vmf_error(err);
> 
> Haven't we leaked the page at this point?

Well, yes. :(

But this code is anyway changed in the next patch. Is this really so
important to fix this in the middle of the series?
 
> > +		__SetPageUptodate(page);
> > +		err = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);
> 
> At this point, doesn't the page contain data from the last person to use
> the page?  ie we've leaked data to this process?  I don't see anywhere
> that we write data to the page.

The data is visible for all processes that share the file descriptor. So
no, we don't leak anything unless the file descriptor itself is leaked.

Did you have a particular scenario in mind?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
