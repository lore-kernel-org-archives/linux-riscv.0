Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B050FC43219
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IQBJL6BuONTuGubL81AquTsq7/TELo4ezafPmo7qGs=; b=2UOHM0VA9UP7aL
	0FANq9FkoV1U3wnq/MLnbp1KK02aUgkV+V1tIx1pH5ReMTD7d29tIQad92etDcLYy8SUo38fJMfSz
	evsZfeBNP4A8muM6VTvdVmUQoaFP9oMslyJpU/TMbproL4Zkxq06cmeXJD0R6Y7pX4/pj8WX0mtjC
	b3QY5hkpClTbcgeN29EGFaZ0GewirK3GGjWTahIvFlLXnOO9Ye7b7PGdEybOyIRviNGRuIkvQ50m/
	Mo+yTxom60UOeAlFRAxaaMSsAl9r8qe72NWbhTeTlX2e7ePcASATCn3a8L1suN1IhDtfG77T98l8T
	O0wNmgXggP9ubuk69pRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQl7-006SaU-3a; Tue, 08 Nov 2022 15:43:29 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQl5-006SZq-DG
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 15:43:28 +0000
Received: by mail-qk1-f178.google.com with SMTP id i9so9282407qki.10
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBbeZBrYz0Ir8oJqm4j9qjBeLOLNJGXBr3pOfnglPQM=;
        b=pu1FJ1iPiYxWBv0uyZzhXWjTlmF2Sh7KaRRCzodeIaPE6IMq6nebg1zbIKYw/9m0T1
         +6in/hbiL0kPHlFlwrfsTiqyVepXWvr2j55JvSlQzszCW29oz7RvklQRy2Q6rmmQ0DKY
         BNXArwmSlJGPWl5aeLagyqxe0Vc4rU6tebu0pxGkr5hGibdn9SJ1KB1FoZrtrAd09/bQ
         cBgHhwe0uV05wMNtCwjpyhq+VTtLLhA+PKBfKTDzaMtRdAepvCEZhAS80UzlOGldmKpd
         Ef3wHJ+w8O8oo6ata8L+uO+QzQfX6E2OhLnAxy47DlroxvH+yIPy7kLWQSThalhoyfjp
         pGsQ==
X-Gm-Message-State: ACrzQf3HX4hLBVsu1ahf+29k7sYJ8zgg0wvFRZN7uDP1nsjDurQsMs6f
	FGMy/bEE7Bt6GEpNawzWYatjGLOWOW8qln34
X-Google-Smtp-Source: AMsMyM6mtf882+/afcDg5qZYx9AeqFjziVPIdkh9e934vajB8UiMlMpr7ui4nCbuOdVG0VeZT+5z3w==
X-Received: by 2002:ae9:f50a:0:b0:6e3:3b4f:2ab1 with SMTP id o10-20020ae9f50a000000b006e33b4f2ab1mr39494900qkg.314.1667922204989;
        Tue, 08 Nov 2022 07:43:24 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id c24-20020a05620a269800b006bba46e5eeasm9502874qkp.37.2022.11.08.07.43.23
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:43:24 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 7so13268564ybp.13
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:43:23 -0800 (PST)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr36322209ybs.380.1667922202961; Tue, 08
 Nov 2022 07:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 16:43:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXh-aWpty=JEwB4Lx5eZZ3Mm43gxjCx2yptV+MOWx4kaw@mail.gmail.com>
Message-ID: <CAMuHMdXh-aWpty=JEwB4Lx5eZZ3Mm43gxjCx2yptV+MOWx4kaw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_074327_466350_F2377881 
X-CRM114-Status: GOOD (  20.63  )
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

On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> Single).
>
> RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
>
> Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> can be used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - PLIC
>
> [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Fixed riscv,ndev value (should be 511)
> * Reworked completely (sort of new patch)

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
