Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3135C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8693660D42
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8693660D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hw5ryLE5koJKefq+mx2AD5lK4VWIK60N1KBDaHgn9AA=; b=NME1C7UmEgVYmO
	AuntuDl6PJqc+xq6sjS3lOgGRP3oOEw4BnG0pRJkSuFwOr/stOiVKfeEI2Kdj5hXtDGwmsuKcTMgZ
	B/A1rze2CVfawgrU6aPBO6uNQvG5HxMtyYELO2ryJ+Vc0GIBIHx6fwda8xDWmunSWoLF1kLiAraXi
	CNu3wxjRn19c6o3mt2yq0vdo4jWj8d4M09dDP4L2Z/WVM3YfwuO/QUcvDrOd06FA0OCTotypXqgHo
	yg1px+LBs2zW86ZmvJfUe1/jFVBdVQZXzWbWgmsXt8B0iyLekplW2/jNXptZg7mEvZnL3ttqb2AfB
	wGC5tyPyZBo5KEBU8wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi0B4-002tzQ-Od; Tue, 02 Nov 2021 20:14:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi0B1-002txS-Qb
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 20:14:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id w15so1558562edc.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJFLiSk1bohG9mZsoNQbF3XHvwqAij8WqFoJj28EDDg=;
 b=iw12nbBwkXxBlIs9kJ77ChJtoTgBhLkikKNBw3ydVms2/+zd4Rpc52iHmLdyamERzo
 mbXMcNtz6C5TdJ31/yl+gsPUEkLWbNC4pXy3I4EE6NDc1Rc/8EDg1uqzxyWGiVCeJXs5
 IbTqvxDb4B1i3gnMMB3swodD7uXYz1YQsXMT2OBct0RMtcaikrhbeSbgR54o1eDNU2kX
 TdQlDpUbA7N2Efiqtwg2fOqZCZcCE/h3MIBzhuF7FN9wAH4UDXijEqmIPpM4HOs3A9XI
 iXkqdoACQpq+rM9mg9wIKuJ/bZQkTW9DJxMLWDEt/i2JoSRWEmF/aO6wt5n4oGz6ALpn
 3RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJFLiSk1bohG9mZsoNQbF3XHvwqAij8WqFoJj28EDDg=;
 b=7tgDhwBufZT7gakLPAIa2iVE33v42XnmqFbUdQualzvj/9mvyQ6IvrPF5rS6GYNIRh
 B9UodeTwXT0wHa6RpcOTJFJHuDRnXDALeWpTDCeAtOk16V2R77Ow6ERzVFXCUd+x5VXd
 3mX5Ofdzv5uQnYDPX+jXgBsWL37J2AI+QviRHnGGRPC5X1Ii06tJ5js1LDylZ/7GyOOq
 lvImWbX4Dkvkvs4mpFbSvTxRDRvkvkZJqySZehuixBmqzvDo0Wwt0z8JLe9JgnlJh+Sa
 1VVlagxw+Nl3w2+dmMMPdKwHgn69PVg2H4l4HAI9wAVUw20tPz+Pn2yLoCU3SBV5B2Gp
 vh+A==
X-Gm-Message-State: AOAM531nGRhCn1pZCkOQfLvmUwoZdyweaVRHj6XNzh5rfaFaH8oTqmnM
 6qzxoakTMzSpkPetVC6E24q5J6L2buQIVr2a22U=
X-Google-Smtp-Source: ABdhPJzCiSq8SUDEahY4JFXuCz6004Aep8GBG6mt9apB6pPfKprIfm9TWaTyyDtYdSgHzOyPQ2onwZ5CPNZ7cVRpjJc=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr48190395ejc.69.1635884072980; 
 Tue, 02 Nov 2021 13:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
In-Reply-To: <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Nov 2021 22:13:44 +0200
Message-ID: <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Yury Norov <yury.norov@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
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
X-CRM114-CacheID: sfid-20211102_131435_930278_CC2AFEAA 
X-CRM114-Status: GOOD (  29.41  )
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

On Tue, Nov 2, 2021 at 9:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +/*
> > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > + * same line.
> > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > + * though, so store the expected value of the status registers when all lines
> > > + * are asserted.
> > > + */
> >
> > Besides missing capitalization,
>
> I'm confused. it was you who wanted all comments to capitalized the same..

Yes and there are two types of the comments, one-liners and
multi-line. In multi-line you usually use proper English grammar,
where capitalization means what it means. For the one-liners just
choose either small letters or capital letters to start them with.

> 64bi

Something is missing here.

> if it sounds like bitmap, use bitmap.
> > I have checked DT definitions and it seems you don't even need the
> > BIT_MASK() macro,
> >
> > > +static const u32 jh7100_reset_asserted[4] = {
> > > +       /* STATUS0 register */
> > > +       BIT_MASK32(JH7100_RST_U74) |
> > > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > > +       /* STATUS1 register */
> > > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > > +       /* STATUS2 register */
> > > +       BIT_MASK32(JH7100_RST_E24),
> > > +       /* STATUS3 register */
> > > +       0,
> > > +};
> >
> > Yury, do we have any clever (clean) way to initialize a bitmap with
> > particular bits so that it will be a constant from the beginning? If
> > no, any suggestion what we can provide to such users?
>
> The problem is, that even if we could initialize this without the
> monstrosity in our last conversation a 64bit bitmap would still
> produce worse code. As it is now it's simply a 32bit load and mask
> with index and mask already calculated for the registers. In the
> status callback the mask can even be folded into the register read
> mask. With a 64bit bitmap you'd need to calculate new 64bit index and
> masks, and then conditionally shift the bits into position.

Why? You may use 8 byte IO (writeq() / readq() or their relaxed versions), no?

...

> If this reflection of the 32bit registers bothers you that much

What bothers me is hidden endianess issues (yeah, here it might be
theoretical, but consider that somebody will look at your code and use
it as the best example ever).

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
