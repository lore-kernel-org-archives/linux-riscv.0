Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95770C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AKB9ttqBqkoohJsTCW2WmaGbXGTSp+MOmApIYWUI+Q=; b=czz8PptoBgeu8Y
	IMduIUV6kFjVRH3/rcRu9Pdtt0xQwkoDbfCc1+9fEnE/3Mza1i5gny99rXFvvPxVgoxtYVaDwz14D
	932hb32EPyTSx81btAVM62yuKJ3c2bxFR3P/ZBANTSNjd458K9bXPuzoKFOw9eoI1L13FLFCn/ux2
	AwUDcCldbsDnix+sTfRtB4i+hz9vwWJ9mv9g00NnDYGkGVIxiGq/CiH7VFq662aaTvTHKPBZHHYOU
	hlDQfDN2aj0FujmsU9aV/xuGr5zB9UHGH55v6E5HETsu3Q6wAByzcoxHFMol//X6IgvESkTofoThy
	P8Ykl7baPOrbIXRP+8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ihz-004Xo0-2f;
	Sat, 27 May 2023 01:27:03 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ihv-004Xl0-1L
	for linux-riscv@lists.infradead.org;
	Sat, 27 May 2023 01:27:01 +0000
X-QQ-mid: bizesmtp72t1685150796tdnayj8x
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 May 2023 09:26:35 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 9OErQKpad8Ah4wDP7YPNO7QIfLzqVaIj39oiToOIFCl/lX+DycsdTBM8Ex7Kk
	eJ59fku2p51B8hYhutt6eR8eIcIn0t+/tXE/IvPC80t9G9yoORp08hlnV9Qzj2Uu4HldiP8
	ZBM/pinCiUcNrMWLLmZsKocoT1aPXrV0Ci0EjY06fLmeAlibElW1l5QQd8RAvkdWHP1meri
	uXol+yQlqbsEO0vtzIEGb8492pfRgMOKBSfFCV0k5agdp33uqmUzpjJFwemyHMQHmot6yoE
	WOXqa2Wb04JuXJuyzORamvdmzBuGEZsXaciS4LgUaFnINwv2smGSYwy8fmnbET8pul21Hg5
	6OnM9QCJvKHpOgscvptubCTZGoV710+50hGGEVB5OdlqDmGT+hFkOhfgXfAZg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8717417676330824894
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH 13/13] tools/nolibc: sys_gettimeofday: riscv: use __NR_clock_gettime64 for rv32
Date: Sat, 27 May 2023 09:26:35 +0800
Message-Id: <20230527012635.19595-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <29e4b23d-27cb-4101-bfe9-c6b412222578@t-8ch.de>
References: <29e4b23d-27cb-4101-bfe9-c6b412222578@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_182659_780658_E2FDF575 
X-CRM114-Status: GOOD (  36.35  )
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

Hi, Thomas, Willy

> On 2023-05-25 02:03:32+0800, Zhangjin Wu wrote:
> > rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
> > __NR_gettimeofday and __NR_clock_gettime after kernel commit d4c08b9776b3
> > ("riscv: Use latest system call ABI"), use __NR_clock_gettime64 instead.
> > 
> > This code is based on src/time/gettimeofday.c of musl and
> > sysdeps/unix/sysv/linux/clock_gettime.c of glibc.
> > 
> > Both __NR_clock_gettime and __NR_clock_gettime64 are added for
> > sys_gettimeofday() for they share most of the code.
> > 
> > Notes:
> > 
> > * Both tv and tz are not directly passed to kernel clock_gettime*
> >   syscalls, so, it isn't able to check the pointer automatically with the
> >   get_user/put_user helpers just like kernel gettimeofday syscall does.
> >   instead, we emulate (but not completely) such checks in our new
> >   __NR_clock_gettime* branch of nolibc.
> > 
> > * kernel clock_gettime* syscalls can not get tz info, just like musl and
> >   glibc do, we set tz to zero to avoid a random number.
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h | 46 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index 2642b380c6aa..ad38cc3856be 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -26,6 +26,7 @@
> >  
> >  #include "arch.h"
> >  #include "errno.h"
> > +#include "string.h"
> >  #include "types.h"
> >  
> >  
> > @@ -51,6 +52,11 @@
> >   * should not be placed here.
> >   */
> >  
> > +/*
> > + * This is the first address past the end of the text segment (the program code).
> > + */
> > +
> > +extern char etext;
> >  
> >  /*
> >   * int brk(void *addr);
> > @@ -554,7 +560,47 @@ long getpagesize(void)
> >  static __attribute__((unused))
> >  int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
> >  {
> > +#ifdef __NR_gettimeofday
> >  	return my_syscall2(__NR_gettimeofday, tv, tz);
> > +#elif defined(__NR_clock_gettime) || defined(__NR_clock_gettime64)
> > +#ifdef __NR_clock_gettime
> > +	struct timespec ts;
> > +#else
> > +	struct timespec64 ts;
> > +#define __NR_clock_gettime __NR_clock_gettime64
> > +#endif
> > +	int ret;
> > +
> > +	/* make sure tv pointer is at least after code segment */
> > +	if (tv != NULL && (char *)tv <= &etext)
> > +		return -EFAULT;
> 
> To me the weird etext comparisions don't seem to be worth it, to be
> honest.
>

This is the issue we explained in commit message:

    * Both tv and tz are not directly passed to kernel clock_gettime*
      syscalls, so, it isn't able to check the pointer automatically with the
      get_user/put_user helpers just like kernel gettimeofday syscall does.
      instead, we emulate (but not completely) such checks in our new
      __NR_clock_gettime* branch of nolibc.

but not that deeply described the direct cause, the direct cause is that the
test case passes a '(void *)1' and the kernel space of gettimeofday can simply
'fixup' this issue by the get_user/put_user helpers, but our user-space tv and
tz code has no such function, just emulate such 'fixup' by a stupid etext
compare to at least make sure the data pointer is in data range. Welcome better
solution.

    CASE_TEST(gettimeofday_bad1); EXPECT_SYSER(1, gettimeofday((void *)1, NULL), -1, EFAULT); break;
    CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;

Without this ugly check, the above cases would get such error:

    35 gettimeofday_bad1init[1]: unhandled signal 11 code 0x1 at 0x00000002 in init[10000+5000]
    CPU: 0 PID: 1 Comm: init Not tainted 6.4.0-rc1-00134-gf929c7b7184f-dirty #20
    Hardware name: riscv-virtio,qemu (DT)
    epc : 00012ccc ra : 00012ca8 sp : 9d254d90
     gp : 00016800 tp : 00000000 t0 : 00000000
     t1 : 0000000a t2 : 00000000 s0 : 00000001
     s1 : 00016008 a0 : 00000000 a1 : 9d254da8
     a2 : 00000014 a3 : 00000000 a4 : 00000000
     a5 : 00000000 a6 : 00000001 a7 : 00000193
     s2 : 00000023 s3 : 9d254da4 s4 : 00000000
     s5 : 00000000 s6 : 0000541b s7 : 00000007
     s8 : 9d254dcc s9 : 000144e8 s10: 00016000
     s11: 00000006 t3 : 00000000 t4 : ffffffff
     t5 : 00000000 t6 : 00000000
    status: 00000020 badaddr: 00000002 cause: 0000000f

Will at least append this test error in the commit message of the coming new
revision of this patch.

Hi, Willy, this also require your discussion, simply remove the above
two test cases may be not a good idea too, the check for gettimeofday is
perfectly ok.

The same 'emulate' method is used in the waitid patch, but that only
requires to compare 'pid == INT_MIN', which is not that weird.

> > +
> > +	/* set tz to zero to avoid random number */
> > +	if (tz != NULL) {
> > +		if ((char *)tz > &etext)
> > +			memset(tz, 0, sizeof(struct timezone));
> > +		else
> > +			return -EFAULT;
> > +	}
> > +

The same issue here.

> > +	if (tv == NULL)
> > +		return 0;
> > +
> > +	ret = my_syscall2(__NR_clock_gettime, CLOCK_REALTIME, &ts);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tv->tv_sec = (time_t) ts.tv_sec;
> > +#ifdef __NR_clock_gettime64
> 
> Nitpick:
> 
> While this ifdef works and is correct its logic is a bit indirect.
> If it is copied to some other function in the future it may be incorrect
> there.
> 
> Without the #ifdef the compiler should still be able to optimize the
> code away.

Ok, will remove the #ifdef wrapper, let the compiler optimize itself.

Thanks,
Zhangjin

> 
> > +	if (tv->tv_sec != ts.tv_sec)
> > +		return -EOVERFLOW;
> > +#endif
> > +
> > +	tv->tv_usec = ts.tv_nsec / 1000;
> > +	return 0;
> > +#else
> > +#error None of __NR_gettimeofday, __NR_clock_gettime and __NR_clock_gettime64 defined, cannot implement sys_gettimeofday()
> > +#endif
> >  }
> >  
> >  static __attribute__((unused))
> > -- 
> > 2.25.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
