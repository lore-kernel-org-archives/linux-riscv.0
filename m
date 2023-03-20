Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B416C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCUf+TbqhSU0Cc/8Vt9WmR3FXSCJjk/tGrlbA50p9Ow=; b=cTki66DxZZkEsD
	RWPhB/L0TNYVL2rtogoj6t1WLxHKeAT7wiCY3CP1LBou7yZYs1gSSNc8M4HqS916a3eyufBxq73fl
	+Y68ZzwbUBLnMWe7tI1c5D+Zo4KpWOaFK9fFqy08Mi3EiHIUJH1sU8BFoH2DkzmZbvSBk5LQ0Lp0V
	cIZnB0ILh0WVaU3KolnlRy6QnhNVXkG1u0LZbjX5/vsBHa36wKGB3blGJo17s817JLIOO+mhDzwNW
	GdJRtUElXs+6aJG78CJNc4qBm3Qd3iykRVdSHRdsk0uvkuoLj+FHI25dPPnc5+HZ4OnnF6fB6kgMh
	ubGOj/KZUtMHnIrqHrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peJYS-00A1Nn-02;
	Mon, 20 Mar 2023 17:44:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peJYO-00A1Mg-0x;
	Mon, 20 Mar 2023 17:44:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8401E61758;
	Mon, 20 Mar 2023 17:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88782C433EF;
	Mon, 20 Mar 2023 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679334254;
	bh=6DWJt0rrEq7W4EzAc8pwNUO8xNmHBtl5KZ70f953RzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XC3RVwkxvdJkDzjF8FSRbgTX/PSUM+XlKBbymCh2x+kc97dcQZWohPbBKWgd5cP8d
	 0O9+YU98jipjen13c3LbUtk7ozKRRORHvXfQ3zr45yf5uliOOnO15/bd9hSGL7C3wo
	 pVi/b5a/yTO6WqOLVDJ/layBzld0e64d4C8gC57eXEkYV9cuf4/dLwDBrlSH4ULJ5c
	 kj40KbM5m2dk4osuXVGTIu/4yJ/4yyudUKPf/TuExxSxyM8APjQd+D/LvtRw4IqXeF
	 6Xt0J6kq2oHZ2IsV+SmV3PS268168Cru1T55WfD6r51OsVIVTCVmh21/u2ao3HHrWv
	 dvYLbYktXlmjA==
Date: Mon, 20 Mar 2023 19:44:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 2/4] mm: Introduce memblock_isolate_memory
Message-ID: <ZBibYDR0h1UeL6L5@kernel.org>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <20230316131711.1284451-3-alexghiti@rivosinc.com>
 <ZBN4Hoo99DNd5wKx@kernel.org>
 <efe1ef6b-b1c2-8d5b-82b7-3cd64053643e@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efe1ef6b-b1c2-8d5b-82b7-3cd64053643e@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_104416_414586_8BC5FE5C 
X-CRM114-Status: GOOD (  31.75  )
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

On Mon, Mar 20, 2023 at 11:54:14AM +0100, Alexandre Ghiti wrote:
> Hi Mike,
> 
> On 3/16/23 21:12, Mike Rapoport wrote:
> > Hi Alexandre,
> > 
> > On Thu, Mar 16, 2023 at 02:17:09PM +0100, Alexandre Ghiti wrote:
> > > This function allows to split a region in memblock.memory and will be
> > > useful when setting up the linear mapping with STRICT_KERNEL_RWX: it
> > > allows to isolate the kernel text/rodata and then avoid to map those
> > > regions with a PUD/P4D/PGD.
> > Sorry I've missed it last time. The changelog is fine in the context of
> 
> 
> No worries :)
> 
> 
> > this series, but if you look at it as a part of memblock changelog it
> > doesn't provide enough background on why memblock_isolate_memory() is
> > useful.
> > 
> > Can you please add more context so it would be self explanatory?
> 
> 
> What about: "memblock.memory contains the list of memory regions and a
> memory region can cover memory that will be mapped with different
> permissions. So to ease the mapping process, allow to isolate those regions
> by introducing a new function called memblock_isolate_memory. This will be
> used in arch specific code to isolate the kernel text/rodata regions when
> STRICT_KERNEL_RWX is enabled so that we avoid mapping them with PUD/P4D/PGD
> mappings."

With this change

... STRICT_KERNEL_RWX is enabled so that they can be mapped with base pages.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> Thanks,
> 
> Alex
> 
> 
> > 
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > Tested-by: Anup Patel <anup@brainfault.org>
> > > ---
> > >   include/linux/memblock.h |  1 +
> > >   mm/memblock.c            | 20 ++++++++++++++++++++
> > >   2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > index 50ad19662a32..2f7ef97c0da7 100644
> > > --- a/include/linux/memblock.h
> > > +++ b/include/linux/memblock.h
> > > @@ -125,6 +125,7 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
> > >   int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
> > >   int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
> > >   int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
> > > +int memblock_isolate_memory(phys_addr_t base, phys_addr_t size);
> > >   void memblock_free_all(void);
> > >   void memblock_free(void *ptr, size_t size);
> > > diff --git a/mm/memblock.c b/mm/memblock.c
> > > index 25fd0626a9e7..e8c651a37012 100644
> > > --- a/mm/memblock.c
> > > +++ b/mm/memblock.c
> > > @@ -805,6 +805,26 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
> > >   	return 0;
> > >   }
> > > +/**
> > > + * memblock_isolate_memory - isolate given range in memblock.memory
> > > + * @base: base of range to isolate
> > > + * @size: size of range to isolate
> > > + *
> > > + * Isolates the given range in memblock.memory so that it does not share any
> > > + * region with other ranges.
> > > + *
> > > + * Return:
> > > + * 0 on success, -errno on failure.
> > > + */
> > > +
> > > +int __init_memblock memblock_isolate_memory(phys_addr_t base, phys_addr_t size)
> > > +{
> > > +	int start_rgn, end_rgn;
> > > +
> > > +	return memblock_isolate_range(&memblock.memory, base, size,
> > > +				      &start_rgn, &end_rgn);
> > > +}
> > > +
> > >   static int __init_memblock memblock_remove_range(struct memblock_type *type,
> > >   					  phys_addr_t base, phys_addr_t size)
> > >   {
> > > -- 
> > > 2.37.2
> > > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
