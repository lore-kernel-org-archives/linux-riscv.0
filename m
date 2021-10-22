Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3116C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1256112F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC1256112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atGVEsg9rgWVP+YD/7nmmH7314Y+Jw0k4KtQ3XTBduQ=; b=DGMJNL3ni68vdn
	RSGJjv+aUrY5dWEhHLAr2o5ExBmY9VmF/ZwAmjfeyqbVbIQVJBmmR4DlrT2hFfQad6Vvx9DhXGlYr
	NSQcQl9FZgMgyKfPC53Fv5nyCj8CIsnXF5m92ZzsWvSl0N27ilzwcK6ntsoLs9Ca3VDDk/kOptry4
	hVxtPFXFirlAdJk9qvm6wesdese182IMu7K38vHTvJWaDygiCYRUjzln0Hpu0KGkjRRuUNMRPO37J
	5A7LACT01wDMPJSFQsrEuBYxc5t9RAqaTfiofHZ7G9Rw4RvQxgrZWHL85p2ncUM73SIbsRprE+NEs
	Qmk5DslxqmbZCKQygXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduwO-00BABs-FB; Fri, 22 Oct 2021 13:50:36 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduwK-00BAAs-Rk
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:50:34 +0000
Received: by mail-pj1-f54.google.com with SMTP id oa4so3014313pjb.2
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4VAlxqjX7tVS4RVU1hVLMwxlt5HBKt4g0cT2A4i/lc=;
 b=D7cMh44zYaMwvQiVvTl6A0Hs3a3uIY/LJLyypYFmbq+Zkc2gAyypdKXW/x3+LwAuA3
 FT3lOzislLJjRJcJujD3P+lPSTOXdrrsbv9yx4PybWbiSVVAQyGcn4E2dXWV1Pxy0Jor
 TUJ6AfnwjKrB3ruquh4BiruZHttVkAi7j0FlbZICOqIDZj0HEAciM+bO4ujtv6xhm28O
 RUFMB2kdM71LNxhofa2k5Vyp3ghh8iHSPIBHMZQHKZT4AY0AiNqqEVVJxmNHQKv940zL
 qqPK7ArAmEoZggMa7afZ0SRF9hGFLOFr8YL6XAhKO27U7Tx6kXAfQ5tHscHYloHTV4d/
 fsEw==
X-Gm-Message-State: AOAM530Mf7j/2RFFOeClg7tCvZhdSRB9++dwEkZq1PfZK0cf8FJIB3PX
 z5tWX2ECtW490Dru51SlYEj22lOsOJB6xqZT2/c=
X-Google-Smtp-Source: ABdhPJxD84S/qyVc64yZN7zn360JIvYLyRoTZQ+nTLW8NPOh4R0Onceuz8xIbXKjs/Zs0RMr8FooFXCbqrByMUrAzuI=
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr13560608pjb.185.1634910632123; 
 Fri, 22 Oct 2021 06:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
In-Reply-To: <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 15:50:21 +0200
Message-ID: <CANBLGcxDUNib4C0mrP1bYnJSLyZn7rmV1wwJyj5tK4-nbMnu9g@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20211022_065032_923253_BCC6BA72 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > Why all these ugly % 32 against constants?
> >
> > Because the JH7100_RST_ values goes higher than 31. There is a
> > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > machine.
>
> And? It's exactly what you have to use!


> > > Can you convert this to simple
> > >
> > >   if (assert)
> > >     ret = readl_...
> > >   else
> > >     ret = readl_...
> > >
> > > below?
> >
> > I don't see how that would work. We're using the done value in in the
> > readl_poll_timeout. Maybe you can be a bit more explicit.
>
> Supply done either == mask or == ^mask. Try it.

So you want this?
if (assert)
  ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
done, 0, 1000);
else
  ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
^done, 0, 1000);

The compiler might be clever enough, but I'd worry the long body of
the readl_poll_timeout_atomic macro is inline twice. Rather than just
flipping the bit in `done`.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
