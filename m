Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9AEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mzKxNqbrU/IgaZGLD+NHrtpC+9XPjLhiQ5uxRHDytQ=; b=3Eq0O4BDCT1p+S
	6PyZGIrDHl0pbfX4h0yNkdg2PksOmA6iBgr7V6bjCcWpFz4rqgyYncMKfTDi9u97aEkmtwSX1fUou
	lML1VcDjBIZM0NYxyhGTQPYVcf2pfohGm+e0bkYaC9rXye+/dnCpAnn1cp9FkBaXTTlJTc/rr4ylb
	rLrrW2p0Rw78pACzDxcXMssg0iGY4/o1SLNatED+BNFtk7L81nY9uq6nGpfDy6nCH4PCYYjApcT0b
	/47mzsCVqq0lYzeO0+dp9guMaI4hb9RnfRKxkpcxe/pQU+gW6S4/7uxFoDRLpBqa6NwDYg7xzeGhE
	Nm0UWEjhEO3VHZ6Iy4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIv0-006qK9-NC; Wed, 16 Feb 2022 11:56:22 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIuw-006qJ1-V3
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 11:56:20 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 a12-20020a05683012cc00b005acf7c91097so1338744otq.10
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 03:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhNx+q9flxByCxUrkRhgBlwV1E/I95+1uqa0YFgkq6g=;
 b=iT2AEWwx2kmQ/iEeYiUslVDYol+IJWHOCYAu/EndEGVOjCfpvlr0+SBUUSbi8FTybM
 ViaOLETa4pUXEQQKqZRHMBUEdJHHhYoHeZsbhXrrdxh6UPjfJUyqjINuilJFbR3+8+hd
 kV1wldLn71EV40AfChJgJykO8eqA0bD0K5q2aHvqQ1KFxyMz8sDtBDq4Fj63YMRrvGrz
 tCDIgChVCL+KleGxb4+j70F/J4XkfNF4Jq0WBS88H/chcvOCf988pr7hxkkmNknOydGB
 Q1WdtqRfSwb1teC1XM/RmGtWDnm9tu1SPlC13uBHMtvpFGwc3TjXBh4gdD8igcbC8SiN
 4CkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhNx+q9flxByCxUrkRhgBlwV1E/I95+1uqa0YFgkq6g=;
 b=doG8euY7H2KXBjY08hxGpzOY5mkh6Mtzk57tv3zYmFairk+aew7GhUsHr5WhPaQGI1
 KeLJjRvSWyyiDpgj2Xi4qsHSIv83JzavCRNaaHJxgN1n7xlQlVbSX14mrpP/RN4x5PxV
 JpXm+iKSah7Mbpjojd6yf7jo3ljjnCvXJT+4RAURHJHE1lh1My9OSCoNlFBYvVRHJuaR
 0TT8zbj0PB+7MCdPQ+okfV2CmkRoKfaR71qCj5vR1C5NLGqR6xk3iKDM8/5+sADbHUVU
 pNNYEHb5WlzV/MawnbewlSyG9CyQRFf9z25eiQbu5yii+ZsG9QLsVlMRAaXDzlD8xIK0
 sUvQ==
X-Gm-Message-State: AOAM530fpV8fZsT/YgJO/Hg8H4LQ2IC2ttLi7WSIl9HTQJE2pRlOkh0V
 NMNcurETf7CJdhNbgLk/fZITz64F7AiNN4dxl70QtA==
X-Google-Smtp-Source: ABdhPJyHxoWNJ8kHTb9HsShfXiM/sbl3u6sXG3pFrQ4s5tBqgytJ6UL3fDX+1Fxn0D9kShi/CTJGTdCVX8sBSaMocVg=
X-Received: by 2002:a9d:77c4:0:b0:5a3:326f:9236 with SMTP id
 w4-20020a9d77c4000000b005a3326f9236mr676453otl.196.1645012577018; Wed, 16 Feb
 2022 03:56:17 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
 <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
 <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
 <CANp29Y4WMhsE_-VWvNbwq18+qvb1Qc-ES80h_j_G-N_hcAnRAw@mail.gmail.com>
 <CANp29Y4ujmz901aE9oiBDx9dYWHti4-Jw=6Ewtotm6ck6MN9FQ@mail.gmail.com>
In-Reply-To: <CANp29Y4ujmz901aE9oiBDx9dYWHti4-Jw=6Ewtotm6ck6MN9FQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 16 Feb 2022 12:56:06 +0100
Message-ID: <CACT4Y+ZvStiHLYBOcPDoAJnk8hquXwm9BgjQTv=APwh7AvgEUQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv@lists.infradead.org, kasan-dev <kasan-dev@googlegroups.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_035619_022380_259C065F 
X-CRM114-Status: GOOD (  29.96  )
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

On Wed, 16 Feb 2022 at 12:47, Aleksandr Nogikh <nogikh@google.com> wrote:
>
> On Wed, Feb 16, 2022 at 11:37 AM Aleksandr Nogikh <nogikh@google.com> wrote:
> >
> > Hi Alex,
> >
> > On Wed, Feb 16, 2022 at 5:14 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > On 2/15/22 18:12, Dmitry Vyukov wrote:
> > > > On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> > > > <alexandre.ghiti@canonical.com> wrote:
> > > >> Hi Aleksandr,
> > > >>
> > > >> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > > >>> Hello,
> > > >>>
> > > >>> syzbot has already not been able to fuzz its RISC-V instance for 97
> > > >> That's a longtime, I'll take a look more regularly.
> > > >>
> > > >>> days now because the compiled kernel cannot boot. I bisected the issue
> > > >>> to the following commit:
> > > >>>
> > > >>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> > > >>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > >>> Date:   Fri Oct 29 06:59:27 2021 +0200
> > > >>>
> > > >>>      riscv: Fix asan-stack clang build
> > > >>>
> > > >>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> > > >>> enabled. In the previous message syzbot mentions
> > > >>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> > > >>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> > > >>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> > > >>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> > > >>> For convenience, I also duplicate the .config file from the bot's
> > > >>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > > >>>
> > > >>> Can someone with KASAN and RISC-V expertise please take a look?
> > > >> I'll take a look at that today.
> > > >>
> > > >> Thanks for reporting the issue,
> > > >
> > >
> > > I took a quick look, not enough to fix it but I know the issue comes
> > > from the inline instrumentation, I have no problem with the outline
> > > instrumentation. I need to find some cycles to work on this, my goal is
> > > to fix this for 5.17.
> >
> > Thanks for the update!
> >
> > Can you please share the .config with which you tested the outline
> > instrumentation?
> > I updated the syzbot config to use KASAN_OUTLINE instead of KASAN_INLINE,
> > but it still does not boot :(
> >
> > Here's what I used:
> > https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
>
> Update: it doesn't boot with that big config, but boots if I generate
> a simple one with KASAN_OUTLINE:
>
> make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
> ./scripts/config -e KASAN -e KASAN_OUTLINE
> make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
>
> And it indeed doesn't work if I use KASAN_INLINE.

It may be an issue with code size. Full syzbot config + KASAN + KCOV
produce hugely massive .text. It may be hitting some limitation in the
bootloader/kernel bootstrap code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
