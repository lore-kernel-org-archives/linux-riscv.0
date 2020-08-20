Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B6FC433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 15:53:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C84C122D2C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 15:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItCX6fkV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXdI/2i+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C84C122D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QCanNzydIGMyiKfqF0ERYdSkyw6JlSwOsCbNAHMuVYY=; b=ItCX6fkVWfdZNM0iSQc+a+MYv
	94JjPhHJcVcoGh4FX0QQWEDjuOrNhczVcWDK4JC9HdDUA9dA/DtrcCffvGRm7qr//q8fID+X1znap
	fJO6HEkSp5Hen1+/3XsZpX1LPq5NqGiIu41zT4EpuMotU2KmjbunzN/LMFOBjhM+bLgG7o6VFyhgt
	dIzW70B8BM2a5h/yG/W/m2QSGnFiXRJeasASrsSwjFxluBgUbwmvwS6CwgwdPIODbBg/WjIghxLSt
	dmCXhXP0RHzyolyYEAvI7XNkkWzaulAEC5d9Jg9v5Qf7LAkYfbUIsMf/XPJ/vnofIqol1IrvCBM5o
	DfqPq/vuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8mru-0003mK-97; Thu, 20 Aug 2020 15:52:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8mrp-0003kG-4J; Thu, 20 Aug 2020 15:52:41 +0000
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50D6F22D02;
 Thu, 20 Aug 2020 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597938759;
 bh=olFkF8WbsFuHtZd9ChmwDnMhq4dAB75kWwSK+0maCo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXdI/2i+uTIyui9Dqky2lOsnOB5jHumUoz9vyCWVksi+jCX/cin2X0NAhZkvzzrrA
 kwB1mQk9tmImk5FV5Ln6HbAMWznc6VF7fXJ8iI6/UHeReZUV1SP7agq0ae+f8/MDDg
 S/yXBOXnLzIrn/7Y0W5T1dTvbgWrpaeScrKjGVKk=
Date: Thu, 20 Aug 2020 18:52:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 6/6] mm: secretmem: add ability to reserve memory at
 boot
Message-ID: <20200820155228.GZ752365@kernel.org>
References: <20200818141554.13945-1-rppt@kernel.org>
 <20200818141554.13945-7-rppt@kernel.org>
 <03ec586d-c00c-c57e-3118-7186acb7b823@redhat.com>
 <20200819115335.GU752365@kernel.org>
 <10bf57a9-c3c2-e13c-ca50-e872b7a2db0c@redhat.com>
 <20200819173347.GW752365@kernel.org>
 <6c8b30fb-1b6c-d446-0b09-255b79468f7c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c8b30fb-1b6c-d446-0b09-255b79468f7c@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_115241_304368_EE24FC00 
X-CRM114-Status: GOOD (  33.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 07:45:29PM +0200, David Hildenbrand wrote:
> On 19.08.20 19:33, Mike Rapoport wrote:
> > On Wed, Aug 19, 2020 at 02:10:43PM +0200, David Hildenbrand wrote:
> >> On 19.08.20 13:53, Mike Rapoport wrote:
> >>> On Wed, Aug 19, 2020 at 12:49:05PM +0200, David Hildenbrand wrote:
> >>>> On 18.08.20 16:15, Mike Rapoport wrote:
> >>>>> From: Mike Rapoport <rppt@linux.ibm.com>
> >>>>>
> >>>>> Taking pages out from the direct map and bringing them back may create
> >>>>> undesired fragmentation and usage of the smaller pages in the direct
> >>>>> mapping of the physical memory.
> >>>>>
> >>>>> This can be avoided if a significantly large area of the physical memory
> >>>>> would be reserved for secretmem purposes at boot time.
> >>>>>
> >>>>> Add ability to reserve physical memory for secretmem at boot time using
> >>>>> "secretmem" kernel parameter and then use that reserved memory as a global
> >>>>> pool for secret memory needs.
> >>>>
> >>>> Wouldn't something like CMA be the better fit? Just wondering. Then, the
> >>>> memory can actually be reused for something else while not needed.
> >>>
> >>> The memory allocated as secret is removed from the direct map and the
> >>> boot time reservation is intended to reduce direct map fragmentatioan
> >>> and to avoid splitting 1G pages there. So with CMA I'd still need to
> >>> allocate 1G chunks for this and once 1G page is dropped from the direct
> >>> map it still cannot be reused for anything else until it is freed.
> >>>
> >>> I could use CMA to do the boot time reservation, but doing the
> >>> reservesion directly seemed simpler and more explicit to me.
> >>
> >> Well, using CMA would give you the possibility to let the memory be used
> >> for other purposes until you decide it's the right time to take it +
> >> remove the direct mapping etc.
> > 
> > I still can't say I follow you here. If I reseve a CMA area as a pool
> > for secret memory 1G pages, it is still reserved and it still cannot be
> > used for other purposes, right?
> 
> So, AFAIK, if you create a CMA pool it can be used for any MOVABLE
> allocations (similar to ZONE_MOVABLE) until you actually allocate CMA
> memory from that region. Other allocations on that are will then be
> migrated away (using alloc_contig_range()).
> 
> For example, if you have a 1~GiB CMA area, you could allocate 4~MB pages
> from that CMA area on demand (removing the direct mapping, etc ..), and
> free when no longer needed (instantiating the direct mapping). The free
> memory in that area could used for MOVABLE allocations.

The boot time resrvation is intended to avoid splitting 1G pages in the
direct map. Without the boot time reservation, we maintain a pool of 2M
pages so the 1G pages are split and 2M pages remain unsplit.

If I scale your example to match the requirement to avoid splitting 1G
pages in the direct map, that would mean creating a CMA area of several
tens of gigabytes and then doing cma_alloc() of 1G each time we need to
refill the secretmem pool. 

It is quite probable that we won't be able to get 1G from CMA after the
system worked for some time.

With boot time reservation we won't need physcally contiguous 1G to
satisfy smaller allocation requests for secretmem because we don't need
to maintain 1G mappings in the secretmem pool.

That said, I believe the addition of the boot time reservation, either
direct or with CMA, can be added as an incrememntal patch after the
"core" functionality is merged.

> Please let me know if I am missing something important.
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
