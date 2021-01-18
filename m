Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224C3C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 19:59:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72CF22B49
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 19:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72CF22B49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mbc6NupKXebY6phm+/Se3Hc7QhwX8dI4rXEFr4PKX+4=; b=naC9Qfv8y1H+f7d5VZDYLghmC
	PbXoruhsJISQbWOnYZP7MBWyFqoIQOMXd+cNM0kmsHJ+oqd1TwBtklEFGCw6P5Lqt1ek1KcD6huu8
	jRlM5n/Y1HahawieuHXw61cyyFKqaboa/HTHE9khL4EBOlp8StVsjWEE5uY1+8D/MqFmsrU41CPht
	gsrCg6e5HGlnb0xHVhm95k+0jr/e5erMYnUdEbudLIL7lYfVYHoemijbs0OnbAL0KDWQOFtsqnUm8
	OJVOlTS1yqWT6KXyrO1Y+nTJ8fot0YyFwc4ER2CemMn8wGwicXsdlXlMiWOP1S6tYs4tp9saf+iWK
	duRgMVRQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1agB-0008Fm-PW; Mon, 18 Jan 2021 19:59:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1ag8-0008FR-T4
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 19:59:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA28922D5B
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610999947;
 bh=RCF30Vg+Wet2xG0r5EVf+JhKfFllDWby8xnGyCy3/os=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tb+LhWWVVm/CDSo5AOmq2nZBXXcERQnH6IFdRuOpDu/Hvo/Ry1txTMD23JffiNC2S
 ySl4dNCXQjXcuepatqXeakayxAabZzFOJce6/nKB+XLG7FIS3cpIGnzBqaRKWDFm5g
 SPY7Gj3RUDwl949l/coONnPhriIPEzHF5Taco5p1zg2jEq244dKlYB6g852yuG9m2g
 b/WDzqbIbiIR1tzmWYcMqXJQZWU42/BzhQdtIUZz3rGo7XOEucliupkF5pHBq1VLxq
 RujirAW0DaXDrQ7mInJLCYYvKgkd/cNFkpkKTq4zEFERZcx2KTy5MzaFzUcCOUCL/E
 eBczurIhN7N5Q==
Received: by mail-oo1-f54.google.com with SMTP id x203so4371320ooa.9
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 11:59:07 -0800 (PST)
X-Gm-Message-State: AOAM531S1p4C025cZwhoaU+rVpPm0jDsy2/kiedVPFYAVHoTyZjmTmVV
 82mtXosm69r3uLd1nTBaiv+Pb2vvabJ9CQB12Z4=
X-Google-Smtp-Source: ABdhPJzZtNhOIcSnPc2C9uk4dCBsiSFAZW0suvVs39FcXLlFxO1IdYB5x2Ivodp8tsQXHrAXohEfi6f9S0TSFB1J1ic=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr527885ooj.15.1610999946950;
 Mon, 18 Jan 2021 11:59:06 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
In-Reply-To: <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 20:58:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a31ssD+FS1tAUxVHzrtUz-L9=mYCbv=ShEMci_bDdiTAg@mail.gmail.com>
Message-ID: <CAK8P3a31ssD+FS1tAUxVHzrtUz-L9=mYCbv=ShEMci_bDdiTAg@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_145909_260412_3C1CB352 
X-CRM114-Status: GOOD (  23.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 4:33 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> On Mon, Jan 18, 2021 at 04:19:47PM +0100, Arnd Bergmann wrote:
> > On Mon, Jan 18, 2021 at 3:53 PM Emiliano Ingrassia <ingrassia@epigenesys.com> wrote:
> > >
> > > Hi,
> > >
> > > after some searching I found this patch from Yocto project:
> > >
> > > https://www.mail-archive.com/linux-yocto@lists.yoctoproject.org/msg01004.html.
> > >
> > > I don't know if it's ever been proposed as mainline patch.
> > >
> > > What do you think about it? Could it be the right solution?
> >
> > No. While this makes it work on rv32, it does not fix it in a
> > way that makes it work on other architectures with a time64
> > libc. If you fix it, please do it in a way that works on all architectures.
>
> Ok, I totally agree with you on this point.
>
> So, it is right to conclude that the problem is not in perf
> implementation but in the libc implementation?
> That is, for example, glibc should define SYS_futex as SYS_futex_time64
> in case of riscv 32 bit because of its support to 64 bit time_t?

Actually, there might be a somewhat less ugly workaround, if we decide
to put a correct wrapper into the exported kernel headers, e.g. adding
something along these lines to include/uapi/linux/futex.h or a new header
from the kernel:

#ifndef __KERNEL__
#include <linux/futex.h>
#include <linux/time_types.h>
#include <asm/unistd.h>
#include <sys/time.h>
#include <unistd.h>
#include <errno.h>

#define __kernel_futex __kernel_futex
typedef union __attribute__ ((__transparent_union__)) {
       const struct timespec *timeout;
       unsigned int intval;
} __kernel_futex_union;

struct __kernel_old_timespec {
       __kernel_time_t tv_sec;                 /* seconds */
       long            tv_nsec;                /* nanoseconds */
};

static inline int __kernel_futex(int *uaddr, int op, int val,
                                 __kernel_futex_union val2,
                                 unsigned *uaddr2, int val3)
{
        int cmd = op & FUTEX_CMD_MASK;
        int ret = -ENOSYS;
#ifdef __NR_futex64
        {
                if (((cmd != FUTEX_WAIT) && (cmd != FUTEX_WAIT_BITSET)) ||
                    (sizeof(time_t) == sizeof(__u64))) {
                        ret = syscall(__NR_futex64, uaddr, op, val,
                                      val2.timeout, uaddr2, val3);
                }

                if (ret != -ENOSYS && ret != -EPERM)
                        return ret;
        }
#endif
#ifdef __NR_futex
        {
                if (((cmd != FUTEX_WAIT) && (cmd != FUTEX_WAIT_BITSET)) ||
                    sizeof(time_t) == sizeof(__kernel_long_t)) {
                        ret = syscall(__NR_futex, uaddr, op, val,
                                       val2.timeout, uaddr2, val3);
                } else {
                        struct __kernel_old_timespec oldtimeout = {
                                .tv_sec  = val2.timeout->tv_sec,
                                .tv_nsec = val2.timeout->tv_nsec,
                        };
                        ret = syscall(__NR_futex, uaddr, op, val,
                                      &oldtimeout, uaddr2, val3);
                }
        }
#endif
        return ret;
}
#endif /* __KERNEL__

With this, applications can be changed to define their own

#ifdef __kernel_futex
#define futex(uaddr, futex_op, val, val2, uaddr2, val3) \
      __kernel_futex(uaddr, futex_op, val, val2, uaddr2, val3)
#else
#define futex(uaddr, futex_op, val, val2, uaddr2, val3) \
       syscall(__NR_futex, uaddr, futex_op, val, val2, uaddr2, val3)
#endif

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
