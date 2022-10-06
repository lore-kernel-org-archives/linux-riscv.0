Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C8FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 09:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmVVMuNNYe1v2ZY28PkgdyqY47ZQ7kkAIEmLzVhwj10=; b=0vlx0GBomdH4gz
	1dDonaeEWErjq7dZ7mYz+aWQJhtaAEea+qQIgvRlMZeWi5TobferTlehQVQ/HpTxcy/4ghg0ZdUhu
	XpWHkEkZkJpdtSxYPpwXND7mTe2MUMdo3+DGcZ542pNq/cISMAfgy140qK536A4JeLB6sk4t91Lt6
	hcsclhQVzc8/f35zpc6UwupBJihhtMLoTmVIvXhpdbbR85v6Z+XTxpfPRfhlmZe4yvBOIltBLT9xj
	hL+Bmj+ooSSdnpPLo8aBjEQ0IPvqFbbFJgFB37G0aqKquzT0/vLCTIvYTxllsu2EbeiLjk8mal5E1
	rHdiMP+swgypWP5YPvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMra-000y5X-Gg; Thu, 06 Oct 2022 09:08:18 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMrU-000xyK-QN
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 09:08:17 +0000
Received: by mail-qk1-f181.google.com with SMTP id h6so610655qkl.11
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=L7WdsxThKx8DLY3HEg/N0eYOYTLtN7B9Ka7mZhp0NQU=;
        b=GvknyaKtu6qTxRYCc8PyVodncxCjXVaUyA71XDCjSU110MBavKKS7GkPtTgkNh+Bhb
         Bn/eAeti/2E6iqlK+W6LNvQjD8fsyG93fWh9bZ+B5K8YlB2X5kfFFu/9Nm1g9cMX7Q1s
         iCm6itpBvFxnX6LDuiXXTGe7SXHU11bbmKjcNqgjYVUW9N8bhvPHbwJns29BoAljKxld
         SJeSI+M8/+w043Ny7gbqISKn8WECEJAFstWvHFaCRxJclCL9OzvMVYPN6+XB4sw+SAl/
         ntb/smsecNMfPEpgL+LbAew2Y7DXNRncvClUFPeo4viiBJ9isH9xXkP6vjrZ1vmu7abG
         1yyA==
X-Gm-Message-State: ACrzQf19g6azK/mf0NN3WXPD8ZE3obzmY9rIxoSJcOxJ8NgSA7MrnfVQ
	Z6qKpRkEGGY9OadDKvhVVTeAeShPYcFpHA==
X-Google-Smtp-Source: AMsMyM5AZqpQWNjEmYlyoCrUqpzeSfsRrvxf6SXwTIB5h3TGFRk5SHdCt7Ss7o0TaVv2ZgIEuhxa0A==
X-Received: by 2002:a05:620a:29c5:b0:6ce:b03d:2a06 with SMTP id s5-20020a05620a29c500b006ceb03d2a06mr2429075qkp.552.1665047278743;
        Thu, 06 Oct 2022 02:07:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id n14-20020a05620a294e00b006ce622e6c96sm21021523qkp.30.2022.10.06.02.07.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 02:07:58 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-35711e5a5ceso11672647b3.13
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 02:07:57 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:357:2422:13b4 with SMTP id
 135-20020a81098d000000b00357242213b4mr3519086ywj.316.1665047277420; Thu, 06
 Oct 2022 02:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930061404.5418-1-hal.feng@linux.starfivetech.com> <166457324093.1075476.18009315584754055366.robh@kernel.org>
 <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com>
In-Reply-To: <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Oct 2022 11:07:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUx9FCDAW4maJytd5H0=Mur9K4Teg99EOp6cVXF8ann8w@mail.gmail.com>
Message-ID: <CAMuHMdUx9FCDAW4maJytd5H0=Mur9K4Teg99EOp6cVXF8ann8w@mail.gmail.com>
Subject: Re: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to "pinctrl-starfive-jh7100"
To: Linus Walleij <linus.walleij@linaro.org>
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
X-CRM114-CacheID: sfid-20221006_020812_870872_E5566ABC 
X-CRM114-Status: GOOD (  27.81  )
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

Hi Linus,

On Tue, Oct 4, 2022 at 10:50 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Sep 30, 2022 at 11:28 PM Rob Herring <robh@kernel.org> wrote:
> > On Fri, 30 Sep 2022 14:14:04 +0800, Hal Feng wrote:
> > > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> > >
> > > Add the SoC name to make it more clear. Also the next generation StarFive
> > > SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
> > > No functional change.
> > >
> > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > > ---
> > >  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
> > >  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
> > >  drivers/pinctrl/starfive/Kconfig                            | 2 +-
> > >  drivers/pinctrl/starfive/Makefile                           | 2 +-
> > >  .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
> > >  .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
> > >  6 files changed, 8 insertions(+), 8 deletions(-)
> > >  rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
> > >  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Would be good to pull this out separately and apply for 6.1. It's kind
> > of messy with cross tree dependencies.
>
> OK I applied this for V6.1.

Isn't the name of the DT bindings header file part of the DT bindings,
i.e. it cannot be changed afterwards?
As of v5.17, it is in active use by
arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
