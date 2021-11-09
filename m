Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E89C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:02:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746CD61A09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 746CD61A09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uw+9hasYvq8O5csKJwGXR4aFxCcN58TFHIv21RV65XY=; b=pSxmvQPtD7gz1a
	FzztLZE2casS123lXuWdZb8Fo6NyZ8V9cK2RqTpqsq6CCWTLgvO+nKDjzSooAbLQHIJKYJCNAwkL8
	uW9bDXlgptszAzzz04ekDOBlqzn6N8S8fl/aMiOI3+wBdQ5Hn6taaYjFQcxzRab4+bw/TSj/xU5LN
	eS+yVFdIsw2RyugZbtKtZZ3zzHtbzPKfQOe0Gw/n6GhbYkdjsSKF3kgA5ddihtfjjFYNtTtz23JJJ
	7AOJATgtLNM8BxHLfCsYV+7SKORmk+AeCcN1CU7bxUHk5fsiUva31YF2F904Iv761/EWdGdFejYiw
	VovsYozD2t2T22dS6Aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFWv-000BP7-JA; Tue, 09 Nov 2021 01:02:29 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFPM-0008lr-4A
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 00:54:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 g25-20020a9d5f99000000b0055af3d227e8so23960388oti.11
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 16:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/5wawZ4iCQr7l/M8N9c7Pm/2uOFf0V7hWRrRXV1YxY=;
 b=n+jlur+tkjDc+lvzvnxzvjuMCuPiLormrOIgFn5OjIIJDPQHrK7TYPu8WkNQsELu1e
 xa6Ms7ysitAQJllZkoG9r+FsT1x/JJVXiQQTYvYlfe4V1HuBUazR6CzD+341b1DQvMwR
 ehKV26SEHzwLQUzAYiT6S9szxr+CZ+pug1+BngZBPtdxAohv7pweOteMw11Opm0tNZ4J
 utDUZzCR8NkxuTy37qDOPhHzRcf/oMHy8/p3KMsuKzwOtzG+SS+L98bqykJsd9/3eYCg
 e3N1zFEeyPwFmtROdKHMB5ZaAzoSn4g+NXJpbsKNunzO9Vaq/DN+cgYhOlkQyymcldrh
 aR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/5wawZ4iCQr7l/M8N9c7Pm/2uOFf0V7hWRrRXV1YxY=;
 b=51liV8W6TNLpHVLOud69G/RERx3qRU28kBbc1Vcb+bXqSRM3fDUkocpDICo73QyDhl
 HF5xvqTtUQcL4Hj3ALOqrYjcIm2DmJH9j5B7Erkg1umqTWcNjDFXstVkorRQIn6hRW9E
 yVxbYWghWymsGEaF2oG40Sx8HqSiVdFOzhw4ot7dMLrJWGbWrdQEOyPlSmTwCjq4ven2
 RkVMCYxNErH7GYZBDqQeZjVE/wEtyqSO5sP/WsKhd3gfroJBwEXVrE4i3LULE09n1W0O
 YzYBiyFBtTsx+a+clOgxtaArE1jTvyEGLa5LlDxeguPxx6f+PKfKa0m/B5F2ZwJsP3o1
 bHQw==
X-Gm-Message-State: AOAM5334whB9sVMLtPErVsgSz8btQgy4XuJTeBfYz0lESonjNjeMZJD2
 wHUWGZ9SL81VE8vQ/2AWnkoxR1HDf92BxLM028vtOQ==
X-Google-Smtp-Source: ABdhPJx6ntF9Ij4ABUlVfspt/BrE1AagUV5HYqW4lumhYW9HaJk/bpBVv2CAh2o/6TEPXu1pygB6104B8pbDewZcMzA=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr2614070otj.35.1636419278616;
 Mon, 08 Nov 2021 16:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
In-Reply-To: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 01:54:26 +0100
Message-ID: <CACRpkdZOpXC0GvoyS8KexgjxL17rjyNkPuA0KGOvesZMDLvyJg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
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
X-CRM114-CacheID: sfid-20211108_165440_211330_389772DA 
X-CRM114-Status: GOOD (  11.15  )
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

On Tue, Nov 2, 2021 at 9:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> > +       depends on OF
>
> So this descreases test coverage.
> Linus, can we provide a necessary stub so we may drop this dependency?

Hm it further selects OF_GPIO which depends on OF
so I don't know how that would work.

But does it decrease compile coverage a lot, even x86 has
optional OF support so I imagine it appears in x86
allyesconfig I suppose? Or am I wrong?

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
