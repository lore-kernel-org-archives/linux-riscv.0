Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FC4C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fqBdTOu4qoL6Pk82IuARpDwhcte8w42+e0XAexx3g4o=; b=UcQqrWyqUtI9Nu/b3ZdBU7snB3
	46CIGDyFC5i/vNTTxNamJQMLLbI2tFWleNWOFM2mT9OYYX3RRg+OdKkbim6GQOxK6VtQ1R1vPxaZE
	GnRiPji2hwEhOre4PxagIEInTBgZyPebEB2Pm6+3kog6MhpBrZmc410aEtErCLaXkai14tMc+oho5
	zMaPZp2HpZRbo/lE0oBpOuo3POVW13SmVsbzGyNZe2JbxxhidrMRDKxlis7Ubm9lpuNlGYmZWOij5
	xfIot9jek6XKeNI8Aevanx1drmqFQZPkRAKZ2FNkvA/ELqpTpAt4IbAL1rS2klV5H/qKoUBwFNpAu
	ocbEQZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5vy0-00BVVZ-Uc; Thu, 15 Dec 2022 21:40:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5vxw-00BVT9-PX
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 21:40:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id g10so330043plo.11
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 13:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UhQMoGzyPQoO6coVT0IwbZp+PXxQ7bh8ldQshrXNrk=;
        b=nd6useCy5mDi1KHbA55vHEOJhr8iFu/8qita2tBOeSNjQjOpoh4/MhEQwviPyefNV9
         AoM5k+Qd2OHhBKM8/hfxqyDcpN4coUzO1cAugUeg96yeY6T0aUfm1YB/41Ja6ohk9pm0
         vQ1xJt7kLNMRZVaYZatkh14ui8sBry5Uhfamnhts+rG1b39opgFI6iaOXMzdO9WKlMH3
         w/EwVoaaV5g4c4aZ8ZeE2+pzQy3D61l9pAuyN3dd368yYlq8WkD60l28/Lk8R4IQ0XpR
         ILzFn6+dDOHXUOrbR/cWXQkJ6lJpXvl0IhkTeHZC1gNmexkLi0+WO+GvC4KChLTpr10G
         0m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UhQMoGzyPQoO6coVT0IwbZp+PXxQ7bh8ldQshrXNrk=;
        b=5JbwgOSX/Oh2CTJFqjQnLKdOokYxIpODGV3Ha3Y2+LVZbc+lyB2u90XJJoJhbltRjl
         e6ST+L2DFTPxTD1XiZOtcnxPXWSTqpaRiR/VxPE39zpT46s1hg6QXMIE56jDOjlCldkM
         buR3BmCz88wk75c/xOXsRPbCBQ/iu5mtdKn9Swjpfa0aDhllWfVmQpUgWGP4KeDqgSky
         SO9yM+uB5sy6iN3oYR9oj7FHvvXelI8lMTdixXZzQxyhhCPGISBJiEfpc/zHgQMkGroA
         JrYg7xgfN1oB4hb27zcPfXnUnRG+din1WQkVt1OcraQQESXkFb1jZOSKFqppmJS2MwJA
         pbiA==
X-Gm-Message-State: ANoB5pmURipS5jJLly2cigpCIT7QuWKPsG7x1DgfxBcdaXsmQmXc0TOf
	z7jUiU9D8VRbS8eVFh4zX5JiHw==
X-Google-Smtp-Source: AA0mqf5MBUVcNkahTznoohWrAxg1q+3XZ47h2BCnANLg0HowcpfjH7uuG719LdG576kqb0KUKSlDyQ==
X-Received: by 2002:a17:90a:cf16:b0:219:861a:ac10 with SMTP id h22-20020a17090acf1600b00219861aac10mr30270560pju.6.1671140430425;
        Thu, 15 Dec 2022 13:40:30 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y1-20020a17090a474100b00218ae9916c4sm3542617pjg.35.2022.12.15.13.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 13:40:30 -0800 (PST)
Date: Thu, 15 Dec 2022 13:40:30 -0800 (PST)
X-Google-Original-Date: Thu, 15 Dec 2022 13:40:09 PST (-0800)
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
In-Reply-To: <CAMuHMdUO7iFvh73u+m=EXYyxyePXHahJ=OVwQHdt0ap4vWDG4A@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, prabhakar.csengg@gmail.com,
  Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  magnus.damm@gmail.com, heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>,
  samuel@sholland.org, guoren@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  jszhang@kernel.org, Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
  ajones@ventanamicro.com, nathan@kernel.org, philipp.tomsich@vrull.eu, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
  biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org, Christoph Hellwig <hch@infradead.org>, soc@kernel.org
Message-ID: <mhng-6160c058-408a-4ff5-8a7d-4fb2886d3d95@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_134032_840645_EAC304A8 
X-CRM114-Status: GOOD (  50.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 15 Dec 2022 12:17:38 PST (-0800), geert@linux-m68k.org wrote:
> Hi Conor,
>
> On Thu, Dec 15, 2022 at 8:54 PM Conor Dooley <conor@kernel.org> wrote:
>> On Thu, Dec 15, 2022 at 05:46:42PM +0000, Lad, Prabhakar wrote:
>> > On Thu, Dec 15, 2022 at 11:10 AM Geert Uytterhoeven
>> > <geert@linux-m68k.org> wrote:
>> > > On Thu, Dec 15, 2022 at 12:06 PM Lad, Prabhakar
>> > > <prabhakar.csengg@gmail.com> wrote:
>> > > > On Thu, Dec 15, 2022 at 10:36 AM Geert Uytterhoeven
>> > > > <geert@linux-m68k.org> wrote:
>> > > > > On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> > > > > >
>> > > > > > I/O Coherence Port (IOCP) provides an AXI interface for connecting
>> > > > > > external non-caching masters, such as DMA controllers. The accesses
>> > > > > > from IOCP are coherent with D-Caches and L2 Cache.
>> > > > > >
>> > > > > > IOCP is a specification option and is disabled on the Renesas RZ/Five
>> > > > > > SoC due to this reason IP blocks using DMA will fail.
>> > > > > >
>> > > > > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
>> > > > > > block that allows dynamic adjustment of memory attributes in the runtime.
>> > > > > > It contains a configurable amount of PMA entries implemented as CSR
>> > > > > > registers to control the attributes of memory locations in interest.
>> > > > > > Below are the memory attributes supported:
>> > > > > > * Device, Non-bufferable
>> > > > > > * Device, bufferable
>> > > > > > * Memory, Non-cacheable, Non-bufferable
>> > > > > > * Memory, Non-cacheable, Bufferable
>> > > > > > * Memory, Write-back, No-allocate
>> > > > > > * Memory, Write-back, Read-allocate
>> > > > > > * Memory, Write-back, Write-allocate
>> > > > > > * Memory, Write-back, Read and Write-allocate
>> > > > > >
>> > > > > > More info about PMA (section 10.3):
>> > > > > > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>> > > > > >
>> > > > > > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
>> > > > > > software. Firstly OpenSBI configures the memory region as
>> > > > > > "Memory, Non-cacheable, Bufferable" and passes this region as a global
>> > > > > > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
>> > > > > > allocations happen from this region and synchronization callbacks are
>> > > > > > implemented to synchronize when doing DMA transactions.
>> > > > > >
>> > > > > > Example PMA region passes as a DT node from OpenSBI:
>> > > > > >     reserved-memory {
>> > > > > >         #address-cells = <2>;
>> > > > > >         #size-cells = <2>;
>> > > > > >         ranges;
>> > > > > >
>> > > > > >         pma_resv0@58000000 {
>> > > > > >             compatible = "shared-dma-pool";
>> > > > > >             reg = <0x0 0x58000000 0x0 0x08000000>;
>> > > > > >             no-map;
>> > > > > >             linux,dma-default;
>> > > > > >         };
>> > > > > >     };
>> > > > > >
>> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> > > > >
>> > > > > Thanks for your patch!
>> > > > >
>> > > > > >  arch/riscv/include/asm/cacheflush.h       |   8 +
>> > > > > >  arch/riscv/include/asm/errata_list.h      |  28 ++-
>> > > > > >  drivers/soc/renesas/Kconfig               |   6 +
>> > > > > >  drivers/soc/renesas/Makefile              |   2 +
>> > > > > >  drivers/soc/renesas/rzfive/Kconfig        |   6 +
>> > > > > >  drivers/soc/renesas/rzfive/Makefile       |   3 +
>> > > > > >  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
>> > > > >
>> > > > > Given this touches arch/riscv/include/asm/, I don't think the
>> > > > > code belongs under drivers/soc/renesas/.
>> > > > >
>> > > > Ok. Do you have any suggestions on where you want me to put this code?
>> > >
>> > > As it plugs into core riscv functionality, I think it should be under
>> > > arch/riscv/.
>> > > if the RISC-V maintainers object to that, another option is
>> > > drivers/soc/andestech/ or (new) drivers/cache/
>> > >
>> > RISC-V maintainers had already made it clear to not to include vendor
>> > specific stuff in the arch/riscv folder, so I'll consider putting this

We have vendor-specific behavior in arch/riscv now, and it's even in the 
policies (the behavior has been there for a while, the policy is new).  
There's probably a bunch of posts saying otherwise because we used to 
not take vendor-specific behavior, but that's not the case any more.

>> > into drivers/cache/ folder to sync with the bindings.
>> >
>> > Conor/Palmer - do you have any objections/suggestions?
>>
>> I'm not its maintainer so sorta moot what I say, but having drivers in
>> arch/riscv makes little sense to me..

Some drivers are pretty tightly coupled to an ISA, I'm thinking of 
things like interrupts/timers where we're writing CSRs.  I could see how 
cache controllers would fall into that category, doubly so as they get 
integrated to the memory model.  That leaves us in sort of a grey area 
and there's certainly ports that have way more drivers in arch so it's 
not an uncommon way to do things.

I generally lean pretty heavily towards keeping things that could at all 
be considered out of arch/riscv and instead have them in some sort of 
driver folder.  That probably results in more total work to do, as we've 
got to have arch/riscv interfaces with one use case and sync up between 
multiple trees sometimes to get stuff merged.  I think it also results 
in better code: being closer to the other drivers makes us more likely 
to get reviewed by folks who understand the space, and it's generally 
easier to share code in the subsystems.

>> Putting stuff in drivers/cache does sound like a good idea since the
>> binding is going there too.
>>
>> The SiFive ccache driver is in drivers/soc and it was suggested to me
>> this week that there's likely going to be a second SiFive cache driver
>> at some point in the near future. Plus Microchip are going to have to
>> add cache management stuff to the existing SiFive ccache driver.
>> Having them be their own thing makes sense in my mind - especially since
>> they're not tied to SoCs sold by Andes or SiFive.
>>
>> I had a quick, and I mean *quick* look through other soc drivers to see
>> if there were any other cache controller drivers but nothing stood out
>> to me. Maybe someone else has more of a clue there. Ditto for misc, had
>> a look but nothing seemed obvious.
>
> Usually they're under arch/:
> $ git ls-files -- "arch/*cache*" | wc -l
> 148
> $ git ls-files -- "drivers/*cache*" | wc -l
> 63
>
> E.g. arch/arm/mm/cache-l2x0.c.

Above all I like to do things as normally as possible, so if most cache 
drivers are in arch then I'm OK with.  Looks like we originally had it 
arch/riscv, though, until 9209fb51896f ("riscv: move sifive_l2_cache.c 
to drivers/soc") moved it out.

I don't really remember this history/rationale here, at the time the 
SiFive cache driver wasn't really doing anything all that exciting: it 
was just way enable and some statistics, we hadn't really planned on 
using it for the non-coherent stuff that folks are now trying to 
retrofit it to handle.  That sort of thing makes it a lot more coupled 
to the ISA.

Given that we already moved the SiFive one out it seems sane to just 
start with the rest in drivers/soc/$VENDOR.  Looks like it was 
Christoph's idea to do the move, so I'm adding him in case he's got an 
opinion (and also the SOC alias, as that seems generally relevant).

> Gr{oetje,eeting}s,
>
>                         Geert

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
