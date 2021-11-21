Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB49C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+f3O/uPFQ5RH2f7PDa6qfy1iWk4DoKMpGNXG+9FKs0=; b=tJYX4kMjILcUE9
	CIPvcZkz9UDDjqG6igwkiJXjXLnUpfhYEPr95l2nPJPNgrQR9LCYvHYbgehhQpeZBgO154xFLHcQg
	24QGo77toB8YMt1GasI9v6wpaOMUV+FhiyIk5D0hCMoRoNbHYSCYwHWv+MultVyy/nl+QMpMz/SSS
	RdbzbWmyWBGaJEgEXmJdq82m1p+xrsDauA3q5WqCjKAnMNigF/3EbU41w6OPDYN0hqZDYij/jsUBW
	RDDJCoKajRxhAP2E6/zke7OQkqJcP0yqCQaLYTqppjJMupyrh58VCnYHW2TN24aOwDrWpGDsS7Y9o
	8rSfieYzOO5ZnegnVZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mow7V-00ESfS-4S; Sun, 21 Nov 2021 23:19:37 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mow7S-00ESdy-KO
 for linux-riscv@lists.infradead.org; Sun, 21 Nov 2021 23:19:36 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 o15-20020a9d410f000000b0055c942cc7a0so26107060ote.8
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niG4LhykdMe2sCgAWkzlpTzAknhhfhfFKN7/kHVLdb8=;
 b=wcakSBzJXl9BZALRNXqLiyhsCB+m6PdHwbi8HzqWYQSDqzOUzvEqpnvo21ThgDfiUG
 YeyUYuOqKliWaPSXP/3LV4nTzhJ67sErjZ9XmD8vEyQ0pDW321Hx2roOzp9DvJ0BEA7J
 2IWUMeWBcGigOgZN2CdXyeomJHmgrZ/hwlM+gUea3h48Ioa5ZpPo0L3VUny+fxgUQ0ks
 /ZLvb22GhtsiEvG5gQXnXcMFBm5AfOhDm+50f7dWkr6nQIM/zeugbt4FCtIx6kcdwEIS
 IWPVkQyjCfhxRQIYm1R2CrQsPeeRMtMsD9QvTBmJ8X3sG9ojs8/p/EM1lQ+VBLpDkc4q
 TKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niG4LhykdMe2sCgAWkzlpTzAknhhfhfFKN7/kHVLdb8=;
 b=iSkqQIL653Gg/G6syxtDuJcavK4glIG5Ndxn9QQ2lsynsAKlKfUFcexUIygmIGUyg1
 KAPvoEqchPZXjg9S4bdJlgseJ3txskuumjr5j4+X59LkGpNMBnXTyYG8xd8kSMQLkKUd
 gL9HiGHqQ6/Hm26Kjd+rn68nyZHeSCNj9q8fDln4N1whSfQP+f/7X38fnBxFpSafKez4
 U//DWyJCyC8kuO+uXIjTeSEJ2bVoTdFwc6vuYfgKsY1xOBIPwpQWGidt9tOXB87tUqNv
 gm6cQwNN+rON+uBBsyZYB5rnqQNZNsjbz9IOeaTr8RpilbjEp3ZVff6+S3ByYAWyMj/B
 BtGg==
X-Gm-Message-State: AOAM5307RGcGvujfKwEbU9rjO80RY+6oN8aEjh4ZnG4IsLUKIZBzqhm1
 yDRhFUIlsssE93YbkUq2P/DjKFY3jXUburZySlkmMg==
X-Google-Smtp-Source: ABdhPJyVdtjQUoLHr9GMlVhAVr/1N/sztecCcTj39EJlBe5nSjbyIi50Oo/ofoA+ROJrbzFktx9bDGshBDQgVsRlEgw=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20546619otj.35.1637536773648;
 Sun, 21 Nov 2021 15:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
 <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
In-Reply-To: <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Nov 2021 00:19:22 +0100
Message-ID: <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_151934_696147_636BF8F0 
X-CRM114-Status: GOOD (  13.39  )
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

On Fri, Nov 12, 2021 at 12:04 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:

> > As it appears to have some cross dependencies I assume
> > it will be merged through the SoC tree?
>
> I don't know. I've never tried this before, so whatever is easiest I
> guess. Do I do anything special other than cc'ing soc@kernel.org for
> v4 to make that happen?

You create a pull request with git request-pull and sent it to
soc@vger.kernel.org and linux-arm-kernel on Cc that should
work fine and it appears here:
https://patchwork.kernel.org/project/linux-soc/list/

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
