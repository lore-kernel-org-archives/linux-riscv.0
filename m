Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D516C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 21:04:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E350861166
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 21:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E350861166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhmgH2oGxFW0Wp/EXJ3c9RvLaSLfDHFK+MgjqZqN+yM=; b=GunRHI41jASzgz
	ECiDiPA1AKv5W/JdFyegpE+89pk59YeZM6uxfMlAZRu1frFwc+k7FEtjjpqOMiWLtJOAQSaIAazRH
	R95cNrRt8K0QLklmNP9bFCrMNXTyQ9bnKxMf4YErQbGmRANtHL112V8AhKz5gcUq9mEXUX1nlCnlk
	rHhsu/ajX8yrztOpeeIe5Rd5Q+XIESwkGFlVPDR3hVg3P/rX9RIJHif9NODSCZDjol2lzWYjbpZry
	AITZTesqVU4NTion/Wu3SzXuKfqx0+IbKGRaeaRX6De2zV1mwq4rrnNcvGtWifJWkS9y+PwOMCm8R
	dJ5Ydk7uSBMWI1dy/mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkYIK-003Fpb-86; Tue, 09 Nov 2021 21:04:40 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkYIG-003FpC-FS
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 21:04:38 +0000
Received: by mail-pg1-f176.google.com with SMTP id g28so259877pgg.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 13:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8Y2jyNg7h9soMk4rEm6rzTo1BjlaELOxyIkvTVeIKc=;
 b=xOx9vv1yAd8meaZniKAFbYRtdEwlUPgp2ts49KjJKeCrx+prn4/s4Kowyi4XK8f20r
 UrphrcTqDsirnLk5VQal5TP1pyCOsItkWO/nn8NOgBSjI4GbCQtBexI91tCMPCx26eE4
 t/8i+kBFuaTsHeHNttRaVtD9JXjW8oRmuAGjaDusxSt2W5M/K5zJLTXGNN1wPvqydIxo
 /eDEJFqENjGqqRJqZBWbOOwwlzQ8aoSuSfNKDEA20ep6kYr/slHJFMHAJJKCHcmSM8sE
 k1z1/u9k728jpO/DYuBiG/46GoJPBGQ70x+F6OfIYBP9buC3tKfMdrd7P485mgy5eCeJ
 5YKg==
X-Gm-Message-State: AOAM532vgmfjjpEBx6XpGZoXiMJWK0fr71bMyyOd9ONDqKOpSnMJu0pP
 iz/iGkd9AJ+TGknocKKL+0+NFcLwK2LPLyBhbo1KeXQ29Ec=
X-Google-Smtp-Source: ABdhPJz1YJYHQflXJx0Bc84bAu1eZK8Iidi5ru1YEkbahK+1/iI8yZB/R/hQC6b2vi+cWBbhfBoFSTKZxNwGdzS5FHg=
X-Received: by 2002:aa7:8883:0:b0:49f:f87a:95de with SMTP id
 z3-20020aa78883000000b0049ff87a95demr9062124pfe.53.1636491875224; Tue, 09 Nov
 2021 13:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
 <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
 <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
In-Reply-To: <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 9 Nov 2021 22:04:24 +0100
Message-ID: <CANBLGcxT_a3J+uaaKazRkfJQoBjGGGiz9agAZUzMEmfJiVXXbw@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_130436_538614_699FEA17 
X-CRM114-Status: GOOD (  26.83  )
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

On Tue, 9 Nov 2021 at 21:29, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> > > > The order the different states are blinked depends entirely on
> > > > how the pinctrl framework parses the device tree. I still think it
> > > > would be more natural to cleanly go to the end result without this
> > > > blinking.
> >
> > Hmm.. but if going through the different states is what you want, then
> > wouldn't you need the device tree to have an ordered list of the
> > states rather than just a single node and also a way to tune how long
> > time the different states are blinked?
>
> In a way you are correct that the DT is a functional language and it's
> a bit lite a style sheet or prolog or something in that the end reduction
> is what counts.
>
> In this case, I would say something is weird if there are interim states,
> the yaml validation should not allow you to set the same thing back
> and forth in your DTS file.

Yes, exactly.

> Alas we are not perfect as in yaml validation isn't perfect either.
> I can't see what the problem is really, just write proper DTS files
> and there will not be any interim states, right?

No, I agree. I think it's only that Andy wasn't sure if these interim
states might be meaningful/useful.

> And if it is possible
> to write DTS files that have states and sequence requirements,
> these should be caught in validation. Should be.
>
> Yours,
> Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
