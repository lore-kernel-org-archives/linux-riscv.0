Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DD3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:57:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14C6360FBF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14C6360FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+tlClsWAYibPpGn+V1fgpOcBxiGJUSsU7TtM3B1dQs=; b=wE65/X8PUBNFCc
	MqlWfRYB/MYgMfcxXBFLP1cM5y9f98kv0qTXveCz7WegkdhZwbwq6NGhy1vskc3VqgBdmX+SDEBTF
	RmWTceYvgxcKRkGA45dgrLmdWz3YZLtLpngtPx9E0IBAGsZWR3KfoPMAR8eKQ+0xGPyuHPE99N0Is
	os9urZ4gCRrkSuScLqJ72Hnu7wSa8Qdtywxy1szKnpxEVqAtseBgcphe9aCLy7kDsZ9NAv1LNZ0TT
	4nIMh9nw4bP2W/EP81GFNPjivNKmht6ai+74lrBEfCdixaFyGX3WRyh+Y8E/0zzWvOWblK9eqHtTS
	KJSXZnG6RPD2BapUoYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdv2x-00BAvS-Ev; Fri, 22 Oct 2021 13:57:23 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdv2v-00BAuN-4C
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:57:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id d3so1964088edp.3
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N2LgKJHjAxWATzIP8s9Chgsauqr0Jq39ANiFQNTNdvA=;
 b=atHm7dWYDFc+xMMI0nEXnjBKGmTe3Mhj3j44gptKPmL3yZSmcfPhGBE64YsimpDkRj
 3JNapsquzvEaRN4rlLZm/e3gAK6PuH4inkVvuQzMmWJD4Fw6FTtWQPCXkgqDCuh7EULb
 yNTTsoQRo9uDej/o2MZxfOP65jPJvwE94CFsaqfNuZNaXjAjM/EmrMyiG4Xju744vWFB
 MF6JOygy44c4b8O8vYFaLC36mbgBaHx84E22kFUgJLaYtkfz/IR1K5WkWIspkHAhxZrf
 ER3rtRGr7XHV0NpNgjyePT0QzWIZ2EsAHQ7higGfSHKW8azFx28d7dx9gfAmHjBCNF4f
 aSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2LgKJHjAxWATzIP8s9Chgsauqr0Jq39ANiFQNTNdvA=;
 b=tkjBfjqs8eQ5B3Ct985u2EJlKQBtd2LU8+DGdz/F83/BHcwjs/2AymsvwxZfLwIcsy
 3dMRg6b/b1wkfjKsKTN3AVGQ5go7bQmsv+5rSBnl6kJRPH5r371PgnEFsMcbZpXFp7OO
 Q1khPx2kJTHZykB95G5vwVSFqBs0LaBiULJX3qE0zBcTecR0ZOJkM5llqAYZjLDDocc3
 U3slQyvqZVoaJ7TSnDVSQmqCMnpfuVtGH5GJgav3IJEePqbUa47jFYSRlDunndHsU7Cw
 Fc5m+sOPL+1uWVVfD2IqkY57EjUmUEN0lpsZRtUHjuHKDvPlYr8uTX+ElSGnhPezHkQA
 ntVA==
X-Gm-Message-State: AOAM531wA4q+TJO2xurffkabmZL4BFkaRZrZRnr7X/enAEyklPjDvtzr
 DuI/EU29gG+vAlHiVQztGa8Ez8/+z8NE8ZD5fPA=
X-Google-Smtp-Source: ABdhPJxJM2m9jS5DjeNSJjBC4XIn4RTOgPs/zblzns86IWUdsSxE0UfgtL48RUJSZS0ETv3HMiVmN+oWWEz4xXDFYeE=
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr15492300ejd.425.1634911039873; 
 Fri, 22 Oct 2021 06:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcxDUNib4C0mrP1bYnJSLyZn7rmV1wwJyj5tK4-nbMnu9g@mail.gmail.com>
In-Reply-To: <CANBLGcxDUNib4C0mrP1bYnJSLyZn7rmV1wwJyj5tK4-nbMnu9g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 16:56:24 +0300
Message-ID: <CAHp75VfcTkpq17fzVmzdZVC=xCBFEajxmG2C79TkD1S5+9BNqg@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_065721_189246_5A3E18FF 
X-CRM114-Status: GOOD (  18.13  )
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

On Fri, Oct 22, 2021 at 4:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > Can you convert this to simple
> > > >
> > > >   if (assert)
> > > >     ret = readl_...
> > > >   else
> > > >     ret = readl_...
> > > >
> > > > below?
> > >
> > > I don't see how that would work. We're using the done value in in the
> > > readl_poll_timeout. Maybe you can be a bit more explicit.
> >
> > Supply done either == mask or == ^mask. Try it.
>
> So you want this?
> if (assert)
>   ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
> done, 0, 1000);
> else
>   ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
> ^done, 0, 1000);
>
> The compiler might be clever enough, but I'd worry the long body of
> the readl_poll_timeout_atomic macro is inline twice. Rather than just
> flipping the bit in `done`.

You have a point, although it would be nice to have confirmation of either.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
