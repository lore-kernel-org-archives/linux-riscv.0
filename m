Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B95C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3h6BVV7jb7OW3EHJYQCNi5qjXZwLio2mDMRp7MCPJg=; b=DblNuNvKCsMtlX
	ivpI6YgErRPcsjqMpH7fke2kjHEUx0enl/VM87rJox/3Y/nKPWTZe/JM8Gc2F+WPQiTtfn1BqtdVX
	YurDoUYZcK0fZyetP/xKOGu6ymlm18Ckh1xmJAuCEwwrhjO1WI/GFf+VPMuexgfN3SWakKEq2bQDk
	YIPGaO/2tmxdyMLTtVXJctpU8/wycdM6gWKgJLf3mX+I39gm6CsvIAyMw7xegqI0WZpXiP+UB03td
	/OxdNiOznQP76P8XhMoxWMBpsbVgh2ZBO7Wk9UoKxRd76jNg2wYk8DFlvJlxDGV/jlZXyn4Eu+INe
	TGeN4AQsv5YcJDS1HJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlY5-0000000Czjf-13no;
	Tue, 16 Apr 2024 16:20:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlY1-0000000CzhN-18m6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 16:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39B03CE1056;
	Tue, 16 Apr 2024 16:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E98C113CE;
	Tue, 16 Apr 2024 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713284437;
	bh=IdxsQtYfDChkI825sswlPFFsLG18TizRixcQTe0GU+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJ3JfecIfR0RG90DjjKBO/IzYxYgUZoinL+ICvju60akeupllGua+bdVjUkHeZoOU
	 rrh8C2I5+D6gylneSLP41HrjfkZ/jOqUjXFJl1wcPlI9coCwFXf37RY466/46Dflk2
	 uXKz1LZ4Em7voJLG1tQNdQ3cpqt0OttXJNpmAQ6MZ/o9jBu8928zDaLb05wPpTPoDZ
	 X6MXOqMVy6GHFaE4uIxS+JDpwP+0hS145prGm6ZJjlWm1q98baevz2Hrw66dXwQV8Q
	 09Om9vh1/uMByU3H9EFkyYnx6XjHo2uOJMZkjd80hsOypgW4EW219VBE7X6HjaSvJQ
	 btkrDaW78I1Ew==
Date: Tue, 16 Apr 2024 19:19:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <Zh6lD8d7cUZdkZJb@kernel.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416171713.7d76fe7d@namcao>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_092041_703694_FE2433BA 
X-CRM114-Status: GOOD (  47.46  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 16, 2024 at 05:17:13PM +0200, Nam Cao wrote:
> On 2024-04-16 Mike Rapoport wrote:
> > Hi,
> > =

> > On Tue, Apr 16, 2024 at 01:02:20PM +0200, Bj=F6rn T=F6pel wrote:
> > > Christian Brauner <brauner@kernel.org> writes:
> > > =

> > > > [Adding Mike who's knowledgeable in this area]
> > > =

> > > >> > Further, it seems like riscv32 indeed inserts a page like that t=
o the
> > > >> > buddy allocator, when the memblock is free'd:
> > > >> > =

> > > >> >   | [<c024961c>] __free_one_page+0x2a4/0x3ea
> > > >> >   | [<c024a448>] __free_pages_ok+0x158/0x3cc
> > > >> >   | [<c024b1a4>] __free_pages_core+0xe8/0x12c
> > > >> >   | [<c0c1435a>] memblock_free_pages+0x1a/0x22
> > > >> >   | [<c0c17676>] memblock_free_all+0x1ee/0x278
> > > >> >   | [<c0c050b0>] mem_init+0x10/0xa4
> > > >> >   | [<c0c1447c>] mm_core_init+0x11a/0x2da
> > > >> >   | [<c0c00bb6>] start_kernel+0x3c4/0x6de
> > > >> > =

> > > >> > Here, a page with VA 0xfffff000 is a added to the freelist. We w=
ere just
> > > >> > lucky (unlucky?) that page was used for the page cache.
> > > >> =

> > > >> I just educated myself about memory mapping last night, so the bel=
ow
> > > >> may be complete nonsense. Take it with a grain of salt.
> > > >> =

> > > >> In riscv's setup_bootmem(), we have this line:
> > > >> 	max_low_pfn =3D max_pfn =3D PFN_DOWN(phys_ram_end);
> > > >> =

> > > >> I think this is the root cause: max_low_pfn indicates the last page
> > > >> to be mapped. Problem is: nothing prevents PFN_DOWN(phys_ram_end) =
from
> > > >> getting mapped to the last page (0xfffff000). If max_low_pfn is ma=
pped
> > > >> to the last page, we get the reported problem.
> > > >> =

> > > >> There seems to be some code to make sure the last page is not used
> > > >> (the call to memblock_set_current_limit() right above this line). =
It is
> > > >> unclear to me why this still lets the problem slip through.
> > > >> =

> > > >> The fix is simple: never let max_low_pfn gets mapped to the last p=
age.
> > > >> The below patch fixes the problem for me. But I am not entirely su=
re if
> > > >> this is the correct fix, further investigation needed.
> > > >> =

> > > >> Best regards,
> > > >> Nam
> > > >> =

> > > >> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > >> index fa34cf55037b..17cab0a52726 100644
> > > >> --- a/arch/riscv/mm/init.c
> > > >> +++ b/arch/riscv/mm/init.c
> > > >> @@ -251,7 +251,8 @@ static void __init setup_bootmem(void)
> > > >>  	}
> > > >>  =

> > > >>  	min_low_pfn =3D PFN_UP(phys_ram_base);
> > > >> -	max_low_pfn =3D max_pfn =3D PFN_DOWN(phys_ram_end);
> > > >> +	max_low_pfn =3D PFN_DOWN(memblock_get_current_limit());
> > > >> +	max_pfn =3D PFN_DOWN(phys_ram_end);
> > > >>  	high_memory =3D (void *)(__va(PFN_PHYS(max_low_pfn)));
> > > >>  =

> > > >>  	dma32_phys_limit =3D min(4UL * SZ_1G, (unsigned long)PFN_PHYS(ma=
x_low_pfn));
> > > =

> > > Yeah, AFAIU memblock_set_current_limit() only limits the allocation f=
rom
> > > memblock. The "forbidden" page (PA 0xc03ff000 VA 0xfffff000) will sti=
ll
> > > be allowed in the zone.
> > > =

> > > I think your patch requires memblock_set_current_limit() is
> > > unconditionally called, which currently is not done.
> > > =

> > > The hack I tried was (which seems to work):
> > > =

> > > --
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index fe8e159394d8..3a1f25d41794 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -245,8 +245,10 @@ static void __init setup_bootmem(void)
> > >          */
> > >         if (!IS_ENABLED(CONFIG_64BIT)) {
> > >                 max_mapped_addr =3D __pa(~(ulong)0);
> > > -               if (max_mapped_addr =3D=3D (phys_ram_end - 1))
> > > +               if (max_mapped_addr =3D=3D (phys_ram_end - 1)) {
> > >                         memblock_set_current_limit(max_mapped_addr - =
4096);
> > > +                       phys_ram_end -=3D 4096;
> > > +               }
> > >         }
> > =

> > You can just memblock_reserve() the last page of the first gigabyte, e.=
g.
> =

> "last page of the first gigabyte" - why first gigabyte? Do you mean
> last page of *last* gigabyte?
 =

With 3G-1G split linear map can map only 1G from 0xc0000000 to 0xffffffff
(or 0x00000000 with 32-bit overflow):

[    0.000000]       lowmem : 0xc0000000 - 0x00000000   (1024 MB)

> > 	if (!IS_ENABLED(CONFIG_64BIT)
> > 		memblock_reserve(SZ_1G - PAGE_SIZE, PAGE_SIZE);
> > =

> > The page will still be mapped, but it will never make it to the page
> > allocator.
> > =

> > The nice thing about it is, that memblock lets you to reserve regions t=
hat are
> > not necessarily populated, so there's no need to check where the actual=
 RAM
> > ends.
> =

> I tried the suggested code, it didn't work. I think there are 2
> mistakes:
>  - last gigabyte, not first
>  - memblock_reserve() takes physical addresses as arguments, not
>    virtual addresses
> =

> The below patch fixes the problem. Is this what you really meant?
> =

> Best regards,
> Nam
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..ac7efdd77be8 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -245,6 +245,7 @@ static void __init setup_bootmem(void)
>  	 * be done as soon as the kernel mapping base address is determined.
>  	 */
>  	if (!IS_ENABLED(CONFIG_64BIT)) {
> +		memblock_reserve(__pa(-PAGE_SIZE), __pa(PAGE_SIZE));

__pa(-PAGE_SIZE) is what I meant, yes. =


>  		max_mapped_addr =3D __pa(~(ulong)0);
>  		if (max_mapped_addr =3D=3D (phys_ram_end - 1))
>  			memblock_set_current_limit(max_mapped_addr - 4096);
> =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
