Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7ECC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l83ut2NGIPT9YGSprvybh+qK8fqg7gb19mVjV0pvTxs=; b=XO98FC2WRcOK93
	Y8DYLc5ccpmcUU9+bL4Hr7B73W/Te3jrWZu3ucag+19258ibqz3EfP8GtIx+yqURPn9YhboufJ03p
	nNmVJMtRwYSeVGtZwUD5tHjvSSLXIOMITGd81ebzrGedQM8u9RH32tViU3EdGRCKqgDWdM6mHtbR8
	UOeZx0cDKI1kqTtF8LTIUcJFNtlqNLduNhKwRPvam+nhb3COZ2WNcjHIh9TQadaqdPs1Zvd11AR7d
	u3Sh9J6qX/v6oDCASru2uO8Bcf89XiTI7t+wYkXMM094YU7bVxXksfYOD93141GfJ/NK7u2ZJ8UU4
	WQLJxGYp5vUWGBPsrt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovERI-001Xjr-1F; Wed, 16 Nov 2022 09:10:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEO6-001VQZ-P8
	for linux-riscv@bombadil.infradead.org; Wed, 16 Nov 2022 09:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SmZ/a6rCcRl77Zg9NUCks3KXP0Nym/qibrWauqUGkuQ=; b=DlIEjlk2/F5H0ags/pudKCVj3r
	AamriwcbyOMTOor7HFNx7mAzTtxUu4wLHxgMpRJe0giMVidCSLgqID3Mh/CPD5r3P0aPiJWAu0ecL
	3CS1rmqaWoTwCH/67h7UQbEfAfyNEYFEhiiCu5Q60A8twUtm0Jx/wzbMVmp/m38gCS3hXxEmUDl4L
	Xt8JGZYVg0xkRdnHAhrawVzryG5qFCT8OitoFHcltyajQM4e0m8coKFtHmqocXuWckzKNh+kKKoVD
	q9yBcEdq0yqppgrnIIKXY75PMrUGWH0VUJG8wx7J8WsReqro7UwceOs8L3sOOAofVBi51s8lIQvmp
	V3gwBCXw==;
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovENw-001Fd5-Tq
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:07:17 +0000
Received: by mail-qk1-f182.google.com with SMTP id p18so11217838qkg.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmZ/a6rCcRl77Zg9NUCks3KXP0Nym/qibrWauqUGkuQ=;
        b=vcrBc/CesXCXaZjnRfeXsY5f89hjvwS4vYotHi4iscDiZIOoumFkT83VJS6zegM8MR
         DvzKNQjr69OPIYcnGx5ciCXZp71xZumS17Vh0Pbo+iA16lHHBrR5eBqmF0yC0pLTDcjf
         5azgtBl4a6H1K2IGpah/wNbIXud32N3Xc/j7Liu08hTm/P8b7ETNs0QvKr+hZMZq5QwB
         2GIfaXr/h7tFQst0zgIWsbC8LV4eucEKiceeXoRcCsQI0WytY9kkXxoz2KYUd+ZMVS0y
         APeTYnRYp5mWV3qDYTZt021wnz8pf6694IzT477hDrO8GmN/KDh/uFP/hrPWq1pTAHha
         2Hfw==
X-Gm-Message-State: ANoB5pn7qkZGl51HaRU8Ey2V7jK2lA0qTzF/p0FWerW2R0cFC/nKUTO7
	cyJREg+JNdo8aOXexOeJXG9yj7YqLQR1Tg==
X-Google-Smtp-Source: AA0mqf78QpGgmOcLuOaH/bTU6lqvaMV1c18lSHoPnWNjzxGr0ohlCogowZ6bEM8c0tuVDmlEtd+dyg==
X-Received: by 2002:a05:620a:a84:b0:6fa:470:7ee4 with SMTP id v4-20020a05620a0a8400b006fa04707ee4mr18383342qkg.153.1668589615210;
        Wed, 16 Nov 2022 01:06:55 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id cr12-20020a05622a428c00b003a50d92f9b4sm8457245qtb.1.2022.11.16.01.06.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:06:54 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id r3so20207266yba.5
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:06:54 -0800 (PST)
X-Received: by 2002:a25:844b:0:b0:6de:6c43:3991 with SMTP id
 r11-20020a25844b000000b006de6c433991mr19216743ybm.604.1668589614165; Wed, 16
 Nov 2022 01:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221115105135.1180490-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWEnd1A3s6iPAqB_+78Q_Sx73XQBW5wU9Mtouw4EiOmJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWEnd1A3s6iPAqB_+78Q_Sx73XQBW5wU9Mtouw4EiOmJQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Nov 2022 10:06:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQ1UAYsdOKpSbi8wUWBouT1z_W7Ko1ep2mkcq7iQm8jw@mail.gmail.com>
Message-ID: <CAMuHMdWQ1UAYsdOKpSbi8wUWBouT1z_W7Ko1ep2mkcq7iQm8jw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221116_090709_899819_24A361D4 
X-CRM114-Status: GOOD (  24.87  )
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

On Wed, Nov 16, 2022 at 10:03 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Nov 15, 2022 at 11:51 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable support for below blocks found on RZ/Five SMARC EVK SoC/SoM:
> > - ADC
> > - OPP
> > - Thermal Zones
> > - TSU
> >
> > Note, these blocks are enabled in RZ/G2UL SMARC SoM DTSI [0] hence
> > deleting these disabled nodes from RZ/Five SMARC SoM DTSI enables them
> > here too as we include [0] in RZ/Five SMARC SoM DTSI.
> >
> > [0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> > @@ -16,13 +16,6 @@ aliases {
> >         chosen {
> >                 bootargs = "ignore_loglevel";
> >         };
> > -
> > -       /delete-node/opp-table-0;
> > -       /delete-node/thermal-zones;
> > -};
> > -
> > -&adc {
> > -       status = "disabled";
>
> I believe this is not sufficient to enable the ADC, as it is disabled
> by default?
> So this needs to set the status to "okay" and configure pin
> control, depending on SW_SW0_DEV_SEL, just like in
> arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?

Sorry, scrap that. grabbing my morning coffee *now*.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
