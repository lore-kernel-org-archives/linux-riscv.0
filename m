Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3389C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A0E20645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L/aLaXxH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUOzSdhM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A0E20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvyazKpnWfk4LnAPnd0x4QjgU2GBri3UonqAjpoxqZk=; b=L/aLaXxHw/AVEb
	9oPBEDOe4YBv5qUXvR7epXFha5Z2NpnjnusObtbjFgts1IuxzIVk8LAmr0kyS5jEXKHqg8P9dLWo8
	/TrHJCQ6HOtmlO96WwQl1J7Chxb84ozNWJXF9dclbu/kXAAQjtbIuGUveBbwESb+a43oQDgDSGt9/
	TLvUbcx0JffupRtz62i/cN/guyxDwBMGRU5YhsiyzuyZ1MbevxiMR4WE/bsMre4vO/uoG0065pMKp
	1G2jXMpDLlwimx91wQNIQyDEutmifsBRHX8e6H3ps6ST8D9PuHssp6m20x36eDAhr74NT+dO7JPgT
	ZWAL0iFcix4qNn2JVzuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRI8-0004sJ-Uc; Tue, 15 Jan 2019 16:10:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRI5-0004UR-B7
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 16:10:15 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8EF620645;
 Tue, 15 Jan 2019 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547568610;
 bh=0MnOS9LDHfl8BmPZHjoV1rOe8OZATuZFEWUAuHMahFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XUOzSdhMI5ILmXbe7dicd/dIWlXWpSrCbhSQZUPAJGReMgRo4ArAZOajAeYXyBT5S
 yKkFrTfdP1kDSzTQmUJho0xHnvH1DFL5/skcYIjN/nwt1w6yhhAl4I3N1aKwY/KOV4
 pPpX9NYXthM1opr6SdXLUSGYgal9nELivanud8hE=
Date: Wed, 16 Jan 2019 00:10:00 +0800
From: Guo Ren <guoren@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
Message-ID: <20190115161000.GA22705@guoren-Inspiron-7460>
References: <1547280987-7630-1-git-send-email-guoren@kernel.org>
 <20190115153613.GC26443@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115153613.GC26443@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081013_464201_77A783C7 
X-CRM114-Status: GOOD (  19.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Mao Han <mao_han@c-sky.com>,
 Guo Ren <ren_guo@c-sky.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 07:36:13AM -0800, Christoph Hellwig wrote:
> On Sat, Jan 12, 2019 at 04:16:27PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> > 
> > max_low_pfn should be pfn_size not byte_size.
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Signed-off-by: Mao Han <mao_han@c-sky.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > ---
> >  arch/riscv/kernel/setup.c | 2 +-
> >  arch/riscv/mm/init.c      | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index fc8006a..5463e67 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -174,7 +174,7 @@ static void __init setup_bootmem(void)
> >  	BUG_ON(mem_size == 0);
> >  
> >  	set_max_mapnr(PFN_DOWN(mem_size));
> > -	max_low_pfn = memblock_end_of_DRAM();
> > +	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
> 
> I know it is used just above, but can we please just switch this
> code to use >> PAGE_SHIFT instead of PFN_DOWN, which just horribly
> obsfucates what is going on?
???
#define PFN_DOWN(x)	((x) >> PAGE_SHIFT)

phys_addr_t __init_memblock memblock_end_of_DRAM(void)
{
	int idx = memblock.memory.cnt - 1;

	return (memblock.memory.regions[idx].base + memblock.memory.regions[idx].size);
}

What's the problem? PFN_DOWN() couldn't be used with function call?

> 
> >  
> >  #ifdef CONFIG_BLK_DEV_INITRD
> >  	setup_initrd();
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 1d9bfaf..658ebf6 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -28,7 +28,8 @@ static void __init zone_sizes_init(void)
> >  	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
> >  
> >  #ifdef CONFIG_ZONE_DMA32
> > -	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
> > +	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G,
> > +			(unsigned long) PFN_PHYS(max_low_pfn)));
> >  #endif
> 
> Same comment as above here, plus I think we should just use
> memblock_end_of_DRAM directly, e.g. something like:
> 
> static const phys_addr_t max_dma32_addr = 4UL * SZ_1G;
> 
> 	max_zone_pfns[ZONE_DMA32] =
> 		min(memblock_end_of_DRAM(), max_dma32_addr) >> PAGE_SHIFT;
Em... The meaning of PFN_PHYS(max_low_pfn) != memblock_end_of_DRAM() in
32-bit highmem system. Of cause, riscv doesn't support highmem, so I
think memblock_end_of_DRAM() is also OK.

But...

static void __init zone_sizes_init(void)
{
	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };

#ifdef CONFIG_ZONE_DMA32
	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
#endif
	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;

	free_area_init_nodes(max_zone_pfns);
}

The max_low_pfn also used by ZONE_NORMAL, So shall we need change that?
	max_zone_pfns[ZONE_NORMAL] = PFN_DOWN(memblock_end_of_DRAM());
                                     ^^^^^^^^ also must >> PAGE_SHIFT?

My patch just want to point out that max_low_pfn is PFN not size. In fact
there is no error for running without my patch :P

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
