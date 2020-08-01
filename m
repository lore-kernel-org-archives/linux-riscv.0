Return-Path: <SRS0=fuf7=BL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E169C433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2020 10:19:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8FC2087C
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2020 10:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZWQ0Bzw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOX5CM31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A8FC2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=auP6jYx0NYlZ8rNIyuhVkWXrbD8cgD7AfHb2cIPSSok=; b=dZWQ0BzwbcCVN4deYnKkiqsi2
	CXXAWgZ1aALzBlupMwLsu4kQXmzQ+LATJD1qEYiEtc/XRu4u9O5Weg0TqSKA7BZO/HTpCQz7VcCiJ
	WsZja3V0gdSmrJ1lQfzURHLC4JcyCnXCFO73NKI+NfPOlKeZbp5o/Y3vuvVJUAUrr27jS/I+MH6gE
	AI79u9uD5+i3hhm+r9YlisGSDtlIGyxZiPMX7/5V4TuqV1LzdZYC+tvi54umb1F/h7rZkVnNCm6ZW
	EN/3aIHFQyiAEdm1wJQPvCui3HfbZDdP4S1N42k3K+CCpJW3OKuJaZQYwoJdqp6So99OWBt0KCRv3
	rEs0EmQGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1obj-00080C-SG; Sat, 01 Aug 2020 10:19:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1obg-0007yV-Hl; Sat, 01 Aug 2020 10:19:13 +0000
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ED692087C;
 Sat,  1 Aug 2020 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596277150;
 bh=jQD0i2dEJRPR8dDJK6vZOAFdpUe2Ho5YLvcSFtENhXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BOX5CM31age4ZqR8WpA9Tu6Sib3TWB8q0axiVZJ9476Af21jQMyZgnRXNsbolGSGn
 pWpwQlO3I1Ym/ZhVqWnuEZ70zJ8p8UgBgfsl0uitfuYMEFBB9GFeRHX0dU8VC7876G
 1GC7zC28lCBEAGXT18VZfRnXSGNcrY6WFAZx7Yv0=
Date: Sat, 1 Aug 2020 13:18:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
Message-ID: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org>
 <87d04d5hda.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d04d5hda.fsf@mpe.ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_061912_709844_610286B3 
X-CRM114-Status: GOOD (  29.03  )
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2020 at 10:15:13PM +1000, Michael Ellerman wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > fadump_reserve_crash_area() reserves memory from a specified base address
> > till the end of the RAM.
> >
> > Replace iteration through the memblock.memory with a single call to
> > memblock_reserve() with appropriate  that will take care of proper memory
>                                      ^
>                                      parameters?
> > reservation.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/powerpc/kernel/fadump.c | 20 +-------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> I think this looks OK to me, but I don't have a setup to test it easily.
> I've added Hari to Cc who might be able to.
> 
> But I'll give you an ack in the hope that it works :)

Actually, I did some digging in the git log and the traversal was added
there on purpose by the commit b71a693d3db3 ("powerpc/fadump: exclude
memory holes while reserving memory in second kernel")
Presuming this is still reqruired I'm going to drop this patch and will
simply replace for_each_memblock() with for_each_mem_range() in v2.
 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> 
> > diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> > index 78ab9a6ee6ac..2446a61e3c25 100644
> > --- a/arch/powerpc/kernel/fadump.c
> > +++ b/arch/powerpc/kernel/fadump.c
> > @@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
> >  /* Preserve everything above the base address */
> >  static void __init fadump_reserve_crash_area(u64 base)
> >  {
> > -	struct memblock_region *reg;
> > -	u64 mstart, msize;
> > -
> > -	for_each_memblock(memory, reg) {
> > -		mstart = reg->base;
> > -		msize  = reg->size;
> > -
> > -		if ((mstart + msize) < base)
> > -			continue;
> > -
> > -		if (mstart < base) {
> > -			msize -= (base - mstart);
> > -			mstart = base;
> > -		}
> > -
> > -		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
> > -			(msize >> 20), mstart);
> > -		memblock_reserve(mstart, msize);
> > -	}
> > +	memblock_reserve(base, memblock_end_of_DRAM() - base);
> >  }
> >  
> >  unsigned long __init arch_reserved_kernel_pages(void)
> > -- 
> > 2.26.2

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
