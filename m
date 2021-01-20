Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B4EC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:46:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96FD423340
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96FD423340
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OhQjCLE0ELAS+8wIAlsyC+vTWi/ZPMRbBSysb0JXA/U=; b=RTPXVmtr1d/BQSnRtABMcu/pO
	U3taTRUbVpAAQhKj2lxJN1pbRmABiXGKYQjobHim3GKBNQvh63+Ag5XYxm+Pgyl35RpObuDQozRsD
	ZQ6eZSPvdf+KSvW8FCYc0MPomxcmL+oTntqyRrNWg71AW2d2+SOUcLSZgd3Bm2sSKNDEFsHb+S8PV
	xHNQAyMZbiWEBCxbFrCrshDbD9j6lUl0gB8YDPtpJOGTZLBv3Tzi12/mOvpDn2SRXT8O98j9hIWY4
	dZcFBjj/vHKN9jXLExYmLnDzXShVkBMmj5bvNUWgULwP46njbcI6fN2vwwqbp22wFEM13wWN/n8iK
	XaYnp4Gkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Fg3-0000Lv-Oa; Wed, 20 Jan 2021 15:45:47 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Fg0-0000Eq-6D
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 15:45:45 +0000
Received: by mail-ed1-f42.google.com with SMTP id dj23so23732021edb.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 07:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8npPzXaATwxK016zxLKvFcL2C31VtLU9BeTG1ZdXM04=;
 b=mHXti2r7GCAXOC81DjHKEEup56Jethmo70J7+4DFH3TwhhQ2wzdbZc+kVv91Ca6+hJ
 0tunPawRYUqrJ34luCeQziRlxM6eLpEXssMyohebYuw8tYFYgfG3C+ZPI8IHnmHpAS9f
 ufWMmFC4LiEfyeyjOB2QchrmvHaHsUUYdZDiVr1T5atbAg8s/8lhOlYe8bAtxW4tpUbV
 +dEAJvCbo3d/AzILTQdZZoyww/eWNfJwE2TtspI2YifCy3fkdV6IraxzARLHmpXBM/h1
 4a/B4TOusQZrWKsY3+zPRdlmkxwJMiDDit1KNrNLddsS7KfLOCgXObqkB4o6zuR2PpyX
 QKKg==
X-Gm-Message-State: AOAM533k3Tl/GnxPA0zqChuvHAvT70uHZYiE0aNwX4zH6bz3KcxO8msf
 981nXEq7XiJwKfwh9st4NKo6NBGuYIljuanV4ck=
X-Google-Smtp-Source: ABdhPJwRhqN/SYqQRc2xxIscQex7MJ1sKYwOUH73vead+FtsFy9ZP1yJNwaJP6kaWCs7ArcPynXN+w==
X-Received: by 2002:a05:6402:70f:: with SMTP id
 w15mr8012388edx.121.1611157541439; 
 Wed, 20 Jan 2021 07:45:41 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id i13sm1346237edu.22.2021.01.20.07.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:45:40 -0800 (PST)
Date: Wed, 20 Jan 2021 16:45:38 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAhQIksHO+xM7wEO@ingrassia.epigenesys.com>
References: <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
 <CAK8P3a31ssD+FS1tAUxVHzrtUz-L9=mYCbv=ShEMci_bDdiTAg@mail.gmail.com>
 <YAcOi0l44VTtd2LS@ingrassia.epigenesys.com>
 <CAK8P3a3q16Fds9bujhjHRwjXoc_8NJBvutNRqajMEPHb9hGdNw@mail.gmail.com>
 <YAhBu/T02m5oFOcM@ingrassia.epigenesys.com>
 <CAK8P3a2y9BC9JDXoJVTi0+TcDvYH-nb27K4r2SybmL-zrxfBtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2y9BC9JDXoJVTi0+TcDvYH-nb27K4r2SybmL-zrxfBtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_104544_234596_DADD3B3B 
X-CRM114-Status: GOOD (  32.18  )
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

Hi Arnd,

On Wed, Jan 20, 2021 at 04:29:02PM +0100, Arnd Bergmann wrote:
> On Wed, Jan 20, 2021 at 3:44 PM Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > On Tue, Jan 19, 2021 at 08:47:59PM +0100, Arnd Bergmann wrote:
> > > On Tue, Jan 19, 2021 at 5:53 PM Emiliano Ingrassia
> > >
> > > I didn't think that COMPAT_32BIT_TIME was even allowed on rv32,
> > > but it seems there is a bug in Kconfig, it should be disabled for any
> > > architecture that does not set __ARCH_WANT_TIME32_SYSCALLS,
> > > but this should not affect the problem at hand.
> >
> > Ok, will you submit a patch for this bug?
>
> Sure, will do.
> >
> > Here is the example futex app corrected w.r.t. all the previous
> > considerations:
> >
> > |#include <features.h>
> > |#if (defined __GLIBC__) && (__GLIBC__ >= 2 && __GLIBC_MINOR__ >= 32)
> > |#include <asm/unistd.h>
> > |#include <bits/timesize.h>
> > |# ifndef __NR_futex
> > |#  if defined (__NR_futex_time64) && (__TIMESIZE == 64)
> > |#   define __NR_futex  __NR_futex_time64
> > |#  endif
> > |# endif
> > |#endif
>
> This is broken on musl (which does not define __GLIBC__), on kernels
> running with CONFIG_COMPAT_32BIT_TIME disabled (which may
> define __NR_futex, but always returns -ENOSYS), and on any future glibc
> with 64-bit time_t on anything other all existing architectures (which
> define __NR_futex but expect an incompatible argument). It may also
> be broken on rv32 if we end up adding support for futex() in the future,
> as has been discussed as a possible workaround.

I agree on this. It was just an example on howto get __NR_futex defined
in this specific case. Sure is broken in general.

>
> > > rv32 is in the unfortunate position of being the first one that has a glibc
> > > port, so it hits a lot of problems that other architectures do not.
> > > If the applications get fixed properly, then at least they will also
> > > work with musl-1.2 and a (will work-in-progress) glibc that will
> > > eventually allow building with 64-bit time_t.
> >
> > Ok, so in case of perf we probably should limit the needed patch to
> > riscv 32 bit architecture, unless we want to solve the problem for all
> > 32 bit architecture with time_t 64 bit support.
>
> No, whatever you do should be written to work on all 32-bit
> architectures. It would be crazy to add a special case for one
> architecture when it's easier to fix it properly.
>
> What was wrong with the helper function I suggested?

Sorry, I was just trying to have a more clear picture of the problem.

I'm totally fine with the helper function you proposed. About that,
should such approach be used for every time64 syscall for which is known
that there is no libc wrapper?

>
>        Arnd

Thank you, best regards.

Emiliano

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
