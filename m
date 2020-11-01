Return-Path: <SRS0=HNWJ=EH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17940C2D0A3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 17:02:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD472074F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 17:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eDgQvpAu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxsex5hs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD472074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SZ3zfIjGP1tpQF/cjnTACGkfRyHrxby/Skev1Lm1qIo=; b=eDgQvpAuGIvEzUSwkSZwB5nhP
	F/Klf7KvPVQh6m/o3OA5/2IRyd2GB3uHAcFDSxfXq67rIHy/dOz1pNdGum+Y3L1G3YBkLO07mC277
	L6StkyxDAA3I7fn2fsZ9HT70YTRIc29JiHEJpYVbQ9TA4jbt5IyYuioY+oOBYQf3oCaIaAnR7QpB4
	MU9vXRckqgeBSL3WGxn0s4JVlbWai5U8PIO/dfKo988DinLzjeNtuvcMbnGfsi0227gwYZk5DO0+y
	PoiWGZMNLFxmo8JXGC/MH4IpILyw+WDJePIewh9QJwbGFJRoxjhkqRq0BtLFnLTQo5J3PhV4SXIev
	aLkHPkaLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGkW-0001zo-4n; Sun, 01 Nov 2020 17:02:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGkR-0001xx-OX; Sun, 01 Nov 2020 17:02:32 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 420992074F;
 Sun,  1 Nov 2020 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250150;
 bh=HP+ZQ6Ps8oAsoYLOvWAk4ExSXyhayG0jX2yWoBMUttE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bxsex5hsLdBiTg92b0MNJxCbBPD+lO6NtdRjasPNMfUBXD6k5B0KcdxvFVYiQIEmX
 Bjfz+dfRQJnD6lyaCaBO97eSNhn6o7BX84zyBBhpcPltXScqdjcB1tCqstPvndRKPK
 MacevoYxMeN6oYR+VtqyVfF6MF53cPKygLmGPOBs=
Date: Sun, 1 Nov 2020 19:02:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Message-ID: <20201101170217.GD14628@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
 <20201029075416.GJ1428094@kernel.org>
 <604554805defb03d158c09aba4b5cced3416a7fb.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <604554805defb03d158c09aba4b5cced3416a7fb.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_120231_942324_78F5389F 
X-CRM114-Status: GOOD (  19.08  )
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

On Thu, Oct 29, 2020 at 11:19:18PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2020-10-29 at 09:54 +0200, Mike Rapoport wrote:
> > __kernel_map_pages() on arm64 will also bail out if rodata_full is
> > false:
> > void __kernel_map_pages(struct page *page, int numpages, int enable)
> > {
> >         if (!debug_pagealloc_enabled() && !rodata_full)
> >                 return;
> > 
> >         set_memory_valid((unsigned long)page_address(page), numpages,
> > enable);
> > }
> > 
> > So using set_direct_map() to map back pages removed from the direct
> > map
> > with __kernel_map_pages() seems safe to me.
> 
> Heh, one of us must have some simple boolean error in our head. I hope
> its not me! :) I'll try on more time.

Well, then it's me :)
You are right, I misread this and I could not understand why
!rodata_full bothers you.

> __kernel_map_pages() will bail out if rodata_full is false **AND**
> debug page alloc is off. So it will only bail under conditions where
> there could be nothing unmapped on the direct map.
> 
> Equivalent logic would be:
> 	if (!(debug_pagealloc_enabled() || rodata_full))
> 		return;
> 
> Or:
> 	if (debug_pagealloc_enabled() || rodata_full)
> 		set_memory_valid(blah)
> 
> So if either is on, the existing code will try to re-map. But the
> set_direct_map_()'s will only work if rodata_full is on. So switching
> hibernate to set_direct_map() will cause the remap to be missed for the
> debug page alloc case, with !rodata_full.
> 
> It also breaks normal debug page alloc usage with !rodata_full for
> similar reasons after patch 3. The pages would never get unmapped.

I've updated the patches, there should be no regression now.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
