Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61012C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBjeTv59y38BMrdB56MuVoxCvdtQUCGKMl4EYp1zOO8=; b=2Kp1fajWCGXRM6
	USsbCGK0cdcnEYJugtCeJBoDiT7XvVkecZ54pk39H4rT2X59BnNPRtZp10elCqWSfkEnoD9BarQ4A
	Pjd3z7bJ2p+Q9+LWACupWlMeQno1ZcorXSQB5bMwuFLlZK2wSK8gYfJPQzvcg975WmSOlPdTzzJVE
	vYfzsYf1OPVMN2GLWMwbE0BUpeOQ/yZjfIZa7Zc+LZ4GqSny4QQ6Hyy/PT8UBtUfCpJpMMYhw2WG5
	8DhU8xCObDT+Yi3Hv9LcpihuL3149DnQux2EZu22ZRI43mpt2OdshtN7oG1c6uLlioWQSSC7MoqKK
	r/FXJ26jKzb2AtdF3szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Mbb-000g3v-0A;
	Fri, 26 May 2023 01:50:59 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2MbX-000g1q-1C
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 01:50:57 +0000
X-QQ-mid: bizesmtp78t1685065838tfibdc44
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 May 2023 09:50:37 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: eSZ1CZgv+JCfU+Q/Ek/ByeU4a4AcvGPfBDxLuzVFFnBqpvoCh57Xxdo1gHof2
	DKr4mZ4kV32WaG5tW5yVOn0mzE2srmKCy20Wly4IDPnhzsNIFzH8Ag5oMY2wbxji9SEJrIc
	xvZ1OFXmdBbzmpsBzEhyTlrbTbAbTKbbKsQJuXoqqjwGsiKWOwV54KwCJ+GwOmWBSWxIqvX
	TdyIfspVyKxfH/7TPKd/GL+n2HqFsSJ0wVBV5B+mE2RgJg6H5I9Qfk4fbp4GZNJDwC5iSGb
	401ADIKHmUHRf0C55yg65WZ3Qde3Eqh2HXjK0SQixho7yC3iCwEd6oL4fZI1Maez5Dq55Ca
	21pxKHG+TjqEZX04sB4RVmaRnlK+A==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17809865514302005706
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH 11/13] tools/nolibc: sys_select: riscv: use __NR_pselect6_time64 for rv32
Date: Fri, 26 May 2023 09:50:37 +0800
Message-Id: <20230526015037.6455-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <76a5f9a0-eec4-415a-9c5d-ac3bca4d4b0e@t-8ch.de>
References: <76a5f9a0-eec4-415a-9c5d-ac3bca4d4b0e@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_185055_725619_E230DB2D 
X-CRM114-Status: GOOD (  29.19  )
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

> On 2023-05-25 15:10:21+0800, Zhangjin Wu wrote:
> > Hi, Thomas
> > 
> > > On 2023-05-25 01:59:55+0800, Zhangjin Wu wrote:
> > > > rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
> > > > __NR_pselect6 after kernel commit d4c08b9776b3 ("riscv: Use latest
> > > > system call ABI"), use __NR_pselect6_time64 instead.
> > > > 
> > > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > > ---
> > > >  tools/include/nolibc/sys.h | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > > > index c0335a84f880..00c7197dcd50 100644
> > > > --- a/tools/include/nolibc/sys.h
> > > > +++ b/tools/include/nolibc/sys.h
> > > > @@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
> > > >  		struct timeval *t;
> > > >  	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
> > > >  	return my_syscall1(__NR_select, &arg);
> > > > -#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
> > > > +#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || defined(__NR_pselect6_time64))
> > > > +#ifdef __NR_pselect6
> > > >  	struct timespec t;
> > > > +#else
> > > > +	struct timespec64 t;
> > > > +#define __NR_pselect6 __NR_pselect6_time64
> > > 
> > > Wouldn't this #define leak to the users of nolibc and lead to calls to
> > > pselect6_time64 with the ABI of the __NR_pselect6 if userspace is doing
> > > its own raw syscalls?
> > >
> > 
> > Yeah, it would break the user-side raw __NR_pselect6 syscall for nolibc is a
> > header-only libc, so, it is not safe to use such method like glibc.
> > 
> > Something like this will let the syscall call to pselect6_time64 instead of the
> > user-required __NR_pselect6 and pass the wrong type of argument.
> > 
> >     #include "nolibc.h"  // If no __NR_pselect6 defined, __NR_pselect6 = __NR_pselect6_time64
> > 
> >     #ifdef __NR_pselect6
> >         struct timespec t;  // come here for __NR_pselect6_time64, but t is not timespec64, broken
> >         syscall(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
> >     #else
> >         struct timespec64 t;
> >         syscall(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
> >     #endif
> > 
> > I have used something like __NR_pselect6_time3264 locally, before
> > sending the patchset, I found a cleaner method already used in sys.h:
> > 
> >     #ifndef __NR__newselect
> >     #define __NR__newselect __NR_select
> >     #endif
> > 
> > But I forgot the arguments mixing issue, __NR__newselect and __NR_select
> > share the same type of arguments, but __NR_pselect6 and
> > __NR_pselect6_time64 not, so, I will use back the old method but still
> > need to find a better string, just like __NR__newselect, __NR__pselect6
> > may be used in kernel space in the future, and __NR_pselect6_time3264 is
> > too long, what about this?
> > 
> >     #ifdef __NR_pselect6
> >             struct timespec t;
> >     #define __NR_pselect6__ __NR_pselect6
> >     #else
> >             struct timespec64 t;
> >     #define __NR_pselect6__ __NR_pselect6_time64
> >     #endif
> > 
> > Or even ___NR_pselect6?
> 
> What about:
> 
> #ifdef __NR_pselect6
>         struct timespec t;
>         const long nr_pselect = __NR_pselect6;
> #else
>         struct timespec64 t;
>         const long nr_pselect = __NR_pselect6_time64;
> #endif
>

It looks better and cleaner, will apply this method, thanks!

> > 
> > The same issue is in this patch:
> > 
> >     [PATCH 13/13] tools/nolibc: sys_gettimeofday: riscv: use __NR_clock_gettime64
> > 
> > will solve it with the same method.
>

And also this one:

    [PATCH 09/13] tools/nolibc: sys_poll: riscv: use __NR_ppoll_time64

Have tested all of them, will send a v2 later.

Best regards,
Zhangjin

> Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
