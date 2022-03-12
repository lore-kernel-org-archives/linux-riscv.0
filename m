Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28624C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Mar 2022 02:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biWRVSftSqCRlSuGgXPWv2+muNunWDcW4x7tLjUvJP0=; b=ti7nO8b3DvpmdV
	BZhXYpjjT2la0C1o5Ullhsra+R77LO+q2g5b3qpsbek1hiUjZqnGYKLf31ZdsU6864XT/yjxXhD4E
	zarVWFo1H4QdqXXMn8LfReZ/kaKZacOvR4gkyL7UBPJvCOsIYu/Uc03QkI8DlX/CrIU6/ma9uKhB4
	julfTYMsONkF+27WABEzpZIamJ3oQm9dMp4Gs4jRRLCLbXz5+zVdbIX74smLZU4bpddib6HIv+YUK
	VOtuUL/aRvQ+dW6iQO4/nqiBylMp6LVevcDqfE8d1SZtXAF6wpt39CTb9C2iijZ4XW8rjwwevtf3Q
	knb98dTGBasI5yKiTK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSrGL-000Zdp-T6; Sat, 12 Mar 2022 02:13:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSrG9-000Zbe-Cv; Sat, 12 Mar 2022 02:13:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9517661724;
 Sat, 12 Mar 2022 02:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D687DC340F8;
 Sat, 12 Mar 2022 02:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647051209;
 bh=iRWRs787HfJQ4SmemjGupG5ATeZbj3chEC+s846rFUI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dzXW6D8a2fZcblys/QjCjL1M/69kjw27NQiwmxnI6v3Ty+JBSWuIwfIfHMmel2imr
 vGu03UC1vkaZOz0pVbvbaJ9VjatjyUMXrOjzw24dIgQIhPT2twm3Y7jpIEc+Sz1sZv
 xbefw+amYIJbHgLb9GrTrmKiMUF0Kh9g0oRa9QtveWDvFd6jsFRy9NIp4DXV0Ut1IQ
 qOhqK6ZRwENFgrFfhjtXN1OmpfCbVK48hQDU1kPXHAQlBTM9+QsrxqThgGkRXzKr2N
 vavIpsLAOCj0FM0mLCPoFRDvSj/f0Tjjlyok2eBV73W6cwj6H+ndb0VRdsWuF97g+/
 fjPsQcegOyixw==
Received: by mail-vs1-f47.google.com with SMTP id a186so11438332vsc.3;
 Fri, 11 Mar 2022 18:13:29 -0800 (PST)
X-Gm-Message-State: AOAM531+27IQwtuQJtdgGJW8YgKKLj0aatGYNyohLHJL3lukkgZu95+9
 x7oFrgAMpn6MPsvzZ7k2U3F4pjieZKdLSkDZrIQ=
X-Google-Smtp-Source: ABdhPJzCzz+Egly7/GI0fNYhw4sbiCEhUuQJ2YUO3cGoxYtVTwt+tqnmQKqPh36WSK6cQ0MJdLShbyuO/M99QnpoqW0=
X-Received: by 2002:a67:fc17:0:b0:320:b039:afc0 with SMTP id
 o23-20020a67fc17000000b00320b039afc0mr7125264vsq.2.1647051208526; Fri, 11 Mar
 2022 18:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
 <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
In-Reply-To: <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 12 Mar 2022 10:13:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
Message-ID: <CAJF2gTSkrm+Ek5i--TTikR2RDBUa6Eo72jwvszbj3uZg=Kxorg@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_181333_560633_EAA13718 
X-CRM114-Status: GOOD (  23.39  )
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

On Fri, Mar 11, 2022 at 9:38 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 11/03/2022 02:38, Guo Ren wrote:
> > Hi Arnd,
> >
> > On Mon, Feb 28, 2022 at 12:30 AM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> If the current task is in COMPAT mode, set SR_UXL_32 in status for
> >> returning userspace. We need CONFIG _COMPAT to prevent compiling
> >> errors with rv32 defconfig.
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Signed-off-by: Guo Ren <guoren@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> ---
> >>   arch/riscv/kernel/process.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> >> index 03ac3aa611f5..54787ca9806a 100644
> >> --- a/arch/riscv/kernel/process.c
> >> +++ b/arch/riscv/kernel/process.c
> >> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> >>          }
> >>          regs->epc = pc;
> >>          regs->sp = sp;
> >> +
> > FIxup:
> >
> > + #ifdef CONFIG_COMPAT
> >> +       if (is_compat_task())
> >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> >> +       else
> >> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> > + #endif
> >
> > We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> > set SR_UXL at all. SR_UXL is BIT[32, 33].
>
> would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
> than an #ifdef here?
I don't think, seems #ifdef CONFIG_COMPAT is more commonly used in arch/*

>
> >>   }
> >>
> >>   void flush_thread(void)
> >> --
> >> 2.25.1
> >>
> >
> >
>
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
