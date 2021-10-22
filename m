Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056CEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:58:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCA261056
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DCA261056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1wLhDGWN/3yK067tNgmCBFVv9TUR5E+Xmk7fz1U0S8=; b=H0p4raywvMEO49
	EP3olLAH7lTIGngcjCPGrtvPaCncIFrF3+WbkZMHWrVnT55aaqqvuTw3Ppk3KGleMCIYUkTpelfD5
	wG/uo3beFw5wMV3Rn6KEbi60mMh+/nBl5XTb6ZNoU2XJ1qDpIuND91HccQMGwzLe5vsJYLVpVSNQT
	TPNdqb3mkL/BDJ/b87aoa5/d/VcfAUQugmEvdAmzhSdGk612u+n1p4WZU5bDPGGaRFE6bdJph3rTc
	91Qlx0qga8wzrzx6wpURcjIMPw9aMW5VGed5YcZ4WRTqunYtdWrOI3MXSFv3MdPO9QoomJt2WsY0o
	GlBLqCnXP9ANHW7x6MAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdu7e-00AzX6-JI; Fri, 22 Oct 2021 12:58:10 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdu10-00Axew-Mo
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 12:51:20 +0000
Received: by mail-ua1-f42.google.com with SMTP id f3so7410577uap.6
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 05:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76x3pLWRTCP/TRw1WTSC3Z8xBZgXnwV9dr1N3FI35XA=;
 b=LV26b33mhUTp4akRS+8RjtCWe+APCzmH+rJNzHw+YsIbxaq+OfBdk2Bwosna/PtTjA
 kPHspViNn6MBberbIh6r77ut6uahjRrP5f7efYb0CCWCdIMhD0ro5uiNP77dw19hgnqP
 mzOCyWhs247GYqzwLmG0UeCjVpdnCF45GJOAtACac5+Dc9UBupicRYn0cYmICGYO/7NY
 3LGfC0w8bQzyoU9PY8USfsiaCuujU1tq0nxsXcPHnvE+kSxz8agHg8InolX9F1ZtGk+a
 vmr3zo8NnPe2yUMvQk/wsoqKYQb6scl+ypIdmyYreCuR9RICNcYMi8KOmjtiQ46eJ4lr
 Sf4Q==
X-Gm-Message-State: AOAM5300UcT4vtChK2lo4d8fgMQAqkJp847Uw2dKjlTYAhBoBvl4qfQl
 uV+5d9GqUA/k/OSSL/XQwY78namdp8GuOQ==
X-Google-Smtp-Source: ABdhPJz9lFnxgD+ASbKQNU8mAJjeSxNT2Y2QBgP6+OsRZtxal++SWCiZJIwKb7lRAFelCIHDBJbhOQ==
X-Received: by 2002:ab0:494a:: with SMTP id a10mr14239283uad.90.1634907076244; 
 Fri, 22 Oct 2021 05:51:16 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173])
 by smtp.gmail.com with ESMTPSA id q200sm4779566vka.18.2021.10.22.05.51.16
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 05:51:16 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id n201so1409546vkn.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 05:51:16 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:: with SMTP id
 cz12mr14104011vsb.35.1634906688057; 
 Fri, 22 Oct 2021 05:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
In-Reply-To: <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Oct 2021 14:44:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJES+Jufhs--5vnXq=RwDF+WmZc7_C6Lc4gAVaY5sRRQ@mail.gmail.com>
Message-ID: <CAMuHMdXJES+Jufhs--5vnXq=RwDF+WmZc7_C6Lc4gAVaY5sRRQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
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
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_055118_791782_131E4BDF 
X-CRM114-Status: GOOD (  20.24  )
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

On Fri, Oct 22, 2021 at 2:34 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > +       while (idx)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
>
> I still consider that usual pattern, i.e.
>
>        while (idx--)
>                clk_hw_unregister(&priv->reg[idx].hw);
>
> but since you are pushing hard for your variant I'll leave it to the
> maintainers and author.

I agree with Andy.

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
