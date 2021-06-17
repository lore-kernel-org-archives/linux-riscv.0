Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE4BC2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 21:49:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A2460FF1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 21:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62A2460FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rp8aLB2x96GbjjRLUycoIQbCj3gjcTO1Ww0uNK/3K00=; b=aAB5b6Fs/MgyWK
	UTJ/u1AqVEpWfvZUnvaIijJZLtVSCwS6hDyI0/CSCecEjNigHccNjrUqBBrULD0WeD4mKUyLTxvWd
	PKM8Q2Uquym2krf+1wqofzUn9UOD968v2zMEL95f6R5sPieAdnmUgI7J/Y03zP2QoNUrT02O2fZ4N
	lNvLtyTkJFqAohlnycalJtjc67Lt/UvW+fx42URwKGanmtwm9ZIoJYPnFdBluVaC8wBfqUmKFSGeJ
	xLzhvLLby0zEootG1gh83CRskt+G0VPurxA0fzpIfi3NBsj4JxUd9+xLu/E2l5tDpg4sVeSQr/Cdv
	1kzMdrBa2x5QvXsLxU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltzst-00BsdM-V9; Thu, 17 Jun 2021 21:49:11 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltzsr-00BscX-Ei
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 21:49:11 +0000
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by linux.microsoft.com (Postfix) with ESMTPSA id CFFC020B6AEE
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 14:49:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CFFC020B6AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1623966547;
 bh=iOxmam1hxsYf6Bv7Bb3oOlwGwzgEo/722mgFg6/iGpE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ibSIfbBmyJYDw8/UWYKpUQGxmHNuDu0MRvAyGNy+c95/BnDOp7ZTW9zNpKxPLts19
 55NTE3ZXCYEnTQtGM6ekpqtH/wNPoAHdCCpkShwRMFY/T9Or3HT+s/tqiH1SqxhxqB
 h9CoAbLv2b8xsr//Egwd30wlGBPyEax2qpzc4XbU=
Received: by mail-pg1-f178.google.com with SMTP id e20so6094020pgg.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 14:49:07 -0700 (PDT)
X-Gm-Message-State: AOAM531uA17s50KaE2R08UyThxSwI73v5/XzaU3yHRcFmHmdAFmpak33
 C19zIKHJxoKPKZbOx3TV33c27k26V8FlvnYai4M=
X-Google-Smtp-Source: ABdhPJyke/C7KbeDnN/bSq8cETCQLuetyQe+T++OgpvF6JWJDrzSnoEja5DxSnRQ8F98Myf3zBKubi+N4iHqVOpCEZo=
X-Received: by 2002:a63:d053:: with SMTP id s19mr6823948pgi.326.1623966547451; 
 Thu, 17 Jun 2021 14:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <CAJF2gTTreOvQYYXHBYxznB9+vMaASKg8vwA5mkqVo1T6=eVhzw@mail.gmail.com>
 <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
 <f9b78350d9504e889813fc47df41f3fe@AcuMS.aculab.com>
In-Reply-To: <f9b78350d9504e889813fc47df41f3fe@AcuMS.aculab.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Thu, 17 Jun 2021 23:48:31 +0200
X-Gmail-Original-Message-ID: <CAFnufp1CA7g=poF3UpKjX7YYz569Wxc1YORSv+uhpU5847xuXw@mail.gmail.com>
Message-ID: <CAFnufp1CA7g=poF3UpKjX7YYz569Wxc1YORSv+uhpU5847xuXw@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_144909_588185_F74A4BB4 
X-CRM114-Status: GOOD (  32.05  )
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

On Thu, Jun 17, 2021 at 11:30 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Matteo Croce
> > Sent: 16 June 2021 19:52
> > To: Guo Ren <guoren@kernel.org>
> >
> > On Wed, Jun 16, 2021 at 1:46 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > Hi Matteo,
> > >
> > > Have you tried Glibc generic implementation code?
> > > ref: https://lore.kernel.org/linux-arch/20190629053641.3iBfk9-
> > I_D29cDp9yJnIdIg7oMtHNZlDmhLQPTumhEc@z/#t
> > >
> > > If Glibc codes have the same performance in your hardware, then you
> > > could give a generic implementation first.
>
> Isn't that a byte copy loop - the performance of that ought to be terrible.
> ...
>
> > I had a look, it seems that it's a C unrolled version with the
> > 'register' keyword.
> > The same one was already merged in nios2:
> > https://elixir.bootlin.com/linux/latest/source/arch/nios2/lib/memcpy.c#L68
>
> I know a lot about the nios2 instruction timings.
> (I've looked at code execution in the fpga's intel 'logic analiser.)
> It is a very simple 4-clock pipeline cpu with a 2-clock delay
> before a value read from 'tightly coupled memory' (aka cache)
> can be used in another instruction.
> There is also a subtle pipeline stall if a read follows a write
> to the same memory block because the write is executed one
> clock later - and would collide with the read.
> Since it only ever executes one instruction per clock loop
> unrolling does help - since you never get the loop control 'for free'.
> OTOH you don't need to use that many registers.
> But an unrolled loop should approach 2 bytes/clock (32bit cpu).
>
> > I copied _wordcopy_fwd_aligned() from Glibc, and I have a very similar
> > result of the other versions:
> >
> > [  563.359126] Strings selftest: memcpy(src+7, dst+7): 257 Mb/s
>
> What clock speed is that running at?
> It seems very slow for a 64bit cpu (that isn't an fpga soft-cpu).
>
> While the small riscv cpu might be similar to the nios2 (and mips
> for that matter), there are also bigger/faster cpu.
> I'm sure these can execute multiple instructions/clock
> and possible even read and write at the same time.
> Unless they also support significant instruction re-ordering
> the trivial copy loops are going to be slow on such cpu.
>

It's running at 1 GHz.

I get 257 Mb/s with a memcpy, a bit more with a memset,
but I get 1200 Mb/s with a cyle which just reads memory with 64 bit addressing.

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
