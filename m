Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F54C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpseAP54oUKljRM3slJxIZ9RB3J/lpqVAekzkwJKG+M=; b=zyq3bCOZM5Aols
	hvL6mwGS//4E0PoVVw+B9tewyO4JNX3LPLEZzZBlkX/ESqnMWQ/Go5ijesqWc5MXqkP8hBqWEQqQX
	DbYIsUyYiA5gYBRbMWhR/BmS2zvcqVu2zVioqyFEMpAlIZVS8yoXKftSYMoUQJPAU85qSvtPDV13q
	QzF9NHlAtZSJhmP5BFi5mWnQHdZhmc0iHZ4WBo9Bn8NWvLwR6P+TZD6x0wCKaOQb7/BG3jJdlPXOH
	vUQjAsUU1cN6nViWc7VuD+loxzZP1S+rxhAmRbUHL0FfrW7r1As+KFKzJKmHRCx2ras/MMuIjltwk
	KdALyca1TS6osKoik8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdzu-0095MC-Ax; Tue, 04 Oct 2022 09:13:54 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdzr-0095LA-Av
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 09:13:52 +0000
Received: by mail-ed1-x536.google.com with SMTP id m3so17960607eda.12
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=D/eA6dEUnW7Jv9EnsDYTw9oSdfCmrRKnwCSuTK1iLK4=;
        b=Upeevv2LcpXpXijGFw9biyCPf3ooBnzKCnx9HkoRDYEKtBV6wZAnmiBgHDPrfygvy3
         HLqqIldd9MheMe9P3PbURB6hI6XqK+MQbdTD+s0ifyP0YrQSKPn4qTT7nbt/h3xMmhSH
         2X7KmdrP2xZPCBNiqN+oUB0fuUUxUQq6oRJngHHAZ8SlX+h3IRuMk5Ph6YRB3EvqNVun
         +2KVz3uZC0xBa2f8yXMRFQCsNDS8d3dcx6ZK3b7hD55IEepxxFQib50z/5lP7dNgak1i
         mgVeW7dZcJEi+qk0kBGDz0SKSlKZM1Kf6A4I62awY9/kydZad6F4axkLaeQ95ibVc8UN
         1/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=D/eA6dEUnW7Jv9EnsDYTw9oSdfCmrRKnwCSuTK1iLK4=;
        b=C11saLTT3B9Er/0KL82T5WX8XXdhR0stehy45MfyNKQyUppCbepoZbxX2bFtXXnaby
         AxZFJcbzcj8xTwl/s5pqEfa6GJo4VuANlBKEU+PnYpi1R/3mJiIv0PwvmiyOXynOoew/
         gHJTthnoLRg2DBZ8AXR3BZCSBMBIy/mmfF+df6HO+7JGJ0nu5iHcTrut90WCTWRzBlzI
         utWA33AlelqbEuEgWGUzBE2a1P1hk2xINd54GOMhJ2BQDxCA/LSpwyd2esMe0JniHKcH
         1sqdd46Dtr6rxKPqXZvToXV3aiYMzOUlWg9+EYgdAi2Rchqrb2LvwUSk5A+JXdsDsjBM
         t5Lg==
X-Gm-Message-State: ACrzQf024Fn+hWaKkt7c08+6P2PiTbo4+h2lfG1WktvhJZcB7xBq7a2M
	BQvdc+wI8ADUfuy+dJoXO65VOclcGOuzPwHnymjLHw==
X-Google-Smtp-Source: AMsMyM7IDfq5yPgrVEdqWyITqmz5NIGLNtALJWFubooSQ9ADrb1IPN5du4hYEgIYHihv+bGFkluDZNzDXRbFLWqqxRA=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr14608157edb.46.1664874828910; Tue, 04
 Oct 2022 02:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930061404.5418-1-hal.feng@linux.starfivetech.com> <166457324093.1075476.18009315584754055366.robh@kernel.org>
 <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com> <Yzv1uJbGMuFmRsRL@wendy>
In-Reply-To: <Yzv1uJbGMuFmRsRL@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 11:13:37 +0200
Message-ID: <CACRpkdZYXhc7phDmHrVwNzWWvjiQZHEsaQgdsbPF8JK-Yse_QQ@mail.gmail.com>
Subject: Re: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to "pinctrl-starfive-jh7100"
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Hal Feng <hal.feng@linux.starfivetech.com>, 
	Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_021351_533185_1D414AC7 
X-CRM114-Status: GOOD (  24.41  )
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

On Tue, Oct 4, 2022 at 10:59 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> On Tue, Oct 04, 2022 at 10:48:38AM +0200, Linus Walleij wrote:
> > On Fri, Sep 30, 2022 at 11:28 PM Rob Herring <robh@kernel.org> wrote:
> > > On Fri, 30 Sep 2022 14:14:04 +0800, Hal Feng wrote:
> > > > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > >
> > > > Add the SoC name to make it more clear. Also the next generation StarFive
> > > > SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
> > > > No functional change.
> > > >
> > > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > > > ---
> > > >  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
> > > >  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
> > > >  drivers/pinctrl/starfive/Kconfig                            | 2 +-
> > > >  drivers/pinctrl/starfive/Makefile                           | 2 +-
> > > >  .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
> > > >  .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
> > > >  6 files changed, 8 insertions(+), 8 deletions(-)
> > > >  rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
> > > >  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
> > > >
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > >
> > > Would be good to pull this out separately and apply for 6.1. It's kind
> > > of messy with cross tree dependencies.
> >
> > OK I applied this for V6.1.
>
> Will this need to be done immutably so it can be pulled into the riscv
> tree in case this gets applied as a late change for 6.1:
> https://lore.kernel.org/linux-riscv/c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com/

Always one finger on the fast-forward button have we? ;)

Rob's point was that I should apply this for v6.1 so that exactly
that kind of cross-dependencies and immutable branches could
be avoided for the v6.2 development cycle.

The merge window is already open, it's a bit late for completely
new stuff I think.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
