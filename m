Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F991C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 20:37:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D00023432
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 20:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D00023432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z+SBtrQtEVTcKzduH62V2mxELkMqvHaKFhw7/R0UHoc=; b=E+TAZxjA/rAjbfScMb2FJ4F+q
	mq9oTKV0/7h/YxOZsVx924ql9ILVlWbq5H4okryy2mZX0e4vqhq+exJRzvFWvdPnH7vlJjzwmxH4i
	igdZ5Crsgfsi/nPqGXYxuykKEXmhHhDoXlNPx7/Ands4p+6D2veSnkZ2iJr09aw6zmrOV5G2kOcJz
	X6QLPwe84nZYgCi4JrpQdxKbXYrSuM4E9d4YvsvfmcwH5aJvGMXQagAdtPqT9230wzrl2X0qWvyrO
	Ji2XMmW+/UNuPEXtwsWrc2TgPGSJdRRVTvwGihgvKALDDxifJBfErsaWtjg9NutSJaHvG6I0Nf3/l
	iGtldJLRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2KDW-0001DW-Fs; Wed, 20 Jan 2021 20:36:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2KCW-0000pA-BN; Wed, 20 Jan 2021 20:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wha2ICxXtgWp8RSsmCA+ALoEMK4ppTh6Oifr+i/Aq5k=; b=POzz2vX4NL2FOL5KBbnP1afVXx
 7DUTchSw2uhr4v29pMLrprop/X/8ZeNKhQq7aAFkKjGCAaz+4r1ZagnvTwdmKGmT9i0FzNXsqZahm
 q9E7TLVeaTjgo4hB//QCK/z3qo/IC038TH8qoDfcTrbEX4HQwU+j3xjBQbd2dBZq1M8sL4f6Bgywx
 uWLIgA09gDv+4QyFtj2nzdZ6SX/r+mfucsyd3HnBXPOJQTMl8QIGIc+jM4N6BLZRg11soghFJAHDI
 MBF25b/+EoBQGmRDSRBoj1XqDhYK0b2JcmyiChLejE9AC5YkNQhOshX3nQckPpNNZoG+dbrcsXsTk
 Y0dgmP2g==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l2KC0-00GBPk-8o; Wed, 20 Jan 2021 20:35:07 +0000
Date: Wed, 20 Jan 2021 20:35:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v15 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210120203504.GM2260413@casper.infradead.org>
References: <20210120180612.1058-1-rppt@kernel.org>
 <20210120180612.1058-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120180612.1058-7-rppt@kernel.org>
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

On Wed, Jan 20, 2021 at 08:06:07PM +0200, Mike Rapoport wrote:
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
> +	int err;
> +
> +	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
> +		return vmf_error(-EINVAL);
> +
> +retry:
> +	page = find_lock_page(mapping, offset);
> +	if (!page) {
> +		page = secretmem_alloc_page(vmf->gfp_mask);
> +		if (!page)
> +			return VM_FAULT_OOM;
> +
> +		err = set_direct_map_invalid_noflush(page, 1);
> +		if (err)
> +			return vmf_error(err);

Haven't we leaked the page at this point?

> +		__SetPageUptodate(page);
> +		err = add_to_page_cache(page, mapping, offset, vmf->gfp_mask);

At this point, doesn't the page contain data from the last person to use
the page?  ie we've leaked data to this process?  I don't see anywhere
that we write data to the page.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
