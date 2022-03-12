Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA823C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Mar 2022 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EufiwGoulGHBvuLVXDcfIP5QuU6tbljbwOq2sUZvr58=; b=KXbo5SKVz+Mv7J
	NZwgcFRqfj4yW43Eh8bYB5IRJn5pyRKXeiUUThg2V+bPvXMwTXbsZrVTbXeyKrEy3opm46reCBYoo
	nr+HlppOu676bj8nZyUfZ3hHalwbn9XZx2+XQRWsW8jW1XwUIpRhKHoLXYszXslEmEIY5am8MBLCa
	plp9vODhV2gMubzzsABirLZiaXzc3CYykl9G7Z28GJLtjd4/JreSiuMC6gGgAUNhkRwxOf/rNz+dX
	/bb74+gZBX3RJCEF5EsWJj9a65UUOTRE7gvfWqPovbe/zey+QjoWLEjFKv9o3FJGo55o7zE/YwjW1
	JWNI+LTE4+B8ZDNPSu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nT19b-001JK1-6T; Sat, 12 Mar 2022 12:47:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nT19O-001JHM-Pj; Sat, 12 Mar 2022 12:47:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 455C5B82462;
 Sat, 12 Mar 2022 12:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F99C340F7;
 Sat, 12 Mar 2022 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647089231;
 bh=H3gp8D41VexBopqf3rhNzKhC2EJfbt242g4EiN0GOBA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oIXPRgskEBIl/4YKNylq9hUIA5UdRaj2Cfsq1LhhJ8KvIzcDM6CBFNxlWDeaGuY35
 bGW8CWqr9CFb1yrZmUW4WEheUVlQL1e0BM92OZJ0gkrWdpgFsq/ot356LWvUVK6SDh
 rKAAp1jIbrYXQ34u+gMY5qiESiIyVuPlyhJ1i9G0ufaX5yT0igqjfMaQTha4GYteLQ
 hNA+TnIGBwo01yfgVojpx+oXl5cVB9tOmREpLHFBuPtvTnLL4l/1KCbWDDVD8vx3u9
 CSL7CCtt1MB5CJf2rjmWTENarFDZuTTkOwZI8X1Za3Rsgrumfw0ERINFfY+ZyUgwii
 qtYfRHCpWmJFQ==
Received: by mail-vs1-f53.google.com with SMTP id t124so605914vsb.7;
 Sat, 12 Mar 2022 04:47:11 -0800 (PST)
X-Gm-Message-State: AOAM530OSOh6PQu2u8gzN7xRJeacRK3kn6DWa63MDWjdAcDsTzCEe5Wn
 XovSSswzJ4pyehFwjqdvvDqi1JhGNSPahPe0FKo=
X-Google-Smtp-Source: ABdhPJy5ZidR6+hU7oi1y4oFAyxIqylb9Be+genvWRhNZ7iOORRW8nJemtq9UEHA7jF2pE6KBHQPZVnae3YTrPKV5FM=
X-Received: by 2002:a67:fc17:0:b0:320:b039:afc0 with SMTP id
 o23-20020a67fc17000000b00320b039afc0mr7728220vsq.2.1647089230100; Sat, 12 Mar
 2022 04:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
 <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
 <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
 <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0LqTdEk53XpUV4xRKoiJ_AvLkJSbMabqBgk7KNxF_XxQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Mar 2022 20:46:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT4qT5AXcmbg+twbJn4X6NvG0XLGVC6sZc8WasrwxA9FA@mail.gmail.com>
Message-ID: <CAJF2gTT4qT5AXcmbg+twbJn4X6NvG0XLGVC6sZc8WasrwxA9FA@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_044715_147923_FDD09518 
X-CRM114-Status: GOOD (  28.88  )
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

On Sat, Mar 12, 2022 at 4:36 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Mar 12, 2022 at 3:13 AM Guo Ren <guoren@kernel.org> wrote:
> > On Fri, Mar 11, 2022 at 9:38 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > > On 11/03/2022 02:38, Guo Ren wrote:
> > > >> --- a/arch/riscv/kernel/process.c
> > > >> +++ b/arch/riscv/kernel/process.c
> > > >> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> > > >>          }
> > > >>          regs->epc = pc;
> > > >>          regs->sp = sp;
> > > >> +
> > > > FIxup:
> > > >
> > > > + #ifdef CONFIG_COMPAT
> > > >> +       if (is_compat_task())
> > > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> > > >> +       else
> > > >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> > > > + #endif
> > > >
> > > > We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> > > > set SR_UXL at all. SR_UXL is BIT[32, 33].
> > >
> > > would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
> > > than an #ifdef here?
> >
> > I don't think, seems #ifdef CONFIG_COMPAT is more commonly used in arch/*
>
> We used to require an #ifdef check around is_compat_task(), so there are
> a lot of stale #ifdefs that could be removed. In general, 'if (IS_ENABLED())'
> is considered more readable than #ifdef inside of a function. In this case
> there are a number of better ways to write the function if you want to get
> into the details:
>
>  - firstly, you should remove the #ifdef check around the definition of
>    SR_UXL, otherwise the IS_ENABLED() check does not work.
>
>  - you can use an 'if (!IS_ENABLED(CONFIG_COMPAT)) \\ return;' ahead of the
>    assignment since that is at the end of  the function.
>
>  - you can remove the bit masking since 'regs->status' is initialized above it,
>    adding in only the one bit, shortening it to
>
>     if (IS_ENABLED(CONFIG_COMPAT))
>                regs->status |= is_compat_task()) ? SR_UXL_32 : SR_UXL_64;
>
>  - to make this more logical, I would suggest always assigning the SR_UXL
>    bits regardless of CONFIG_COMPAT, and instead make it something like
>
>   if (IS_ENABLED(CONFIG_32BIT) || is_compat_task())
>             regs->status = | SR_UXL_32;
>   else
>             regs->status = | SR_UXL_64;
When CONFIG_32BIT=y, regs->status is 32bit width but SR_UXL_32 is
34bit width. That's wrong in type. (Only CONFIG_64BIT has SR_UXL).

>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
