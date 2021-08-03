Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA993C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 19:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C1361029
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 19:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8C1361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHfn0++CTo92IyXDQMdAlfJQU335XWQNEeOIlDNMZ2s=; b=CgOMCSk7pgg2C+
	YUxEFurajfdcFL0t2JbhDhwCm84ySNAjSj0We1AeOmKcSzCwxazgfsSb1EaPZaoBqG3sdJy/cJS1Z
	kpnE7Qw/nqGqCdEuSQETsPTEPIezy0TMrbRfeWDnHbm5UGxVPcd/Gqdyq6ajKGuJROhVZhXrn7ucf
	gT3i/3ATd6vHOf1i8O+EGYgCL63YtkyqDP6ruxPolDxDa/OcUqSASrLELvh2zTv+PNWdlAXfUnSHL
	9eFThx+GUNewNSn/EBdOWE/MXxnb0E9XVi/Z418qR89v/Wh0/sDX93Uyq2+UpjGNIzs2CWZN27KwZ
	28u8MBMIkIxPicRxyGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAzmC-0040m7-SF; Tue, 03 Aug 2021 19:08:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAzlz-0040kN-Rq; Tue, 03 Aug 2021 19:08:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6758760F9C;
 Tue,  3 Aug 2021 19:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628017697;
 bh=+C3jjxLGYKPgJknmmGMOt0xrAE6Lm0yMyg9+fV845Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8zqBiAF+/8ByrtHscexhIqNJ3ZB6Q9VGNwYaOueNcmaK2iVDBJ7DZpIMyN51lRoa
 /kdDa3fYvlvArsXTmjlHyuNAjtVH4DKC+Oco312NYeUL1Iz1dYwnmfI9MKYYGOFCf+
 6fdAPndFlrgVFxJGXwp5I9zXWrfeCx6KfEOihedyO/RE0YoZvI8vFnE09Za7bZxbJQ
 5kuCtIORrLGHG2vE4xsI58xJjXeJjCvuKtQyzTekCAL178KuTOc97FuEFAKt8SRvlM
 1riAzWuQamXvHnghUF59KN2iD1n7MWJtZ/mPAM7jy2uMfj8GIHqqrCJ5AFZQQeHXLj
 gDIpHLkooESXg==
Date: Tue, 3 Aug 2021 22:07:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Message-ID: <YQmT+Z9QhcwI43GK@kernel.org>
References: <20210803064218.6611-1-rppt@kernel.org>
 <20210803180526.GD5786@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803180526.GD5786@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_120820_002848_BB4BBA0E 
X-CRM114-Status: GOOD (  26.32  )
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

On Tue, Aug 03, 2021 at 07:05:26PM +0100, Catalin Marinas wrote:
> On Tue, Aug 03, 2021 at 09:42:18AM +0300, Mike Rapoport wrote:
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 8490ed2917ff..0bffd2d1854f 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -74,6 +74,7 @@ phys_addr_t arm64_dma_phys_limit __ro_after_init;
> >  static void __init reserve_crashkernel(void)
> >  {
> >  	unsigned long long crash_base, crash_size;
> > +	unsigned long long crash_max = arm64_dma_phys_limit;
> >  	int ret;
> >  
> >  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> > @@ -84,33 +85,18 @@ static void __init reserve_crashkernel(void)
> >  
> >  	crash_size = PAGE_ALIGN(crash_size);
> >  
> > -	if (crash_base == 0) {
> > -		/* Current arm64 boot protocol requires 2MB alignment */
> > -		crash_base = memblock_find_in_range(0, arm64_dma_phys_limit,
> > -				crash_size, SZ_2M);
> > -		if (crash_base == 0) {
> > -			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> > -				crash_size);
> > -			return;
> > -		}
> > -	} else {
> > -		/* User specifies base address explicitly. */
> > -		if (!memblock_is_region_memory(crash_base, crash_size)) {
> > -			pr_warn("cannot reserve crashkernel: region is not memory\n");
> > -			return;
> > -		}
> > +	/* User specifies base address explicitly. */
> > +	if (crash_base)
> > +		crash_max = crash_base + crash_size;
> >  
> > -		if (memblock_is_region_reserved(crash_base, crash_size)) {
> > -			pr_warn("cannot reserve crashkernel: region overlaps reserved memory\n");
> > -			return;
> > -		}
> > -
> > -		if (!IS_ALIGNED(crash_base, SZ_2M)) {
> > -			pr_warn("cannot reserve crashkernel: base address is not 2MB aligned\n");
> > -			return;
> > -		}
> > +	/* Current arm64 boot protocol requires 2MB alignment */
> > +	crash_base = memblock_phys_alloc_range(crash_size, SZ_2M,
> > +					       crash_base, crash_max);
> > +	if (!crash_base) {
> > +		pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
> > +			crash_size);
> > +		return;
> >  	}
> > -	memblock_reserve(crash_base, crash_size);
> 
> We'll miss a bit on debug information provided to the user in case of a
> wrong crash_base/size option on the command line. Not sure we care much,
> though the alignment would probably be useful (maybe we document it
> somewhere).

It is already documented:

Documentation/admin-guide/kdump/kdump.rst:
   On arm64, use "crashkernel=Y[@X]".  Note that the start address of
   the kernel, X if explicitly specified, must be aligned to 2MiB (0x200000).
 
> What I haven't checked is whether memblock_phys_alloc_range() aims to
> get a 2MB aligned end (size) as well. If crash_size is not 2MB aligned,
> crash_max wouldn't be either and the above could fail. We only care
> about the crash_base to be aligned but the memblock_phys_alloc_range()
> doc says that both the start and size would be aligned to this.

The doc lies :)

memblock_phys_alloc_range() boils down to 

	for_each_free_mem_range_reverse(i, nid, flags, &this_start, &this_end,
					NULL) {

		/* clamp this_{start,end} to the user defined limits */

		cand = round_down(this_end - size, align);
		if (cand >= this_start)
			return cand;
	}

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
