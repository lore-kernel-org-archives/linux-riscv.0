Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C963C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJAh05Z1WzQ26W3/swtVDAYjpOBL2RJQy3hyG9Lgcvw=; b=fY2kYUJ3u8rXtq
	M6bm7ZOVuPFlw6n9a04p9V9lTki8bpD+llArhbAHXA34AZggW6dyJ06om78P64J1XzfLaIANzQFa1
	st6YZnWVYiI83DAusxZ/5S7trQ4Lj7Idcr4e7uFnFTyv8RNdeKOz8sRCk9nHGa/xiXj+0ZeK14bIq
	pUDdT42aANcJVmyPuxOSWlVYrBTXn4chPSZx166wbFz4COx/TMAK9Ow19PZof421HIcPeLJ/MOYF5
	TA+gvEeA9PmhLP/dTA8246PF6Gz1g3KKkrUC1HeVfhfPQqy22ftpuqCna3holEowD/7bhrqOnfPHJ
	c7h4uh6HHeyZw+CAcchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARuf-009Luv-5d; Thu, 20 Jan 2022 07:31:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nARub-009Ltb-Hb
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 07:31:15 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C6A73F19C
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642663867;
 bh=dCQXkZtZ/VwDrAN2uVWBP6tsU2v5k0SPHuefqy0UyIg=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=ehE0nLS04/hk/KpGZMHd5dezk6iZAaa5QxU6iWXLcbqAMrtQwKYZq0kcinBJqow0a
 7ThbhGDkRyEPGu2qH4p9uyTrTTi758L3uKp+Ax+UqNIAY10jbBAVBaZcKiahjJgXiG
 /ZWDVEIqZ6FARlmKdKT26tg85vRNoKU5K+zPCaaw29Z7209kHkUok/0KCCH7MB/9VP
 NWObuBB7Pshax2brSTtGaCt9zcKCNdJkLkZ0/T6LAjx5qJKp2xGByH/sGObe4a/lS6
 h3BbRcnYm/8t65jW9Z47CjAaAD/Qoik+vm8IY58zWqbxjkCpyteUJr+aFZ+97tdjVB
 4DeCbvOocx2HQ==
Received: by mail-lf1-f69.google.com with SMTP id
 k11-20020a0565123d8b00b00432719f58dbso3101717lfv.22
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 23:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dCQXkZtZ/VwDrAN2uVWBP6tsU2v5k0SPHuefqy0UyIg=;
 b=BBDICNTqWM/0qfcBYXDrIViL2XW7TNOGSi7JX3vEqEDUmhA89djwoCArsyshysNI4l
 gMoBJHYn66Gr4Q3Go1oM0QQGmLwwbk5myAtp057Z9KtjhTon4ceQgBvF/nVF/jvjHklJ
 IkDJTJ2IlxO9JgHDA0p0tivrp90G7ZwUrmn4si/v1qsYwA9t8V5eBxxjxkj6yrvxNEKk
 NM442aAoJwlkWqUBHNSPnBdXJl+lGG9nR8qLQxONBePVyH60d9qKVFkHa07MLVUEnjOg
 kvrrBTDMQdTxK/5E4uriQjfPhnLD5tlNoz6H6XUct2snCx/gCoYM9PXGk3THs1+BTTWE
 78fg==
X-Gm-Message-State: AOAM530o6RTC5hOz6jEW1a1bpai+t/24fF0QmdJkEDjl5qKyxjMz7Mbg
 A1kWr0gTZ0IpiQWqKp0hOHO/ESiWVDJpMaMgHdgfL69hjpQVkHcgXh03HS/5SAp6if3l702XgMS
 CQXmQU5tQppdNGVLydXRNxGfP5k0rcsUhTQDeBnKVKLK3EHZqaP4XNxi0X5WScg==
X-Received: by 2002:a05:6402:268a:: with SMTP id
 w10mr35311134edd.10.1642663855644; 
 Wed, 19 Jan 2022 23:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx4lfTfUx4Ph9cNei39h0hiDJe+PmE9RqL0dDaj6MBDX4YqPidVFEEVr4D9rAfOlQrUSsuyrh6JKI5CmG9NuI=
X-Received: by 2002:a05:6402:268a:: with SMTP id
 w10mr35311082edd.10.1642663855317; 
 Wed, 19 Jan 2022 23:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
In-Reply-To: <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 20 Jan 2022 08:30:43 +0100
Message-ID: <CA+zEjCuTSjOCmNExSN1jO50tsuXNzL9x6K6jWjG4+vVky5eWsw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220119_233113_753590_9CD48BE5 
X-CRM114-Status: GOOD (  35.35  )
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

On Thu, Jan 20, 2022 at 5:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
> > * Please note notable changes in memory layouts and kasan population *
> >
> > This patchset allows to have a single kernel for sv39 and sv48 without
> > being relocatable.
> >
> > The idea comes from Arnd Bergmann who suggested to do the same as x86,
> > that is mapping the kernel to the end of the address space, which allows
> > the kernel to be linked at the same address for both sv39 and sv48 and
> > then does not require to be relocated at runtime.
> >
> > This implements sv48 support at runtime. The kernel will try to
> > boot with 4-level page table and will fallback to 3-level if the HW does not
> > support it. Folding the 4th level into a 3-level page table has almost no
> > cost at runtime.
> >
> > Note that kasan region had to be moved to the end of the address space
> > since its location must be known at compile-time and then be valid for
> > both sv39 and sv48 (and sv57 that is coming).
> >
> > Tested on:
> >   - qemu rv64 sv39: OK
> >   - qemu rv64 sv48: OK
> >   - qemu rv64 sv39 + kasan: OK
> >   - qemu rv64 sv48 + kasan: OK
> >   - qemu rv32: OK
> >
> > Changes in v3:
> >   - Fix SZ_1T, thanks to Atish
> >   - Fix warning create_pud_mapping, thanks to Atish
> >   - Fix k210 nommu build, thanks to Atish
> >   - Fix wrong rebase as noted by Samuel
> >   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
> >   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
> >
> > Changes in v2:
> >   - Rebase onto for-next
> >   - Fix KASAN
> >   - Fix stack canary
> >   - Get completely rid of MAXPHYSMEM configs
> >   - Add documentation
> >
> > Alexandre Ghiti (13):
> >   riscv: Move KASAN mapping next to the kernel mapping
> >   riscv: Split early kasan mapping to prepare sv48 introduction
> >   riscv: Introduce functions to switch pt_ops
> >   riscv: Allow to dynamically define VA_BITS
> >   riscv: Get rid of MAXPHYSMEM configs
> >   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
> >   riscv: Implement sv48 support
> >   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
> >   riscv: Explicit comment about user virtual address space size
> >   riscv: Improve virtual kernel memory layout dump
> >   Documentation: riscv: Add sv48 description to VM layout
> >   riscv: Initialize thread pointer before calling C functions
> >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
> >
> >  Documentation/riscv/vm-layout.rst             |  48 ++-
> >  arch/riscv/Kconfig                            |  37 +-
> >  arch/riscv/configs/nommu_k210_defconfig       |   1 -
> >  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
> >  arch/riscv/configs/nommu_virt_defconfig       |   1 -
> >  arch/riscv/include/asm/csr.h                  |   3 +-
> >  arch/riscv/include/asm/fixmap.h               |   1
> >  arch/riscv/include/asm/kasan.h                |  11 +-
> >  arch/riscv/include/asm/page.h                 |  20 +-
> >  arch/riscv/include/asm/pgalloc.h              |  40 ++
> >  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
> >  arch/riscv/include/asm/pgtable.h              |  47 +-
> >  arch/riscv/include/asm/sparsemem.h            |   6 +-
> >  arch/riscv/kernel/cpu.c                       |  23 +-
> >  arch/riscv/kernel/head.S                      |   4 +-
> >  arch/riscv/mm/context.c                       |   4 +-
> >  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
> >  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
> >  drivers/firmware/efi/libstub/efi-stub.c       |   2
> >  drivers/pci/controller/pci-xgene.c            |   2 +-
> >  include/asm-generic/pgalloc.h                 |  24 +-
> >  include/linux/sizes.h                         |   1
> >  22 files changed, 833 insertions(+), 209 deletions(-)
>
> Sorry this took a while.  This is on for-next, with a bit of juggling: a
> handful of trivial fixes for configs that were failing to build/boot and
> some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so
> it'd be easier to backport.  This is bigger than something I'd normally like to
> take late in the cycle, but given there's a lot of cleanups, likely some fixes,
> and it looks like folks have been testing this I'm just going to go with it.
>

Yes yes yes! That's fantastic news :)

> Let me know if there's any issues with the merge, it was a bit hairy.
> Probably best to just send along a fixup patch at this point.

I'm going to take a look at that now, and I'll fix anything that comes
up quickly :)

Thanks!

Alex

>
> Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
