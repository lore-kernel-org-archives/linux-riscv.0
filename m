Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93B5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oEij6tc2fOmMHPLhGUBsDoQPnpqoEfIBiubsh9MLqM=; b=wKQ2+MCzux0bOt
	Lp4a8VgD4U0QXkfVrDvBcsllJbqzMC2qwKlb+54aFSwPfSN0QHc6PvjcW3kvyIm3DNQ0x1h8u3Ys3
	QQ2B9pxhZ1QZfYSlmOiePZkaZSCVhpvqotfJxfsH060m2HcHobSzCkjCbByHWlj8HacDkLOIFJCVO
	sJKcQACBfK8i3G4jYoRKKsSVcvu+W+JD4AgddWzKhySH1CQVtdypEdleA5rQqLbE10ohBJjRZ516Q
	62akYcPrDsYex8hPgBkK02dNhfv4V2WJKA5G9jEs4waIM7aJgnw1uZT2fUGljZRpQC+8eGiNFIr12
	LwO7ItHTxRfo9SnUicng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7Io-00BeA4-Ev; Thu, 12 May 2022 11:48:18 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7Ik-00Be8P-RN
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 11:48:17 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 m15-20020a9d608f000000b00606a788887aso2478856otj.0
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JK2+i5Ku98GGSVUQ7q25UBT/j75Io56SBd88g6FXM58=;
 b=aAFcTqcSsFN787hSNccl0uEM57i9Yj9dX9ktFWvwWDzn28ehLlYynZc/rOzOTDfR2H
 +i9UvpmYFUkiOHMztu4HDZaSTC+H5WFDxiPuxtNpzK8ISLFFz9wOoAK8UThi/xLV02rJ
 Aj+G9hqlSkGx8kHuTnExkBg1JlaHt1TqP4kAgZNCW6FHCL/dhAfnBYCSFWn0Y9HGP5ed
 zi9CHO5h5Ho/9lHI50TmAXt3tArn8DQnC73Rwf9b+FEF4CpOO2VykwHefcxc3X2Pbekh
 DAo0Sq/ttRdlbAPT7tR6fr5e1xZ5kGm9tk0B0IlIs7lme7Vch18wY061lQNJ+hlXw0lj
 P4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JK2+i5Ku98GGSVUQ7q25UBT/j75Io56SBd88g6FXM58=;
 b=1or6FkbHQtX2g7VUDEYyM1cqVflpVwK+diNlFw9qFxnxFLtU/F7V6CbS8XXsHAsGt0
 ZIoHCfOJ/pMXQZykAW/2ngMY3CDXxa9OWkHBAtjv1ixbyPxK+egvUZ9egtape1IDiaYe
 14KmTFxoiPw3+k1FwKhAb1c1tDLJFOn5qSWQggWrw/mFJnlzCIrZuDUg6bwTNMPudDhk
 ukcA/q3prOJt7qOgtYxErAJekDFv/Yx7Nzx2+6ybJtsHW7wPNUQFMBt9rQA5l6x/dq3y
 rNqp854qQwj7UFxTkddmm/VEN3eQ1DVPixtu9VfoLC+4dWbtb8MPjv87dyyxkVg8NcjR
 +NZw==
X-Gm-Message-State: AOAM532aIECNEvlbBGq8snkTzYpAbxoFasn4AumZXoZJMfsuByd6iSrK
 rJn/G87SLXyVGVsgtDB0ahR7ViaKI2dWphaaIhpvEA==
X-Google-Smtp-Source: ABdhPJzNtB7kzm0jzBDaKFd2pP5y6UqWZYKjG54pJy8DR2InZOSGI9VTFGVZ4+Lt7//diW2HlUwdu5R9KqcAisAKgfM=
X-Received: by 2002:a05:6830:23a6:b0:606:1bc8:b0d3 with SMTP id
 m6-20020a05683023a600b006061bc8b0d3mr11690535ots.196.1652356092670; Thu, 12
 May 2022 04:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
 <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
 <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
 <CANp29Y4WMhsE_-VWvNbwq18+qvb1Qc-ES80h_j_G-N_hcAnRAw@mail.gmail.com>
 <CANp29Y4ujmz901aE9oiBDx9dYWHti4-Jw=6Ewtotm6ck6MN9FQ@mail.gmail.com>
 <CACT4Y+ZvStiHLYBOcPDoAJnk8hquXwm9BgjQTv=APwh7AvgEUQ@mail.gmail.com>
 <CANp29Y56Or0V1AG7rzBfV_ZTph2Crg4JKKHiuw1kcGFFxeWqiQ@mail.gmail.com>
 <CANp29Y5+MuhKAzVxzEDb_k9voXmKWrUFx8k4wnW5=2+5enVFVA@mail.gmail.com>
 <CA+zEjCtvaT0YsxxUgnEGM+V4b5sWuCAs3=3J+Xocf580uT3t1g@mail.gmail.com>
 <CA+zEjCs1FEUTcM+pgV+_MZnixSO5c2hexZFxGxuCQWc2ZMQiRg@mail.gmail.com>
 <CANp29Y4rDSjrfTOxcQqwh+Qm+ocR0v6Oxr7EkFxScf+24M1tNA@mail.gmail.com>
 <CA+zEjCtB0rTuNAJkrM2q3JQL7D-9fAXBo0Ud0w__gy9CAfo_Ag@mail.gmail.com>
In-Reply-To: <CA+zEjCtB0rTuNAJkrM2q3JQL7D-9fAXBo0Ud0w__gy9CAfo_Ag@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 12 May 2022 13:48:01 +0200
Message-ID: <CACT4Y+Z=3MWEhVUH3mAH150XpOmhdjsGPOHoP1nvBcBwU_sphQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, 
 kasan-dev <kasan-dev@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_044814_964049_01DB47DE 
X-CRM114-Status: GOOD (  58.22  )
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

On Fri, 18 Feb 2022 at 14:45, Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> Hi Aleksandr,
>
> On Thu, Feb 17, 2022 at 6:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> >
> > Hi Alex,
> >
> > On Thu, Feb 17, 2022 at 5:53 PM Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> > >
> > > Aleksandr,
> > >
> > > On Wed, Feb 16, 2022 at 5:58 PM Alexandre Ghiti
> > > <alexandre.ghiti@canonical.com> wrote:
> > > >
> > > > First, thank you for working on this.
> > > >
> > > > On Wed, Feb 16, 2022 at 5:17 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > >
> > > > > If I use just defconfig + DEBUG_VIRTUAL, without any KASAN, it begins
> > > > > to boot, but overwhelms me with tons of `virt_to_phys used for
> > > > > non-linear address:` errors.
> > > > >
> > > > > Like that
> > > > >
> > > > > [    2.701271] virt_to_phys used for non-linear address:
> > > > > 00000000b59e31b6 (0xffffffff806c2000)
> > > > > [    2.701727] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/physaddr.c:16
> > > > > __virt_to_phys+0x7e/0x86
> > > > > [    2.702207] Modules linked in:
> > > > > [    2.702393] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
> > > > >   5.17.0-rc1 #1
> > > > > [    2.702806] Hardware name: riscv-virtio,qemu (DT)
> > > > > [    2.703051] epc : __virt_to_phys+0x7e/0x86
> > > > > [    2.703298]  ra : __virt_to_phys+0x7e/0x86
> > > > > [    2.703547] epc : ffffffff80008448 ra : ffffffff80008448 sp :
> > > > > ffff8f800021bde0
> > > > > [    2.703977]  gp : ffffffff80ed9b30 tp : ffffaf8001230000 t0 :
> > > > > ffffffff80eea56f
> > > > > [    2.704704]  t1 : ffffffff80eea560 t2 : 0000000000000000 s0 :
> > > > > ffff8f800021be00
> > > > > [    2.705153]  s1 : ffffffff806c2000 a0 : 000000000000004f a1 :
> > > > > ffffffff80e723d8
> > > > > [    2.705555]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 :
> > > > > 0000000000000000
> > > > > [    2.706027]  a5 : 0000000000000000 a6 : 0000000000000005 a7 :
> > > > > ffffffffffffffff
> > > > > [    2.706474]  s2 : ffffffff80b80b08 s3 : 00000000000000c2 s4 :
> > > > > ffffffff806c2000
> > > > > [    2.706891]  s5 : ffffffff80edba10 s6 : ffffffff80edb960 s7 :
> > > > > 0000000000000001
> > > > > [    2.707290]  s8 : 00000000000000ff s9 : ffffffff80b80b40 s10:
> > > > > 00000000000000cc
> > > > > [    2.707689]  s11: ffffaf807e1fcf00 t3 : 0000000000000076 t4 :
> > > > > ffffffffffffffff
> > > > > [    2.708092]  t5 : 00000000000001f2 t6 : ffff8f800021bb48
> > > > > [    2.708433] status: 0000000000000120 badaddr: 0000000000000000
> > > > > cause: 0000000000000003
> > > > > [    2.708919] [<ffffffff8011416a>] free_reserved_area+0x72/0x19a
> > > > > [    2.709296] [<ffffffff80003a5a>] free_initmem+0x6c/0x7c
> > > > > [    2.709648] [<ffffffff805f60c8>] kernel_init+0x3a/0x10a
> > > > > [    2.709993] [<ffffffff80002fda>] ret_from_exception+0x0/0xc
> > > > > [    2.710310] ---[ end trace 0000000000000000 ]---
> > > > >
> > > >
> > > > I was able to reproduce this: the first one regarding init_zero_pfn is
> > > > legit but not wrong, I have to check when it was introduced and how to
> > > > fix this.
> > > > Regarding the huge batch that follows, at first sight, I would say
> > > > this is linked to my sv48 patchset but that does not seem important as
> > > > the address is a kernel mapping address so the use of virt_to_phys is
> > > > right.
> > > >
> > > > > On Wed, Feb 16, 2022 at 5:09 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > > >
> > > > > > On Wed, Feb 16, 2022 at 12:56 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > > > > >
> > > > > > > On Wed, 16 Feb 2022 at 12:47, Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Feb 16, 2022 at 11:37 AM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Alex,
> > > > > > > > >
> > > > > > > > > On Wed, Feb 16, 2022 at 5:14 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Dmitry,
> > > > > > > > > >
> > > > > > > > > > On 2/15/22 18:12, Dmitry Vyukov wrote:
> > > > > > > > > > > On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> > > > > > > > > > > <alexandre.ghiti@canonical.com> wrote:
> > > > > > > > > > >> Hi Aleksandr,
> > > > > > > > > > >>
> > > > > > > > > > >> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > > > > > > > >>> Hello,
> > > > > > > > > > >>>
> > > > > > > > > > >>> syzbot has already not been able to fuzz its RISC-V instance for 97
> > > > > > > > > > >> That's a longtime, I'll take a look more regularly.
> > > > > > > > > > >>
> > > > > > > > > > >>> days now because the compiled kernel cannot boot. I bisected the issue
> > > > > > > > > > >>> to the following commit:
> > > > > > > > > > >>>
> > > > > > > > > > >>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> > > > > > > > > > >>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > > > > > > > > >>> Date:   Fri Oct 29 06:59:27 2021 +0200
> > > > > > > > > > >>>
> > > > > > > > > > >>>      riscv: Fix asan-stack clang build
> > > > > > > > > > >>>
> > > > > > > > > > >>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> > > > > > > > > > >>> enabled. In the previous message syzbot mentions
> > > > > > > > > > >>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> > > > > > > > > > >>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> > > > > > > > > > >>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> > > > > > > > > > >>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> > > > > > > > > > >>> For convenience, I also duplicate the .config file from the bot's
> > > > > > > > > > >>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > > > > > > > > > >>>
> > > > > > > > > > >>> Can someone with KASAN and RISC-V expertise please take a look?
> > > > > > > > > > >> I'll take a look at that today.
> > > > > > > > > > >>
> > > > > > > > > > >> Thanks for reporting the issue,
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I took a quick look, not enough to fix it but I know the issue comes
> > > > > > > > > > from the inline instrumentation, I have no problem with the outline
> > > > > > > > > > instrumentation. I need to find some cycles to work on this, my goal is
> > > > > > > > > > to fix this for 5.17.
> > > > > > > > >
> > > > > > > > > Thanks for the update!
> > > > > > > > >
> > > > > > > > > Can you please share the .config with which you tested the outline
> > > > > > > > > instrumentation?
> > > > > > > > > I updated the syzbot config to use KASAN_OUTLINE instead of KASAN_INLINE,
> > > > > > > > > but it still does not boot :(
> > > > > > > > >
> > > > > > > > > Here's what I used:
> > > > > > > > > https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
> > > > > > > >
> > > > > > > > Update: it doesn't boot with that big config, but boots if I generate
> > > > > > > > a simple one with KASAN_OUTLINE:
> > > > > > > >
> > > > > > > > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > > > > > > > ./scripts/config -e KASAN -e KASAN_OUTLINE
> > > > > > > > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > > > > > > >
> > > > > > > > And it indeed doesn't work if I use KASAN_INLINE.
> > > > > > >
> > > > > > > It may be an issue with code size. Full syzbot config + KASAN + KCOV
> > > > > > > produce hugely massive .text. It may be hitting some limitation in the
> > > > > > > bootloader/kernel bootstrap code.
> > > >
> > > > I took a quick glance and it traps on a KASAN address that is not
> > > > mapped, either because it is too soon or because the mapping failed
> > > > somehow.
> > > >
> > > > I'll definitely dive into that tomorrow, sorry for being slow here and
> > > > thanks again for all your work, that helps a lot.
> > > >
> > > > Thanks,
> > > >
> > > > Alex
> > > >
> > > > > >
> > > > > > I bisected the difference between the config we use on syzbot and the
> > > > > > simple one that was generated like I described above.
> > > > > > Turns out that it's the DEBUG_VIRTUAL config that makes the difference.
> > > > > >
> > > > > > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > > > > > ./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
> > > > > > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > > > > >
> > > > > > And the resulting kernel does not boot.
> > > > > > My env: the `riscv/fixes` branch, commit
> > > > > > 6df2a016c0c8a3d0933ef33dd192ea6606b115e3, qemu 6.2.0.
> > >
> > > I fixed a few things today: KASAN + SPARSE_VMEMMAP, DEBUG_VIRTUAL and
> > > maybe KASAN  + KCOV.
> > >
> > > With those small fixes, I was able to boot your large dotconfig with
> > > KASAN_OUTLINE, the inline version still fails, this is my next target
> > > :)
> > > I'll push that tomorrow!
> >
> > Awesome, thank you very much!
> > Looking forward to finally seeing the instance run :)
>
> I sent a patchset which should fix your config with *outline* instrumentation.

Was this fix merged? The riscv instance still does not boot:
https://syzkaller.appspot.com/bug?id=5f2ff52ad42cba9f222202219baebd4e63e35127

> However, as you'll see in the cover letter, I have an issue with
> another KASAN config and if you can take a look at the stacktrace and
> see if that rings a bell, that would be great.
>
> Don't hesitate next time to ping me when the riscv syzbot instance fails :)
>
> Alex
>
>
> >
> > --
> > Best Regards,
> > Aleksandr
> >
> > >
> > > Thanks again,
> > >
> > > Alex
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/CA%2BzEjCtB0rTuNAJkrM2q3JQL7D-9fAXBo0Ud0w__gy9CAfo_Ag%40mail.gmail.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
