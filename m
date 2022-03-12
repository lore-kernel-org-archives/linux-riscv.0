Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CB0C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Mar 2022 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PpNnVsdI1ky5Kj0e32vMrP55taNQR8w1huADVqvVto=; b=LGmqtkVZYTe+Xh
	KttcDSS696CTuj+AsIj1e0Q3tsTwvodOa1tILa1fbAhSLEWQTl2M/gUHX0eZJGxpMMHCPgdj74wx5
	0IkOFwpRFFxwM4zbCsO1weKar+QdwsfpCMuKlUfX2tzi+NEcbGk+SwCFOR0RwuIGwr7hd/N/Zoe5H
	8c3kWE2dGhChH5oh8zhEX5fq5oSh2/qNN3qlrGKj81nfMe8RLavInsHv9xV7O1HDXmgdSvD9dQERo
	dnb0gKeBkFdFnyARLi7ONu3wdOkaewkAn3nzeYYmcdsOn/jQN0ChjsJka+R+FPqZxwWvpvkmUlg7v
	65XkvPlFyP47R7VbicIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSxF4-000xRr-Nn; Sat, 12 Mar 2022 08:36:50 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSxEr-000xOO-LO; Sat, 12 Mar 2022 08:36:39 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MUGNZ-1ncXdx3vVL-00RIb5; Sat, 12 Mar 2022 09:36:34 +0100
Received: by mail-wr1-f48.google.com with SMTP id j26so16273675wrb.1;
 Sat, 12 Mar 2022 00:36:34 -0800 (PST)
X-Gm-Message-State: AOAM533uoDuqpIDYps08SelzDy+mKnBVjK6slJ+AhZcWLbxU23RvG53y
 ZmmlncvR583Zlidjf22Ywo3d2nBff3MqhhQBGkg=
X-Google-Smtp-Source: ABdhPJwrBgijWcFmabOKnFeCHeAhHQBR3PR+3P0h6p5JQhHZX/5odIXHkxJDpCBUEOwN9ui3K5nWlIusCnBN24XocoE=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr7048966wrq.192.1647074194359; Sat, 12
 Mar 2022 00:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
 <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
 <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
In-Reply-To: <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 12 Mar 2022 09:36:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
Message-ID: <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Guo Ren <guoren@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:bSco+jHtNyV5wUMMhjoFpPRyLwxySTonD/UNizaYg/7cnzPOFMr
 avIM1YPICNPEPPowDRjxDu/LAZI9Su4pg1kg6ADDx8873L0e5sk4mng0xwXToxZYc4XDkSo
 Be2i7/2InnqpXhM9AG5quIUdM7xaf+g8ZYJGavC15LAMNkF3WPR2UjFmsM8Lo05GRa5xLHd
 dZQHB5kDvDCyz/3+ZGvAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m6qHh7c00j4=:WNyJvJBc/1hNIsGpOViHRl
 rayKiC/4Vk4CBRyo5VbQVvjOhOdd6B2Puz7MH4rGmMFg6AyLw++7SuO94a2L3YooxukV0nlNS
 7Ms1dk52oNYLY+FAFzc3y/fj5bNYTf3sDZcGeMu0FDgVlKFNoVRVPGFEGibCACHrvizxOPOeE
 b2cXpk9DlNIf482Y/2WKa5pIU9nEbm65CK8/t/CEn00LY+oYKRBjhmGpcC/JJ08QUaSvWpMII
 x4iGLAn9xGiHeDWQfY5zRlITqxP98dc2GpWlBX9GCbmXvAVMbdFCXA/k1XwIEINuSmnhruQQG
 qm37fdUOzA3rLe6pOyJU/i5WtMnhYpD7Ibse31cipBb1XnKaGS6UNe/qSj8/CRw6nagvWUWgz
 JOgXHXdIhLR6hFrPKJzOFVJ3l4kxfQe9DR4jBSsLDgsw74kwB+lMoEWk12e9tUX8zAa7ar/CX
 LfuJNQZZvMhYI/a/erG1xj3Ph8OM8ejGwqTt0ZqbsDHnhyHOWaNynC/Gsul1BXNvBxrY0d7O5
 j0mF7GNJu2toRf4xbBlU6ZgUqL8KJ20D2TPGDWLxCot/Y1pFws5bitGqZapQ17dxPmNG3Y+Dj
 FRH5RqiZ+DTX3Sib64IxF0wPsCHu9vOnC80Nhgg+de0Rz1rBKNKAkkZxaMp7ZM6jicqHVat1v
 PlFdK98M/FECtpAGK6jOAM4MLwoTCmpeFzjeX44eWLaMa41ScMVQafkwnf1qS956UFrO9n64N
 QomR1OVrBWwubJ0ruQ+jTBMKZmKNN9enw2AAAPUnDxG9zLtbS7vguPQXpo0kvYkz/19uLYzaG
 wvGGpWhYmmyDhlRKADj0z4IJx1/2AgkMhPcpAZAJfPhsDiuYi8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_003638_061980_55FE9719 
X-CRM114-Status: GOOD (  21.73  )
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

On Sat, Mar 12, 2022 at 3:13 AM Guo Ren <guoren@kernel.org> wrote:
> On Fri, Mar 11, 2022 at 9:38 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > On 11/03/2022 02:38, Guo Ren wrote:
> > >> --- a/arch/riscv/kernel/process.c
> > >> +++ b/arch/riscv/kernel/process.c
> > >> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> > >>          }
> > >>          regs->epc = pc;
> > >>          regs->sp = sp;
> > >> +
> > > FIxup:
> > >
> > > + #ifdef CONFIG_COMPAT
> > >> +       if (is_compat_task())
> > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> > >> +       else
> > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> > > + #endif
> > >
> > > We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> > > set SR_UXL at all. SR_UXL is BIT[32, 33].
> >
> > would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
> > than an #ifdef here?
>
> I don't think, seems #ifdef CONFIG_COMPAT is more commonly used in arch/*

We used to require an #ifdef check around is_compat_task(), so there are
a lot of stale #ifdefs that could be removed. In general, 'if (IS_ENABLED())'
is considered more readable than #ifdef inside of a function. In this case
there are a number of better ways to write the function if you want to get
into the details:

 - firstly, you should remove the #ifdef check around the definition of
   SR_UXL, otherwise the IS_ENABLED() check does not work.

 - you can use an 'if (!IS_ENABLED(CONFIG_COMPAT)) \\ return;' ahead of the
   assignment since that is at the end of  the function.

 - you can remove the bit masking since 'regs->status' is initialized above it,
   adding in only the one bit, shortening it to

    if (IS_ENABLED(CONFIG_COMPAT))
               regs->status |= is_compat_task()) ? SR_UXL_32 : SR_UXL_64;

 - to make this more logical, I would suggest always assigning the SR_UXL
   bits regardless of CONFIG_COMPAT, and instead make it something like

  if (IS_ENABLED(CONFIG_32BIT) || is_compat_task())
            regs->status = | SR_UXL_32;
  else
            regs->status = | SR_UXL_64;

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
