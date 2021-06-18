Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F06C2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 01:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83116600D1
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 01:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83116600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnF+KglcKF3Dl8RGivgu1NKVcXysubZiyUNMZaRrrwI=; b=nL0xtiWZSnFwa4
	SDsP/G5tLXBTdSf5oyyrXu3Xczw3VQywLi56JWfmcaM1MtZsEIzpDCnfHeROz2iC/YMjHUuKJyKYJ
	TPid0IVFyV7hcN+Jbf1WNj9LSz5Oz5UHIsChpkvohNEaqe48KOueNjRtBs/nUN9U3wAnse4M9uWRX
	PwF01zBRU8nEgyM7LVuhvqJGujwrIIh5FJLQfUFL0jnygCv/9YnFdAjdL9uOyB3D52UEDec1eUCJZ
	011YP2v6kw84OgQwOV7GER7KFKIIPLpdrFfqVCmGnRjHBfPRj2OIywHog6CeXBgWClFVhgyUGR62z
	KXIqfrp0eflTncOvDetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu2xV-00CFo7-B9; Fri, 18 Jun 2021 01:06:09 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu2xS-00CFnM-To
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 01:06:08 +0000
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0281920B83F2
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 18:06:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0281920B83F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1623978361;
 bh=bcgnjvQBfThviAfC+nD0r2UT09RJuWAKCqEqQjpA3Og=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fUL6DWKLJQUl6vGWhBUXX+k/2dBmtGWCQxF7DjcAdmRLWwjVd1iZZDodMcxjpTpdf
 5qheHDrPcxAEBOmU2QOutsCe9ZY+2rSDqtIUnXNkbCXXFHAGCjk7vGLkx6r1krTRrK
 v9LKbFrGUrExxaaqW8kNvsOShTkFnuIj9ewAOX9c=
Received: by mail-pj1-f54.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4896903pjp.2
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 18:06:00 -0700 (PDT)
X-Gm-Message-State: AOAM530KffmQ0V2IgYmMYzaAq+OHqvoLeoBTrx+7QY9/ydQmxufShKom
 /aVjDOpsH21Co2s2YCtl3HXdmzxBtaZTpxdDxoE=
X-Google-Smtp-Source: ABdhPJy1CyLirX67m04udv8UHON+e5LssQwZjwMZGuMURb8bRjcpQvLKYFf0zMAVsCblD14Q5nNYc/2Dk/zxdAQjUN4=
X-Received: by 2002:a17:90a:650b:: with SMTP id
 i11mr8254024pjj.39.1623978360544; 
 Thu, 17 Jun 2021 18:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <CAJF2gTTreOvQYYXHBYxznB9+vMaASKg8vwA5mkqVo1T6=eVhzw@mail.gmail.com>
 <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
 <f9b78350d9504e889813fc47df41f3fe@AcuMS.aculab.com>
 <CAFnufp1CA7g=poF3UpKjX7YYz569Wxc1YORSv+uhpU5847xuXw@mail.gmail.com>
 <CAFnufp2LmXxs6+aH7cjH=T4Ye_Yo6yvJpF93JcY+HtVvXB44oQ@mail.gmail.com>
In-Reply-To: <CAFnufp2LmXxs6+aH7cjH=T4Ye_Yo6yvJpF93JcY+HtVvXB44oQ@mail.gmail.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 18 Jun 2021 03:05:24 +0200
X-Gmail-Original-Message-ID: <CAFnufp0qjJG4fr=rcAHYrZp3CVfSs0TBuDN_eAOwOM-K804yow@mail.gmail.com>
Message-ID: <CAFnufp0qjJG4fr=rcAHYrZp3CVfSs0TBuDN_eAOwOM-K804yow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210617_180607_049758_69DA174D 
X-CRM114-Status: GOOD (  40.86  )
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

On Fri, Jun 18, 2021 at 2:32 AM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> On Thu, Jun 17, 2021 at 11:48 PM Matteo Croce
> <mcroce@linux.microsoft.com> wrote:
> >
> > On Thu, Jun 17, 2021 at 11:30 PM David Laight <David.Laight@aculab.com> wrote:
> > >
> > > From: Matteo Croce
> > > > Sent: 16 June 2021 19:52
> > > > To: Guo Ren <guoren@kernel.org>
> > > >
> > > > On Wed, Jun 16, 2021 at 1:46 PM Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > Hi Matteo,
> > > > >
> > > > > Have you tried Glibc generic implementation code?
> > > > > ref: https://lore.kernel.org/linux-arch/20190629053641.3iBfk9-
> > > > I_D29cDp9yJnIdIg7oMtHNZlDmhLQPTumhEc@z/#t
> > > > >
> > > > > If Glibc codes have the same performance in your hardware, then you
> > > > > could give a generic implementation first.
> > >
> > > Isn't that a byte copy loop - the performance of that ought to be terrible.
> > > ...
> > >
> > > > I had a look, it seems that it's a C unrolled version with the
> > > > 'register' keyword.
> > > > The same one was already merged in nios2:
> > > > https://elixir.bootlin.com/linux/latest/source/arch/nios2/lib/memcpy.c#L68
> > >
> > > I know a lot about the nios2 instruction timings.
> > > (I've looked at code execution in the fpga's intel 'logic analiser.)
> > > It is a very simple 4-clock pipeline cpu with a 2-clock delay
> > > before a value read from 'tightly coupled memory' (aka cache)
> > > can be used in another instruction.
> > > There is also a subtle pipeline stall if a read follows a write
> > > to the same memory block because the write is executed one
> > > clock later - and would collide with the read.
> > > Since it only ever executes one instruction per clock loop
> > > unrolling does help - since you never get the loop control 'for free'.
> > > OTOH you don't need to use that many registers.
> > > But an unrolled loop should approach 2 bytes/clock (32bit cpu).
> > >
> > > > I copied _wordcopy_fwd_aligned() from Glibc, and I have a very similar
> > > > result of the other versions:
> > > >
> > > > [  563.359126] Strings selftest: memcpy(src+7, dst+7): 257 Mb/s
> > >
> > > What clock speed is that running at?
> > > It seems very slow for a 64bit cpu (that isn't an fpga soft-cpu).
> > >
> > > While the small riscv cpu might be similar to the nios2 (and mips
> > > for that matter), there are also bigger/faster cpu.
> > > I'm sure these can execute multiple instructions/clock
> > > and possible even read and write at the same time.
> > > Unless they also support significant instruction re-ordering
> > > the trivial copy loops are going to be slow on such cpu.
> > >
> >
> > It's running at 1 GHz.
> >
> > I get 257 Mb/s with a memcpy, a bit more with a memset,
> > but I get 1200 Mb/s with a cyle which just reads memory with 64 bit addressing.
> >
>
> Err, I forget a mlock() before accessing the memory in userspace.
>
> The real speed here is:
>
> 8 bit read: 155.42 Mb/s
> 64 bit read: 277.29 Mb/s
> 8 bit write: 138.57 Mb/s
> 64 bit write: 239.21 Mb/s
>

Anyway, thanks for the info on nio2 timings.
If you think that an unrolled loop would help, we can achieve the same in C.
I think we could code something similar to a Duff device (or with jump
labels) to unroll the loop but at the same time doing efficient small copies.

Regards,

--
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
