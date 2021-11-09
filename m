Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD274C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8604460EDF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8604460EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GV7sEL/m/8/ECRGn7ynu/hMzAsvaDGVP8XORIEwWzXY=; b=tlzTlEHUIHEZwk
	sOE57TDMQd2IZRiITT82hvC8RpguMcjMoyTsmHGLN7W8qp453GT/04zrt2VS1krexeKJH2bUInSeB
	O/Ia5qj7+vF5Z3O5mZVD+Gu8B3aarM+vbU3bjhxBGxtKFaHIHco9SYzzebo4smYYzlnbvbjtgkluA
	F5S+RRj40cXgK0/FHEu5wfPwfv/YPa+O7ZhubnAL9hFbhNrqStaSKVES9k1s0Sr/faPmf2gUJCBAL
	IA3jMiv73UevhQsk4CU5/iyIRInfyJJ4rDZi9VByGWgtoU68qKgCELvE/08b4OLTu+osU+5tkzpij
	x+WcAWTc19lvk8OVMVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNYz-001G7D-UK; Tue, 09 Nov 2021 09:37:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNW1-001FPC-KJ
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:34:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b15so54740732edd.7
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lcKEhYP4+yPtNIxKXGgbgdUfjg0mHGJfVwUnsoOpxAY=;
 b=oBOlsPNFn0gaiki/GKvqQJhMANbtFxOs60cmycBfbRyX7suhZrv7wMadmLWmbukSj0
 WVppmPtJZ6QZzoQmxVXt2p0O/MEph5yQ6OEO0Mq85tIq+XybH2FvFsxa+mV+WC6ntqhX
 Cqn3eUugJJjA2il/u7B3VbpqcJmouLsZX0gwdDQl6qmPuf6++BE8k4aGNeShMRCnyvWP
 FU6osIQjARDVHbACUoCWr6fsdL/wX3pRQfOy0rbHO7zbCF+egA0hXhU43sqZhvH1K6uK
 aXrMvmzo7eqBHdkR2x1eKQd7P2QvL6P/WCK8/cYgqmJc1Mgp1IaP9tRdkLTTxz5la/ve
 xFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lcKEhYP4+yPtNIxKXGgbgdUfjg0mHGJfVwUnsoOpxAY=;
 b=CZmgKnv+jLepGBvn5hTBXIcqnWYzE3PBK9vZWDOllD0CpHuZ//bA03oPgGo4XolnFY
 maMFK7XOnFEttgdL+5EjVQOdKzZZk8OZHqx+gHO5Yuma41D17KK0X00p0Czxh7D3tTfQ
 62aS2hfY7N9qvdk8KlSg56/Xi2O2FCo7hm567AE9SbGShyzTeMlZ7vnGuGdOZ36vMazd
 QOz4+NXLTapdagcpiA8iFtGBBxMN7Po0pE5aGw/dr4zasDgbBcCyDYUY65R0VYMaKZVo
 i3tcX323iUNrdv3ns+PyaVfidy8NPwwQeZbH8MF5GzWY6AjHMm1LQXOyP3IWGipJ+col
 dKBg==
X-Gm-Message-State: AOAM5313Nj/0QFJD3qD82sBqFj/TLXIVDLYq8vdS1gY5t5envh6JhEMY
 fMPKuARPqFb0+cvbT2n5fKPSJp6ajuW2sMOJ+Wg=
X-Google-Smtp-Source: ABdhPJy0dDm/mlyjTZTlzLyJP2VMt8V9BsgSHXvzkfxp3RQMuGYj214mbiDUSn4mWhvgON2nHHH6KEoHezuFlsRgyYI=
X-Received: by 2002:aa7:cb09:: with SMTP id s9mr8212855edt.359.1636450443458; 
 Tue, 09 Nov 2021 01:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
In-Reply-To: <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Nov 2021 11:33:18 +0200
Message-ID: <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
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
X-CRM114-CacheID: sfid-20211109_013405_717182_7BA30419 
X-CRM114-Status: GOOD (  29.69  )
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

On Tue, Nov 9, 2021 at 11:21 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 02:01, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > > Linus any comments on this code (sorry if I missed your reply)? The
> > > idea behind above is to skip all settings from the same category and
> > > apply only the last one, e.g. if we have "bias set to X", ..., "bias
> > > disable", ..., "bias set to Y", the hardware will see only the last
> > > operation, i.e. "bias set to Y". I think it may not be the best
> > > approach (theoretically?) since the hardware definitely may behave
> > > differently on the other side in case of such series of the
> > > configurations (yes, I have seen some interesting implementations of
> > > the touchpad / touchscreen GPIOs that may be affected).
> >
> > That sounds weird. I think we need to look at how other drivers
> > deal with this.
> >
> > To me it seems more natural that
> > starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > would get called at the end of each iteration of the
> > for (i = 0; i < num_configs; i++) loop.
>
> That would work, but when the loop is done the end result would be
> exactly the same.

It seems we interpret the term "result" differently. The result when
we talking about GPIOs is the series of pin state changes incl.
configuration. This is how it should be recognized when programming
hardware.

>  The only difference is that the above would rapidly
> "blink" the different states during the loop until it arrives at the
> result. This would certainly be different, but it can never be the
> intended behaviour and only a side-effect on how the pinctrl framework
> works.

Is it? That's what I'm trying to get an answer to. If you may
guarantee this (the keywords "intended behaviour" and "side effect"),
I wouldn't object.

> The order the different states are blinked depends entirely on
> how the pinctrl framework parses the device tree. I still think it
> would be more natural to cleanly go to the end result without this
> blinking.


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
