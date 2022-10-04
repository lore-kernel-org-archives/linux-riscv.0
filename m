Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDCFC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTc4eDp3O8PLOI+wHFxbxPH1CfofEZ7QrHxC2jejG/0=; b=AiMTxjj2pq+uXe
	y1ScboPSINbUV0TfgQf4cAQ7OnmJIHeb2D2cOSukcxZuXbd+t5qtL/J8fZLAgINbRg7Z7i2MHmhhd
	MbaNt5BuQorg/VD+CQaBaWXt8QV50BQ/fwPX1oKo4LPwWY4P6/NBprWVhPHNPsHwHbFpZKr4AVap/
	sZSR7tfbg1wei+QGlykkV9flC2oc3PvJm7pdttGOuez42INpSoF0hDWDsbnpj6x+2x8ssuA+T9num
	kQwn6AtZKB9LE03S88WnhptDRh7lLo9M52WbdrNYy9BzKSAz33NzDt1TPmAonLyTWyAV+uddRdbCT
	Eh6MTRkz/d62LezPkDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdbk-0091go-CT; Tue, 04 Oct 2022 08:48:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdbf-0091gA-63
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 08:48:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id a26so27359940ejc.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sVC3cBBvDwdRDUeiwLasUQWtDpHhngctxl/vMaOSR5M=;
        b=EyEbjvlgI3b6KcuhljzcziR00HmSK05LJbKnmHZCGAArwnuBnaaBAsozltwNPjjriY
         sjaziasiJyT9HlpHJi6+6s2OwkoEl7oU4xjgYqs1MGg5l1aWFQfMD+A8RxC92UraF/E2
         u9UQQWF2JNh8KtN+sNkIF18SUrPSIbJGpoeQrCmcDccgfz8CndqWXYUd/zDZfRDZ/JXL
         9kEQu49d7jCD+xdQvBhDDgJkMQJ2J52BSMY8wOlIgynQFfaqJvB3CNffs8hbAsD1phTd
         zisIiCQnlWlqE8+GGsadjqh1bsMk4B0zbe024mp1aUiuxvR6oMOWqoA9nlMn45kexJFd
         uOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sVC3cBBvDwdRDUeiwLasUQWtDpHhngctxl/vMaOSR5M=;
        b=5oWzc64HTI6PZzyQcPi3822TMK3qKWpNp/QH2mSb8eskD5T9UJadF6SFcwrNDzq69Q
         MlY/PfrQ14Nm1rrRdcRhUAlQnvM6KcTqHUuqy4M/4K3+UuUdS5MLIwFdnudUmvtKIOTF
         +EinARnnVkH/DO0IQl79BfZNaRue3lSvvjkTR47B9Yv9h3+XVqzgZ6z+yH+luOwiDfva
         3uEeWofZD7NfWBpgEvtlTDw0nUs3w4/yliIbngbmc66ORyW4bP+VjbsaSyE+EUkeFwBr
         D809WIZ89sGKPLjfOs6ag2NGcB4ffmvVyRxDY7Li44N37PLlmSHEYUSjtRSNCkJu93yF
         fWGg==
X-Gm-Message-State: ACrzQf1tpUJ2/nhhE5JL18ukozBk6uzrYIehgX7kkHu8nJXRhazf3NjT
	QNLy+b7NNYwMD8iY2caXjGelbLWk7FxbPHTzHQtNeQ==
X-Google-Smtp-Source: AMsMyM4+MuzPA3rxpU5/7ETp/iSywQSnH9Rb7N1c+d3shN6lW+DluwyMwhY14bCye5s1tkXQlw1TFZUCGQJCnLBR3KA=
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr17505898ejc.690.1664873329543; Tue, 04
 Oct 2022 01:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930061404.5418-1-hal.feng@linux.starfivetech.com> <166457324093.1075476.18009315584754055366.robh@kernel.org>
In-Reply-To: <166457324093.1075476.18009315584754055366.robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 10:48:38 +0200
Message-ID: <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com>
Subject: Re: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to "pinctrl-starfive-jh7100"
To: Rob Herring <robh@kernel.org>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>, Rob Herring <robh+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_014851_249223_E6E1538A 
X-CRM114-Status: GOOD (  15.96  )
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

On Fri, Sep 30, 2022 at 11:28 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, 30 Sep 2022 14:14:04 +0800, Hal Feng wrote:
> > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> >
> > Add the SoC name to make it more clear. Also the next generation StarFive
> > SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
> > No functional change.
> >
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> >  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
> >  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
> >  drivers/pinctrl/starfive/Kconfig                            | 2 +-
> >  drivers/pinctrl/starfive/Makefile                           | 2 +-
> >  .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
> >  .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
> >  6 files changed, 8 insertions(+), 8 deletions(-)
> >  rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
> >  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> Would be good to pull this out separately and apply for 6.1. It's kind
> of messy with cross tree dependencies.

OK I applied this for V6.1.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
