Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103F9C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lq1gv8EHogQeFP7WkePVX5s0uMOEr/11+sXqG/xIXEI=; b=a3OMvs8j268fXk
	znc6PHApWS4h0QpFY1D2NKPbCxoHoLR2s8aIEGWOyZY9PHVWXnytzbF5PilmcQkaOFx07hj3ruMeR
	G9y3VlLjsgkehRBBKuhCYqd5bGVKDhv4L6nrBNTLduFLPacb3ePfQC2nMb2XsVu+ABzetrD3WzNZs
	eJi/R0F7HbtfPl0HV26eHcZX+feEESgwsnxRv2/JMD5pNFXbS3zp5nFfBcJLS5OHc6rhgc7m85/z6
	8oVIcZgAAqvB4fQGcViULhbtuqyaRnPBgkjo2cht7pFtJDAeOLLeSUqjJaBZRw1l7cgkyR6wFrYqH
	8yn4+Rwvfa+//xDiArcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVNS-00GWN3-01;
	Mon, 31 Jul 2023 16:04:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVNN-00GWLk-1p;
	Mon, 31 Jul 2023 16:04:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E692611F6;
	Mon, 31 Jul 2023 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC273C433C7;
	Mon, 31 Jul 2023 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690819444;
	bh=5mjxkRGYdDJHi8iwtbjaqm+ZNCwOd9w23JucUBfspJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsmshpuMt1cGOfRI5e/3xtukcr4V0We1YeC5wgMpz8W+RgsWHtFaqOAQtAPALNj9U
	 2R9y3xAC3kuregKU/3WvvqNt6xi4ujaay08GQOOmiKl0CstMwYlAbsVesU/0ntB2bM
	 AWLnvPC6bQ880pLICLLUzYb5Gndqj5nND6Nyq0/fac/Me4PTRDzaltX5SaM3WqLnik
	 65rkjwWALQbwb05YmTKdaishaSzwx6hYePIJ6htVXei03FGUIRmZt55uX+UG+cb0DI
	 dIEhkXlD6c0ivqDvlf0L0cPy1q5c79cwAx6c/o4hF2xPDzbG3OYNyyUmHEUJGuPbj6
	 3ZUtXa3EY5ulQ==
Date: Mon, 31 Jul 2023 09:04:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	Linux-Arch <linux-arch@vger.kernel.org>, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
Message-ID: <20230731160402.GB1823389@dev-arch.thelio-3990X>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
 <1687443219-11946-2-git-send-email-yangtiezhu@loongson.cn>
 <20230727213648.GA354736@dev-arch.thelio-3990X>
 <1777400a-4d9c-4bdb-9d3b-f8808ef054cc@app.fastmail.com>
 <20230728173103.GA1299743@dev-arch.thelio-3990X>
 <a2fa1a31-e8bb-4659-9631-398b564e7c2b@app.fastmail.com>
 <20230728234429.GA611252@dev-arch.thelio-3990X>
 <e7a792d9-39b9-440a-9c22-99e25b25a396@app.fastmail.com>
 <20230729174617.GA1229655@dev-arch.thelio-3990X>
 <6d6641b6-748e-412c-a139-35fc873a6a1b@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d6641b6-748e-412c-a139-35fc873a6a1b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_090405_694417_7DE7B1D1 
X-CRM114-Status: GOOD (  45.83  )
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

On Sat, Jul 29, 2023 at 11:12:26PM +0200, Arnd Bergmann wrote:
> On Sat, Jul 29, 2023, at 19:46, Nathan Chancellor wrote:
> > On Sat, Jul 29, 2023 at 09:59:23AM +0200, Arnd Bergmann wrote:
> >> On Sat, Jul 29, 2023, at 01:44, Nathan Chancellor wrote:
> 
> >> 
> >> in order to get the ORC definitions from asm/orc_types.h, but
> >> then it looks like it also gets the uapi/asm/bitsperlong.h
> >> header from there which contains
> >> 
> >> #if defined(__x86_64__) && !defined(__ILP32__)
> >> # define __BITS_PER_LONG 64
> >> #else
> >> # define __BITS_PER_LONG 32
> >> #endif
> >> 
> >> and this would set __BITS_PER_LONG to 32 on arm64.
> >> 
> >> However, I don't see this actually being included on my
> >> machine. Can you dump the sorttable.c preprocessor output
> >> with your setup, using -fdirectives-only, so we can see
> >> which of the two (__BITS_PER_LONG or BITS_PER_LONG) is
> >> actually wrong and triggers the sanity check?
> >
> > Sure thing, this is the output of:
> >
> >   $ gcc -I/linux-stable/tools/include 
> > -I/linux-stable/tools/arch/x86/include -DUNWINDER_ORC_ENABLED -I 
> > ./scripts -E -fdirectives-only /linux-stable/scripts/sorttable.c
> >
> > https://gist.github.com/nathanchance/d2c3e58230930317dc84aff80fef38bf
> 
> Ok, so what we get is that the system-wide
> /usr/include/aarch64-linux-gnu/asm/bitsperlong.h
> 
> includes the source tree file 
> tools/include/asm-generic/bitsperlong.h
> 
> which in the old kernels only has the "32" fallback value.

Ah, makes perfect sense.

> >> What I see on my machine is that both definitions come
> >> from the local tools/include/ headers, not from the
> >> installed system headers, so I'm still doing something
> >> wrong in my installation:
> >
> > Just to make sure, you have the 6.5-rc1+ headers installed and you are
> > attempting to build the host tools from an earlier Linux release than
> > 6.5-rc1? I don't see a problem with building these host programs on
> > mainline/6.5, I see this issue when building them in older stable
> > releases (my reproduction so far has been on 6.4 but I see it when
> > building all currently supported long term stable releases) when I have
> > the 6.5-rc1+ headers installed.
> 
> Ok, I see. I missed that part of your description earlier.
> 
> >
> > which seems to be where the mismatch is coming from?
> 
> Right, exactly.
> 
> >> ./tools/include/asm-generic/bitsperlong.h
> >> #define BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
> >> 
> >> Neither of these files actually contains the sanity
> >> check in linux-6.5-rc3, and comparing these is clearly
> >> nonsensical, as they are defined the same way (rather
> >> than checking CONFIG_64BIT), but also I don't see why
> >> there is both a uapi/ version and a non-uapi version
> >> in what is meant to be a userspace header.
> >
> > May be worth looping in the tools/ folks, since that whole directory is
> > rather special IMO...
> 
> I think the good news is that this only happens because
> the tools/ directory contains a copy of the kernel headers
> including that sanity check, and other user space won't
> suffer from it because they don't contain copies of kernel
> internal headers.

Yeah, I think you are correct.

> Reverting the change might still end up being the easiest way
> out regardless, but it does seem like we should be able
> to address this in the tools directory by making sure it doesn't
> mix the installed headers with the local ones.

Agreed, although you do make a good point below that we would need the
fix in the stable trees, which adds additional complexity when it comes
to things like bisecting. It is already hard enough with all the various
clang behavior changes we have had to adapt to over the years...

> Part of the problem I think is that the installed 
> /usr/include/asm-generic/int-ll64.h includes
> /usr/include/aarch64-linux-gnu/asm/bitsperlong.h, so both
> of them are the uapi headers, but this one has an
> "include <asm-generic/bitsperlong.h>" that expects the
> uapi version but instead gets the kernel version from
> the tools directory. We could override this by adding
> a working tools/include/asm-generic/bitsperlong.h header,
> but that has to be backported to the stable kernels then.

but this does not sound like it would be the end of the world, I do not
have to bisect too often and even if I have to, using a userspace
without these headers is generally possible.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
