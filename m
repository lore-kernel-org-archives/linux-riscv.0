Return-Path: <SRS0=G26q=VB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647A4C0650E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2019 09:19:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3899021882
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2019 09:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDAIHQ8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3899021882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl7LG0Cf9otvDZW7VZ2HyIMYE2G6vCIjwR48bKBGOXE=; b=KDAIHQ8EJwDOnL
	JcQKv+VoGtUCmX8FmPU9Ro29EzS+or9hEiY4+3+aN7UqkCkYPQQAXNhTX2HhX2tz2SqwnGjr/mjbV
	ukLTJ/+WF6NBuLsYWBthC3BwL/uFh4dBoEinn42ATIXvzldbi3AnyVMhGO8CdCv+QTjfcvYujkr6S
	0Wg+TGWHbDzuXyBmf1mJH0AxVh5hbuj8WLsSFg8K2hB6u8hbqrexM+fHV/FULU2+MGmWEwie7v8cf
	8aPUMsGAz9/F6yiStbCeGJBSAZK76oPQc8Q2/1+P4SXBeQAg8lmKSWCOLBCxuYJGNq00nKekqFPj2
	wzN5i7tLsGRPOqhhqhYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hixtv-0005wS-MD; Thu, 04 Jul 2019 09:19:35 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hixts-0005vX-Kr
 for linux-riscv@lists.infradead.org; Thu, 04 Jul 2019 09:19:34 +0000
Received: by mail-qt1-f194.google.com with SMTP id w17so4174752qto.10
 for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2019 02:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UU1LRzgJ9KtlIamPG1rpTOdBbiRt377kXD3IRu4KTEc=;
 b=ExnruZHg1FIxzbSSsgUL5CDc2Q7HDjY745czXVoV2Z9MSzJY/CAKvvBcd2q2plW8Z9
 Xhu6g6DUSMI46g8jE/0tZWSjr/3T4zPDo2LQGzIAApASzyH74pyOP0BspX+5FPQsIVt+
 QlMT4SXA1kplPH/9dKHqXBCGN4Odeq3ktIzhaTSrvNQtUBY6jIW/7zdH0W4/XSzngWmU
 aVas3TzvjDI5GirofLapMArx6cUMSYAVoziqULePAmzSpBwASOhm2Gb50/XVEO5TqycQ
 tI+wdJVzuM+E/84+g/gfuAxpGyBEcdNR3XqVsdKOdM90aQtOwTk4TYGFH6hbr6+bWr8o
 KNFg==
X-Gm-Message-State: APjAAAWu6N2m2w4G9un8zKbPjYZlwkFPTlVjCl+D5mawJeIOB17mEJWh
 yj4Xxw/m6GpZTwW7eGxt8tDDj8DicsrUkMc06wc=
X-Google-Smtp-Source: APXvYqz9HnBRmgYL+EgQde6QoC+3TNiwekg2y+kqVusM0V3Keg/hNYgvdDkMLVnEv4+p3P8DAILsb6JwSzdx30DpREE=
X-Received: by 2002:aed:3363:: with SMTP id u90mr2705494qtd.7.1562231969777;
 Thu, 04 Jul 2019 02:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190703005202.7578-1-alistair.francis@wdc.com>
 <mvmk1czh9y6.fsf@suse.de>
 <CAKmqyKPn9GBg=n1j-ZpEdCN4Qfi5qfNtEVgpgF8rYRpof4eNDA@mail.gmail.com>
 <mvmpnmqfepx.fsf@suse.de>
In-Reply-To: <mvmpnmqfepx.fsf@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Jul 2019 11:19:13 +0200
Message-ID: <CAK8P3a2NmdoHzFGKrzw4CBYDOBtZHDQCGsWE_L0UbG+w0bGWkA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] RISC-V: Handle the siginfo_t offset problem
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190704_021932_687552_10E2D2D0 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Alistair Francis <alistair23@gmail.com>, linux-riscv@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 4, 2019 at 9:20 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jul 03 2019, Alistair Francis <alistair23@gmail.com> wrote:
>
> > On Wed, Jul 3, 2019 at 12:08 AM Andreas Schwab <schwab@suse.de> wrote:
> >>
> >> On Jul 02 2019, Alistair Francis <alistair.francis@wdc.com> wrote:
> >>
> >> > In the RISC-V 32-bit glibc port [1] the siginfo_t struct in the kernel
> >> > doesn't line up with the struct in glibc. In glibc world the _sifields
> >> > union is 8 byte alligned (although I can't figure out why)
> >>
> >> Try ptype/o in gdb.
> >
> > That's a useful tip, I'll be sure to use that next time.
>
> It was a serious note.  If the structs don't line up then there is a
> mismatch in types that cannot be solved by adding spurious padding.  You
> need to fix the types instead.

Would it be an option to align all the basic typedefs (off_t, time_t,
clock_t, ...)
between glibc and kernel then, and just use the existing
sysdeps/unix/sysv/linux/generic/bits/typesizes.h after all to avoid
surprises like this?

As of v2 the functional difference is

-#define __INO_T_TYPE        __ULONGWORD_TYPE
+#define __INO_T_TYPE    __UQUAD_TYPE
 #define __INO64_T_TYPE        __UQUAD_TYPE
 #define __MODE_T_TYPE        __U32_TYPE
-#define __NLINK_T_TYPE        __U32_TYPE
-#define __OFF_T_TYPE        __SLONGWORD_TYPE
+#define __NLINK_T_TYPE    __UQUAD_TYPE
+#define __OFF_T_TYPE    __SQUAD_TYPE
 #define __OFF64_T_TYPE        __SQUAD_TYPE
-#define __RLIM_T_TYPE        __ULONGWORD_TYPE
+#define __RLIM_T_TYPE      __UQUAD_TYPE
 #define __RLIM64_T_TYPE        __UQUAD_TYPE
-#define    __BLKCNT_T_TYPE        __SLONGWORD_TYPE
+#define __BLKCNT_T_TYPE    __SQUAD_TYPE
 #define    __BLKCNT64_T_TYPE    __SQUAD_TYPE
-#define    __FSBLKCNT_T_TYPE    __ULONGWORD_TYPE
+#define __FSBLKCNT_T_TYPE  __UQUAD_TYPE
 #define    __FSBLKCNT64_T_TYPE    __UQUAD_TYPE
-#define    __FSFILCNT_T_TYPE    __ULONGWORD_TYPE
+#define __FSFILCNT_T_TYPE  __UQUAD_TYPE
 #define    __FSFILCNT64_T_TYPE    __UQUAD_TYPE
-#define    __FSWORD_T_TYPE        __SWORD_TYPE
+#define __FSWORD_T_TYPE   __SQUAD_TYPE
-#define __CLOCK_T_TYPE        __SLONGWORD_TYPE
-#define __TIME_T_TYPE        __SLONGWORD_TYPE
+#define __CLOCK_T_TYPE     __SQUAD_TYPE
+#define __TIME_T_TYPE      __SQUAD_TYPE
 #define __USECONDS_T_TYPE    __U32_TYPE
-#define __SUSECONDS_T_TYPE    __SLONGWORD_TYPE
+#define __SUSECONDS_T_TYPE __SQUAD_TYPE
-#define __BLKSIZE_T_TYPE    __S32_TYPE
+#define __BLKSIZE_T_TYPE   __SQUAD_TYPE
 #define __FSID_T_TYPE        struct { int __val[2]; }
 #define __SSIZE_T_TYPE        __SWORD_TYPE
-#define __SYSCALL_SLONG_TYPE    __SLONGWORD_TYPE
-#define __SYSCALL_ULONG_TYPE    __ULONGWORD_TYPE
-#define __CPU_MASK_TYPE     __ULONGWORD_TYPE
+#define __SYSCALL_SLONG_TYPE __SQUAD_TYPE
+#define __SYSCALL_ULONG_TYPE __UQUAD_TYPE
+#define __CPU_MASK_TYPE    __UQUAD_TYPE

-#ifdef __LP64__
 # define __RLIM_T_MATCHES_RLIM64_T    1
-#else
-# define __RLIM_T_MATCHES_RLIM64_T    0
-#endif

+#define __ASSUME_TIME64_SYSCALLS 1
+#define __ASSUME_RLIM64_SYSCALLS 1

Since the sysdeps/unix/sysv/linux/generic/bits/typesizes.h definitions
generally match the kernel, anything diverging from that has the potential
of breaking it, so the difference should probably be kept to the absolute
minimum.

I think these ones are wrong and will cause bugs similar to the clock_t
issue if they are used with kernel interfaces:
__NLINK_T_TYPE, __FSWORD_T_TYPE, __CLOCK_T_TYPE,
__BLKSIZE_T_TYPE, __SYSCALL_ULONG_TYPE,
__SYSCALL_SLONG_TYPE, __CPU_MASK_TYPE

These are fine as long as they are only used in user space and to
wrap kernel syscalls, but I think most of them can end up being
passed to the kernel, so it seems safer not to have rv32 diverge
without a good reason.

The remaining ones (__INO_T_TYPE, __OFF_T_TYPE, __BLKCNT_T_TYPE,
__FSBLKCNT_T_TYPE, __FSFILCNT_T_TYPE, __TIME_T_TYPE) all
follow the pattern where the kernel has an old 32-bit type and a new
64-bit type, but the kernel tries not to expose the 32-bit interfaces
to user space on new architectures and only provide the 64-bit
replacements, but there are a couple of interfaces that never got
replaced, typically in driver and file system ioctls.

Since glibc already has code to deal with the 64-bit types and that
is well tested, it would seem safer to me to just #undef the old
types completely rather than defining them to 64-bit, which would
make them incompatible with the kernel's types.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
