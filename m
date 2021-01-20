Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4319AC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 16:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD852339E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 16:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD852339E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tMDBCk2ZLNVH2naFs34QOZq/FBZVhIwqBUkf4OIwnYI=; b=ZFdBtqUhN6RVLguj7QSqPrLIt
	IvjDjemJUMGCVfwch5mypW5IyDDNfGP2uGFZzPbDnXZ5FhUpPpxj+xVBoFirXLJHEfBYqlbao4Mpu
	lIZCJ8r/VrJn8tXMZFnC5ZD3+6ZouJ746P5Z4LC6UnZEAtUEetLfhur3bvHfCwlgDutE8OTy+VSQQ
	4N4ALSONTfXV8B7Q18c3b+q0r/yqGXdgOlhLVILrXbTnhMg3ybLM1eqW71jwwUwdYuWmFKx1peRd9
	FRjdcHI+dsLvQE21RsdrwTaGTlDKcfPsT/Raqi5o9QsdLw/44LOM5uK5ohdF37pOiAGoB5y8Bf585
	cLgJUqmow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2FxW-0003U2-OS; Wed, 20 Jan 2021 16:03:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2FxU-0003Td-Dm
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 16:03:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EE42233ED
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611158627;
 bh=T0E6+mqakN4V9vWo8X1ljtTe+kN6yus7W9b1XzynuwM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SrLoCkiCGaNFYbjas36sYatWF5/YwK4EjiIhWAUUpJ+Apy0cHpDZaYo1Qp5ivJFmI
 rtBsUbqbm9eOQGZeTEV3H7YU/59qHVHmxdsUNRbzOL0kpxP0uFuwCgjbzObzIJn4UG
 66BTYrf475a/8CuI9nnfKxACUsO2xlofj/qXVy+gUhpqSPbvQsMn97O0hc0wAwOATj
 31ChqIXGptr/EMxHVe5+tSzcFzTAWc71nGZtby9E78w7eljp3MU9k9jk2D/zCEO4yL
 PYWU+aEyQwSWXAspeQKcG/rWS6q3UfwpCuESSO64r1GQgGvYdTqR6OQP89Eu5fdBsO
 7f/9eTAxLWVuA==
Received: by mail-ot1-f48.google.com with SMTP id i30so10912954ota.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 08:03:47 -0800 (PST)
X-Gm-Message-State: AOAM532FlcrgTd/0d7WPaUjzyuj+Ro5uJt+N3G5nHl8VZ7ZyVq6o971F
 dvXEOWH7uWK7qlsgOISKYd/7UEZ0g+/WaQG01O0=
X-Google-Smtp-Source: ABdhPJxaRbbNCHdD3JOd3u35/vAqUKVfGKWCfXkdtpwBgrfo502SBbYLtn9isLPcnVFeKsBmrqxPppHoV64aP1QpSf0=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr7491016otq.305.1611158626717; 
 Wed, 20 Jan 2021 08:03:46 -0800 (PST)
MIME-Version: 1.0
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
 <YAhQIksHO+xM7wEO@ingrassia.epigenesys.com>
In-Reply-To: <YAhQIksHO+xM7wEO@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Jan 2021 17:03:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Kjy14Pxf4_1SOYA5cy1bSYhhxW9_5LefNzJ2dRTJ29g@mail.gmail.com>
Message-ID: <CAK8P3a1Kjy14Pxf4_1SOYA5cy1bSYhhxW9_5LefNzJ2dRTJ29g@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_110348_643186_ECA31DFF 
X-CRM114-Status: GOOD (  26.98  )
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

On Wed, Jan 20, 2021 at 4:45 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> > > > rv32 is in the unfortunate position of being the first one that has a glibc
> > > > port, so it hits a lot of problems that other architectures do not.
> > > > If the applications get fixed properly, then at least they will also
> > > > work with musl-1.2 and a (will work-in-progress) glibc that will
> > > > eventually allow building with 64-bit time_t.
> > >
> > > Ok, so in case of perf we probably should limit the needed patch to
> > > riscv 32 bit architecture, unless we want to solve the problem for all
> > > 32 bit architecture with time_t 64 bit support.
> >
> > No, whatever you do should be written to work on all 32-bit
> > architectures. It would be crazy to add a special case for one
> > architecture when it's easier to fix it properly.
> >
> > What was wrong with the helper function I suggested?
>
> Sorry, I was just trying to have a more clear picture of the problem.
>
> I'm totally fine with the helper function you proposed. About that,
> should such approach be used for every time64 syscall for which is known
> that there is no libc wrapper?

We have previously discussed adding generated wrappers for every
syscall, but my suggestion to have an inline function in one of the kernel
headers was not very popular at the time.

I think futex() is very much a special case here because this is the
only[1] thing that gets called directly by a number of applications through
syscall(). All the other time32 system calls have wrappers that are
provided by any C library, which will just use the correct syscall number
to match the arguments, or do a conversion if needed.

Most of the packages that use the other __NR_* macros need them
for something other than calling them (e.g. strace), so a wrapper does
not help.

      Arnd

[1] technically, there is also io_{p,}getevents, but that is usually abstracted
through libaio, and only that needs to be fixed. I checked
https://pagure.io/libaio/commits/master, which seems to be the upstream
but I do not see a fix in there, so this version is currently broken on 32-bit
architectures with musl-1.2 as well as on rv32 with glibc. Distros may
have already fixed this in their downstream copies.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
