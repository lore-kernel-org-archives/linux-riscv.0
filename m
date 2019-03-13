Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E8CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 21:06:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E9C32070D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 21:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gS2EGA8B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="2RiDmuXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E9C32070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUNKp1t6JgFuncBrM8r3O/SkrXUROoJ5cOtsYRreS+o=; b=gS2EGA8BeMPL4d
	Rmilru/WbL0ktkmWQWnMRD4Y1SffGs127ZbJSs01i6dP583n1wywM6w/vCoId8NSUZytBzHNtgx5S
	LdmQMNVipbbd8gd5EkXM1/tDQHosc+h/tWA5Zdfk1F/v7C7a0HLOjL/mxIzFeoWFhWaM591xU7yfT
	jqWRTWzk4F36rOMOSNjWXX49Wq5u57ij3o1kEB20hIln/70W0PkfhMIbncAlMcmutNs7FEPmgNPSb
	uAaMdL3eLzZ0r5fePRtFlpXB3BMFDqSNeITQ6WoB7pCiBUVbsdiGw1cY46UbYGgMMzeHbBOMkYjSX
	RE77GEvAlb4C536CwO2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4B4x-0004hG-Ht; Wed, 13 Mar 2019 21:06:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4B4p-0004Me-HK
 for linux-riscv@lists.infradead.org; Wed, 13 Mar 2019 21:06:21 +0000
Received: by mail-wm1-x341.google.com with SMTP id e74so722663wmg.3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2019 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jooKZ6bjOshpJ4KeSFoPxNiKTgfel8e+7adx53/EYZI=;
 b=2RiDmuXnNuN0BEV42QZDZB35/jW0v86X1mIML1uA5+ylaPHh5Puryetbenqf/rbiUk
 pd14iTL8EUIBgqt05xdLIZlD8X12gDn3ipwaQx5MOYfPg1k8qQ2r5Q+tejQJytgMK8tn
 46Zk1AetVsw48nXVb8CWigq+y9mkzcrC77IihtRa9IgujCfS5hUydXbDvUJQ1/vKyWwg
 Lzr3Hshm2iXIbVSrrgPsVlsUrfBwF0qSIU/8BHeSi9hr+iyOzH1ksDSLfMJCVIrcgenM
 zh9xko+RaygiBnWvqbGjivptbfq2pEMp4H7EpWbQBZWsQStj7YmisOgdoPBRjIdq4eec
 YQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jooKZ6bjOshpJ4KeSFoPxNiKTgfel8e+7adx53/EYZI=;
 b=dxHdAt139wDccWQpwLpQRDcigG77lWRMhmsHoBMng7MZiZkj02PtBQXb4GIclNVJoS
 uDC+amfc6HPzbqA/2XmO/v9ZbgyL8EriOxIoAVSCisFx9B0SM8JWxYyMe6MO8MkDlG68
 MkyJ1/yKX49fEvwsQFiepWmSeoTXbfh16TK3/e6EO5TDz9NkKyzfw6VvndhXIinYCCnb
 5hADy3Mx9vad0EO/1WSPvLYcZaFt+klAD++Xun/NedqAVm5HddMbCWh3c08HGNbwgAFp
 cdyG2kPXzqgbpavFN9fVcuPurjRqWUH40DQUjv/fkH2RTckvyHJ1klug8OqQDCKZ8VE2
 LYww==
X-Gm-Message-State: APjAAAVfMF4Ob9b3EVVBSGyJCtmkuvZt4dCvYQMjJZwOrcROxcXkWEys
 qVVvuaZ6busZyr8dbyDqL5FTWZ1Qx5p22lTo8ABZUA==
X-Google-Smtp-Source: APXvYqyiVLuOBtzhh7YfprNbwUo2FOcmqGAFw45zxzCJIZgbG3DNDdUt3J+A6GailyukrbGR8C+ESqZWoHB2f6+1fbU=
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr90829wmh.153.1552511172923;
 Wed, 13 Mar 2019 14:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-4-anup.patel@wdc.com>
 <20190313183121.GB28630@rapoport-lnx>
In-Reply-To: <20190313183121.GB28630@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Mar 2019 02:36:01 +0530
Message-ID: <CAAhSdy1mrV2CakS0cfOY8F1B7uH_yXjO3W-CiMUcYonkRnVbeQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_140616_435573_8987BCE3 
X-CRM114-Status: GOOD (  22.52  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 12:01 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Tue, Mar 12, 2019 at 10:08:22PM +0000, Anup Patel wrote:
> > Currently, we have to boot RISCV64 kernel from a 2MB aligned physical
> > address and RISCV32 kernel from a 4MB aligned physical address. This
> > constraint is because initial pagetable setup (i.e. setup_vm()) maps
> > entire RAM using hugepages (i.e. 2MB for 3-level pagetable and 4MB for
> > 2-level pagetable).
> >
> > Further, the above booting contraint also results in memory wastage
> > because if we boot kernel from some <xyz> address (which is not same as
> > RAM start address) then RISCV kernel will map PAGE_OFFSET virtual address
> > lineraly to <xyz> physical address and memory between RAM start and <xyz>
> > will be reserved/unusable.
> >
> > For example, RISCV64 kernel booted from 0x80200000 will waste 2MB of RAM
> > and RISCV32 kernel booted from 0x80400000 will waste 4MB of RAM.
> >
> > This patch re-writes the initial pagetable setup code to allow booting
> > RISV32 and RISCV64 kernel from any 4KB (i.e. PAGE_SIZE) aligned address.
> >
> > To achieve this:
> > 1. We map kernel, dtb and only some amount of RAM (few MBs) using 4KB
> >    mappings in setup_vm() (called from head.S)
> > 2. Once we reach paging_init() (called from setup_arch()) after
> >    memblock setup, we map all available memory banks using 4KB
> >    mappings and memblock APIs.
>
> I'm not really familiar with RISC-V, but my guess would be that you'd get
> worse TLB performance with 4KB mappings. Not mentioning the amount of
> memory required for the page table itself.

I agree we will see a hit in TLB performance due to 4KB mappings.

To address this we can create, 2MB (or 4MB on 32bit system) mappings
whenever load_pa is aligned to it otherwise we prefer 4KB mappings. In other
words, we create bigger mappings whenever possible and fallback to 4KB
mappings when not possible.

This way if kernel is booted from 2MB (or 4MB) aligned address then we will
see good TLB performance for kernel addresses. Also, users are still free to
boot Linux RISC-V kernel from any 4KB aligned address.

Of course, we will have to document this as part of Linux RISC-V booting
requirements under Documentation/ (which does not exist currently).

>
> If the only goal is to utilize the physical memory below the kernel, it
> simply should not be reserved at the first place, something like:

Well, our goal was two-fold:

1. We wanted to unify boot-time alignment requirements for 32bit and
64bit RISC-V systems
2. Save memory by allowing users to place kernel just after the runtime
firmware at starting of RAM.

>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b379a75..6301ced 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -108,6 +108,7 @@ void __init setup_bootmem(void)
>         /* Find the memory region containing the kernel */
>         for_each_memblock(memory, reg) {
>                 phys_addr_t vmlinux_end = __pa(_end);
> +               phys_addr_t vmlinux_start = __pa(start);
>                 phys_addr_t end = reg->base + reg->size;
>
>                 if (reg->base <= vmlinux_end && vmlinux_end <= end) {
> @@ -115,7 +116,8 @@ void __init setup_bootmem(void)
>                          * Reserve from the start of the region to the end of
>                          * the kernel
>                          */
> -                       memblock_reserve(reg->base, vmlinux_end - reg->base);
> +                       memblock_reserve(vmlinux_start,
> +                                        vmlinux_end - vmlinux_start);
>                         mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
>                 }
>         }

Thanks for above changes. I will include them in my next revision.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
