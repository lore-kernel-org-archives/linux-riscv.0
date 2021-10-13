Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D38C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B76C61077
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B76C61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZI0nt97K8hI8ivdKRKweskxLFqdsb/6nqm6n6bsPmY=; b=YD0kePd0+5c5Se
	mE7quaWIgsMFJlhNPK/cvWjE4X8STBY6Zlx836OSLt+9ER0vSIvglomSUjCF2NFGpomTBQtfrqVXH
	jU82V9H525coKiDTaWoZLwO9YjcH68jAGnj9ZhLmRQmGJobSsD8/bK42NkCm9BMIJPeiYppxQwBV7
	rY8s71+4HcCu+22YW2hoecFwlE1X4tIZOfnAXdgtSsPNB9TZNZdw/vaaFNjuAkl4FC4/dbvsPq8d8
	QuM05t4NqJljBTv9X2i9LTIxuKXkx3Bl+OYKZ3/pwNXogAnS6bZ/B2xFtAVtfAUWEFgRby8qB1CNn
	h3TLdYWuwxqx88+SJQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZc5-00FZI7-2x; Wed, 13 Oct 2021 08:27:49 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYKT-00FGZy-0k
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 07:05:34 +0000
Received: by mail-ua1-f48.google.com with SMTP id i15so2684682uap.0
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 00:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODFUHeafSyfJJr/dZjG81Kg2CJUeDy3Vtm7EDZAJVcs=;
 b=FvUau0lhhku+wWW7ZgVFtLMqk3m7CaGDg6y0dGgt01DylSlmB7gDh/ltIi74lLlJXg
 UGHiMucB1Pb31Lt58vjqkkkZr/yve3ucbCtqkww701LCTpDqx9OKlH6wew9OlMJHVTLQ
 /mqvvZBll9EUpSMGd7qTVBGZneckR8VL6aOYl1vmTVaOPsQK1hrVdnjHEJ0HM9lwuN80
 44T1O/4sahSW5cGeJuyBlNT2Dzfjf1047FmufthKCpvtFtMyShJYEw+pPnwVMD8KvKs2
 pSmzFEszd6AQVXnV61RNaCPn8HQgf1AW3+G45rdJ7ZNin74XIfY6N9nVn59FNzywIiBi
 cyag==
X-Gm-Message-State: AOAM533atDruXBvgXyRCQ7q2yJshw5y5s42e7W3IobT/Nn6G/lvHOfRi
 1majXvTh9jKtadpAQw0PWow9RDkhZ3KgFB1ui1c=
X-Google-Smtp-Source: ABdhPJygs5LYNeOJqEM1k5UdNR0eKKutf4oKyYkCZ3Sv+78TmKiKttmATy8/qE8zE082U1qV2JXAhNEbNBitCJBQkF8=
X-Received: by 2002:a05:6102:290c:: with SMTP id
 cz12mr15636134vsb.35.1634108731922; 
 Wed, 13 Oct 2021 00:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-3-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-3-kernel@esmil.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 09:05:20 +0200
Message-ID: <CAMuHMdW1YD2hJ+eSwHe8WLK1YJZ9pHYrESX3-M70au_3HCKfdA@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] dt-bindings: timer: Add StarFive JH7100 clint
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
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
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_000533_087757_91264648 
X-CRM114-Status: GOOD (  15.45  )
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

On Tue, Oct 12, 2021 at 3:41 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add compatible string for the StarFive JH7100 clint.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
