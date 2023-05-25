Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D2C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htgbZ/uZsckcyyN70I6tbT+5FfXnsRC/MueJY+Rfunw=; b=W3np/hG4WyNr51
	dBJpBYW4Tt1fJhaEiBpXZKLpBGdmuyG+C05YFtixN2FRwd7GfvhbDwP9PA/RjR8Drq2N332t9/jG3
	GhbkY2T2kWQFwG+OiDO8tfGOKDT/ddlWLj0nVpGfe4mVnqNin3svYeXjwhDryGJbMp9a2+uCMoDoW
	dKS5toE31NYFAwOt1UvWnGEFircccS6zi/ETAFEZw1TJE9Z6xSoaItj0fdaZtdM4gNFnAwsXbK23O
	W24/7/qpAMTgEBbaN48lOrCkhjWtlR8ks3ofK0qgH/6mZvwosBCjlbEkohn1CmFAsuWTMiSlx2Mfs
	Sryd3SrNsFzUEoMn6KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q257Z-00FlFI-2F;
	Thu, 25 May 2023 07:10:49 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q257W-00FlCj-1x
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 07:10:48 +0000
X-QQ-mid: bizesmtp66t1684998623tlsn9f2l
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 15:10:22 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: CR3LFp2JE4kc3pygKDDUtJn39vE4Fmng3uwhG01MZ6x96u4i0xrEu8jidY6KF
	5LIn2dky9FChTAvw70bQd9V3YXqgsFXT9XOcCHlIUtq/BlhasJ5GDPxSOVybTX2GzL2SdTF
	Cy9+lJVOpqy2BqRKTsa/7hvTm+6tLB3DQsVE8gfL77TWmpV1LIFxnTct1mL2DFCgrmbj44u
	yvlo+Ru0JKK/txynsYD2yYLA/lPIuJ4o3pwL3apINnuVVXdnlcZQBxrlMavqHxpGPQnYd1o
	6pJ5c1eWvkUz6nPe1TRye4KJwMooBdw5zaKOuotp5LAcSVmcXevPRP0Y6q/veUNqJiCB63L
	caopRqfllIHHckm32A7Flqkwmt6aAbtHH68/+KQGqx9l95K/3eiVKStGIcsXb/tdFusUokR
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15606333847527544035
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	w@1wt.eu
Subject: Re: [PATCH 11/13] tools/nolibc: sys_select: riscv: use __NR_pselect6_time64 for rv32
Date: Thu, 25 May 2023 15:10:21 +0800
Message-Id: <20230525071021.77223-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <83339ea6-6653-41fe-af75-e0d51a4fa920@t-8ch.de>
References: <83339ea6-6653-41fe-af75-e0d51a4fa920@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_001046_945931_32BEDC70 
X-CRM114-Status: GOOD (  19.95  )
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

Hi, Thomas

> On 2023-05-25 01:59:55+0800, Zhangjin Wu wrote:
> > rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
> > __NR_pselect6 after kernel commit d4c08b9776b3 ("riscv: Use latest
> > system call ABI"), use __NR_pselect6_time64 instead.
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index c0335a84f880..00c7197dcd50 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
> >  		struct timeval *t;
> >  	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
> >  	return my_syscall1(__NR_select, &arg);
> > -#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
> > +#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || defined(__NR_pselect6_time64))
> > +#ifdef __NR_pselect6
> >  	struct timespec t;
> > +#else
> > +	struct timespec64 t;
> > +#define __NR_pselect6 __NR_pselect6_time64
> 
> Wouldn't this #define leak to the users of nolibc and lead to calls to
> pselect6_time64 with the ABI of the __NR_pselect6 if userspace is doing
> its own raw syscalls?
>

Yeah, it would break the user-side raw __NR_pselect6 syscall for nolibc is a
header-only libc, so, it is not safe to use such method like glibc.

Something like this will let the syscall call to pselect6_time64 instead of the
user-required __NR_pselect6 and pass the wrong type of argument.

    #include "nolibc.h"  // If no __NR_pselect6 defined, __NR_pselect6 = __NR_pselect6_time64

    #ifdef __NR_pselect6
        struct timespec t;  // come here for __NR_pselect6_time64, but t is not timespec64, broken
        syscall(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
    #else
        struct timespec64 t;
        syscall(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
    #endif

I have used something like __NR_pselect6_time3264 locally, before
sending the patchset, I found a cleaner method already used in sys.h:

    #ifndef __NR__newselect
    #define __NR__newselect __NR_select
    #endif

But I forgot the arguments mixing issue, __NR__newselect and __NR_select
share the same type of arguments, but __NR_pselect6 and
__NR_pselect6_time64 not, so, I will use back the old method but still
need to find a better string, just like __NR__newselect, __NR__pselect6
may be used in kernel space in the future, and __NR_pselect6_time3264 is
too long, what about this?

    #ifdef __NR_pselect6
            struct timespec t;
    #define __NR_pselect6__ __NR_pselect6
    #else
            struct timespec64 t;
    #define __NR_pselect6__ __NR_pselect6_time64
    #endif

Or even ___NR_pselect6?

The same issue is in this patch:

    [PATCH 13/13] tools/nolibc: sys_gettimeofday: riscv: use __NR_clock_gettime64

will solve it with the same method.

Thanks,
Zhangjin

> 
> > +#endif
> >  
> >  	if (timeout) {
> >  		t.tv_sec  = timeout->tv_sec;
> > -- 
> > 2.25.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
