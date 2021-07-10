Return-Path: <SRS0=oGbN=MC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4810C07E95
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 23:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6642D61355
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 23:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6642D61355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/Ij+I0bLvYvWYtwLF/fB6rjCeu/s4441EoSqTAbDWw=; b=TLN3c22l1ooSvr
	kJiLB1NlXbUrIH4aN1QuemKIoNAV5tVZAdUuzXw82gwkLS3JvjCeOz/UnE9Ue98rqpfPJw01G2dkp
	5S3jQcl8jxcUxDNwXrPWi97pGPVRNLgrYK3XMtDzprjBbyjFPrbDHtQk5qTgjGIU4WYfDv4rpyC/D
	OKzyzgCktAqJ8afISZu1sYkainQL5PFK1myf2FNernCj5PkzfmMWxzdj79RjkGayTfhwpukc02kwO
	FW8XYWM53nGvG2QJBMHhbmBlZ7XZwyz5oahFlXS6tgkNCcj758ZoPW0DRliS1giSHUqn/5vPYC5wi
	m3KSHyx9/doDpv+2NzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2M5G-004FVC-Jr; Sat, 10 Jul 2021 23:08:30 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2M5D-004FUe-OI
 for linux-riscv@lists.infradead.org; Sat, 10 Jul 2021 23:08:29 +0000
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2985620B7188
 for <linux-riscv@lists.infradead.org>; Sat, 10 Jul 2021 16:08:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2985620B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1625958506;
 bh=iI1FMzdW4VlFjZv/Q84Kju2c7nRPfQ1D8g1ol/lad8o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mqjRWbf+6qAnSEecmFTGrkQ4qqom1FTAb4ksGZNiN/l9ybsufLXb2fdmnzUrOn9iv
 VBotjDq18WMYTO+9tBtHZ/zAyPyDXG6RpSXXdccx3qppBIcdzo235HmRRnOdJyb2Cx
 F/SmxbSFCSiPaQgRH9gpclsfiL4ksZfbm2VKdfLc=
Received: by mail-pg1-f177.google.com with SMTP id w15so14001646pgk.13
 for <linux-riscv@lists.infradead.org>; Sat, 10 Jul 2021 16:08:26 -0700 (PDT)
X-Gm-Message-State: AOAM532k9reI0eumKSkIx1ydrvHsf8aX/XAXzRac8V3zaagKL/5yluXF
 C8LoX29QXtCmnZwas76GShJ6Vw/VDOP9WqbKqWA=
X-Google-Smtp-Source: ABdhPJyBa7wMiayi1ErSAh3ldGm6dx2ZY5JoyPvQw5M4KtTZ2dOOWv17h2lZwMrUOjEQAXpV+yA5JCGWg7/gJP9llqY=
X-Received: by 2002:a62:5b81:0:b029:32a:dfe:9bb0 with SMTP id
 p123-20020a625b810000b029032a0dfe9bb0mr4818627pfb.0.1625958505677; Sat, 10
 Jul 2021 16:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
 <20210710143109.fd5062902ef4d5d59e83f5bb@linux-foundation.org>
In-Reply-To: <20210710143109.fd5062902ef4d5d59e83f5bb@linux-foundation.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Sun, 11 Jul 2021 01:07:49 +0200
X-Gmail-Original-Message-ID: <CAFnufp1d+FH1K5QAx+Z=KvMUvrveJAVnjJJc8xoDCn2wmzUOoQ@mail.gmail.com>
Message-ID: <CAFnufp1d+FH1K5QAx+Z=KvMUvrveJAVnjJJc8xoDCn2wmzUOoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] lib/string: optimized mem* functions
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
 David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>, 
 linux-arch <linux-arch@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_160827_935337_492B60EF 
X-CRM114-Status: GOOD (  17.79  )
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

On Sat, Jul 10, 2021 at 11:31 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Fri,  2 Jul 2021 14:31:50 +0200 Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
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
> > These are the performances of memcpy() and memset() of a RISC-V machine
> > on a 32 mbyte buffer:
> >
> > memcpy:
> > original aligned:      75 Mb/s
> > original unaligned:    75 Mb/s
> > new aligned:          114 Mb/s
> > new unaligned:                107 Mb/s
> >
> > memset:
> > original aligned:     140 Mb/s
> > original unaligned:   140 Mb/s
> > new aligned:          241 Mb/s
> > new unaligned:                241 Mb/s
>
> Did you record the x86_64 performance?
>
>
> Which other architectures are affected by this change?

x86_64 won't use these functions because it defines __HAVE_ARCH_MEMCPY
and has optimized implementations in arch/x86/lib.
Anyway, I was curious and I tested them on x86_64 too, there was zero
gain over the generic ones.

The only architecture which will use all the three function will be
riscv, while memmove() will be used by arc, h8300, hexagon, ia64,
openrisc and parisc.
Keep in mind that memmove() isn't anything special, it just calls
memcpy() when possible (e.g. buffers not overlapping), and fallbacks
to the byte by byte copy otherwise.

In future we can write two functions, one which copies forward and
another one which copies backward, and call the right one depending on
the buffers position.
Then, we could alias memcpy() and memmove(), as proposed by Linus:

https://bugzilla.redhat.com/show_bug.cgi?id=638477#c132

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
