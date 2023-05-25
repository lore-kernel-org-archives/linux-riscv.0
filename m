Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFADC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uAMgO7TmFN/bAfsbSc9y+7UtJKgeirGNvOm2mGfDT0=; b=HBXkUSfPY+0wgC
	zayzFY/eNGIzMddfnK8Gv8p3vt8SB0kFz4wNkJnP0vwYQtEwfyalvX5swCGN7CVgFCzZxzHuV42YP
	eh0dLHFlCJCQTXrX6wpQIrml5qFWK5c+jAD7b7bEno/wt+Q0wj0aqYmrEX6tTLxUBno3HD37JKFjJ
	kkR/bj9s+ExD9FgFSSLgHaEotRkrLoTG8owE2ca78bG+p1WkXvL2VaJJQjrQjyhaThZzjLIPV42pF
	cblx+StzanpARsYNvYvsI3X+PC1ig/t0BCr7Fqx9ulbDIsnwRwHQAuEOfp0y6Nmf8wx5c89itTS5h
	uqSW8LFi3yxjQKrjCBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25Og-00Fndy-3D;
	Thu, 25 May 2023 07:28:31 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25Od-00FndO-2c
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 07:28:29 +0000
Date: Thu, 25 May 2023 09:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684999344; bh=WqUc/D7b6J+dZZ3k3J04dIED1dcPikypQw79086aY+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4qui0d6SFgquCtdZyX+rdW4NmFRU+MwSYXoz+NIOgAxuOFHJkA+W16BNaGXrAxwi
	 d0tM4EyEQIRvkweDgiY07CEo3ZiJ5+1TnmhDDmOUYoqcsDtOdLbibs2POpPS07pecY
	 KPcXGq5T2pYQ6SKBHWVTX7h02Mhr5OLA1nQx/nO4=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, w@1wt.eu
Subject: Re: [PATCH 11/13] tools/nolibc: sys_select: riscv: use
 __NR_pselect6_time64 for rv32
Message-ID: <76a5f9a0-eec4-415a-9c5d-ac3bca4d4b0e@t-8ch.de>
References: <83339ea6-6653-41fe-af75-e0d51a4fa920@t-8ch.de>
 <20230525071021.77223-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525071021.77223-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_002828_000227_03091A08 
X-CRM114-Status: GOOD (  25.63  )
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

On 2023-05-25 15:10:21+0800, Zhangjin Wu wrote:
> Hi, Thomas
> 
> > On 2023-05-25 01:59:55+0800, Zhangjin Wu wrote:
> > > rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
> > > __NR_pselect6 after kernel commit d4c08b9776b3 ("riscv: Use latest
> > > system call ABI"), use __NR_pselect6_time64 instead.
> > > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  tools/include/nolibc/sys.h | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > > index c0335a84f880..00c7197dcd50 100644
> > > --- a/tools/include/nolibc/sys.h
> > > +++ b/tools/include/nolibc/sys.h
> > > @@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
> > >  		struct timeval *t;
> > >  	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
> > >  	return my_syscall1(__NR_select, &arg);
> > > -#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
> > > +#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || defined(__NR_pselect6_time64))
> > > +#ifdef __NR_pselect6
> > >  	struct timespec t;
> > > +#else
> > > +	struct timespec64 t;
> > > +#define __NR_pselect6 __NR_pselect6_time64
> > 
> > Wouldn't this #define leak to the users of nolibc and lead to calls to
> > pselect6_time64 with the ABI of the __NR_pselect6 if userspace is doing
> > its own raw syscalls?
> >
> 
> Yeah, it would break the user-side raw __NR_pselect6 syscall for nolibc is a
> header-only libc, so, it is not safe to use such method like glibc.
> 
> Something like this will let the syscall call to pselect6_time64 instead of the
> user-required __NR_pselect6 and pass the wrong type of argument.
> 
>     #include "nolibc.h"  // If no __NR_pselect6 defined, __NR_pselect6 = __NR_pselect6_time64
> 
>     #ifdef __NR_pselect6
>         struct timespec t;  // come here for __NR_pselect6_time64, but t is not timespec64, broken
>         syscall(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
>     #else
>         struct timespec64 t;
>         syscall(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
>     #endif
> 
> I have used something like __NR_pselect6_time3264 locally, before
> sending the patchset, I found a cleaner method already used in sys.h:
> 
>     #ifndef __NR__newselect
>     #define __NR__newselect __NR_select
>     #endif
> 
> But I forgot the arguments mixing issue, __NR__newselect and __NR_select
> share the same type of arguments, but __NR_pselect6 and
> __NR_pselect6_time64 not, so, I will use back the old method but still
> need to find a better string, just like __NR__newselect, __NR__pselect6
> may be used in kernel space in the future, and __NR_pselect6_time3264 is
> too long, what about this?
> 
>     #ifdef __NR_pselect6
>             struct timespec t;
>     #define __NR_pselect6__ __NR_pselect6
>     #else
>             struct timespec64 t;
>     #define __NR_pselect6__ __NR_pselect6_time64
>     #endif
> 
> Or even ___NR_pselect6?

What about:

#ifdef __NR_pselect6
        struct timespec t;
        const long nr_pselect = __NR_pselect6;
#else
        struct timespec64 t;
        const long nr_pselect = __NR_pselect6_time64;
#endif

> 
> The same issue is in this patch:
> 
>     [PATCH 13/13] tools/nolibc: sys_gettimeofday: riscv: use __NR_clock_gettime64
> 
> will solve it with the same method.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
