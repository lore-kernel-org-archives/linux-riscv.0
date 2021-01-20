Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDB1C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3C8623358
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3C8623358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ne6+KE8jv5r3wiEME5WXHkYFa/h9ddiSVYHPAYXNrzc=; b=F86zpybFI+fS0FI0KZWBVivKb
	aNbANYf0m/zANykhuxyN6JEYCfBRXBywY9y5fnzR5AbvCo0Hbhp/qw50Y5MLgirc/AupDrfxI3fjJ
	JUAFul8Nus3MsYe0SYSgUGl3720iMnrj9Do6G2ZICT8MBlM/aCsYRrat8tJBxAHln4SBC+x/E970f
	wtJXQ6BbSeVUP1857uxpFvJ2KDim4vb8IZaiIhp7dUfs+fT5ZSRdpqJm0u77y/qGoZBnU3byENcJG
	gPLkcXV0Is3fR3xL8dvtx9QfpWwbHtgcUXTYNT3GcGq2zTeJM3EAH7oF52JXodbIFhMMg/G7ywk5q
	sGX2vwfwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2FQA-0005kT-Qm; Wed, 20 Jan 2021 15:29:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2FQ8-0005jM-Rt
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 15:29:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9876B2339E
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611156559;
 bh=7WmsTvnAxPUyLnSy+7idacbviQ2ZXQ9V63K2VAQXPPQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=njosop8oX4+mLBzQ4sXl8FUyNqfAJnAZG/nYjpjD4PCTQXjAbXaRtCcfP4/TrBbrQ
 Fg0gYdC8Nmd40f8PSxwlk56RVL/XRcUW8J4jpXc+lDq8pEFZcvTgRuAUyuidc4uB7e
 h4gP4kgAFoGCzzxQCDicr6dtdIrkA96TB8DIa1Qokb7Z2b+G9NREWBYV4/52XvxUv5
 alTYs0iX5OeOEOr1ApcS8Y3H+KVGZV91rCrfCnU9aEJb0K2RAtMBiq6PPzu8G+kGSh
 QTagLesvb4XUG/uuT+C8J6kRG2vZtB1pS+CHc0hdgFwOeiNRsG33j/EVnblJRwFgut
 GDCYIcRnzoy1A==
Received: by mail-oi1-f178.google.com with SMTP id q205so25340949oig.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 07:29:19 -0800 (PST)
X-Gm-Message-State: AOAM532p1n+nteqqiP5c5toccNj9D3KD3tSV1LFwXHiByA3hXZT4jMzk
 jr/N8yMFw9fuz6opsQWF/4TldZ/Z0dZHR7+OfvU=
X-Google-Smtp-Source: ABdhPJwZiFp47TofXx52OGFpz+dwnvNbLq2R0G7FqMR3WLWTVDTOq+qhS0F0eCIyFj2IT4PmtXzzeqiaRUH9oYlE4BI=
X-Received: by 2002:aca:44d:: with SMTP id 74mr3252962oie.4.1611156558930;
 Wed, 20 Jan 2021 07:29:18 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
 <CAK8P3a31ssD+FS1tAUxVHzrtUz-L9=mYCbv=ShEMci_bDdiTAg@mail.gmail.com>
 <YAcOi0l44VTtd2LS@ingrassia.epigenesys.com>
 <CAK8P3a3q16Fds9bujhjHRwjXoc_8NJBvutNRqajMEPHb9hGdNw@mail.gmail.com>
 <YAhBu/T02m5oFOcM@ingrassia.epigenesys.com>
In-Reply-To: <YAhBu/T02m5oFOcM@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Jan 2021 16:29:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2y9BC9JDXoJVTi0+TcDvYH-nb27K4r2SybmL-zrxfBtw@mail.gmail.com>
Message-ID: <CAK8P3a2y9BC9JDXoJVTi0+TcDvYH-nb27K4r2SybmL-zrxfBtw@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_102921_036134_0DB745C2 
X-CRM114-Status: GOOD (  24.61  )
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alistair Francis <alistair.francis@wdc.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, "Maciej W. Rozycki" <macro@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 20, 2021 at 3:44 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> On Tue, Jan 19, 2021 at 08:47:59PM +0100, Arnd Bergmann wrote:
> > On Tue, Jan 19, 2021 at 5:53 PM Emiliano Ingrassia
> >
> > I didn't think that COMPAT_32BIT_TIME was even allowed on rv32,
> > but it seems there is a bug in Kconfig, it should be disabled for any
> > architecture that does not set __ARCH_WANT_TIME32_SYSCALLS,
> > but this should not affect the problem at hand.
>
> Ok, will you submit a patch for this bug?

Sure, will do.
>
> Here is the example futex app corrected w.r.t. all the previous
> considerations:
>
> |#include <features.h>
> |#if (defined __GLIBC__) && (__GLIBC__ >= 2 && __GLIBC_MINOR__ >= 32)
> |#include <asm/unistd.h>
> |#include <bits/timesize.h>
> |# ifndef __NR_futex
> |#  if defined (__NR_futex_time64) && (__TIMESIZE == 64)
> |#   define __NR_futex  __NR_futex_time64
> |#  endif
> |# endif
> |#endif

This is broken on musl (which does not define __GLIBC__), on kernels
running with CONFIG_COMPAT_32BIT_TIME disabled (which may
define __NR_futex, but always returns -ENOSYS), and on any future glibc
with 64-bit time_t on anything other all existing architectures (which
define __NR_futex but expect an incompatible argument). It may also
be broken on rv32 if we end up adding support for futex() in the future,
as has been discussed as a possible workaround.

> > rv32 is in the unfortunate position of being the first one that has a glibc
> > port, so it hits a lot of problems that other architectures do not.
> > If the applications get fixed properly, then at least they will also
> > work with musl-1.2 and a (will work-in-progress) glibc that will
> > eventually allow building with 64-bit time_t.
>
> Ok, so in case of perf we probably should limit the needed patch to
> riscv 32 bit architecture, unless we want to solve the problem for all
> 32 bit architecture with time_t 64 bit support.

No, whatever you do should be written to work on all 32-bit
architectures. It would be crazy to add a special case for one
architecture when it's easier to fix it properly.

What was wrong with the helper function I suggested?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
