Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C5C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:38:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F7D22202
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 08:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6+OQEC9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vvKAPuYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F7D22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tjoj972dunzDEZTSNSSp6i8zmKWlOMF74WN/YeGz7ag=; b=I6+OQEC92DWp2qBds2vww37s+
	ffoeaGChXJSv3KtesuexN4/k3dwJ4fgjyg0HqUeKgubpKcNQI23VfjKx20OvSxjfEtLwyRt0I7Phw
	f/UnPhOsWZ5t7ppmNWolHldWeIGRGkm7aDhARcbKVZbcDAH6oJFVc6vxSH1cNJcTUe6Q5vztoBX2U
	fMIE4GRRB1LUSPETvMG670A1IUQFASIC++c7WH2kiJvPIik2TfSWzFPWYcH1N19ccQG8URS7SkHQS
	qNngshk5j7toKW/A6EqcGTAxLYTDpZNS/Exo45qzLyqJHNBY16SjW/hX7PtZacXlL5rwi21/8OPA7
	GEEL+VGyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXKV4-0002g1-MI; Tue, 27 Oct 2020 08:38:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXKUz-0002e1-KX; Tue, 27 Oct 2020 08:38:34 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C11822202;
 Tue, 27 Oct 2020 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603787912;
 bh=+dg6y245gJ/L/iVvDw0zsMRT1YcHeax7uEbyu/BJ1vU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vvKAPuYKxTdVNDwya4r3iDVjxe8A/dfT1KkHWZ2jber7PIqFofblUr/spVu5jBkBm
 MQdFvQl0xxFyWw19nhjLmQKrxETaTmSPzdpKryLQfRCY42kv1ouILXBiwwp7JDzj+f
 1m13PYW49F1mKn6btDBt0MyRnWGW82tINBD33+oE=
Date: Tue, 27 Oct 2020 10:38:16 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201027083816.GG1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_043833_867476_F5E3C7EB 
X-CRM114-Status: GOOD (  34.33  )
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

On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
> > On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
> > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > Indeed, for architectures that define
> > > > CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > > > it is
> > > > possible that __kernel_map_pages() would fail, but since this
> > > > function is
> > > > void, the failure will go unnoticed.
> > > 
> > > Could you elaborate on how this could happen? Do you mean during
> > > runtime today or if something new was introduced?
> > 
> > A failure in__kernel_map_pages() may happen today. For instance, on
> > x86
> > if the kernel is built with DEBUG_PAGEALLOC.
> > 
> >         __kernel_map_pages(page, 1, 0);
> > 
> > will need to split, say, 2M page and during the split an allocation
> > of
> > page table could fail.
> 
> On x86 at least, DEBUG_PAGEALLOC expects to never have to break a page
> on the direct map and even disables locking in cpa because it assumes
> this. If this is happening somehow anyway then we should probably fix
> that. Even if it's a debug feature, it will not be as useful if it is
> causing its own crashes.
> 
> I'm still wondering if there is something I'm missing here. It seems
> like you are saying there is a bug in some arch's, so let's add a WARN
> in cross-arch code to log it as it crashes. A warn and making things
> clearer seem like good ideas, but if there is a bug we should fix it.
> The code around the callers still functionally assume re-mapping can't
> fail.

Oh, I've meant x86 kernel *without* DEBUG_PAGEALLOC, and indeed the call
that unmaps pages back in safe_copy_page will just reset a 4K page to
NP because whatever made it NP at the first place already did the split.

Still, on arm64 with DEBUG_PAGEALLOC=n there is a possibility of a race
between map/unmap dance in __vunmap() and safe_copy_page() that may
cause access to unmapped memory:

__vunmap()
    vm_remove_mappings()
        set_direct_map_invalid()
					safe_copy_page()	
					    __kernel_map_pages()
					    	return
					    do_copy_page() -> fault
					   	
This is a theoretical bug, but it is still not nice :) 							

> > Currently, the only user of __kernel_map_pages() outside
> > DEBUG_PAGEALLOC
> > is hibernation, but I think it would be safer to entirely prevent
> > usage
> > of __kernel_map_pages() when DEBUG_PAGEALLOC=n.
> 
> I totally agree it's error prone FWIW. On x86, my mental model of how
> it is supposed to work is: If a page is 4k and NP it cannot fail to be
> remapped. set_direct_map_invalid_noflush() should result in 4k NP
> pages, and DEBUG_PAGEALLOC should result in all 4k pages on the direct
> map. Are you seeing this violated or do I have wrong assumptions?

You are right, there is a set of assumptions about the remapping of the
direct map pages that make it all work, at least on x86.
But this is very subtle and it's not easy to wrap one's head around
this.

That's why putting __kernel_map_pages() out of "common" use and
keep it only for DEBUG_PAGEALLOC would make things clearer.

> Beyond whatever you are seeing, for the latter case of new things
> getting introduced to an interface with hidden dependencies... Another
> edge case could be a new caller to set_memory_np() could result in
> large NP pages. None of the callers today should cause this AFAICT, but
> it's not great to rely on the callers to know these details.
 
A caller of set_memory_*() or set_direct_map_*() should expect a failure
and be ready for that. So adding a WARN to safe_copy_page() is the first
step in that direction :)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
