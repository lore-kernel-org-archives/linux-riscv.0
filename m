Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020F5C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2voc0g72YHVP8fkGc0ICjTYNozfJXAqY7WQuAHWq9Q=; b=4EpsXo+oP4Dnvo
	8e4PgwRdNARuscOgFc3S5dx+YpQznzE6AEhCP8Hga0sbuFexY0T2v3jdnodsDrN75qcWnznNON5EV
	3yTMkK7aZYRPajKxjF6V2GfD/eG06b5TcQJM/XIgvzWEjRJt5M2i7I8eW2vJ0ZyRJNfx53i8R44S/
	vQypD6IP2JTb5bmXum43Jn62UJc3aGYhQlyyP/rskgGIefG4OKIBJdPPMuer/MxBwuhcUnOx2RPPX
	sSLnbQlJf6CHANvRDewZ8ZmlZh6iGovUsW33Q6Mp6EYlCSrT5ZvaArhtC2tdqVL+E7nmlvbU90CnK
	aDkKjfzfu6SkWWhLjOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp9tz-00GmP7-H1; Mon, 22 Nov 2021 14:02:35 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp9tw-00GmOJ-53
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 14:02:33 +0000
Received: by mail-pl1-f177.google.com with SMTP id k4so14136775plx.8
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 06:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CXsdV198ETc5Z4b8HkqNnBSItnEYeGqb45DkswhRR10=;
 b=WfcuJjkR4/+MUbfsnHJligeMCUwfK3QXNEhIyP5/jyt3tGHreoBwR63usm/OCSaNQc
 SjzSkf92l/8ECS9oOZbYOvE0cEAdBWjYXpfGhdi6CXwKv8aA4Xi2aGfNVKrhW1G3CNdi
 6q1PPXuWotYEIrOpEZjZ6glLJ8GooqcKQZyt9wl2pndK6eWR9BbVofTeWWamU64dSnNy
 stBPsJ0zdzrb/BiyBwbEQ9d5Jwn/V8Qof80DBnE99pJx4aJzRQz5xwGRob99K/bJ+VzB
 PV5b1KG0mUXGNEYPWNLwEIHMW9TpfRaQnKGTWgFX83j9ODI2gzpMa6SmXqj+9TiVbtPX
 OBtg==
X-Gm-Message-State: AOAM532s9cMthNraZ5j90Fb8acRsPEXb9HioFKQjsdTozGa969DUWGg/
 BVrQRPclXCYHec9Rs+tHDLuD37Ld92eXVxk+EOk=
X-Google-Smtp-Source: ABdhPJwgDW7QnFYaRXQx8WMqdI3IoaCx11UiPY/TY96xWHkzvW+86RsBX57z5zjgEHmwt2m4CJlWhRK0P1C2/0hu1wE=
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr108553260pll.33.1637589748634; Mon, 22
 Nov 2021 06:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
 <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
 <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
In-Reply-To: <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 22 Nov 2021 15:02:17 +0100
Message-ID: <CANBLGcyWGeYUk_RcL6rhmu4608bP7LQ35o-B5FiNckQUDJ83Wg@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Linus Walleij <linus.walleij@linaro.org>
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
X-CRM114-CacheID: sfid-20211122_060232_216306_8E8F849E 
X-CRM114-Status: GOOD (  17.62  )
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

On Mon, 22 Nov 2021 at 00:19, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 12, 2021 at 12:04 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > As it appears to have some cross dependencies I assume
> > > it will be merged through the SoC tree?
> >
> > I don't know. I've never tried this before, so whatever is easiest I
> > guess. Do I do anything special other than cc'ing soc@kernel.org for
> > v4 to make that happen?
>
> You create a pull request with git request-pull and sent it to
> soc@vger.kernel.org and linux-arm-kernel on Cc that should
> work fine and it appears here:
> https://patchwork.kernel.org/project/linux-soc/list/

Thanks. I'm just waiting for Palmer to ack the riscv bits then I'll do that.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
