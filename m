Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575EDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MM8zYrm/rXdqGCH1vn+uVSj7CR65zfA+JOyW1n0Yx4=; b=LEktHVyjy1HeQB
	3vUV1fyczFfrDvArqkNZ77Cjw7TzUdYLalYnLbcrDILhOsg+V6po//Vdt8GznYkvIg8z6PRlZll+D
	i8tDAxDXzhlH2hAC4Z6fQYR+PthQrUDQ+KAf74OXY/D2t1UoB6pP9wHvSJ2BlMTpFE+aSp77Wo+ql
	T7EH3yM45N9qnOUnZUoeRhk+foFwziUFLEvSJ2EYskS1yr6sE8UdLPJw7qNXplw8b6NU1k7m6cLZa
	zdpuRo7DmzdNsJ88QbyvjtywNJXGINTbYNbHp9vRnwQGniIjt/1SPYWUMpcUpCtwUHmSRuuNAR6K4
	rNCGM+U65YbjEOpfS6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL0mD-00DtQN-Nn; Fri, 18 Feb 2022 10:46:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL0mA-00DtOq-Jp
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 10:46:12 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 00A1D4001E
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645181161;
 bh=dGDRz61XRlmN2nrsI5bz0i1S0S+h5+fQGdDwmq0wB0k=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=MnbNQWNh+6BAFqW+C5yFNyicCYDsfb5+yQkBPy7f71UP7MdOe9u98mPWLGpiE+EL+
 OM1vCK/emaL0YnhpZc2+qMjLhPnsmQqLTlcWFgvIREc3YIAB7stlnReXVqtwPcOUQo
 SHzGh/gTGa0pQG0gHqXeo9xrYtZbMs5VSAermk5Z21E4cYbxx/2dWJyicbsCjsNqVL
 BE+WRX5+l98dNZKJkhUCRFtX55pftj+asCzE8Dhrty5ffv5YUttQKAT21OCnboje9s
 w2TTsDG3BTP2cmuJvIfPaxnELugJGUzDRRyOXMMLvzy1qMt2rFSKehocqthG9Be8ex
 gfz93VQl7g+1A==
Received: by mail-ed1-f69.google.com with SMTP id
 n7-20020a05640205c700b0040b7be76147so5288883edx.10
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 02:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dGDRz61XRlmN2nrsI5bz0i1S0S+h5+fQGdDwmq0wB0k=;
 b=3tSCF/MnhEviRJC5gwa8pICR2nJ+GcC13DGasyTKO2XtES1X1uLRXLVbEss/RrohPd
 99D77hFwE+Kc9U2TNx16jSReeE6IK3apU5sBkBK7f/wOkzf9tscNDVX9ok4s0Mb/1ruS
 XUuEzk1t06PC6ENqRWaApMtip0BRAQFnaw/PfWg0zltAvleZXUsL2YLxVgcvLRP9UjkB
 KfMPgXEGdHxq9v7ERgss2T9BbxSB7Jm87kZY+FlZN0OLnWqFN3KJxIOxisYfHpwjr+bZ
 x/q/5EZxN0okkQkclBKGitkT1ImB6qa/x52jl1BmciztCFyoZR2dxYh4eOYlmEnnOGer
 SByg==
X-Gm-Message-State: AOAM531i59Rdx6vBSH/NgKRUlEd7iVnGUeOzjpy518Y8uBXtBd4FfCkB
 vf5k/QLZrcQ3c9nGHMU6GghD2jOJDP0BlzJtVodHZU0XXe8EaeHKV4zupVlbL/wJJOBBsB51qx8
 54l9TaRSB6zRy7WqnHu7rryT02g2FlULnQx0WojPkjcRTROY0JAb1PNTeMP1RHw==
X-Received: by 2002:aa7:d3d9:0:b0:410:7a81:c0cf with SMTP id
 o25-20020aa7d3d9000000b004107a81c0cfmr7414111edr.177.1645181160596; 
 Fri, 18 Feb 2022 02:46:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ+NAme7XzeWAZqBbGMYs1sQLjBbN9OgKux5J4SQWKa0WWJPX7Ydz76FgBA28E+tI3LAqAq09x/bebpkHqaFo=
X-Received: by 2002:aa7:d3d9:0:b0:410:7a81:c0cf with SMTP id
 o25-20020aa7d3d9000000b004107a81c0cfmr7414090edr.177.1645181160350; Fri, 18
 Feb 2022 02:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
 <CA+zEjCuTSjOCmNExSN1jO50tsuXNzL9x6K6jWjG4+vVky5eWsw@mail.gmail.com>
 <CA+zEjCuTYmk-dLPhJ=9CkNrqf7VbCNyRDSZUGYkJSUWqZDWHpA@mail.gmail.com>
In-Reply-To: <CA+zEjCuTYmk-dLPhJ=9CkNrqf7VbCNyRDSZUGYkJSUWqZDWHpA@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 18 Feb 2022 11:45:49 +0100
Message-ID: <CA+zEjCt04OV++qK5ar+p8HwqOfEgkSN8YFfxwRiCFw1FeJv2rg@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 zong.li@sifive.com, anup@brainfault.org, Atish.Patra@rivosinc.com, 
 Christoph Hellwig <hch@lst.de>, ryabinin.a.a@gmail.com, glider@google.com, 
 andreyknvl@gmail.com, dvyukov@google.com, ardb@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, guoren@linux.alibaba.com,
 heinrich.schuchardt@canonical.com, mchitale@ventanamicro.com, 
 panqinglin2020@iscas.ac.cn, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org, 
 linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_024610_816127_7A788233 
X-CRM114-Status: GOOD (  46.48  )
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

Hi Palmer,

On Thu, Jan 20, 2022 at 11:05 AM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Thu, Jan 20, 2022 at 8:30 AM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > On Thu, Jan 20, 2022 at 5:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >
> > > On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
> > > > * Please note notable changes in memory layouts and kasan population *
> > > >
> > > > This patchset allows to have a single kernel for sv39 and sv48 without
> > > > being relocatable.
> > > >
> > > > The idea comes from Arnd Bergmann who suggested to do the same as x86,
> > > > that is mapping the kernel to the end of the address space, which allows
> > > > the kernel to be linked at the same address for both sv39 and sv48 and
> > > > then does not require to be relocated at runtime.
> > > >
> > > > This implements sv48 support at runtime. The kernel will try to
> > > > boot with 4-level page table and will fallback to 3-level if the HW does not
> > > > support it. Folding the 4th level into a 3-level page table has almost no
> > > > cost at runtime.
> > > >
> > > > Note that kasan region had to be moved to the end of the address space
> > > > since its location must be known at compile-time and then be valid for
> > > > both sv39 and sv48 (and sv57 that is coming).
> > > >
> > > > Tested on:
> > > >   - qemu rv64 sv39: OK
> > > >   - qemu rv64 sv48: OK
> > > >   - qemu rv64 sv39 + kasan: OK
> > > >   - qemu rv64 sv48 + kasan: OK
> > > >   - qemu rv32: OK
> > > >
> > > > Changes in v3:
> > > >   - Fix SZ_1T, thanks to Atish
> > > >   - Fix warning create_pud_mapping, thanks to Atish
> > > >   - Fix k210 nommu build, thanks to Atish
> > > >   - Fix wrong rebase as noted by Samuel
> > > >   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
> > > >   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
> > > >
> > > > Changes in v2:
> > > >   - Rebase onto for-next
> > > >   - Fix KASAN
> > > >   - Fix stack canary
> > > >   - Get completely rid of MAXPHYSMEM configs
> > > >   - Add documentation
> > > >
> > > > Alexandre Ghiti (13):
> > > >   riscv: Move KASAN mapping next to the kernel mapping
> > > >   riscv: Split early kasan mapping to prepare sv48 introduction
> > > >   riscv: Introduce functions to switch pt_ops
> > > >   riscv: Allow to dynamically define VA_BITS
> > > >   riscv: Get rid of MAXPHYSMEM configs
> > > >   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
> > > >   riscv: Implement sv48 support
> > > >   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
> > > >   riscv: Explicit comment about user virtual address space size
> > > >   riscv: Improve virtual kernel memory layout dump
> > > >   Documentation: riscv: Add sv48 description to VM layout
> > > >   riscv: Initialize thread pointer before calling C functions
> > > >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
> > > >
> > > >  Documentation/riscv/vm-layout.rst             |  48 ++-
> > > >  arch/riscv/Kconfig                            |  37 +-
> > > >  arch/riscv/configs/nommu_k210_defconfig       |   1 -
> > > >  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
> > > >  arch/riscv/configs/nommu_virt_defconfig       |   1 -
> > > >  arch/riscv/include/asm/csr.h                  |   3 +-
> > > >  arch/riscv/include/asm/fixmap.h               |   1
> > > >  arch/riscv/include/asm/kasan.h                |  11 +-
> > > >  arch/riscv/include/asm/page.h                 |  20 +-
> > > >  arch/riscv/include/asm/pgalloc.h              |  40 ++
> > > >  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
> > > >  arch/riscv/include/asm/pgtable.h              |  47 +-
> > > >  arch/riscv/include/asm/sparsemem.h            |   6 +-
> > > >  arch/riscv/kernel/cpu.c                       |  23 +-
> > > >  arch/riscv/kernel/head.S                      |   4 +-
> > > >  arch/riscv/mm/context.c                       |   4 +-
> > > >  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
> > > >  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
> > > >  drivers/firmware/efi/libstub/efi-stub.c       |   2
> > > >  drivers/pci/controller/pci-xgene.c            |   2 +-
> > > >  include/asm-generic/pgalloc.h                 |  24 +-
> > > >  include/linux/sizes.h                         |   1
> > > >  22 files changed, 833 insertions(+), 209 deletions(-)
> > >
> > > Sorry this took a while.  This is on for-next, with a bit of juggling: a
> > > handful of trivial fixes for configs that were failing to build/boot and
> > > some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so
> > > it'd be easier to backport.  This is bigger than something I'd normally like to
> > > take late in the cycle, but given there's a lot of cleanups, likely some fixes,
> > > and it looks like folks have been testing this I'm just going to go with it.
> > >
> >
> > Yes yes yes! That's fantastic news :)
> >
> > > Let me know if there's any issues with the merge, it was a bit hairy.
> > > Probably best to just send along a fixup patch at this point.
> >
> > I'm going to take a look at that now, and I'll fix anything that comes
> > up quickly :)
>
> I see in for-next that you did not take the following patches:
>
>   riscv: Improve virtual kernel memory layout dump
>   Documentation: riscv: Add sv48 description to VM layout
>   riscv: Initialize thread pointer before calling C functions
>   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>
> I'm not sure this was your intention. If it was, I believe that at
> least the first 2 patches are needed in this series, the 3rd one is a
> useful fix and we can discuss the 4th if that's an issue for you.

Can you confirm that this was intentional and maybe explain the
motivation behind it? Because I see value in those patches.

Thanks,

Alex

>
> I tested for-next on both sv39 and sv48 successfully, I took a glance
> at the code and noticed you fixed the PTRS_PER_PGD error, thanks for
> that. Otherwise nothing obvious has popped.
>
> Thanks again,
>
> Alex
>
> >
> > Thanks!
> >
> > Alex
> >
> > >
> > > Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
