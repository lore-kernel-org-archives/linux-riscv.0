Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B0AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5080D60F6E
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5080D60F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfRC+4Sza/MdtznBZKkXB0YVkLKeBz4wlwHJLMt0+Ik=; b=UctEOhD+Z0C5/S
	DoBQ567WhveTXvfGEfDoyQBl3PaxvYO+1L+fVRd/9OpA11AwFczlhlyRZq09L+rpDtLU9XVM+dYxQ
	O1oY5/U1sfpVeiX16OhMQxDAPT358opfCtuqNjN6mG1mf5pOj5M1xhGPTYjfWZxq8hHCnf0e+UEDw
	jJu22+sc95p/ZiKQ+jxC0ks2Nx2jlgp5XH9K0VlH0nmRQUXr6jhd5vjRIe8LOnqkL0psU2mzWFpc0
	iRc7n/R2GN2kWAPsxzkFxMaGC0XQpFdKDCp8xJVbvP1QWNfRsebnMf2Iq0+BsVp3wXtbVtcKBQR5f
	a+8vlYyPLRTKHyBDkFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvry-00BJei-Fb; Fri, 22 Oct 2021 14:50:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvrv-00BJdL-6I
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 14:50:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z20so3254871edc.13
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=va1CWMK0fvoaygUpYfBZZ7pMG5xay62hu0qP41q24WM=;
 b=CKeP7lytVF2WkjwAJ3hD8Kd6INjvDsFkxaVTxTc8yC/7vZCj1kMaef78g39jBHveY+
 S+AGNMDTKcU/WRpAh0Z2ezSX5BpxMM7ezZvxscn6c1tKQcNK1eM5hsI9Ym32DKcjSVQy
 dphH8+5XgSNA/4PxM217K/JrdtmTdIWlDR4lpZCKYpWMvk04aAkFE27YxQv9I7wpTwGu
 +q1Xew6H4P5lAszpRgfOgkUcckJJHk5qjCC5URaGmUHDjoj7e7aa0VJIJorxpXeC+pKc
 ApBzBILqxGdG03VcdSzpLItUi9rXzigsB3cagUGHuIR2Cj/c5ZIe1LGEPMLaX3tDPefr
 wCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=va1CWMK0fvoaygUpYfBZZ7pMG5xay62hu0qP41q24WM=;
 b=2zHOknPIwZN77KdTObE1wTDczdd9wmdp34m7knRovzV6m2vkwzZSMx2PrzNFOJ1TAV
 K0C1tnWpVn55KBp7FAdoK8HOVhSEqJQEQVNt6aDr9iV4RcKhKLkh1pxEo6hSJ2GIJSNV
 HC/bHBAZ1xmWhvasfAP5GiaN4f/7PIUisAuHWngSzV0faCuk88/v5NDFfhXDWe6MsNeY
 NDRo5963lx6+OJAjSQ24yY1hkhearAcUw6ISByj/4Z6h4s9qh3BDwLjhmYuHYPL64Pqi
 Y+SY1ScGnfqH3xXwoLPaRtTp/+gAlVPWYWdbByARP9o21YTWMXxTw+B8dTvIdWYF6vPg
 kwAA==
X-Gm-Message-State: AOAM533FKg8KTcFP5NZGO1QrNDAwYJNgNJHvG0t/Pml3L58kTO0OM8WF
 MuFtKzaMxLlAf1lU6sAte6oBI7O8qFla/wjkjGA=
X-Google-Smtp-Source: ABdhPJwOiHEsJ4IhKG97eFe3EyClQ4TryP+4xHxPKxWKTF6bELZAON/Gz0kQqsRsMvFmZwAxe1wY02W2uX56jXYO0tk=
X-Received: by 2002:a17:906:a158:: with SMTP id
 bu24mr58564ejb.356.1634914200398; 
 Fri, 22 Oct 2021 07:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
In-Reply-To: <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 17:49:04 +0300
Message-ID: <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211022_075003_260634_D9A6D665 
X-CRM114-Status: GOOD (  20.83  )
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

On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > Why all these ugly % 32 against constants?
> > >
> > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > machine.
> >
> > And? It's exactly what you have to use!
>
> So you want me to use an unsigned long array or DECLARE_BITMAP and
> juggle two different index and bit offsets?

What are the offsets of those status registers?
AFAICS they are sequential 4 32-bit registers.

So bitmap is exactly what is suitable here, you are right!
See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.

> Also is there a macro for handling that we'd then need 4 commas on
> 32bit COMPILE_TEST and 2 commas on 64bit?
> If you have some other way in mind you'll have to be a lot more explicit again.
>
> The point of the jh7100_reset_asserted array is that it exactly
> mirrors the values of the status registers when the lines are
> asserted. Maybe writing it like this would be more explicit:
>
> static const u32 jh7100_reset_asserted[4] = {
>         /* STATUS0 register */
>         BIT(JH7100_RST_U74 % 32) |
>         BIT(JH7100_RST_VP6_DRESET % 32) |
>         BIT(JH7100_RST_VP6_BRESET % 32),
>         /* STATUS1 register */
>         BIT(JH7100_RST_HIFI4_DRESET % 32) |
>         BIT(JH7100_RST_HIFI4_BRESET % 32),
>         /* STATUS2 register */
>         BIT(JH7100_RST_E24 % 32),
>         /* STATUS3 register */
>         0,
> };

--
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
