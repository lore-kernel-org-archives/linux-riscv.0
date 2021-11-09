Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1812AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF6661057
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFF6661057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1NH7hbxs0YXa3T+yjpMfP6LmI2uijbZ4vY3c8kvP0E=; b=Sfr7lTiN0erKPD
	VpBIg6M63AkKdqCZ1TP7zW18oSUXcWdepvIlJb1NLrhN+hDM/B8/Q+uga+PoJM+AP0yqbjRgwRCQ7
	3J9tavLKbfirdytf/9aSR+myYCXRqvoZ+9XZ68CxtShoFwdLhc06NUOtlWTdGiu8fDv7H8GgfDpyU
	Bk+Ftyc9gXcw7SMSy+fv98N3n6PaPPppF2RtqVm/K3ioSUwLvKG8gGTVKzmvY7XX2ihFR3anz/9eA
	oOgmsONpjoR1Ax4dUqeBiwCCwTSLMTFN5Bi8pxTk0qc/+dXdXca4CfG1DyYFJSXHGiqmywkTeeYdd
	PY2Xw3eAfyC+4lsVPJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMyH-0017KM-A6; Tue, 09 Nov 2021 08:59:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMyE-0017Jo-AG
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:59:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id j21so73573502edt.11
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kmkcsLwhqrRlZYiF/o6WGOvaKjRFSvuNPZIr825qDS4=;
 b=B0Nkb/Lxi0ma4Gqty9CoAxpahvSRtZuZt6gtGMcfl+nc1uMbWq8qR6m380Cn1GtcYo
 CE3E5Ovrh+MmdKN0BaVZaUbM764j9Q8purv+cEYsE7jtPS7bPFvvHeJz079iNLi/xS50
 tmY5tAsfSHvM0JsV0+46VXA338tcleeUlItyIbU33JpjEFGzuzuqIvp8ftahGriow6Lm
 6ga1r+wPTMjilwoXyBDuRlEftn3l7MwikhGjtipWEF4yjm7F2gHTBWaG8pSC9BVrpWaG
 fCgx5rL5EcCxwlbNhLvr/fueVV9MpPK1k1e0XYQVDh4pBQGif/GvKh04bDBmH1np8Oul
 zWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kmkcsLwhqrRlZYiF/o6WGOvaKjRFSvuNPZIr825qDS4=;
 b=wZWeLE5BBpFd1RZzDYo6PMye7njQiyDMZ4a3ig8ozuUw8T8RVVXXSml1vQTk/pWeUc
 42AJSLHYdIi6RLcex1Vtra1IZFGaTRSFyqBQse934c07ak3TC+RFUm1g8VXpGfu/f5oa
 sA1BTIYoSk2U6XwJomMBxLKYhu/84SCYLhRBWmfik5QmzDw0LcdGrnqs3VbV/shUWx+j
 ZbOq5HHQWeXIQfk80D8XxNZcwcS1d852SQKC3ccPbBRt/pcAp6tBNm6M4gbDGAXptwlB
 Z5GgodbBkLPl2YmVlkRcRtlcqDn3D3uMDn06HFjtW3IW6IHZBMetWnqC3e7s6Nx4e5LF
 9EXA==
X-Gm-Message-State: AOAM532kBaYFyAru7JQSYyHS515p1gxkMqqQpgk6fcqeMw61Yffa3bTX
 wqzjFtudm/AymXpXP9LYvcP1fuNKUJBZ9Hj0QLc=
X-Google-Smtp-Source: ABdhPJyUtICnxChNmThzPFmd2mxmlxgT2Vf4Uq3J6C6iLge/0z3Zlx6o0pBqiUkPlRNLnjsnz4Jc3nCgip5GrDG9gAs=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr7419521ejc.69.1636448348975; 
 Tue, 09 Nov 2021 00:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CACRpkdZOpXC0GvoyS8KexgjxL17rjyNkPuA0KGOvesZMDLvyJg@mail.gmail.com>
In-Reply-To: <CACRpkdZOpXC0GvoyS8KexgjxL17rjyNkPuA0KGOvesZMDLvyJg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Nov 2021 10:58:23 +0200
Message-ID: <CAHp75VcxQ8nWqUTYzhJeUW55bvALHzcxQjMTP5UQwxmwu2aZ3Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Linus Walleij <linus.walleij@linaro.org>
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
X-CRM114-CacheID: sfid-20211109_005910_419146_0DA1DDEA 
X-CRM114-Status: GOOD (  15.54  )
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

On Tue, Nov 9, 2021 at 2:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 2, 2021 at 9:02 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > > +       depends on OF
> >
> > So this descreases test coverage.
> > Linus, can we provide a necessary stub so we may drop this dependency?
>
> Hm it further selects OF_GPIO which depends on OF
> so I don't know how that would work.
>
> But does it decrease compile coverage a lot, even x86 has
> optional OF support so I imagine it appears in x86
> allyesconfig I suppose? Or am I wrong?

I believe so. At least in my environment I have OF enabled (I haven't
looked into what was the change to the config, though).

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
