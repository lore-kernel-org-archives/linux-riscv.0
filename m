Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B8EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875DC61058
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 875DC61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imv7AGhO0k3Cfq19Uwg09A/IpcHgTCE5aIui+gPqg/s=; b=KPtqtsf1lr/Lpy
	Q2YuX+n+AoSo1rsltQPwElNaaL83FfAQP8ioVW3vv8tfi8iqGFHQKQ0VPwKnCBlRkzgTSfhkqSPi9
	vw87b+sgMfqATqdNR5HarXwqdnrIfx2iXa0T5O7wTAqCBme7nYEBSF6f8C2m8Ro634ivN11jR5Oae
	43/wy93p4YBOSc0NlkRDz+nDb5uIePgEaAW9+VwLFEWQeoz2DKJ5jmIxsL3UDIbiFdrkit9DolIP/
	o9/7NpEg6Gt7X3VsDBegp12Ohc0gSjcUFs+jk6MNayClrQzDcetkDzZNTNPJfth1TLUbJFP3f3VuQ
	zVY2tBfT87DpdWCquIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miGLI-005Jq7-VV; Wed, 03 Nov 2021 13:30:16 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miGLF-005JoQ-Sj
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 13:30:15 +0000
Received: by mail-pj1-f49.google.com with SMTP id gn3so1288873pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 06:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTMij4riOHLD0cKrMBvNEsbDWm7ejt3VqpUfGJxdY7w=;
 b=IK2Vss4qLY2eU5qLM2kD+IDCwCyUvYVFUQtFD1yzBYRpJs8s+78Uighs41j7NJ+7qV
 ZRFVDLeonBWBdEIfWgHCYml3fv9boicek5LYfKFiRU4860/fG47RK8uMXditS0qg7qqw
 80CsGhzu9C9bkXkXQ0R987sGlfXP3HjzPv7B6MP9+zcch6dgyCvILgtjs4TkHguFPLfa
 il8+5yVyODwIPqkoVrZlNbiLUt/erIXerewUOseKZ4UOd4ououdlegQTND07z6v3j8Po
 /f+xgVAfP8BUE2KVsNTCJlZ4kLirjammi4LUoy7v8ALB9kWfhFS+B/nK3u9eTCRVsS3V
 0nfw==
X-Gm-Message-State: AOAM531VvgSBWhjslzPBN6V9OlzLizvleMj8ltKIfajfciJbWbnjIeoI
 80LSeBmGoqc35TraewhdN9l3GW5K4tIwT7qK2+Y=
X-Google-Smtp-Source: ABdhPJwNq6Q76J7qXE/0eAQN5HimezZY3rwDPmoANzNGDoGAXLzuRGbdMKq3Oek9Nc0X4IigXZvlpuqyhJ7hmGVXXQg=
X-Received: by 2002:a17:902:a60f:b0:141:8996:3fe with SMTP id
 u15-20020a170902a60f00b00141899603femr37563503plq.71.1635946212677; Wed, 03
 Nov 2021 06:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
 <1635902437.610819.3880381.nullmailer@robh.at.kernel.org>
In-Reply-To: <1635902437.610819.3880381.nullmailer@robh.at.kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 3 Nov 2021 14:30:01 +0100
Message-ID: <CANBLGcwTB27kSRC7HCAJvrk7T0zyj1eM1i4YHj8Prar6JLqTYA@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Matteo Croce <mcroce@microsoft.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Fu Wei <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_063013_972907_3B989369 
X-CRM114-Status: GOOD (  20.61  )
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

On Wed, 3 Nov 2021 at 02:20, Rob Herring <robh@kernel.org> wrote:
> On Tue, 02 Nov 2021 17:11:20 +0100, Emil Renner Berthing wrote:
> > Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> > StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >
> > @Linus: I'm really struggling to find a good way to describe how pin
> > muxing works on the JH7100. As you can see I've now resorted to
> > ascii-art to try to explain it, but please let me know if it's still
> > unclear.
> >
> >  .../pinctrl/starfive,jh7100-pinctrl.yaml      | 307 ++++++++++++++++++
> >  1 file changed, 307 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dts:19:18: fatal error: dt-bindings/clock/starfive-jh7100.h: No such file or directory
>    19 |         #include <dt-bindings/clock/starfive-jh7100.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1549835

Hi Rob.

It seems like your bot didn't add the clock header because the patch
already has an Acked-by from you.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
