Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXzr9bCVqYWkZJjpr7XovMe0Fimb+j+w8q5vUMun2P8=; b=1+d17HZWPXa6IE
	ZRrbhL+wbXaSVqJ8d5LlXdXVKTyOKZgBIppWfcEPgGT2NQTrVevtuRJhMRZ3h6Ta0UgG3OWChyO40
	/3F7isJNAJrQz0e7BUhan20iR9P8HGNNmp1E0amnIKiaM6IBFmYpW/17OE7gnKDhmlP8Vf5hNZfgt
	5gxIAIH0cvhHCuNo7+kvrijKeoKCaS2N07J6WR8Gs9jEJaFIMHT1Xz/7AH/arHaPawtP+BsN0pOtA
	sxp5n0h6BUMB9r/qzqebn2VE7DVgI/S7dcfIpxd4Tdg/dWAhHpbsvRCBpNGH0tOGJuebfRkgPeyGH
	OVn0SdwBfeqPemacPFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS4Se-00AcNj-SJ; Wed, 09 Mar 2022 22:07:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS4Sa-00AcMv-Dx
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 22:07:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nS4SO-0007xe-Vw; Wed, 09 Mar 2022 23:06:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v7 00/13] riscv: support for Svpbmt and D1 memory types
Date: Wed, 09 Mar 2022 23:06:55 +0100
Message-ID: <9863388.BuYlmvG7s8@diego>
In-Reply-To: <2347714.EJkkgcx2xJ@diego>
References: <mhng-4052f547-4a01-44ca-9286-97cc57819fbc@palmer-ri-x1c9>
 <2347714.EJkkgcx2xJ@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_140708_671325_7C39CBBA 
X-CRM114-Status: GOOD (  59.81  )
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

Am Dienstag, 8. M=E4rz 2022, 12:56:20 CET schrieb Heiko St=FCbner:
> Hi Palmer,
> =

> Am Dienstag, 8. M=E4rz 2022, 01:47:25 CET schrieb Palmer Dabbelt:
> > On Mon, 07 Mar 2022 12:52:57 PST (-0800), heiko@sntech.de wrote:
> > > Svpbmt is an extension defining "Supervisor-mode: page-based memory t=
ypes"
> > > for things like non-cacheable pages or I/O memory pages.
> > >
> > >
> > > So this is my 2nd try at implementing Svpbmt (and the diverging D1 me=
mory
> > > types) using the alternatives framework.
> > >
> > > This includes a number of changes to the alternatives mechanism itsel=
f.
> > > The biggest one being the move to a more central location, as I expect
> > > in the future, nearly every chip needing some sort of patching, be it
> > > either for erratas or for optional features (svpbmt or others).
> > >
> > > Detection of the svpbmt functionality is done via Atish's isa extensi=
on
> > > handling series [0] and thus does not need any dt-parsing of its own
> > > anymore.
> > >
> > > The series also introduces support for the memory types of the D1
> > > which are implemented differently to svpbmt. But when patching anyway
> > > it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
> > > location.
> > >
> > > The only slightly bigger difference is that the "normal" type is not 0
> > > as with svpbmt, so kernel patches for this PMA type need to be applied
> > > even before the MMU is brought up, so the series introduces a separate
> > > stage for that.
> > >
> > >
> > > In theory this series is 3 parts:
> > > - sbi cache-flush / null-ptr
> > =

> > That first patch looks like an acceptable candidate for fixes.  If =

> > there's a regression that manifests I'm happy to take it, but if it's =

> > only possible to manifest a crash with the new stuff then I'm OK just =

> > holding off until the merge window.
> =

> While right now only my poking around the early init via alternatives
> is affected, the problem exists for everyone.
> =

> I.e. I do consider flush_icache_all() to be generic enough that we
> should expect someone trying to call this in some early code-path
> as well.
> =

> But any call to flush_icache_all() before sbi_init() ran will cause the
> breakage that is fixed by patch1 .
> =

> =

> So it doesn't look like any _current_ code path has that issue, but
> it might be good to just pick patch1 for the next merge window
> individually?
> =

> =

> =

> > > - alternatives improvements
> > > - svpbmt+d1
> > >
> > > So expecially patches from the first 2 areas could be applied when
> > > deemed ready, I just thought to keep it together to show-case where
> > > the end-goal is and not requiring jumping between different series.
> > >
> > >
> > > I picked the recipient list from the previous versions, hopefully
> > > I didn't forget anybody.
> > >
> > > changes in v7:
> > > - fix typo in patch1 (Atish)
> > > - moved to Atish's isa-extension framework
> > > - and therefore move regular boot-alternatives directly behind fill_h=
wcaps
> > > - change T-Head errata Kconfig text (Atish)
> > =

> > I was just poking around v6, so I have some minor comments there.  None =

> > of those need to block merging this, but I am getting a bunch of build =

> > failures under allmodconfig
> > =

> >     $ make.riscv allmodconfig
> >     #
> >     # configuration written to .config
> >     #
> >     $ make.riscv mm/kasan/init.o
> >       SYNC    include/config/auto.conf.cmd
> >       CALL    scripts/atomic/check-atomics.sh
> >       CC      arch/riscv/kernel/asm-offsets.s
> >       CALL    scripts/checksyscalls.sh
> >       CC      mm/kasan/init.o
> >     ./arch/riscv/include/asm/pgtable.h: Assembler messages:
> >     ./arch/riscv/include/asm/pgtable.h:323: Error: attempt to move .org=
 backwards
> >     make[2]: *** [scripts/Makefile.build:288: mm/kasan/init.o] Error 1
> >     make[1]: *** [scripts/Makefile.build:550: mm/kasan] Error 2
> >     make: *** [Makefile:1831: mm] Error 2
> > =

> > Unfortunately my build box just blew up so I haven't had time to confim =

> > this still exists on v7, but nothing's jumping out as a fix.  I've put =

> > this on the riscv-d1 branch at kernel.org/palmer/linux, not sure exactl=
y =

> > what's going on but I'm guessing one of the macros has gone off the =

> > rails.  I'm going to look at something else (as this one at least =

> > depends on Atish's patches), but LMK if you've got the time to look int=
o =

> > this or if I should.
> =

> Yeah, we now depend on Atish's isa-extension parsing (same for my cmo
> series and some more series I saw on the list), so getting that into a
> mergeable position would be really great :-)
> =

> "attempt to move .org backwards" seems to be the telltale sign of the
> alternatives blocks not matching up in size. While I definitly didn't see
> anything like this in my tests on qemu + d1, I'll try to investigate where
> that comes from.

Hmm, looking at your branch [0] it seems that you're missing
patch7 that introduces the no-compressed-instruction thingy
for alternatives.

And missing that patch will of course cause the size issue.

The patch has made its way to the actual mailing lists [1], so I guess
it "just" somehow didn't reach your inbox due to some mail hickup?


Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=
=3Driscv-d1
[1] https://lore.kernel.org/all/20220307205310.1905628-8-heiko@sntech.de/


> > > changes in v6:
> > > - rebase onto 5.17-rc1
> > > - handle sbi null-ptr differently
> > > - improve commit messages
> > > - use riscv,mmu as property name
> > >
> > > changes in v5:
> > > - move to use alternatives for runtime-patching
> > > - add D1 variant
> > >
> > >
> > > [0] https://lore.kernel.org/r/20220222204811.2281949-2-atishp@rivosin=
c.com
> > >
> > >
> > > Heiko Stuebner (12):
> > >   riscv: prevent null-pointer dereference with sbi_remote_fence_i
> > >   riscv: integrate alternatives better into the main architecture
> > >   riscv: allow different stages with alternatives
> > >   riscv: implement module alternatives
> > >   riscv: implement ALTERNATIVE_2 macro
> > >   riscv: extend concatenated alternatives-lines to the same length
> > >   riscv: prevent compressed instructions in alternatives
> > >   riscv: move boot alternatives to after fill_hwcap
> > >   riscv: Fix accessing pfn bits in PTEs for non-32bit variants
> > >   riscv: add cpufeature handling via alternatives
> > >   riscv: remove FIXMAP_PAGE_IO and fall back to its default value
> > >   riscv: add memory-type errata for T-Head
> > >
> > > Wei Fu (1):
> > >   riscv: add RISC-V Svpbmt extension support
> > >
> > >  arch/riscv/Kconfig.erratas                  |  29 +++--
> > >  arch/riscv/Kconfig.socs                     |   1 -
> > >  arch/riscv/Makefile                         |   2 +-
> > >  arch/riscv/errata/Makefile                  |   2 +-
> > >  arch/riscv/errata/sifive/errata.c           |  17 ++-
> > >  arch/riscv/errata/thead/Makefile            |   1 +
> > >  arch/riscv/errata/thead/errata.c            |  85 +++++++++++++++
> > >  arch/riscv/include/asm/alternative-macros.h | 114 +++++++++++-------=
--
> > >  arch/riscv/include/asm/alternative.h        |  16 ++-
> > >  arch/riscv/include/asm/errata_list.h        |  52 +++++++++
> > >  arch/riscv/include/asm/fixmap.h             |   2 -
> > >  arch/riscv/include/asm/hwcap.h              |   1 +
> > >  arch/riscv/include/asm/pgtable-32.h         |  17 +++
> > >  arch/riscv/include/asm/pgtable-64.h         |  79 +++++++++++++-
> > >  arch/riscv/include/asm/pgtable-bits.h       |  10 --
> > >  arch/riscv/include/asm/pgtable.h            |  53 +++++++--
> > >  arch/riscv/include/asm/vendorid_list.h      |   1 +
> > >  arch/riscv/kernel/Makefile                  |   1 +
> > >  arch/riscv/{errata =3D> kernel}/alternative.c |  48 +++++++--
> > >  arch/riscv/kernel/cpu.c                     |   1 +
> > >  arch/riscv/kernel/cpufeature.c              |  80 +++++++++++++-
> > >  arch/riscv/kernel/module.c                  |  29 +++++
> > >  arch/riscv/kernel/sbi.c                     |  10 +-
> > >  arch/riscv/kernel/setup.c                   |   2 +
> > >  arch/riscv/kernel/smpboot.c                 |   4 -
> > >  arch/riscv/kernel/traps.c                   |   2 +-
> > >  arch/riscv/mm/init.c                        |   1 +
> > >  27 files changed, 546 insertions(+), 114 deletions(-)
> > >  create mode 100644 arch/riscv/errata/thead/Makefile
> > >  create mode 100644 arch/riscv/errata/thead/errata.c
> > >  rename arch/riscv/{errata =3D> kernel}/alternative.c (59%)
> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
