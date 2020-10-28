Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07FCC4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 11:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65558246C6
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 11:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHfByzdi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUnXipj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65558246C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MKxs7pwTMeXIhmQjZYBRlKb3ncGajaxEqRDuM7Hl9pg=; b=oHfByzdioHeJoEmpf0YCrWlz4
	H1vUIwMtCI/zdNAltlAgVy4qglO71ZXloN9SgNkKpDgveH4aZnfNr93s7wy6ZdpDLpcb00xxayjsY
	xytgacEwfnNYla4ukQ0Wb2a8IT4Hyq4H7h+U/8I2jj9mfO6Tb10Mq/upGqRSBkY9GptpHIrnDudfI
	YJZWeifo5GK77R7Bzhwl48vERWc83TL+ck34/S+jxj2qXVe22VAg9r9vCLk67kElGacKFyvNJLY/J
	v6CR8qmVSNW7R6iiCYGO0Dy2hiAE2Sw1ZXghXwXTs6bv+QWY/jIVCsvbNCOMEfPlODaqTCsevLVio
	Q5oPogUSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXjfn-0000sc-6G; Wed, 28 Oct 2020 11:31:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXjff-0000pB-A1; Wed, 28 Oct 2020 11:31:18 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6741246C3;
 Wed, 28 Oct 2020 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603884674;
 bh=gjv0U3NBKOnTNW44zMRkwPjIj1Z7l37xu//HQaF8TcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cUnXipj6SCyD+eplDp9tJgGGwn2XxiBxnaCPOYRKRcF6AcrwUEHeSRRr9vZ0ie5Ek
 O9QqqyW5F35vu7he5aXY8rhMDZYP4dyGxJF4jP4TGOEc1CbbkAGYzd/w5djNh6qS70
 Sw2BJFOdgVYfPE9KAiE15TI5bQsRgWsjOYlHfBMk=
Date: Wed, 28 Oct 2020 13:30:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201028113059.GG1428094@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <20201028112011.GB27927@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028112011.GB27927@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_073115_620362_D5B99C4A 
X-CRM114-Status: GOOD (  33.93  )
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
 "cl@linux.com" <cl@linux.com>,
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
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 28, 2020 at 11:20:12AM +0000, Will Deacon wrote:
> On Tue, Oct 27, 2020 at 10:38:16AM +0200, Mike Rapoport wrote:
> > On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
> > > On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
> > > > On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
> > > > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > > > Indeed, for architectures that define
> > > > > > CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > > > > > it is
> > > > > > possible that __kernel_map_pages() would fail, but since this
> > > > > > function is
> > > > > > void, the failure will go unnoticed.
> > > > > 
> > > > > Could you elaborate on how this could happen? Do you mean during
> > > > > runtime today or if something new was introduced?
> > > > 
> > > > A failure in__kernel_map_pages() may happen today. For instance, on
> > > > x86
> > > > if the kernel is built with DEBUG_PAGEALLOC.
> > > > 
> > > >         __kernel_map_pages(page, 1, 0);
> > > > 
> > > > will need to split, say, 2M page and during the split an allocation
> > > > of
> > > > page table could fail.
> > > 
> > > On x86 at least, DEBUG_PAGEALLOC expects to never have to break a page
> > > on the direct map and even disables locking in cpa because it assumes
> > > this. If this is happening somehow anyway then we should probably fix
> > > that. Even if it's a debug feature, it will not be as useful if it is
> > > causing its own crashes.
> > > 
> > > I'm still wondering if there is something I'm missing here. It seems
> > > like you are saying there is a bug in some arch's, so let's add a WARN
> > > in cross-arch code to log it as it crashes. A warn and making things
> > > clearer seem like good ideas, but if there is a bug we should fix it.
> > > The code around the callers still functionally assume re-mapping can't
> > > fail.
> > 
> > Oh, I've meant x86 kernel *without* DEBUG_PAGEALLOC, and indeed the call
> > that unmaps pages back in safe_copy_page will just reset a 4K page to
> > NP because whatever made it NP at the first place already did the split.
> > 
> > Still, on arm64 with DEBUG_PAGEALLOC=n there is a possibility of a race
> > between map/unmap dance in __vunmap() and safe_copy_page() that may
> > cause access to unmapped memory:
> > 
> > __vunmap()
> >     vm_remove_mappings()
> >         set_direct_map_invalid()
> > 					safe_copy_page()	
> > 					    __kernel_map_pages()
> > 					    	return
> > 					    do_copy_page() -> fault
> > 					   	
> > This is a theoretical bug, but it is still not nice :) 							
> 
> Just to clarify: this patch series fixes this problem, right?

Yes.

> Will

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
