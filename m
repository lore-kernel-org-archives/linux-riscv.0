Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEBAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL264MybyjsTMiDglt7uuAhWvDLBwxh4vrmyjyJb3N0=; b=0VgincjS/Myc+y
	48joX7gcs1Owg4pCpL0DvfV2TrbGgnTeVKPxIwQ7jR/VX3Ytxdtva7hHhf3deARqb7c8LH/aRFdG1
	DbPkJzEt7eh2ahnCmb9Ut5gsZa80qpDNl3uaa+ZDFUUCzrFFhL1Y2YRXhju9yjrIiTCJ3qcHCAG16
	b+cO0E96xdMR6WEApAo3hz7QqGUS82HCFD3XGlBGBA3oJqE9r8UMr9HUePgDN6rzxSi0NH3vLGGUW
	lE+N/Z5y9sBGKXQsxDRGr/a+aITBUDanijEnLzI8dUfYarXhvc8R4vsHfIHpjO4kgCg6ye1ToI3OL
	M8q2bZX/tg2oUprUHwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n00y3-00AJBf-UJ; Wed, 22 Dec 2021 12:43:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n00y0-00AJBK-OI
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 12:43:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F92A61A04
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA530C36AEE
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640177015;
 bh=spRwUCGiSSG8n6qeVEE9aN2Iq6VFzAj957YT2tK8Kqs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XOAUZhCycs8P/F/IgB41mY0S24xJyBhBueU6B2STDwK6SWiYp9SFmsTMDZUwf0WlS
 XuGelJ1kDkiPKATKBgPNXcBwUcC0Qi2ZaErDTa1EcLQgSantLXY0oWuTcUXnERnHqG
 PHwPJE3Gc9PccipxJLHsMflbauYYRzS+hjqeLI3jxpvkAkIYc2d2igdTSXOJYTHrxL
 p5IIoIGZLKlbmMVRcBfrRy/YmlQTsYG666UvZpVq7zLs9GoEWvtnRVdSvgoERT9zus
 nnfJvRLhGTzkiPreYUb/purRFnEOQilR8tA4kyBTlksVtapPJgMg637B6GGV6+ZfuX
 nkamUJNP2aBKA==
Received: by mail-vk1-f179.google.com with SMTP id o2so1261811vkn.0
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 04:43:35 -0800 (PST)
X-Gm-Message-State: AOAM533czn9lOHTxLXsPw2G5S5VKjMVQsjB99xSTIKG8CBZy1GvxdmWk
 ky7eMGbkZCcKKQB/hFT80gQ7bh7BP6qF80B/87Y=
X-Google-Smtp-Source: ABdhPJzC3viZd1a1jd6xOFjIMdxvyj8zxpI+z9Ie7iUhyHVWlvCpwXNy8RLLG5OJvKtf/gKMdK2si6m9Ls6Z9GIn+oY=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr846875vke.35.1640177006825; 
 Wed, 22 Dec 2021 04:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-6-guoren@kernel.org>
 <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 20:43:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2fAU=+0fvW_VCqaZfDkSTAxQ=cKE9iAYOoGORb3m+4g@mail.gmail.com>
Message-ID: <CAJF2gTR2fAU=+0fvW_VCqaZfDkSTAxQ=cKE9iAYOoGORb3m+4g@mail.gmail.com>
Subject: Re: [PATCH 05/13] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_044336_916490_78922E7D 
X-CRM114-Status: GOOD (  21.41  )
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

On Wed, Dec 22, 2021 at 2:15 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement compat_syscall_table.c with compat_sys_call_table & fixup
> > system call such as truncate64,pread64,fallocate which need two
> > regs to indicate 64bit-arg (copied from arm64).
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  arch/riscv/include/asm/syscall.h         |  3 +
> >  arch/riscv/kernel/compat_syscall_table.c | 84 ++++++++++++++++++++++++
>
> Same here, I think most of these should go next to the actual syscalls, with the
> duplicates removed from other platforms,
Agree, I will try that next version.

>
> > +#define __SYSCALL_COMPAT
> > +#undef __LP64__
>
> What is the #undef for?

See arch/riscv/include/uapi/asm/unistd.h:

#ifdef __LP64__
#define __ARCH_WANT_NEW_STAT
#define __ARCH_WANT_SET_GET_RLIMIT
#endif /* __LP64__ */


>
> > +SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
> > +       unsigned long, prot, unsigned long, flags,
> > +       unsigned long, fd, unsigned long, offset)
> > +{
> > +       if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
> > +               if (unlikely(!(prot & PROT_READ)))
> > +                       return -EINVAL;
> > +
> > +       return ksys_mmap_pgoff(addr, len, prot, flags, fd, offset);
> > +}
>
> This is one that we may have to deal with separately, introducing
> sys_mmap_pgoff() was a mistake in my opinion, and we should just have
#if __BITS_PER_LONG == 32 || defined(__SYSCALL_COMPAT)
#define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _32)
#else
#define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _64)
#endif

#define __NR3264_mmap 222
__SC_3264(__NR3264_mmap, sys_mmap2, sys_mmap)

> added a sys_mmap2() for all architectures that don't explicitly override it.
That should be another patch, right? Let's keep it here.

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
