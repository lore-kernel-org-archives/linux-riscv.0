Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DD6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W58KUx8x22tfG6aRL9RaLby40C4lUJnhFLoIpY2Ec/s=; b=155gpwIx5qIH2K
	sIjtRz/V91I/MG9BgpH8AEDYZsW72mhmdV0DZhJ4Ev5IHLnAT+GKiw6EY4Az3iNWiGBO5Zc8Fo6Vf
	S42cDdlvuX9+kHikNl7dUaCBv7oxQtYI4N2gUbdRCRbrGgNNTLmjlYEhzGFcWmaLPRP7OPwI+NDrF
	07ek9M2dQH9ueJMNd1yr5MwA9cPH+UHI8mj0JjxtLsddTXJE41zJs9f1CI1HqZp7tmBHkmgXc4VDa
	w/vgGwQO8toN6Mws3gdcCJj0ckHVVRdDzmbCAV7TQgM4AIOS2zSbefV+gX1WkVORTDNiC8gNAJgZ9
	bvAFFFeZNsbxLcsTuY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKMrq-007c56-H4; Wed, 16 Feb 2022 16:09:22 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKMrj-007c2b-Ul
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 16:09:17 +0000
Received: by mail-il1-x136.google.com with SMTP id d3so117702ilr.10
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 08:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1DbyhBVBvnUPYaFyX9FKtS0pYUg5/jmB2DYqrFTT5U=;
 b=J+IlJwKwqNmOWrnf9XmZjoqXa0NqIoyKOJfIcTZrmFWEeZLQaOlywhGandqivrs4pJ
 B89cnA5e/+9qJQzIowUnlXGsCr65LTNHTGRRyzH5tTmj1I2LpsNBTLDSMItBBmKJuPVZ
 f4twJbUofcE5FHVhwVxSjSLIeQ71xPPXnfWFL1Tv0cdLNLR5Ou5czua9VLjsjBWmcJUr
 XCGwJtkNEmHkcsMwl0WkstoebpSHASn+bBGPtRt7JDqF46ZWwteM9qav+cGSv74qfNvJ
 e+5a+XgdW2fSFzlxfQ2ruUrOLVuaB/neINyCjXDMLwnj41WMvQXFGlS19PYvPvu6hqBL
 buXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1DbyhBVBvnUPYaFyX9FKtS0pYUg5/jmB2DYqrFTT5U=;
 b=UCeSYlb0pAqjaSIWqsliorVY9ftuvHh4veD6nORXTV2lIydwWzEDDj/5XAjB+eLM+T
 O2HrZa47/4htAzsD6+HM3D2AQyIIStXA6kYuW3zXaSM3OQNoW5fQpjv7tCEOl/Ww2QtA
 817WXnaFYD5aI03XdffiROjbzqW4mg1/UhadyNtgZ4gqh8VcO9ZUvIKXC/2L4sAWqHog
 oo26KXCkMFAv6Y6yHhUnqX7znQV2xammhxoIxOF+v3dJfW8DD1rhkaFvIyf/HXUjnHMs
 7r94dVOYA5lwh6nYYitcdtrydxnND4QX5okR9a2cKHTmQUifpJMXDqg8DJ9TqPBewVfI
 zHlg==
X-Gm-Message-State: AOAM532XM+IfIYbj0zG5GGnhTBI8QsAu6FaqVtcGUcA63g3g3Mqq4Ej6
 sfvsWzCSqtfDHp9MDXs15h3XAYDsZR0vR88x2p/gCg==
X-Google-Smtp-Source: ABdhPJzW137+bxo/BCmaOoW3nCBMoRhmtQOnwHbg2dFkNZBf4NGOeG+OlNhTXXA6mrUdvAiuLoTMApI3sUxPNcHaTLc=
X-Received: by 2002:a05:6e02:1a26:b0:2bc:2e01:ae73 with SMTP id
 g6-20020a056e021a2600b002bc2e01ae73mr2263040ile.44.1645027754573; Wed, 16 Feb
 2022 08:09:14 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
 <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
 <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
 <CANp29Y4WMhsE_-VWvNbwq18+qvb1Qc-ES80h_j_G-N_hcAnRAw@mail.gmail.com>
 <CANp29Y4ujmz901aE9oiBDx9dYWHti4-Jw=6Ewtotm6ck6MN9FQ@mail.gmail.com>
 <CACT4Y+ZvStiHLYBOcPDoAJnk8hquXwm9BgjQTv=APwh7AvgEUQ@mail.gmail.com>
In-Reply-To: <CACT4Y+ZvStiHLYBOcPDoAJnk8hquXwm9BgjQTv=APwh7AvgEUQ@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 16 Feb 2022 17:09:03 +0100
Message-ID: <CANp29Y56Or0V1AG7rzBfV_ZTph2Crg4JKKHiuw1kcGFFxeWqiQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv@lists.infradead.org, kasan-dev <kasan-dev@googlegroups.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_080916_015470_8D30A361 
X-CRM114-Status: GOOD (  34.46  )
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

On Wed, Feb 16, 2022 at 12:56 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, 16 Feb 2022 at 12:47, Aleksandr Nogikh <nogikh@google.com> wrote:
> >
> > On Wed, Feb 16, 2022 at 11:37 AM Aleksandr Nogikh <nogikh@google.com> wrote:
> > >
> > > Hi Alex,
> > >
> > > On Wed, Feb 16, 2022 at 5:14 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > > >
> > > > Hi Dmitry,
> > > >
> > > > On 2/15/22 18:12, Dmitry Vyukov wrote:
> > > > > On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> > > > > <alexandre.ghiti@canonical.com> wrote:
> > > > >> Hi Aleksandr,
> > > > >>
> > > > >> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > > >>> Hello,
> > > > >>>
> > > > >>> syzbot has already not been able to fuzz its RISC-V instance for 97
> > > > >> That's a longtime, I'll take a look more regularly.
> > > > >>
> > > > >>> days now because the compiled kernel cannot boot. I bisected the issue
> > > > >>> to the following commit:
> > > > >>>
> > > > >>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> > > > >>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > > >>> Date:   Fri Oct 29 06:59:27 2021 +0200
> > > > >>>
> > > > >>>      riscv: Fix asan-stack clang build
> > > > >>>
> > > > >>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> > > > >>> enabled. In the previous message syzbot mentions
> > > > >>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> > > > >>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> > > > >>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> > > > >>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> > > > >>> For convenience, I also duplicate the .config file from the bot's
> > > > >>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > > > >>>
> > > > >>> Can someone with KASAN and RISC-V expertise please take a look?
> > > > >> I'll take a look at that today.
> > > > >>
> > > > >> Thanks for reporting the issue,
> > > > >
> > > >
> > > > I took a quick look, not enough to fix it but I know the issue comes
> > > > from the inline instrumentation, I have no problem with the outline
> > > > instrumentation. I need to find some cycles to work on this, my goal is
> > > > to fix this for 5.17.
> > >
> > > Thanks for the update!
> > >
> > > Can you please share the .config with which you tested the outline
> > > instrumentation?
> > > I updated the syzbot config to use KASAN_OUTLINE instead of KASAN_INLINE,
> > > but it still does not boot :(
> > >
> > > Here's what I used:
> > > https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
> >
> > Update: it doesn't boot with that big config, but boots if I generate
> > a simple one with KASAN_OUTLINE:
> >
> > make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> > ./scripts/config -e KASAN -e KASAN_OUTLINE
> > make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> >
> > And it indeed doesn't work if I use KASAN_INLINE.
>
> It may be an issue with code size. Full syzbot config + KASAN + KCOV
> produce hugely massive .text. It may be hitting some limitation in the
> bootloader/kernel bootstrap code.

I bisected the difference between the config we use on syzbot and the
simple one that was generated like I described above.
Turns out that it's the DEBUG_VIRTUAL config that makes the difference.

make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-

And the resulting kernel does not boot.
My env: the `riscv/fixes` branch, commit
6df2a016c0c8a3d0933ef33dd192ea6606b115e3, qemu 6.2.0.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
