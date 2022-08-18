Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF7BC2BB41
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Q+izi+uy+ownAP1OjUA8HbdwA/1RMbpUyEaXS4E7sE=; b=BZMzCz7b4uprJw
	+JcS9XoeJcCVW3fWcyqtEuVDIKeEtiemL8JV+t73TeYnMbflWZCkIbtrDmRCWJToCUPlHb1d07vXK
	gtdodlUkpPDPPm2+JJm7n80sPPjiu8+NDI8tt3/qwaz9vyeTM8QmTgweVMKuWtCyFZjHbL+Oano0n
	VC65f8X9y63CDPCt0HI3JUUU4BSuuEyQzTMTwISWZ1ituO4cS9iNmCmizOBmW0cPeZU5+VriolQ6J
	hLH8odIkuFPmobKz93AbIOg/m/uzwa9FP/9KpV1QTUoBJYEMOyUt0/yEtuTf/Us3FQEZhZkojnrRz
	eE6nLN+9NAB0Df0PW4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhKa-006Yjv-9a; Thu, 18 Aug 2022 15:21:12 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOhG7-006WBH-2q
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 15:16:36 +0000
Received: by mail-qv1-f54.google.com with SMTP id y4so1402673qvp.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 08:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fNAryURHxGVgmjXYIDSK6dvngkhik8cAD5MGphiVLyw=;
        b=6bcN6Jb/e6TrbpoxF1MqQ2ZXzIJ7XBNgJK2aiJScdN3kXbwP08AsTVdqOCoVsfr7Sa
         MZXX7+L/WBlAEJ4LXuYO2YUhStuT/MI7JuwoxLi5BpqBzIIKqdz1y+A+5BReTBsSnBNn
         6sDjtepLNFNiYKXc/uMNIFVR54UZybIWty6pgLiuS/r8O72htfduOM3UVppywFLwE87X
         D2flavEGzA2iya2v4JUL15VNs/i8ipDT0uXbLsn2kMgS3eXKb8PRMU1LpZsqTADrCPea
         5cat1mr8KPKUxq/o4Bb9B3Qby8JWPGF/UmFdOvpPkUAZAQ5ixROpNmzyQNw/FfthNHmO
         Ip9A==
X-Gm-Message-State: ACgBeo00tEE9b5Y1BFt9umweHNrUPOm28GUpaZHY2kSoC7464T2DzNf4
	LNBlOExf1jhwRXb+mBakiBx4EScQdstczQ==
X-Google-Smtp-Source: AA6agR4AXBQdxwsIKOpxwt0kmjbSTZJh8dSy18tXDoYR/eQnrEdeLOcrwcTnjux5C4wyCXtv6CrUxQ==
X-Received: by 2002:a05:6214:2582:b0:476:c4fa:5a22 with SMTP id fq2-20020a056214258200b00476c4fa5a22mr2754139qvb.130.1660835792452;
        Thu, 18 Aug 2022 08:16:32 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id y1-20020a05620a44c100b006a65c58db99sm1839366qkp.64.2022.08.18.08.16.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 08:16:32 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3246910dac3so49053357b3.12
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 08:16:31 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr3123682ywg.283.1660835791476; Thu, 18
 Aug 2022 08:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:16:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW29Q40hypWZ05KRj5cc=DY8XjnDwOPVw3kJPNUrnL0fA@mail.gmail.com>
Message-ID: <CAMuHMdW29Q40hypWZ05KRj5cc=DY8XjnDwOPVw3kJPNUrnL0fA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_081635_271276_BBA11B11 
X-CRM114-Status: GOOD (  22.79  )
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

Hi Prabhakar,

On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> of the Renesas drivers depend on this config option.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

The technical part LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
>
>  endif # SOC_CANAAN
>
> +config ARCH_RENESAS

We definitely want ARCH_RENESAS, as it serves as a gatekeeper for
Kconfig options for IP cores found on Renesas ARM and RISC-V SoCs.

> +       bool
> +       select GPIOLIB
> +       select PINCTRL
> +       select SOC_BUS
> +
> +config SOC_RENESAS_RZFIVE

Do we need this symbol? You could as well make ARCH_RENESAS above
visible, and defer the actual SoC selection to ARCH_R9A07G043 in
drivers/soc/renesas/Kconfig[1].

I don't know what is the policy on RISC-V. ARM64 has a "single-symbol
in arch/arm64/Kconfig.platforms"-policy, so we handle SoC selection
in drivers/soc/renesas/Kconfig, and that is fine, as it avoids merge
conflicts.

> +       bool "Renesas RZ/Five SoC"
> +       select ARCH_R9A07G043
> +       select ARCH_RENESAS
> +       select RESET_CONTROLLER
> +       help
> +         This enables support for Renesas RZ/Five SoC.
> +
>  endmenu # "SoC selection"

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-drivers-for-v6.1&id=ebd0e06f3063cc2e3a689112904b29720579c6d2

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
