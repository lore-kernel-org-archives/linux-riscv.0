Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB502C4320A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 10:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B84961037
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 10:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B84961037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zK3frlr18EvtlFSlubf0S4LWQEcZtBjqivdEh8hCvcM=; b=FWpRDnH0S62u1n
	tibU5UyvJmo/Co7aA169YpntfzrUnPoTee+l1c7BNnaI0VPf9AEcagSuLgOO3m4Cr/PxOrBjlHSH2
	+Vb7oXvrF4bKWT4S5ezCc+W9ophmuG2r/N9nI63Tb2JVhx+U9J6zCsxDsj9fnw24YNYSHuvTpFPlK
	oAOoTV81tcyrRylbd92kfeDIpSNXJCp6sEq7c42JA5LKw8PYXpEtI4XljFVi1rnhj4GnqOSHJBJ4x
	+DqKTqtq4l34awSGqeQEEW1wrSdGeC61/89pTcMxxmCCZHI/Z2s61YRuAq03xmYSdyu+xj7dP51jo
	vIRTB4oApmeaDJh1M+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBDk0-005aMH-Ej; Wed, 04 Aug 2021 10:03:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBDjU-005a7M-Gx; Wed, 04 Aug 2021 10:02:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E224061004;
 Wed,  4 Aug 2021 10:02:34 +0000 (UTC)
Date: Wed, 4 Aug 2021 11:02:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Len Brown <lenb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3] memblock: make memblock_find_in_range method private
Message-ID: <20210804100231.GA4857@arm.com>
References: <20210803064218.6611-1-rppt@kernel.org>
 <20210803180526.GD5786@arm.com> <YQmT+Z9QhcwI43GK@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQmT+Z9QhcwI43GK@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_030240_753284_D609FD0E 
X-CRM114-Status: GOOD (  29.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 03, 2021 at 10:07:37PM +0300, Mike Rapoport wrote:
> On Tue, Aug 03, 2021 at 07:05:26PM +0100, Catalin Marinas wrote:
> > On Tue, Aug 03, 2021 at 09:42:18AM +0300, Mike Rapoport wrote:
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index 8490ed2917ff..0bffd2d1854f 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -74,6 +74,7 @@ phys_addr_t arm64_dma_phys_limit __ro_after_init;
> > >  static void __init reserve_crashkernel(void)
> > >  {
> > >  	unsigned long long crash_base, crash_size;
> > > +	unsigned long long crash_max = arm64_dma_phys_limit;
> > >  	int ret;
> > >  
> > >  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> > > @@ -84,33 +85,18 @@ static void __init reserve_crashkernel(void)
> > >  
> > >  	crash_size = PAGE_ALIGN(crash_size);
> > >  
> > > -	if (crash_base == 0) {
> > > -		/* Current arm64 boot protocol requires 2MB alignment */
> > > -		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
> > > -				crash_size, SZ_2M);
> > > -		if (crash_base == 0) {
> > > -			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> > > -				crash_size);
> > > -			return;
> > > -		}
> > > -	} else {
> > > -		/* User specifies base address explicitly. */
> > > -		if (!memblock_is_region_memory(crash_base, crash_size)) {
> > > -			pr_warn("cannot reserve crashkernel: region is not memory\n");
> > > -			return;
> > > -		}
> > > +	/* User specifies base address explicitly. */
> > > +	if (crash_base)
> > > +		crash_max = crash_base + crash_size;
> > >  
> > > -		if (memblock_is_region_reserved(crash_base, crash_size)) {
> > > -			pr_warn("cannot reserve crashkernel: region overlaps reserved memory\n");
> > > -			return;
> > > -		}
> > > -
> > > -		if (!IS_ALIGNED(crash_base, SZ_2M)) {
> > > -			pr_warn("cannot reserve crashkernel: base address is not 2MB aligned\n");
> > > -			return;
> > > -		}
> > > +	/* Current arm64 boot protocol requires 2MB alignment */
> > > +	crash_base = memblock_phys_alloc_range(crash_size, SZ_2M,
> > > +					       crash_base, crash_max);
> > > +	if (!crash_base) {
> > > +		pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> > > +			crash_size);
> > > +		return;
> > >  	}
> > > -	memblock_reserve(crash_base, crash_size);
> > 
> > We'll miss a bit on debug information provided to the user in case of a
> > wrong crash_base/size option on the command line. Not sure we care much,
> > though the alignment would probably be useful (maybe we document it
> > somewhere).
> 
> It is already documented:
> 
> Documentation/admin-guide/kdump/kdump.rst:
>    On arm64, use "crashkernel=Y[@X]".  Note that the start address of
>    the kernel, X if explicitly specified, must be aligned to 2MiB (0x200000).

Thanks for the pointer.

> > What I haven't checked is whether memblock_phys_alloc_range() aims to
> > get a 2MB aligned end (size) as well. If crash_size is not 2MB aligned,
> > crash_max wouldn't be either and the above could fail. We only care
> > about the crash_base to be aligned but the memblock_phys_alloc_range()
> > doc says that both the start and size would be aligned to this.
> 
> The doc lies :)
> 
> memblock_phys_alloc_range() boils down to 
> 
> 	for_each_free_mem_range_reverse(i, nid, flags, &this_start, &this_end,
> 					NULL) {
> 
> 		/* clamp this_{start,end} to the user defined limits */
> 
> 		cand = round_down(this_end - size, align);
> 		if (cand >= this_start)
> 			return cand;
> 	}

Alright, it should work then. For arm64:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
