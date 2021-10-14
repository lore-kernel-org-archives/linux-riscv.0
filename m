Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC516C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 10:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA71603E5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 10:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BA71603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXblqror8RY/e5eWrToA/dg/dkV2Q+fGuf1aI9G4BM0=; b=lmc9SUr/UaozxG
	0RkWk72t+P6OQ6eN/OmIDIF+JxhA6CUNzkLpbi2xomKsEFj6dNdTCAtWbkUloCHq4046bAsSGCahT
	cMBB5M1Qr5jaoVezWN+MNfyZQ2ACADq7Cbrqv7YGk5IhwlH1CRVe3Ninc4mnggu6pQNLN+Etf/5Ka
	LklbXEXJUNjYWNCkNjCSt6s8dz91AA0DBtx4WZ6/3NeCfhteBoo0tMArMmh/5hJL8BpQVeDtwoXz7
	bvtf7Yp9LF5uJHAYfU9/lnvzopdoHb7TIuS5VxYF1FiFPFbHf6hnHDxOZUY+rljIg5Llfy7xCsTBD
	6Pihpr+FokZo3bHk9wvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mayGK-002fHT-Rg; Thu, 14 Oct 2021 10:47:00 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mayG0-002fEv-CT
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 10:46:42 +0000
Received: by mail-pf1-f175.google.com with SMTP id m14so5092406pfc.9
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 03:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJvXSZseMVfQbBmTt0BMqFozFQd+wMN0VfIKZGrZECk=;
 b=09M9Oabqlg/Y0v8oO5OoV2AqiKl9x84L8DsZDYIJx4ZNgg34Yfrm3+0KeJKvdSj7WY
 fGnPTW6ldogm4Vyb+/1oNoLPFnfQpQSmHjYH++4EGheAUEH12S1NKI84ZVE5sRz6Trc8
 FkHu47qLtxFqK1zrlQ+cVrW7Xr3CYI7ejxQrBKBgxCYIffleAXSdyn9cc8Zv0VbErBW1
 IIIbWMZEkOk2+yrFIe5zcH7EEnigV2DE1DxedjOufoSdrllXVrgZdb0mC0XjDfTi45Nm
 loo4fXRvbxN+GKZ/fcToXTGR19oFIbDYxrP4ixpJNeMEOFniwiugoZSTl2TnmZ/llBfI
 YukQ==
X-Gm-Message-State: AOAM533LmkPk7HEClS1XpAxgPfoX0p3JqQ95NGS5JLQ0LtqChddxzmaa
 q+tsBUgjY+8qEEnNvfLl4taDBs/1Bo7sz2XMHXw=
X-Google-Smtp-Source: ABdhPJwtbEns4mDs0xX2KLgZa1X/jK39DitRxJ5GZBX6KxfQkmgA4slF3Il6bBNO+Vq6ZZEe58g8utxI0258TBE2Aiw=
X-Received: by 2002:a62:31c5:0:b0:447:cd37:61f8 with SMTP id
 x188-20020a6231c5000000b00447cd3761f8mr4695364pfx.29.1634208399368; Thu, 14
 Oct 2021 03:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <CACRpkdaB27Ar0a+Kxh9bmH78bUL_vFush==Suua2TDjt7wpYug@mail.gmail.com>
In-Reply-To: <CACRpkdaB27Ar0a+Kxh9bmH78bUL_vFush==Suua2TDjt7wpYug@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Thu, 14 Oct 2021 12:46:28 +0200
Message-ID: <CANBLGcyno5YGsjAyScDMXqdOPpyXQDH8u7=qMD07rsNVLrOC_Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/16] Basic StarFive JH7100 RISC-V SoC support
To: Linus Walleij <linus.walleij@linaro.org>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_034640_482641_C869AE55 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, 14 Oct 2021 at 01:32, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Oct 12, 2021 at 3:41 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> >   dt-bindings: pinctrl: Add StarFive pinctrl definitions
> >   dt-bindings: pinctrl: Add StarFive JH7100 bindings
> >   pinctrl: starfive: Add pinctrl driver for StarFive SoCs
>
> I'd be happy to apply these to the pinctrl tree if everybody is
> happy.
> If you prefer some other merge path:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thank you, that sounds great to me. Let me post v2 to address Andy and
Geerts comments though.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
