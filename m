Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2831CC4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:49:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCA0207DE
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cwQxOyJN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cob/039d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCA0207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tSAhf8Jnv4HRsyCfU9EoOYJkXvepotKPl1SyvRaXEM4=; b=cwQxOyJNZREskQfx+Zjw6te5N
	CCTpSMv80BI6RSIbU3281GFi2SIYfCj7luhrg2eNGy9ZGgz/Stq5E6friaXzdcLtS+XI9ybxtzn3F
	NEL4zLQtOnLo0kWhMcd+4PpG11MewkH7DnbjMTdLzG5Ub9xMmVxs3MSymSlcz4x/vwLoLCGGZSx7n
	Bbt3jdieW5ln8mBjs5qPfskjSvNxx5VRyXLnPbn0XA9nqyXs1QJn8latgK+ulhfq9TRfiVzQvpINK
	qcplz8242BwhGCwtwa2sHHEtpgYYMmDQ+SubqA6pcmydTJ40Y0soRjPFOaxarsSLLOm5WGpWJHgmk
	2l2YWTWlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXKfZ-0004I8-9U; Tue, 27 Oct 2020 08:49:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXKfO-0004Dr-EY; Tue, 27 Oct 2020 08:49:19 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 817B6207DE;
 Tue, 27 Oct 2020 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603788557;
 bh=vqvHVfwUem4JOBq/WXsfNE79L5Iz5nEhnMlkJj2ElFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cob/039dcWnn8OjH5If0m1K0e5hz+wi7uaTqafHhMC0w6AKDJ7mof/L9QVAWjAi5m
 AzwVpAcX/G3bIeFGz/QZ6LDXFrWjC3A32wjsC/UaCx/T35y4jeNZtg1G5OqKcQamFp
 mFhuBk5Uhn3ItuoN/wmMtQFg0IPWtBPQaAK5nUZY=
Date: Tue, 27 Oct 2020 10:49:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Message-ID: <20201027084902.GH1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
 <20201026091554.GB1154158@kernel.org>
 <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_044918_795560_03DEF45A 
X-CRM114-Status: GOOD (  27.73  )
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
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 06:57:32PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2020-10-26 at 11:15 +0200, Mike Rapoport wrote:
> > On Mon, Oct 26, 2020 at 12:38:32AM +0000, Edgecombe, Rick P wrote:
> > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page
> > > > may
> > > > be
> > > > not present in the direct map and has to be explicitly mapped
> > > > before
> > > > it
> > > > could be copied.
> > > > 
> > > > On arm64 it is possible that a page would be removed from the
> > > > direct
> > > > map
> > > > using set_direct_map_invalid_noflush() but __kernel_map_pages()
> > > > will
> > > > refuse
> > > > to map this page back if DEBUG_PAGEALLOC is disabled.
> > > 
> > > It looks to me that arm64 __kernel_map_pages() will still attempt
> > > to
> > > map it if rodata_full is true, how does this happen?
> > 
> > Unless I misread the code, arm64 requires both rodata_full and
> > debug_pagealloc_enabled() to be true for __kernel_map_pages() to do
> > anything.
> > But rodata_full condition applies to set_direct_map_*_noflush() as
> > well,
> > so with !rodata_full the linear map won't be ever changed.
> 
> Hmm, looks to me that __kernel_map_pages() will only skip it if both
> debug pagealloc and rodata_full are false.
> 
> But now I'm wondering if maybe we could simplify things by just moving
> the hibernate unmapped page logic off of the direct map. On x86,
> text_poke() used to use this reserved fixmap pte thing that it could
> rely on to remap memory with. If hibernate had some separate pte for
> remapping like that, then we could not have any direct map restrictions
> caused by it/kernel_map_pages(), and it wouldn't have to worry about
> relying on anything else.

Well, there is map_kernel_range() that can be used by hibernation as
there is no requirement for particular virtual address, but that would
be quite costly if done for every page.

Maybe we can do somthing like

	if (kernel_page_present(s_page)) {
		do_copy_page(dst, page_address(s_page));
	} else {
		map_kernel_range_noflush(page_address(page), PAGE_SIZE,
					 PROT_READ, &page);
		do_copy_page(dst, page_address(s_page));
		unmap_kernel_range_noflush(page_address(page), PAGE_SIZE);
	}

But it seems that a prerequisite for changing the way a page is mapped
in safe_copy_page() would be to teach hibernation that a mapping here
may fail.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
