Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B99C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 05:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ztfrd/orK9T/mR1iAgH8YS/JHGWvwQyM/4HhmEIxjo=; b=dRsqc61Bj+x9BF
	x76+LSfOsgBB/Gq2oeRy1GmnvnM3avySEwbhll4LaVfizGopoAkYpaSo0XCpN1jPdondVHI0XgXwD
	Hkm2aSH/E9lRN19dq+sGxajn1J+AYiYM/qOwqfESFJCZosIfw4dDZWV1u3Y0dw3A9e81lb1it9HpU
	Aka/DaSoPY+9MBQxJLZhb8ZRhHmHOVSyjek8fI3Iy0tDP9tt6J+l4aS5WHzga38OMyHbOoRQmyk3E
	/xrTLqxh5mq5o7biEBq6wwwx97XSU7flfMnseKvVf9dG+1etHWl2q86oILRXBLGPRoaWz1YqxQdvG
	K8O7TjY5otMMFommzCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE3Ak-005xfQ-MY; Sun, 30 Jan 2022 05:54:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE3AY-005xd0-IQ; Sun, 30 Jan 2022 05:54:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB0D860FEE;
 Sun, 30 Jan 2022 05:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C967EC36AE2;
 Sun, 30 Jan 2022 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643522071;
 bh=KTwtRKH/OVKhaNoB2dpS+9CRT5rYtiTrBbRTY58frfI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KbqY9YcjYQ53gmY2dHmrpw7RqkS4V6dNNJjtLBbW8U4K47uqz0ecQoZbQwgfGmZma
 tRCWkNjivI6OGFruhAjydv25WQ48WPT8wiGKtc8VkkqRijcv4FkBddBEiA9bZ6UpWM
 I5RJVntAdZO8XAOSx+Hzslf2/jqxqMaVH/0ebTmNHQjz/YBFdn/6EIt7d+vxsPHNSZ
 ZaFIL+Fyvt5HOclTxwg6T2ZdaTD4y5Z172agNJmW87mhTO2d74ig4seQ3g/0cZwPaa
 1X8MVufLeenvPKvFey3paLO3ejlnzOfUnZP2orkztfEtq678+ZCjwp7m/wgaw/Qbsh
 4OleGJIuGH/Uw==
Received: by mail-vs1-f50.google.com with SMTP id x13so7992195vsl.10;
 Sat, 29 Jan 2022 21:54:31 -0800 (PST)
X-Gm-Message-State: AOAM531bamIRdimDIbE6i087p6kqqOBLLRvxuRi/Qv1E8V61w6mWMNMg
 9RMXrWS+ZPxTxIheQrZS1dZ/X7QqpDaR0neQqEU=
X-Google-Smtp-Source: ABdhPJw3SI5w6wpfoRZZErXNv34dgmNp5eduh3H4LQwaI7qbmi+2hfTO0XEH13fEEhf3iFH2jsVqfmVsSGc5OwjgZr4=
X-Received: by 2002:a67:e0d9:: with SMTP id m25mr5857135vsl.51.1643522070834; 
 Sat, 29 Jan 2022 21:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
 <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
In-Reply-To: <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 13:54:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
Message-ID: <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
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
X-CRM114-CacheID: sfid-20220129_215434_710937_26F91433 
X-CRM114-Status: GOOD (  17.26  )
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

On Sun, Jan 30, 2022 at 6:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > Implement compat sys_call_table and some system call functions:
> > truncate64, ftruncate64, fallocate, pread64, pwrite64,
> > sync_file_range, readahead, fadvise64_64 which need argument
> > translation.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> This all looks really good, but I would change one detail:
>
> > +#ifndef compat_arg_u64
> > +#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
> > +#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
> > +#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
> > +                                        ((u64)name##_lo & 0xffffffffUL))
> > +#endif
>
> I would make these endian-specific, and reverse them on big-endian
> architectures. That way it
> should be possible to share them across all compat architectures
> without needing the override
> option.
I hope it could be another patch. Because it's not clear to
_LITTLE_ENDIAN definition in archs.

eg: Names could be __ORDER_LITTLE_ENDIAN__ CPU_LITTLE_ENDIAN
SYS_SUPPORTS_LITTLE_ENDIAN __LITTLE_ENDIAN

riscv is little-endian, but no any LITTLE_ENDIAN definition.

So let's keep them in the patch, first, Thx

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
