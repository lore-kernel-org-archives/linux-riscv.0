Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4EEC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16kv64vcj6w+OgiZFirlUj5d0AlCZB9ydSL+/A3BCXA=; b=eU2LcT/Fay/vKc
	yrMbUBtNopzj9Hc17dlsvlXMoCxKgvRWMNesQN3c7Z4k6ekpDQFNO7dzHhRvL2DjhYVvMJxrwLuce
	4bqlhm8kri5oIykqmQhPi/mOc3Gq8OIJxWVbrnLw5G1mlqtKCSFMq80ZEqZHvt08LlbjGhVH3CClQ
	iS8ys+2sEsTiKRPY1l+gqZRFEo+PvdofAMfed0Xs/UPDQ5e0T3UWgu7TdBgheuWD4BgSpALgu5GPV
	X1p8AjNUCTsdIfZID3NtWyjS/j+pzf3gnEvezAxb+Wr0NuY+cashEqp4kY/n/OL8SB/gwAzmN1owv
	34ctc+c8pUmW042RfGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB7d-00Cx7s-2z; Mon, 06 Mar 2023 13:43:25 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB7a-00Cx5j-3A
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 13:43:23 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id v13so8145533ybu.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 05:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7JJkVYaR6k4y/YwEKjFCoaiSSS5E0lC7DyrGlhsXf5w=;
        b=LOz7FoweylZgi9J6lwrdz6tiy8AS1nZ7HN40BnYhblypkghOkEBKFBr+jlAqBpJNb7
         4GX60HwmND/rfdFczU9lOL0+8O2ZIcIrfexnmQEzHOOXlhuKQGCanKDZmwvu32Yp+Fai
         L7xrpgnnchYQweepB3wyfcZ48YRGNXsftoZAISo+b7h3u114MgufTVwYYvHVSr7WhugT
         qnNFHWJHnH4n8+1lOp2cVBXMT1ixUlb9SNBX6ze0kWkNFMjkLSk3H7TWJM4/hlH8a9He
         v63npSxGzFUEN2/d8CgGxXpWCJT1g8GjAXrmA8+k5bBc+642oEwRdb2nZ/2ukKZQl8bC
         dcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JJkVYaR6k4y/YwEKjFCoaiSSS5E0lC7DyrGlhsXf5w=;
        b=3BJnzuRnakKQ9z5+Xm6N3PkG+Y9WlyUkveeMCzZffFImg1xfkX4hDlu/24iqpRfWMR
         DKM4NOe9RPE1IiTr205l/3thhoNAtcyiGDHiptFzb1lPelNmUrPBrt015MdJSLJZQ2dp
         2hPzHguIrCP/+hTeWSNWMpNkCaZXtYMaLvyDa1P6/QJGbRHtaFwbNxoKvEiezZA0GBYV
         L2DAIM1WJLTS6lbRkCD3zlcGc6/9MdgPscs4sUzBNn4fYg/V+81KNGC+OxIuefzNV4W2
         MLoYyqz4ybw3wEDKwL9SyxcwHZ6SfQWFDtt1Zxm5/burmYiE+Rz/BJHgcORA3vfoX6o/
         9r5Q==
X-Gm-Message-State: AO0yUKUGrYEodL+yRSZia4Wgy4Vvj8XBsP1rNp5GoibpegZxXz/l93SV
	t+uhPV5u8mFStR9RA2//3t/hOzr2xIjPNqzxBsfXKA==
X-Google-Smtp-Source: AK7set8YCn4Jsg6jPH4qYG0BJbp6vWpxECdQH2wjw+INvQEWWcKTR4Gyu0b6jwpzUsU4ixquh/OWea0HjiSteilI90o=
X-Received: by 2002:a5b:647:0:b0:932:8dcd:3a13 with SMTP id
 o7-20020a5b0647000000b009328dcd3a13mr6489593ybq.5.1678110197962; Mon, 06 Mar
 2023 05:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20230209143702.44408-1-hal.feng@starfivetech.com>
 <CACRpkdbao9M5dMHFO_QE8z4_E6DZLZsMUW1OnUNjKSfQc59=ew@mail.gmail.com>
 <4211d93d-702c-6759-6f25-f86160c0be5d@starfivetech.com> <CAJM55Z-+Cxdebcn4MLXfQdOVhx4c2SQ+zMH8cjn-Yq35xO8g0A@mail.gmail.com>
In-Reply-To: <CAJM55Z-+Cxdebcn4MLXfQdOVhx4c2SQ+zMH8cjn-Yq35xO8g0A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 14:43:06 +0100
Message-ID: <CACRpkdYvzbK-ZJVzh6mGY3Sf5fT3u9LQYkW52BBtiFd2REgwNA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Andreas Schwab <schwab@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_054322_184404_90B4BC2B 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Feb 20, 2023 at 11:16 AM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:

> Hi Hal and Linus
>
> I'm curious if there is a plan to address Icenowy's concerns here:
> https://lore.kernel.org/linux-gpio/52dcbe48dbf5f2561713a9642943353216fef15a.camel@icenowy.me/
>
> The problem is that input from "GPIO" pins is configured a little
> differently on the StarFive SoCs. Instead of having a register pr.
> pin(grroup) there is a register pr. control line to the peripherals,
> and into these you write the pin number + 2 of the pin you want the
> peripheral to react to. Why +2? That's because 0 is a special "always
> low" signal and similarly 1 is a special "always high" signal.
>
> With the current bindings one hacky way to solve this is to treat
> those two special values as kind of "virtual pins" that will always be
> high or low. So that would be something like
>
> pinmux = <GPIOMUX(GPIO_ALWAYS_LOW, GPOUT_IGNORED, GPOEN_DISABLE,
> GPI_SYS_USB_OVERCURRENT)>;
>
> ..but this means we might need to mux these two virtual pins to
> multiple peripherals. I'm not sure the pinmux framework is prepared
> for that.

I am not a fan of the magic numbers approach to pin muxing at all and I
often point out that I prefer that you use strings and connect groups with
functions using strings.

The above mentioned problems is one of the reasons.

As maintainer I have been repeatedly hammered down by maintainers
who think magic numbers is good for them, usually because it saves
space in the DTS file and is easier to code a driver for. So this alternative
approach is acceptable, as a compromise.

My apologies if I didn't point this out as sternly as I often do for
StarFive. Really sorry. I guess I have just started to give up on insisting,
as so many people like their magic numbers.

If you switch to stop using the "pinmux" property and instead use
string arrays function and groups as defined in
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
this should fix it, the old pinmux device trees can be supported
as fallback, if pinmux is present but function and groups are
missing.

So that is my suggestion.

Usually people don't like this suggestion, so I suspect you might
not like it either and come up with something else to work around
it.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
