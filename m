Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E1C04A95
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcF0p22fc9u+tRB0CKt8fEfDqM09w+CrsNb/b5+Mw/8=; b=FGIkDUmqKqsgUq
	A+5vfo+5wW09kQaZmhgjBHwW+scq7PqKJjghEFiijnPiftcrIisXFS9SjzOFFY5Gp/cgPX6pjexB1
	X5AwAz/+XgAPx8/NnU8Wf8p3BcDkim0Z66ih14QeiQtN0GWXEL9tReiRCeGR2KgtZbexJu7/JrnME
	0f8ySHqiKawH2A7fznrf3+47iXo9r1f5LFLQ50YInm9VqDG0iLTlTDE3/Zj4dnnaaUOTAg30DCgCz
	kfn2qgUsf2B8xQe4H2kTQJrUz6TZnaly55+u8Of78Q5SCUfaOl/2BbsDXMTmH5+zDkaIrgDyZX/y2
	tJ0qaA/IZ7Tk03AhIsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJIQ-005FZk-JT; Tue, 25 Oct 2022 12:44:42 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJHu-005FJU-UI; Tue, 25 Oct 2022 12:44:12 +0000
Received: by mail-qk1-f176.google.com with SMTP id f8so7913462qkg.3;
        Tue, 25 Oct 2022 05:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEjQC8UwPSpJbdU9AEdKNSZFHoUYuJmVXV6mmwXFmnE=;
        b=PiHAEszLKQCEMjUw81OCQt9MSIdIMt3yJXR9Y39KJ6U+Bt+nM2Unq06vi6ka15kgOI
         D6RxeDilPWjoByKhsCFx6DyZHSFeANIIWIleWN5GU9ozP/hPiIDOZfoFtvUAPfMejNI3
         xfJd/ff+BZzNT+5TipWjrJuLZKrLj/Ys37exmbXdrNtxJQ7UT6HWnM3ywnkigSOchrJE
         zgDEryLRrnr9Hltgxn/8YJIPWE6P9h15/ETys6rnSBoffVsvikQLiOUcXmA3fP4iF5kx
         XTwvp/vqtGU8APprlr2PQtPFLNBNaLAboAxvJGbE8Uv4BH4katIDdQg2tSOBZW//mpiF
         nuow==
X-Gm-Message-State: ACrzQf2X5VAGaDA8dAolbqssSu3BYiqha/eJ/cxulHIIXq04D0smTQS9
	EhS+bRsx+riU1BJ9JFbFLC9fejQ2N3sXkQ==
X-Google-Smtp-Source: AMsMyM74pbtF6hJ7t4KlVS7q7fRQSmbfI2V9tkoHxFmgneSpmrIhRWEJnXDocXP96zXEQ6iLts5Zfg==
X-Received: by 2002:a05:620a:28cf:b0:6df:9a0a:c5d8 with SMTP id l15-20020a05620a28cf00b006df9a0ac5d8mr26440654qkp.12.1666701848599;
        Tue, 25 Oct 2022 05:44:08 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id q11-20020a05620a0d8b00b006f1187ca494sm1993436qkl.28.2022.10.25.05.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:44:08 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-369426664f9so111835937b3.12;
        Tue, 25 Oct 2022 05:44:08 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr32925900ywe.283.1666701438736; Tue, 25
 Oct 2022 05:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:37:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
Message-ID: <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 2/2] arm64: dts: renesas: r9a07g043: Split out
 RZ/G2UL SoC specific parts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_054411_003720_EAFAC593 
X-CRM114-Status: GOOD (  20.53  )
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

On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> can be shared with RZ/Five (RISC-V SoC).
>
> Below are the changes due to which SoC specific parts are moved to
> r9a07g043u.dtsi:
> - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
>   for SYSC block on RZ/Five
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

This assumes the operating points tables are the same for both variants?
I guess that's OK.

Overall, LGTM.

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
