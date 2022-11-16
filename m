Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72473C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWYD0i9c/laCSj9T+rAtdSI/zh0Ps3LmdYJkVX5Ezss=; b=S2rzTbNMjuApeP
	OuJSxu+WsWmsRQQ6pSgLn+pHerptlWcoiIrk2fSbUWMljfKO4+hICVecbLJvfO7JFO+Eef9gF83qm
	a9TqLEtpN2GchbFd8weCSz1y7B6TKj5RxAz2KXfmMpgV1LoEFpaUw92R+sa7BVLXgJQnWWg+i0Ujg
	Yc0DDR07tq8rM/TJF7t7XeDJcMIkCHcG/mLKny9ORU8Cr7EikuljXmyRxq1SAv9J9hTFvtvvFUcq3
	f85+AePd56qTwN8Wz/tRvPBnB/tizcR3E76rVImNZ5CURaT4tyaklrM/7UOHFnybIdH5QxlpG6trB
	TtNCHpbQCudnXOALgtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovENk-001VBX-Jr; Wed, 16 Nov 2022 09:06:56 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEL1-001T9t-LR
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:04:09 +0000
Received: by mail-qk1-f179.google.com with SMTP id x21so11233579qkj.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmIeQZARSPuMEBQfP7VelxzQDQAJgpM+Uez3QuwZD1U=;
        b=7a6kFb2wrgGhOSnia015L8pbo8gdQ9cj+1kQcBuZDM1RXcZqYajJl6rrA6+hcVMKud
         l5SU+B5cTTSlD2XIlWGuqTk5+MQIQl5DkYQ4z0li61D4n68tIJ6+7P08lrlrazSKwz0L
         FNV+BxzmDDnZQEHzcDrj4Na0XO6SAYEVyNTtsNwpShr6TOWQiVNaoolynubzBEOohv8S
         mHX8y4upImSZwfhzofvtwSSqIO1egDWLVuIVTWDbBFCFjSCAXtzrqchX1ih0ykbOU0nR
         lMH9U6SyI5vWQPSxEue3ZfG8LdBEBaYy7D+lGWI24iGge5fL/ooRNYLB1cXU7x+j4Onz
         /gFA==
X-Gm-Message-State: ANoB5pnWB26DI9A1kaiwtxOmxeHbStt85xOLIz2UBOZk3j5dCoL9Ecbb
	x3AfKzdnJbRPIJ4SzUXy/yDqDjqx4d9vJg==
X-Google-Smtp-Source: AA0mqf4hZiuRCpBstJcGIwr6rnmyvw/E2Mx1OActQVGDjQS7OcCpZcMuVomwlmlPYjwNYbVHYlJBKw==
X-Received: by 2002:a05:620a:676:b0:6fa:d303:963 with SMTP id a22-20020a05620a067600b006fad3030963mr18835340qkh.562.1668589445191;
        Wed, 16 Nov 2022 01:04:05 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id f21-20020a05620a409500b006fa4a81e895sm10071600qko.67.2022.11.16.01.04.04
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:04:04 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id i131so20031310ybc.9
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:04:04 -0800 (PST)
X-Received: by 2002:a25:258d:0:b0:6ca:3b11:8d76 with SMTP id
 l135-20020a25258d000000b006ca3b118d76mr20609898ybl.202.1668589444351; Wed, 16
 Nov 2022 01:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221115105135.1180490-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221115105135.1180490-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Nov 2022 10:03:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEnd1A3s6iPAqB_+78Q_Sx73XQBW5wU9Mtouw4EiOmJQ@mail.gmail.com>
Message-ID: <CAMuHMdWEnd1A3s6iPAqB_+78Q_Sx73XQBW5wU9Mtouw4EiOmJQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: renesas: r9a07g043f/rzfive-smarc-som:
 Enable ADC/OPP/Thermal Zones/TSU
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_010407_737042_7743C29A 
X-CRM114-Status: GOOD (  20.39  )
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

On Tue, Nov 15, 2022 at 11:51 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable support for below blocks found on RZ/Five SMARC EVK SoC/SoM:
> - ADC
> - OPP
> - Thermal Zones
> - TSU
>
> Note, these blocks are enabled in RZ/G2UL SMARC SoM DTSI [0] hence
> deleting these disabled nodes from RZ/Five SMARC SoM DTSI enables them
> here too as we include [0] in RZ/Five SMARC SoM DTSI.
>
> [0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> @@ -16,13 +16,6 @@ aliases {
>         chosen {
>                 bootargs = "ignore_loglevel";
>         };
> -
> -       /delete-node/opp-table-0;
> -       /delete-node/thermal-zones;
> -};
> -
> -&adc {
> -       status = "disabled";

I believe this is not sufficient to enable the ADC, as it is disabled
by default?
So this needs to set the status to "okay" and configure pin
control, depending on SW_SW0_DEV_SEL, just like in
arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?

The rest LGTM.

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
