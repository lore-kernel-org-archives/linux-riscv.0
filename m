Return-Path: <SRS0=W22O=LV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60358C49EA5
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 00:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C6961A1D
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 00:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C6961A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6H4VBFTUxxSRoun5PdWq9Pzss/fo8sNn9eKnZ3dSYoI=; b=0WTrNmJpW3gFZj
	WMebozkyhz3wpJn/bS2eAIv7X5VEl3DnR33RIZ28cKZ6dzrEpMbf9M/N9c4Y67y4lACgBS67QrkTe
	Sw2Wmct90pbikD7W16JaPGBMfKQSZAtgwB/TublxvOxT93ngPEJC3HR+MhKqP/7kjAlHI42EHHzsY
	eYj+Cp2Fh7+hNwI2BCTEpUH9FjeGevS7c8RROmVJuh65tIZ+rvpVhx1Urhj5pECFm4aUEb7iZYaDb
	CynF08ShENJ8ZPQ0EU/6cvKMDm1UrP4kx4EPDQSuoahkNqW+lLXtoF0DrPyZFoQkkQBdgrVYHTXhW
	amGzPq/1GtCKsGhHhC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxIXi-004vKv-Tv; Sun, 27 Jun 2021 00:20:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxIXQ-004vJu-86
 for linux-riscv@lists.infradead.org; Sun, 27 Jun 2021 00:20:41 +0000
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by linux.microsoft.com (Postfix) with ESMTPSA id CFABD20B6AEE
 for <linux-riscv@lists.infradead.org>; Sat, 26 Jun 2021 17:20:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CFABD20B6AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1624753235;
 bh=ql5M5jaT8pEIRhBidjp+VT0YSsjiH7tSOsIK7C/7Q1A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qFmiBjF5FD5ByxzdnR+OepMXg9q2TEVbr+K4mhHzFyT8C4XiEgCStYDh2S59iiJYu
 2MfoNV7GJ5ksAqEc3glyW01aLUSym1uObst9ax1yoX74J9l1oCNdB5wkXDfOAZGu+P
 YImSGEseM/C458L+t2LgVV0F6gF/uEW+fb/zAxdk=
Received: by mail-pl1-f169.google.com with SMTP id x22so6732651pll.11
 for <linux-riscv@lists.infradead.org>; Sat, 26 Jun 2021 17:20:35 -0700 (PDT)
X-Gm-Message-State: AOAM531HGW6Tki7ygRtvypaVUEXJn3k7ZGNu534K5i2zdE0o7IXhAHHh
 q5VhGMTFyo7Wp2kSwIeI3dq2i12PVJvXt/l7XZ4=
X-Google-Smtp-Source: ABdhPJzR9XJThrU5IbGCcpYuM0v/cOsYB9rbLs2VQsUc4Y01I33kg2bqpRGVazOix/d1o8l6hZVA62FD9tp2xG5ntbg=
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr7478784pjq.187.1624753235319; 
 Sat, 26 Jun 2021 17:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210625010200.362755-1-mcroce@linux.microsoft.com>
 <CAKwvOd=rzoCFtUPrB+Hh8ZneGJwKc_2jW=QN6apb4T033r+kYg@mail.gmail.com>
In-Reply-To: <CAKwvOd=rzoCFtUPrB+Hh8ZneGJwKc_2jW=QN6apb4T033r+kYg@mail.gmail.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Sun, 27 Jun 2021 02:19:59 +0200
X-Gmail-Original-Message-ID: <CAFnufp160uvpqNowZpDdOY4bSN1NJ5j81nYcX=9+rW9WZHfXcQ@mail.gmail.com>
Message-ID: <CAFnufp160uvpqNowZpDdOY4bSN1NJ5j81nYcX=9+rW9WZHfXcQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] lib/string: optimized mem* functions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
 David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>, 
 linux-arch <linux-arch@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_172040_363612_27DFC81A 
X-CRM114-Status: GOOD (  23.05  )
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

On Fri, Jun 25, 2021 at 7:45 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jun 24, 2021 at 6:02 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > From: Matteo Croce <mcroce@microsoft.com>
> >
> > Rewrite the generic mem{cpy,move,set} so that memory is accessed with
> > the widest size possible, but without doing unaligned accesses.
> >
> > This was originally posted as C string functions for RISC-V[1], but as
> > there was no specific RISC-V code, it was proposed for the generic
> > lib/string.c implementation.
> >
> > Tested on RISC-V and on x86_64 by undefining __HAVE_ARCH_MEM{CPY,SET,MOVE}
> > and HAVE_EFFICIENT_UNALIGNED_ACCESS.
> >
> > Further testing on big endian machines will be appreciated, as I don't
> > have such hardware at the moment.
>
> Hi Matteo,
> Neat patches.  Do you have you any benchmark data showing the claimed
> improvements? Is it worthwhile to define these only when
> CC_OPTIMIZE_FOR_PERFORMANCE/CC_OPTIMIZE_FOR_PERFORMANCE_O3 are
> defined, not CC_OPTIMIZE_FOR_SIZE? I'd be curious to know the delta in
> ST_SIZE of these functions otherwise.
>

I compared the current versions with the new one with bloat-o-meter,
the kernel grows by ~400 bytes on x86_64 and RISC-V

x86_64

$ scripts/bloat-o-meter vmlinux.orig vmlinux
add/remove: 0/0 grow/shrink: 4/1 up/down: 427/-6 (421)
Function                                     old     new   delta
memcpy                                        29     351    +322
memset                                        29     117     +88
strlcat                                       68      78     +10
strlcpy                                       50      57      +7
memmove                                       56      50      -6
Total: Before=8556964, After=8557385, chg +0.00%

RISC-V

$ scripts/bloat-o-meter vmlinux.orig vmlinux
add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
Function                                     old     new   delta
memcpy                                        36     324    +288
memset                                        32     148    +116
strlcpy                                      116     132     +16
strscpy_pad                                   84      96     +12
strlcat                                      176     164     -12
memmove                                       76      52     -24
Total: Before=1225371, After=1225767, chg +0.03%

I will post benchmarks made on a RISC-V machine which can't handle
unaligned accesses, and it will be the first user of the new
functions.

> For big endian, you ought to be able to boot test in QEMU.  I think
> you'd find out pretty quickly if any of the above had issues.
> (Enabling KASAN is probably also a good idea for a test, too). Check
> out
> https://github.com/ClangBuiltLinux/boot-utils
> for ready made images and scripts for launching various architectures
> and endiannesses.
>

Will do!

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
