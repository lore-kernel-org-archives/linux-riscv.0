Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91288C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 08:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514DA60FF2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 08:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 514DA60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gu4z0AWi5C1hEVXxBCbGu4roD20Bk9K+IdjSyzfORyA=; b=WdbgbjZcZbBrUI
	Wfa+GXhwoF6FOPC0Uo1SavUQf16KNUQxoGjEBYJrTm1T96b+CxssLU+oJKrXnkXfHHQo3j0g65lMG
	iscpKU3/Udam2jYpY5cnJzfVmRfz2dJM4gkAGFtqKtFLcSJGNeSO2UjNp+kW3UZy6HrYFBDQUPOIU
	pMmwMuh7rYLv2sxniCnnpXRE53lQQ1TiIteyEt45bjOE8kxdLfQfJSplCUR2EAd4biCEv2jpXoAil
	2leP6UgSqgr7xgco41nJBpTPvvWouCcEcIVv482nrOgZ4u9WCQgdcyp1fAIEz5ZaX1WBSVz+kOVSD
	roXcPXK9t1zpMSmfd0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqHJ-00AFHu-Jt; Fri, 22 Oct 2021 08:51:53 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqHG-00AFG4-LG
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 08:51:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t16so2604674eds.9
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 01:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsSof8B35sJ3TdkUFeoW7PDjPfQXbtV3oB1joueUNsI=;
 b=LmOW2M7Fls4cmKaeo5kDREtk0zbyuTkrGZBD8wxmaysk/H0O0rScyPc56wgFeg6BtR
 Oi8BOBQD+Fym+tArVe6z1Y1H1aNXcMv7ojyYr+GFhZEZXyp2DJpyEt9B3MqLdt0ZMIUJ
 TvGAy/iVDbjKK1Wyha135Etodgnpe8mk04QRAJI0qG+7mRumNyYYXS+JClEOk/xkj8+v
 dXgtyctgJtieXo7LMiBedb3Vcoub142ihtAxE6RQXey9sjgjhpwhQXulz+s633tIDqDc
 j6LSTINe9bgiELKxM8C3MTuaYked3bcPiczfVP26IQo7fdvNZ7kS8zxCFteFea8RGbbh
 YMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsSof8B35sJ3TdkUFeoW7PDjPfQXbtV3oB1joueUNsI=;
 b=iinqFp4Oly5vgF3BujPf2IYbOXTTUTxgrS7JWEiGSHgvU9/u3WMZS/3g6t/F/Ae960
 iu4NMCYBdZ17Wjf37KJvnbJpqwsCMtBE4oJC681Sz39LXKrT8rf5sDbfENtO0Od/rZ5x
 ia1mpXgVRbvw9lbdcGHFaRmJvkl3VSxVJn3iKTGUumv8d3G6XHLs+mazIZZWVhA9r2FW
 39J61wkKAqnzEDCkQRWQyQKwRLCo+rv4lRU65gchZfxTmjkV3Hsn+eil1wnbrV1FkysU
 wIwwb3228LvafCRM824vxoHTrrIDw5X1AkVj27OkwfoUl5y9A2chlqvO2sDXOwA+qZFC
 HrZw==
X-Gm-Message-State: AOAM532Rb5vvfxM8oEpkraUYzPh9LFibskrxMjeu0O/qMGsQkl19Fxh2
 zyvONCuwX2AZCj8rjxQisckrqJfUiBa9Aeun2Qc=
X-Google-Smtp-Source: ABdhPJxg0tLJ7/LdpnuntihRiqWvlRRwACrMPNo7XYl/Y8z0+A5FUElZXiGRbf+lmQ4LBqBm7evjGm3ttticSo63kcs=
X-Received: by 2002:a17:906:1707:: with SMTP id
 c7mr13563725eje.377.1634892708737; 
 Fri, 22 Oct 2021 01:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-2-kernel@esmil.dk>
In-Reply-To: <20211021174223.43310-2-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 11:50:52 +0300
Message-ID: <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
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
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_015150_736763_92EBBE1D 
X-CRM114-Status: GOOD (  11.61  )
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

On Thu, Oct 21, 2021 at 8:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add StarFive Kconfig option to select SoC specific and common drivers
> required for these SoCs.

...

> +config SOC_STARFIVE
> +       bool "StarFive SoCs"
> +       select PINCTRL
> +       select RESET_CONTROLLER

> +       select SIFIVE_PLIC

If this is well understood and platform related the above two are too
generic. Why have you selected them?

> +       help
> +         This enables support for StarFive SoC platform hardware.

Not too much to read here. What is the point of this help?
I would elaborate what kind of platform it may support, what kind of
drivers it selects due to necessity of the accomplishing the boot
process, etc.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
