Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC86C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 17:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D4860E90
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 17:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66D4860E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sJUmgmXqmOemaZ9lnuFjeTLGf4l/PUC00Cnkyr+mrI=; b=j3Hlq583FxF5ZP
	nnSyt3VWk+FfbVwpjN+f9viJ6GIAEdjvE8aqOaxHbpnE7+tz2VQ58JCgCvuLeYRKA145sPhUpN0Tz
	tTb2JLxPpRjsaMY+qlLlhM3iaCqFzkJKXAW/KKevCJYljSQFSocDhD1LCbDpTeOOD4bFgijbl5V8O
	hZaMRu4V5w5c1xmjrriSo7JXrcpHGDWFMQKaBQtkiDKRgWtyeedWo/hzZRzbgKT+Rfw1UkfESqmcq
	qH51qJYhZZDvPEtaYQWXvu5D07+6mzjkHgVokfdYTUes0VC0ZDVgKTy2H/bR+MLilJUnBr2EG6iRK
	Dlc/boaWGyFqITNz7F+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcW2N-00Gaht-Eu; Mon, 18 Oct 2021 17:02:59 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcW2K-00GahD-AY
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 17:02:58 +0000
Received: by mail-pf1-f171.google.com with SMTP id q19so15215542pfl.4
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 10:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pncH/JsFyTOuX1MFN8WrmdDdgAe+iOiHDqyec0cvtsI=;
 b=V/QQ9Gs94S7EnpAFahT8iPsF9VVATnpjSdDurV2gDAGHuz2aQovUMJLVtCNXfWQGv7
 7N9iB+/tbTfNNm64aS5DfeUj328Bw8xgwndGJ62OVtyh12HFhxLWIaNSWxEjIxQCOyb8
 rfcnaJ0HGve8CXptNIxZQCF6hfuSUr6juP6THbw4bvNTSFPBUD8vt6uLenVL0r5XH+gc
 gzDPrG5vQYwRHV1sQXrjz1mhNTyM75PW7DjIziyJiRKgkjYzk+xEzqR6pjGrbTU0kHa2
 5q7F5aqSgor2rKwIx+boCmVOxd8vVhN1+EnOZYIzah52hMhn++oo6jiWALYQUwrcc958
 ZUcw==
X-Gm-Message-State: AOAM532wyDsL4YNxRCRCP9zy0FsfRL3t79HtXwKimiOmenZeI2MGEGdj
 pU4QV1wrx6fd/YuehxNc1A5l4tyPRcTC/EALZA4=
X-Google-Smtp-Source: ABdhPJxBbRec2jyrrXkEQANfBfNhCIEoy1Kd52kI2aZkYtXf49W7q1r7dD5sz5uKW7JBTdSKP3O7I/8meCQjtrHn/bY=
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr30112553pfc.53.1634576575002; Mon, 18
 Oct 2021 10:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
 <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
In-Reply-To: <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 18 Oct 2021 19:02:43 +0200
Message-ID: <CANBLGcxHLQZygX9CHsXK4aYS9m4VE5OnLNROOmvP1ps5UP-xAw@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_100256_385218_B5D81423 
X-CRM114-Status: GOOD (  26.19  )
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

On Mon, 18 Oct 2021 at 18:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 7:23 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > > > +       ret = clk_prepare_enable(clk);
> > > > > > > +       if (ret) {
> > > > > >
> > > > > > > +               reset_control_deassert(rst);
> > > > > >
> > > > > > Use devm_add_action_or_reset().
> > > > >
> > > > > I don't see how that is better.
> > > >
> > > > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > > > the probe, or don't use it at all. Above is the more-or-less standard
> > > > pattern where devn_add_action_or_reset() is being used in the entire
> > > > kernel.
> > > >
> > > > > Then I'd first need to call that and
> > > > > check for errors, but just on the line below enabling the clock the
> > > > > reset line is deasserted anyway, so then the action isn't needed any
> > > > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > > > lingering unneeded action or code to remove it again vs. just the line
> > > > > above.
> > > >
> > > > Then don't use devm_*() at all. What's the point?
> > >
> > > I'm confused. So you wan't an unneeded action to linger because the
> > > probe function temporarily asserts reset for 3 lines of code?
> >
> > I;m talking about clk_prepare_enable().
>
> Having a second look I found even problematic error paths because of
> mixing devm_*() with non-devm_*() calls, which only assures me that
> your ->probe() error path is broken and should be revisited.

So do you want to expand on that now or should I send v2 first?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
