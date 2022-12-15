Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23815C3DA78
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rqtc/5fFvmm1qLUYSpTVtQZPngq13dz3a32H5vo+bnQ=; b=otqu7p6F9aioBe
	IT3JSRrBIbon95qIuFn3lsvukz8Q4Vf7N5NSd+kkOPpNwjiSecvV7sffs/Gr79tjuoNDTatJ2638m
	1i6GbkgL0kg6QloBpXElyB8n4HZEgcOdPjHcnYWFITy1UHD+O7yhswcCSSnI2Kab2XLbY5H79WXL0
	gqhP8hDCGNSyWZ9lWVQOHh3I4Hc5+NBU6xDOefz6ocqtgaXbjPq89pFN5sswc+w4d32N351TrNrEk
	/En8gWmCgB5IokFaV+fVlxsO81yLU9F91Xo9uHBd4r0+DzHTzS2SHoYjVDAwN7C78RXYkTL/PuLb/
	weUQt2/5wBfeGxSY90fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5uuP-00BFT3-3o; Thu, 15 Dec 2022 20:32:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5uuL-00BFS5-LC
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 20:32:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21A77B81C88;
	Thu, 15 Dec 2022 20:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E89BC433F1;
	Thu, 15 Dec 2022 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671136362;
	bh=y/3TLTR8alCyKtmxTcEVJqr0AUUfHrH/2E1FxBjfCdo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MidHzEP0HrIzPA5nOA5tEymalTfFPQ8rtCZBPbPsxQ0sXSNi0NeuFkVuAkElJLf+I
	 QWvT4huoJd4/6DQKUzl8b8wyC5kreTGxbF+AQxUL+98CUJFkChfll27/CEbE04rYJA
	 0tEn+neLFvJxZF3K8U+v9wwsAymXVVU9SgnlIyklnmuoxEUpv41Vq4vf5n2Ozo81Wy
	 9i+KZx2cMs8wVC0hUOpHsMo8aYeJNim/VpAkuXQOR9TBUKO9yF3AeyA9I5ei0OQEU8
	 UnkSzaIMu/PlYRb76qnZPbFyDfg57BArPoJ7O66lL4/07qCBENx+2LYJR1Z/szkYUg
	 KrHV0h6AlHX3A==
Date: Thu, 15 Dec 2022 12:32:06 -0800
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, palmer@dabbelt.com,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_6/6=5D_soc=3A_renesas=3A_Add?= =?US-ASCII?Q?_L2_cache_management_for_RZ/Five_SoC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMuHMdUO7iFvh73u+m=EXYyxyePXHahJ=OVwQHdt0ap4vWDG4A@mail.gmail.com>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com> <CA+V-a8vD=SOb6gPOwdPUE=kHeqa+oo2L-rbaW8zGjvw7YyQsqg@mail.gmail.com> <CAMuHMdWX4Yd52=Jv8kABtn+1B1V=dC2iXVZ81gNZBWNu4hb_3w@mail.gmail.com> <CA+V-a8t3+zzQ4yPftsAa51rkMGHr45NhMO4_2WmZ9BGg0wuQvw@mail.gmail.com> <Y5t7a2oZ64McjSSn@dizzy> <CAMuHMdUO7iFvh73u+m=EXYyxyePXHahJ=OVwQHdt0ap4vWDG4A@mail.gmail.com>
Message-ID: <88D71672-7A1D-422C-97E8-5046FB1B48CD@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_123246_364614_C9AE833D 
X-CRM114-Status: GOOD (  38.08  )
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



On 15 December 2022 12:17:38 GMT-08:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>Hi Conor,
>
>On Thu, Dec 15, 2022 at 8:54 PM Conor Dooley <conor@kernel.org> wrote:
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
>> > into drivers/cache/ folder to sync with the bindings.
>> >
>> > Conor/Palmer - do you have any objections/suggestions?
>>
>> I'm not its maintainer so sorta moot what I say, but having drivers in
>> arch/riscv makes little sense to me..
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
>Usually they're under arch/:
>$ git ls-files -- "arch/*cache*" | wc -l
>148
>$ git ls-files -- "drivers/*cache*" | wc -l
>63

That's for checking what I could not!
Don't think my roaming data would cover a kernel clone!

>E.g. arch/arm/mm/cache-l2x0.c.

If that's where they usually go, is there a real reason not to do the same here?
Whatever about a limited set of riscv cache drivers, moving all the other ones around to a new directory doesnt seem like a great idea.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
