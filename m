Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B435FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWg4ekUAEIESykI+SMD0OZYRSdhOs92U2GvcrihtyH0=; b=FH3N1sfLMffPm+
	1NuczAXGg/5Bh+tUeDK6wONlNx8P5D2lu0gwB/tiHgYQIxjWX0nz6ZzEVdELKCscWpywnVO6BZ5H4
	ootBBfLcC8fch4XjMMDcDa9vtdwpWvp0XzL1IA/ryo8/Yfj4fE+bAPLlI3z2ukdjFTrhxnGsVwcKf
	Sd16pzgFtISd1ZG8RUjlZqNZfx2Q51/LdqjK0qcLLA53rN8b5S+MqoS5Uf/bqIG9ixrxRly4rijBR
	G4tIWfoqzMZVqX8ZHntH+JEdyUXOGs5dPv774BMorOLyPml4CXlkC7+yk9SEa3BRopm3DkNLMPzS0
	RKTXk6C2d3T4s+NaoS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n01ew-00AWW9-AN; Wed, 22 Dec 2021 13:27:58 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n01Z0-00AU1I-9g
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 13:21:52 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MoeU5-1mg54s3B2f-00p3EI for <linux-riscv@lists.infradead.org>; Wed, 22 Dec
 2021 14:21:47 +0100
Received: by mail-wr1-f43.google.com with SMTP id a9so4875077wrr.8
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 05:21:47 -0800 (PST)
X-Gm-Message-State: AOAM531uihiL+pIlPfNCtUbgPLjqGJaYnPes3KNsqyH6fX7Mr0xMiE/o
 rXfVarecR8dGEad7xFCHSEm9z4C/eG6waFYaXVc=
X-Google-Smtp-Source: ABdhPJyZJ7IM3FfszIOXVrgOVxvS2jRO3t8J5UTThAJUFt3pUIkSGUxFgQ01Mn2RRPgx8pl2cn6vKm8xDVBrWZjoma4=
X-Received: by 2002:a5d:484f:: with SMTP id n15mr2096485wrs.219.1640179307179; 
 Wed, 22 Dec 2021 05:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-6-guoren@kernel.org>
 <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
 <CAJF2gTR2fAU=+0fvW_VCqaZfDkSTAxQ=cKE9iAYOoGORb3m+4g@mail.gmail.com>
In-Reply-To: <CAJF2gTR2fAU=+0fvW_VCqaZfDkSTAxQ=cKE9iAYOoGORb3m+4g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 14:21:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17A3MU_atWNEretDcr5sLRc7540tM4vfc=H4M8qVCDEg@mail.gmail.com>
Message-ID: <CAK8P3a17A3MU_atWNEretDcr5sLRc7540tM4vfc=H4M8qVCDEg@mail.gmail.com>
Subject: Re: [PATCH 05/13] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:vyJm/CfPOIPnR4NgwTCwiGlo8lRiCNCN2C5SieDqH1YL0eTgvC9
 ROYZTWu6WVjMHv9GzgUSNX1CWBI0iY0T2G8e2v5VMspUDgoI9Cp93KEl7ORRDWnnwgM7yTr
 ohe3GmgQYyAfacTsfr1NKRBtcnBzHS7NIfZKMrFaKtMeU9LDqXFHoaOzqNySnJ9MrnUr7q1
 5SHVLDeMP8nROuRDlql6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lsW+4X0ZOKg=:B7rX6G58BV+s4X8hNWFpwe
 8XnsmbM1UYPz7fTdf7kdxKCZXPDJn9BN/BvNl2KO6fgJK2XWhMpyHIz1vwYFUtv8SHcuBQ2sP
 ls+lckZ5XU8XhNuMaCXeu/KvyHgBagfW/ByE4XkGo68eAHAjPUFUXgh4TiNqgsascBVaz/Mp4
 InMLlVtSK614Sp7Csr2lNOgSaLi2VDKRsgkdnC90kf1uLmVRFhry7KhnwubXe6zD9xopcIcn/
 fCZvJS5F4ivOfwkSgbCWDzV0YBMKFNEWTCYrtcajC8n/Ra4b2HvYklN7gwQKan8iyU0TAnuJW
 4Qn/niZOOPtvyzUtQo5uJj5cCLKQRt8YHmaaM/cJixrmhfPdHmXMBLY+8+4cexiDincmS8RUa
 vcESClczj/5S8KRwNl35cH7/2Qn4SYqgP5sWEotivtsKi1KCuCHNoO3ARHKOozWjDWkJ2WVp2
 HkYnjfvgrEz+LS06GlNFH6ByC9/cK2MizIIVKIIMVa4R4Cz6j17Ld92x5ChF6iHrW7CTLEAA0
 YPzZ9597MU3SZXQxtXOaG2ELYXfHi+6AETs2VMkYo5KGeou9/84VBQEU8vl4LP8/jsB68Hxlh
 4ajDuHNuABTC63tGgq019iHrK72Uk5lku30GUYFw1Ph5ID8j0O70mDF8ZYpfCF94+PfdjAZ9b
 9OQ45F+ZQ/EUFbVgA56TJCsEzRFFemvlwLYV6Md4lF/f2qIyzJ3J52ZHQFvFDtrQiyslLWSkT
 Ujmb7tH85+xT5X9+t28rXyjgY8Z3tu/2q/ibUoJlCy6GEJ64lXzM7fJl9gxXFnORHgaGE/V7P
 6NDwfA6d2LaUtsJRCHVq3kKGSeiHMrww+8tdBT0CXytZJpIQXA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_052150_685974_19944B81 
X-CRM114-Status: GOOD (  29.65  )
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

On Wed, Dec 22, 2021 at 1:43 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Dec 22, 2021 at 2:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Implement compat_syscall_table.c with compat_sys_call_table & fixup
> > > system call such as truncate64,pread64,fallocate which need two
> > > regs to indicate 64bit-arg (copied from arm64).
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > ---
> > >  arch/riscv/include/asm/syscall.h         |  3 +
> > >  arch/riscv/kernel/compat_syscall_table.c | 84 ++++++++++++++++++++++++
> >
> > Same here, I think most of these should go next to the actual syscalls, with the
> > duplicates removed from other platforms,
> Agree, I will try that next version.
>
> >
> > > +#define __SYSCALL_COMPAT
> > > +#undef __LP64__
> >
> > What is the #undef for?
>
> See arch/riscv/include/uapi/asm/unistd.h:
>
> #ifdef __LP64__
> #define __ARCH_WANT_NEW_STAT
> #define __ARCH_WANT_SET_GET_RLIMIT
> #endif /* __LP64__ */

Ok, in this case I would recommend changing that #ifdef to
check for __SYSCALL_COMPAT instead, as removing the
__LP64__ define may cause other unintended changes.


> > > +SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
> > > +       unsigned long, prot, unsigned long, flags,
> > > +       unsigned long, fd, unsigned long, offset)
> > > +{
> > > +       if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
> > > +               if (unlikely(!(prot & PROT_READ)))
> > > +                       return -EINVAL;
> > > +
> > > +       return ksys_mmap_pgoff(addr, len, prot, flags, fd, offset);
> > > +}
> >
> > This is one that we may have to deal with separately, introducing
> > sys_mmap_pgoff() was a mistake in my opinion, and we should just have
>
> #if __BITS_PER_LONG == 32 || defined(__SYSCALL_COMPAT)
> #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _32)
> #else
> #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _64)
> #endif
>
> #define __NR3264_mmap 222
> __SC_3264(__NR3264_mmap, sys_mmap2, sys_mmap)
>
> > added a sys_mmap2() for all architectures that don't explicitly override it.
> That should be another patch, right? Let's keep it here.

Right, I think the patch would be a nice cleanup, but it appears that
riscv is among the few architectures that have defined their own
nonstandard mmap2() syscall after all, despite using the standard
name for the entry point. Not sure how this slipped past my original
review, but it certainly can't be changed now.

It also means that you need to change your implementation of
compat_sys_mmap2() to match the version from
arch/riscv/kernel/sys_riscv.c, rather than the version that
everyone else has. Maybe leave it there and change the
#ifdef to build mmap2 for both native rv32 and compat
mode.

FWIW, this is what a conversion from mmap_pgoff() to mmap2()
would look like, I think this is an overall win, but it's entirely
unrelated to your series now: https://pastebin.com/QtF55dn4
(I'm sure I got some details wrong, at least it needs some
#ifdef checks).

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
