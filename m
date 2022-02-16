Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27F3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1kWEm1vmdZvhT2pRwjnsxTMGHrbLBSxLmc2RL05KIY=; b=duKM0uIuZHcCI2
	RXkgDIWcs6e040m3XFyLNtrEvbrXt1+SeF6bCnwk78Pia3Q0LPbVVjqRAovg1zO5SGFX56AQLcYIP
	Pi6ylV3uFcP1FG3uXXXll8MO9qDlPGFTpR6+x/D95npO5IQ4lQK2ARplmvpXRfg8Yrs4PZmc/q3Et
	JkjPmHdZQ732Uf6cmSmxpDBOX0mhIyXiYGLT1eyp0vxFTNjMXHr47cfWr7rPZ+6Yw33haTuvWeiKD
	dpqWUZBp9Gog6b4nEQQ/f0dUERdMhvhqRb4vWOzwXZ8QU4gviUzdwqt5SnqQLEFoBPUe0q2reAwm6
	4tYCoptgridyYl695PHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKNdL-007pBn-5N; Wed, 16 Feb 2022 16:58:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKNdH-007p9C-IA
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 16:58:25 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7E48140338
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645030700;
 bh=M5RLsO3qjhpfilL1JQ6gt3RIe8kV5S+RZ2jxfqQZ1pY=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=QVj2gEWKc72LaNue60mqt0gX9AbMWuewjTiT0sXpCpHuPreXaGzog0K9FaWDV1DOS
 h6nqnc/8wAg3PIP69RxksR0szAf/2K+thi0StyDDezqPf/WPdTwOZWP08uXx0AkDYQ
 AhUNOk1K4kNXCbn+Pt256KmXptInqOxwCjG1m9LA9IatmyuwPosiUOxMu+jKofBwKN
 4/46oGHSXnXtjXG4KwyYIN2IFNW4hDajxFV+0P7E/dqBjT8/njClyPIzA7ddSZXkHl
 2At6q34NFi9S9htHJlEDF2antbNP/fLlvDy88EJX6EGQEWruWj7M240ffY/BR/goCr
 orj22VWuL+9JA==
Received: by mail-ed1-f69.google.com with SMTP id
 z8-20020a05640240c800b0041003c827edso1969324edb.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 08:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5RLsO3qjhpfilL1JQ6gt3RIe8kV5S+RZ2jxfqQZ1pY=;
 b=T2D+CLZqkzUbC9AYSS2U5Qhuj20piBEiOdQwJW26jGZNOaLaGEgIpmREEpPDUBeh04
 VkqTvqmYtAtgL3or+AOkn2ZUhXtYipl+qpjB0vCKw5a9wSn3sftyuGT8eiF8sfVn8mRK
 264kRtyy9GmeMBPTiBXHdz7aR5PYZkVPYzGW0Ib4NiABfHHeZ+FVcoU36/mOf+C4K5Ol
 t6DF7TKI35jSOOj24sJhyYc5UDswvsmLFDynEVIyExJpc1a2i7T/UCJn6HJDSfWZ65FN
 I2lvsIN7JLjGoUxCm683+foxjI+ldOKwu7ODdIiKdvOdQanjt0sUrpayZm1oJqoQV9cc
 +0Hg==
X-Gm-Message-State: AOAM533HWZqRkmaPFkY2h/mCtwjodLpj3e8j70EXhd4lJ4LVIuLeSjQQ
 8/WpLutatgl5/oT2L0pZktTcsqJ54MOHWedYSrHKxt452vnqDfEzjEo7RRyWXl8Ip9hYrJga12Y
 hpjMFPOQpCkT2RtvbBeqtl6UPsmJkIMQc4sGpSNGZrzaLchhp5//Cb1K6+u/wGQ==
X-Received: by 2002:a17:906:80c7:b0:6cf:9c76:1404 with SMTP id
 a7-20020a17090680c700b006cf9c761404mr2981226ejx.207.1645030698120; 
 Wed, 16 Feb 2022 08:58:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzsEnPuFZSBDMUrBGuDIF01b/TEtZZHaCW7kECaM136HycI5D7aTPI7ebTnaUUlLGEDnNjxGdRs+82GkluLjw=
X-Received: by 2002:a17:906:80c7:b0:6cf:9c76:1404 with SMTP id
 a7-20020a17090680c700b006cf9c761404mr2981216ejx.207.1645030697922; Wed, 16
 Feb 2022 08:58:17 -0800 (PST)
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
In-Reply-To: <CANp29Y5+MuhKAzVxzEDb_k9voXmKWrUFx8k4wnW5=2+5enVFVA@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 16 Feb 2022 17:58:06 +0100
Message-ID: <CA+zEjCtvaT0YsxxUgnEGM+V4b5sWuCAs3=3J+Xocf580uT3t1g@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, 
 kasan-dev <kasan-dev@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_085823_847748_EBF44E0D 
X-CRM114-Status: GOOD (  44.08  )
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

First, thank you for working on this.

On Wed, Feb 16, 2022 at 5:17 PM Aleksandr Nogikh <nogikh@google.com> wrote:
>
> If I use just defconfig + DEBUG_VIRTUAL, without any KASAN, it begins
> to boot, but overwhelms me with tons of `virt_to_phys used for
> non-linear address:` errors.
>
> Like that
>
> [    2.701271] virt_to_phys used for non-linear address:
> 00000000b59e31b6 (0xffffffff806c2000)
> [    2.701727] WARNING: CPU: 0 PID: 1 at arch/riscv/mm/physaddr.c:16
> __virt_to_phys+0x7e/0x86
> [    2.702207] Modules linked in:
> [    2.702393] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
>   5.17.0-rc1 #1
> [    2.702806] Hardware name: riscv-virtio,qemu (DT)
> [    2.703051] epc : __virt_to_phys+0x7e/0x86
> [    2.703298]  ra : __virt_to_phys+0x7e/0x86
> [    2.703547] epc : ffffffff80008448 ra : ffffffff80008448 sp :
> ffff8f800021bde0
> [    2.703977]  gp : ffffffff80ed9b30 tp : ffffaf8001230000 t0 :
> ffffffff80eea56f
> [    2.704704]  t1 : ffffffff80eea560 t2 : 0000000000000000 s0 :
> ffff8f800021be00
> [    2.705153]  s1 : ffffffff806c2000 a0 : 000000000000004f a1 :
> ffffffff80e723d8
> [    2.705555]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 :
> 0000000000000000
> [    2.706027]  a5 : 0000000000000000 a6 : 0000000000000005 a7 :
> ffffffffffffffff
> [    2.706474]  s2 : ffffffff80b80b08 s3 : 00000000000000c2 s4 :
> ffffffff806c2000
> [    2.706891]  s5 : ffffffff80edba10 s6 : ffffffff80edb960 s7 :
> 0000000000000001
> [    2.707290]  s8 : 00000000000000ff s9 : ffffffff80b80b40 s10:
> 00000000000000cc
> [    2.707689]  s11: ffffaf807e1fcf00 t3 : 0000000000000076 t4 :
> ffffffffffffffff
> [    2.708092]  t5 : 00000000000001f2 t6 : ffff8f800021bb48
> [    2.708433] status: 0000000000000120 badaddr: 0000000000000000
> cause: 0000000000000003
> [    2.708919] [<ffffffff8011416a>] free_reserved_area+0x72/0x19a
> [    2.709296] [<ffffffff80003a5a>] free_initmem+0x6c/0x7c
> [    2.709648] [<ffffffff805f60c8>] kernel_init+0x3a/0x10a
> [    2.709993] [<ffffffff80002fda>] ret_from_exception+0x0/0xc
> [    2.710310] ---[ end trace 0000000000000000 ]---
>

I was able to reproduce this: the first one regarding init_zero_pfn is
legit but not wrong, I have to check when it was introduced and how to
fix this.
Regarding the huge batch that follows, at first sight, I would say
this is linked to my sv48 patchset but that does not seem important as
the address is a kernel mapping address so the use of virt_to_phys is
right.

> On Wed, Feb 16, 2022 at 5:09 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> >
> > On Wed, Feb 16, 2022 at 12:56 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > On Wed, 16 Feb 2022 at 12:47, Aleksandr Nogikh <nogikh@google.com> wrote:
> > > >
> > > > On Wed, Feb 16, 2022 at 11:37 AM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > >
> > > > > Hi Alex,
> > > > >
> > > > > On Wed, Feb 16, 2022 at 5:14 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > > > > >
> > > > > > Hi Dmitry,
> > > > > >
> > > > > > On 2/15/22 18:12, Dmitry Vyukov wrote:
> > > > > > > On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> > > > > > > <alexandre.ghiti@canonical.com> wrote:
> > > > > > >> Hi Aleksandr,
> > > > > > >>
> > > > > > >> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > > > >>> Hello,
> > > > > > >>>
> > > > > > >>> syzbot has already not been able to fuzz its RISC-V instance for 97
> > > > > > >> That's a longtime, I'll take a look more regularly.
> > > > > > >>
> > > > > > >>> days now because the compiled kernel cannot boot. I bisected the issue
> > > > > > >>> to the following commit:
> > > > > > >>>
> > > > > > >>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> > > > > > >>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > > > > >>> Date:   Fri Oct 29 06:59:27 2021 +0200
> > > > > > >>>
> > > > > > >>>      riscv: Fix asan-stack clang build
> > > > > > >>>
> > > > > > >>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> > > > > > >>> enabled. In the previous message syzbot mentions
> > > > > > >>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> > > > > > >>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> > > > > > >>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> > > > > > >>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> > > > > > >>> For convenience, I also duplicate the .config file from the bot's
> > > > > > >>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > > > > > >>>
> > > > > > >>> Can someone with KASAN and RISC-V expertise please take a look?
> > > > > > >> I'll take a look at that today.
> > > > > > >>
> > > > > > >> Thanks for reporting the issue,
> > > > > > >
> > > > > >
> > > > > > I took a quick look, not enough to fix it but I know the issue comes
> > > > > > from the inline instrumentation, I have no problem with the outline
> > > > > > instrumentation. I need to find some cycles to work on this, my goal is
> > > > > > to fix this for 5.17.
> > > > >
> > > > > Thanks for the update!
> > > > >
> > > > > Can you please share the .config with which you tested the outline
> > > > > instrumentation?
> > > > > I updated the syzbot config to use KASAN_OUTLINE instead of KASAN_INLINE,
> > > > > but it still does not boot :(
> > > > >
> > > > > Here's what I used:
> > > > > https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
> > > >
> > > > Update: it doesn't boot with that big config, but boots if I generate
> > > > a simple one with KASAN_OUTLINE:
> > > >
> > > > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > > > ./scripts/config -e KASAN -e KASAN_OUTLINE
> > > > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > > >
> > > > And it indeed doesn't work if I use KASAN_INLINE.
> > >
> > > It may be an issue with code size. Full syzbot config + KASAN + KCOV
> > > produce hugely massive .text. It may be hitting some limitation in the
> > > bootloader/kernel bootstrap code.

I took a quick glance and it traps on a KASAN address that is not
mapped, either because it is too soon or because the mapping failed
somehow.

I'll definitely dive into that tomorrow, sorry for being slow here and
thanks again for all your work, that helps a lot.

Thanks,

Alex

> >
> > I bisected the difference between the config we use on syzbot and the
> > simple one that was generated like I described above.
> > Turns out that it's the DEBUG_VIRTUAL config that makes the difference.
> >
> > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > ./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
> > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> >
> > And the resulting kernel does not boot.
> > My env: the `riscv/fixes` branch, commit
> > 6df2a016c0c8a3d0933ef33dd192ea6606b115e3, qemu 6.2.0.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
