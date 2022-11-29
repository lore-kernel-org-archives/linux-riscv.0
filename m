Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD02C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urtzqU8UlOEXsYKOuJvmtuEN9iGAHc0n/wOeWDxdEh8=; b=NEVqYtp2SzxINu
	d9MwapZXsbN9Bw3CVt4To22IaPcs+GBF5LFFsXbNvn4hdZi8iqKwUdhf/Y5YorUYxqsNRB6HIEvYb
	63rX4LSdFBpF9tCtQ2kvijRTl1kc1eRZi8VjHsVNxezKpnyHmxScaiHzz+T+3RfeYIMVY2IRSpTEe
	AvzzJKoZ7e/z6UyIIk2jiPiz8i8HIetPdL+fA3T0OZSapNBHDagx+LAruFO+jgMiMLaVc8hUZulzt
	/fc4e8r/GnhLM7K6e4k4h95UZO8Oui9NOPC1PXfhagAfUGW38QfAXYfcLVOHVgbuxh61E9C9hqqPp
	J99w0aJzwoKqJvCwt/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02Mq-009elR-Fc; Tue, 29 Nov 2022 15:17:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02Mm-009egg-FX
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:17:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBAF46179B;
	Tue, 29 Nov 2022 15:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582DDC43470;
	Tue, 29 Nov 2022 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669735066;
	bh=e+Hn5pR9Mx/HnkooeOoLey+ZYeFJJe+XXIc7bPgCKm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+T8dgIbASyqpaWpLk5pHZ0L5E6CRZyXadDwEvmFUtI7rXtupctEwe1WcHAZrYl/K
	 tSEtd+r5BIKX1xhHoafIyS4cpLID3+udc+csgh1izJuTlDHkg5UkTov8xvpe0hquz/
	 yLzLOKYKdC2oMsuWLFh5XdLrKYVyG14pzVU6WCHYVrVBg1+quHCvu1/4D+6R8dbznL
	 JcoGi1Wnf2CMbWH/nBN5P2g9pdHJSYfd6oJZ9Qb8s+aydHONh0gTjjEafc8F4hUBmE
	 AZN2Uh5hunRustX/kwhTDbtowkqoa+ZquHoa57UmjqwAl9gTH9EJbioRssIUikygu8
	 2HErlwX3yK4Xw==
Date: Tue, 29 Nov 2022 23:07:51 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, samuel@sholland.org,
	Atish Patra <atishp@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: head: use 0 as the default text_offset
Message-ID: <Y4YgR12aQAgZyEck@xhacker>
References: <e39851df-251d-662d-3319-af9d948a9430@sholland.org>
 <mhng-028a3e75-6cd0-4775-ac68-3e0eb70c91ae@palmer-ri-x1c9>
 <CAK9=C2VCXLOMBa4JQPRDjXQN5LnNdp3gFKmuMb28EONbkHiRpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VCXLOMBa4JQPRDjXQN5LnNdp3gFKmuMb28EONbkHiRpg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_071748_670741_929571AA 
X-CRM114-Status: GOOD (  65.70  )
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

On Tue, Nov 29, 2022 at 02:48:08PM +0530, Anup Patel wrote:
> On Tue, Nov 29, 2022 at 11:50 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Mon, 28 Nov 2022 21:04:48 PST (-0800), samuel@sholland.org wrote:
> > > On 11/28/22 14:11, Atish Kumar Patra wrote:
> > >> On Mon, Nov 28, 2022 at 7:34 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >>>
> > >>> Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
> > >>> parse.") adds an image header which "is based on ARM64 boot image
> > >>> header and provides an opportunity to combine both ARM64 & RISC-V
> > >>> image headers in future.". At that time, arm64's default text_offset
> > >>> is 0x80000, this is to give "512 KB of guaranteed BSS space to put
> > >>> the swapper page tables" as commit cfa7ede20f13 ("arm64: set TEXT_OFFSET
> > >>> to 0x0 in preparation for removing it entirely") pointed out, but
> > >>> riscv doesn't need the space, so use 0 as the default text_offset.
> > >>>
> > >>> Before this patch, booting linux kernel on Sipeed bl808 M1s Dock
> > >>> with u-boot booti cmd:
> > >>> [    0.000000] OF: fdt: Ignoring memory range 0x50000000 - 0x50200000
> > >>> ...
> > >>> [    0.000000]   DMA32    [mem 0x0000000050200000-0x0000000053ffffff]
> > >>> As can be seen, 2MB DDR(0x50000000 - 0x501fffff) can't be used by
> > >>> linux.
> > >>>
> > >>> After this patch, the 64MB DDR is fully usable by linux
> > >>> [    0.000000]   DMA32    [mem 0x0000000050000000-0x0000000053ffffff]
> > >>>
> > >>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > >>> ---
> > >>>  arch/riscv/kernel/head.S | 12 +-----------
> > >>>  1 file changed, 1 insertion(+), 11 deletions(-)
> > >>>
> > >>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > >>> index b865046e4dbb..ef95943f7a70 100644
> > >>> --- a/arch/riscv/kernel/head.S
> > >>> +++ b/arch/riscv/kernel/head.S
> > >>> @@ -38,18 +38,8 @@ ENTRY(_start)
> > >>>         .word 0
> > >>>  #endif
> > >>>         .balign 8
> > >>> -#ifdef CONFIG_RISCV_M_MODE
> > >>> -       /* Image load offset (0MB) from start of RAM for M-mode */
> > >>> +       /* Image load offset (0MB) from start of RAM */
> > >>>         .dword 0
> > >>> -#else
> > >>> -#if __riscv_xlen == 64
> > >>> -       /* Image load offset(2MB) from start of RAM */
> > >>> -       .dword 0x200000
> > >>> -#else
> > >>> -       /* Image load offset(4MB) from start of RAM */
> > >>> -       .dword 0x400000
> > >>> -#endif
> > >>> -#endif
> > >>
> > >> NACK.
> > >> RV64 needs to boot at a 2MB aligned address and RV32 needs to boot at
> > >> a 4MB aligned address.
> > >> The firmware is assumed to live at the start of DRAM for Linux running
> > >> in S-mode.
> > >
> > > What needs to happen so we can stop making this assumption? If the SBI
> > > implementation wants to reserve memory, it should use the devicetree to
> > > do so. OpenSBI already does this.
> >
> > IMO we've really screwed up the boot flow on RISC-V.  Having Linux
> > reserve space for the firmware is just all backwards, Linux can't know
> > how much memory the firmware needs (which manifests under large hart
> > counts in OpenSBI, for example).  Unfortunately there's no specification
> > that defines these platform-level details, so we're stuck depending on
> > unspecified behavior like this.
> >
> > I think we could fix this by either making Linux's early boot relocation
> > code work sanely (fix whatever bugs are there, document what can't be
> > fixed, and then add some sort of Image flag to tell firmware the kernel
> > can be relocated) or relying on relocatable firmware, but both of those
> > come with some costs ...
> 
> Clearly, there is a misunderstanding about the "offset" field in the kernel
> image header.
> 
> The "offset" field is not for reserving memory for firmware (OpenSBI). The

This is also my understanding -- offset != reserve memory for firmware.

> value of "offset" is a hint to bootloader that kernel expects to be booted
> at a particular aligned physical address (2M for RV64 and 4M for RV32).
> This "offset" hint is based on the fact that the kernel tries its best to use
> huge mappings for kernel virtual addresses which results in good
> performance in kernel space.

IIUC, the "offset" is used to tell bootloader to load the kernel to
linux_start_ram + offset, whether align to 2MB or not isn't the target.
u-boot's booti_setup() clearly indicates this usage.
So if linux_start_ram isn't 2MB aligned, linux_start_ram + offset isn't
2MB aligned either. IMHO, if we do care about performance, it's the
bootloader's job to chose a suitable linux_start_ram.

And the reason arm64 used text_offset is to ensure space to put the
swapper page tables, after v4.6, text_offset in arm64 is 0 as well.

> 
> In fact, even today a bootloader can happily load the kernel at the
> RAM_START and it will boot perfectly fine.
> 
> The real issue is that whenever __pa(PAGE_OFFSET) > RAM_START,
> kernel will reserve memory from RAM_START to __pa(PAGE_OFFSET)
> and this will happen irrespective where the firmware is running. The
> patch posted by Alex tries to solve this issue whereas the current patch
> tries to change the "offset" in the image header which is totally wrong.
> 
> Also, the Linux reserved-memory DT bindings define a standard way
> to inform the kernel about reserved memory areas. The OpenSBI
> firmware uses reserved-memory DT bindings to reserve its own
> memory so kernel does not have to guess anything.
> 
> >
> > > Throwing away 2 MiB of RAM is quite wasteful considering we have
> > > multiple SoCs (D1s, BL808) that are limited to 64 MiB of in-package RAM.
> >
> > ... and I'd argue that users on systems don't want to pay those costs.
> > In fact, I'd argue that systems like that don't want resident firmware
> > at all.
> >
> > So let's just add a CONFIG_SBI=n, and then just use direct drivers for
> > everything.  If the firmware doesn't need to be resident then it's
> > pretty straight-forward to support these 0 offsets, so we can just add
> > that as another Kconfig.  Sure this will trip up firmware that depends
> > on these fixed reservations, but saying "the resident firmware fits in 0
> > superpages" is just as much of a platform-specific dependency as saying
> > "the resident firmware fits in 1 superpage".  If firmware can't handle
> > this field in the Image format then we're going to end up with breakages
> > at some point, it might as well be now.
> 
> The firmware (OpenSBI) does not depend on any fixed memory
> reservations from the kernel. It is capable of running from any
> memory location since it is compiled using -fPIC.
> 
> >
> > If these systems don't have all the ISA bits necessary to avoid M-mode
> > entirely then we can just implement a tiny M-mode stub in Linux that
> > gets left around during early boot and then shims stuff to S-mode.
> > That'll be a bit of a headache and with some extensions it can be
> > avoided, the standard stuff won't allow for that until the latest round
> > of specs is done but if it's possible via whatever custom extensions are
> > in these things then that's probably the way to go.
> 
> Another misunderstanding here is that SBI stuff == firmware stuff. All
> RISC-V hypervisors implement the SBI spec for Guest/VM. In absence
> of SBI, how will Guest/VM bring-up secondary VCPUs or reboot itself ?
> 
> In fact without SBI, all paravirt approaches (such as steal time
> accounting, time scaling, system reset, CPU hotplug etc) become
> fragmented across hypervisors. Do we expect all hypervisors (proprietary
> or opensource) send their own non-standard driver support to Linux
> which is otherwise standardized through SBI spec ?
> 
> The M-mode can have dedicated resources (debug CSRs, PMU
> counter configuration CSRs, etc) so in absence of SBI how will
> S-mode use these features? We have more M-mode only resources
> being defined by RVI (example Resumable NMIs) which will eventually
> require SBI abstraction for S-mode.
> 
> Let alone CSRs, on future platforms, the M-mode will have attestation
> capability so without SBI how will S-mode get this attestation facility.
> 
> >
> > We'll probably also end up shaking out some bugs in that early
> > relocation code, but again no big deal: we'll need to chase those down
> > at some point, it might as well be now.
> 
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
