Return-Path: <SRS0=O7qi=BK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D55C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 14:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722F1206FA
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 14:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bnmr+2CF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722F1206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+k68ZMKNTVEn0j9QspEI7PstRUDlSW3YO6ARNgc0ODA=; b=Bnmr+2CF8PQWCqJgAKOxQUJNp
	QQ8hG9TGmvWrD1SuJBu0V+AtJiJCfLPSuLJxAPtq4Ub4XZuw0u+S+IYIJthsCnwNroTfsoRVoZy2n
	odsDkLmsz3Hs9mCj+ergbcq6k49R8YFsbVWwf7i2W4FiXZnfiOJPdkEuzsTeGFfqZFhrmaw1PHnYH
	Ccqx+s8b/ia1YzZ6WTr/xMk7U14kDlfP8bwlL96Me+yuL4FKblBr2xwcpzO/3UM4RmuSpdJFqBj6A
	XtZJ8CatSDXcfDSPhCCh30IxRdVZPGBT7oCux2ePe2nup2hw8Ud7U8Ar17ybFsV6+pbRojz0Ej1it
	g5Z/UmwyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1W2L-0007l6-7K; Fri, 31 Jul 2020 14:29:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1W2G-0007fR-Mv; Fri, 31 Jul 2020 14:29:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D1A831B;
 Fri, 31 Jul 2020 07:29:20 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.4.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2B863F66E;
 Fri, 31 Jul 2020 07:29:13 -0700 (PDT)
Date: Fri, 31 Jul 2020 15:29:05 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 3/7] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200731142905.GA67415@C02TD0UTHF1T.local>
References: <20200727162935.31714-1-rppt@kernel.org>
 <20200727162935.31714-4-rppt@kernel.org>
 <20200730162209.GB3128@gaia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730162209.GB3128@gaia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_102924_873739_0187A7D7 
X-CRM114-Status: GOOD (  24.04  )
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
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2020 at 05:22:10PM +0100, Catalin Marinas wrote:
> On Mon, Jul 27, 2020 at 07:29:31PM +0300, Mike Rapoport wrote:

> > +static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
> > +{
> > +	struct secretmem_ctx *ctx = file->private_data;
> > +	unsigned long mode = ctx->mode;
> > +	unsigned long len = vma->vm_end - vma->vm_start;
> > +
> > +	if (!mode)
> > +		return -EINVAL;
> > +
> > +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> > +		return -EINVAL;
> > +
> > +	if (mlock_future_check(vma->vm_mm, vma->vm_flags | VM_LOCKED, len))
> > +		return -EAGAIN;
> > +
> > +	switch (mode) {
> > +	case SECRETMEM_UNCACHED:
> > +		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> > +		fallthrough;
> > +	case SECRETMEM_EXCLUSIVE:
> > +		vma->vm_ops = &secretmem_vm_ops;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	vma->vm_flags |= VM_LOCKED;
> > +
> > +	return 0;
> > +}
> 
> I think the uncached mapping is not the right thing for arm/arm64. First
> of all, pgprot_noncached() gives us Strongly Ordered (Device memory)
> semantics together with not allowing unaligned accesses. I suspect the
> semantics are different on x86.

> The second, more serious problem, is that I can't find any place where
> the caches are flushed for the page mapped on fault. When a page is
> allocated, assuming GFP_ZERO, only the caches are guaranteed to be
> zeroed. Exposing this subsequently to user space as uncached would allow
> the user to read stale data prior to zeroing. The arm64
> set_direct_map_default_noflush() doesn't do any cache maintenance.

It's also worth noting that in a virtual machine this is liable to be
either broken (with a potential loss of coherency if the host has a
cacheable alias as existing KVM hosts have), or pointless (if the host
uses S2FWB to upgrade Stage-1 attribues to cacheable as existing KVM
hosts also have).

I think that trying to avoid the data caches creates many more problems
than it solves, and I don't think there's a strong justification for
trying to support that on arm64 to begin with, so I'd rather entirely
opt-out on supporting SECRETMEM_UNCACHED.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
