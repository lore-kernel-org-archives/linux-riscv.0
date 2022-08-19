Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C509C25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpH2eFPz9BgTvpAIq7Yn8hRy2YRlxcWhxSUDTBxEUXs=; b=4G5YAuIPZSMg+G
	YCaP8j9sNAslRahhQmkxyWlokOHymfxRey7iX1L18oWTQBy2mQbVrhS+lmdhEmSOVIx8a3p2+4XCX
	ds+/AP6Ly0TOWbvRVsxX2UEgdpQuqiauSyvB5VRfKQGR5zkNTuOUfOE8pr1Mmglck14lL1rHMSepD
	83KiQ6GHTDfpg8vEnrICEx+xXNN5xAANw2e4N9IWeRu/vW/mCoqvU6btXDmKrP7yjPwrpouteFgkg
	syCfExMFDuIG9bfF0k1MNvL2VjT43JGiX8uC7+WmoDC+yBIV8azugo1zKAx5T+7U6o9Y4q+8pOmCr
	pTcjpWtbXYtqA0VjhoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOx02-003mBV-SS; Fri, 19 Aug 2022 08:05:02 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwzz-003m8r-Vp
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:05:01 +0000
Received: by mail-qt1-f169.google.com with SMTP id h22so2823561qtu.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MAnXagYjiuWeDTJ+i5sfMrFcvpfp6NbedVvWmTP//ek=;
        b=SsgOZE+EdB6HpEUOm4Zt7l8xyuKGXdtSVWGrkvNzBIBloRHXaduApKcONwbyUG8e/u
         n8NgH/K3eHj0ncSHceafRxZGfQ7at+7va+GV10If4PucllsxoqOMxeYxeX26vWup2vrZ
         OyEoN7tSGJbTjMEg9TeoNghaVxQjaPvA/Lpp5/q95kikLptKPGIwRV0u5xziZsC3aRqY
         tSBk6c+ww2XzCgQrSIJLTEM+GP5mmxiFFZlJHLs7cqe9rKLsUwuSvOiIXxtz7eyWPzyZ
         IkwYcT9oV0BZruDrTUt6CHpBvS1tgC0Z0iha7o6WCfgsYx0bX/QSYUpUuFnv8+MHkIEd
         OdqQ==
X-Gm-Message-State: ACgBeo0JBi6DC/moOB4A2/saEv2OS1dFwFDeKnzOqrEZcIDmVqYF2v1E
	Tj9yTEofHMRV+74ZX/+yPAACUoQUR0QpNA==
X-Google-Smtp-Source: AA6agR4ZxX7c9XNkoH0UUK5Zg3Z7TrpG7dlsUcM6Ov4sQKXR0xJkF2HRjDo9ZpL36ZEZhUiOBD++Rw==
X-Received: by 2002:a05:622a:24b:b0:343:4f6c:7bee with SMTP id c11-20020a05622a024b00b003434f6c7beemr5516694qtx.637.1660896298035;
        Fri, 19 Aug 2022 01:04:58 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id f39-20020a05622a1a2700b00342f05defd1sm2686496qtb.66.2022.08.19.01.04.55
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:04:57 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-33387bf0c4aso101896777b3.11
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:04:55 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr6390139ywe.384.1660896295663; Fri, 19
 Aug 2022 01:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 10:04:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com>
Message-ID: <CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_010500_049034_95058765 
X-CRM114-Status: GOOD (  25.99  )
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

Hi Prabhalar,

On Mon, Aug 15, 2022 at 5:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> Single).
>
> Below is the list of IP blocks added in the initial SoC DTSI which can be
> used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SoC

My first thought was:

    This should be arch/riscv/boot/dts/renesas/r9a07g043f01.dtsi,
     including the common r9a07g043.dtsi, shared by
     arch/arm64/boot/dts/renesas/r9a07g043u11.dtsi.

Then I realized this is harder than it sounds, due:

> +       soc: soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&plic>;

vs. "interrupt-parent = <&plic>;" for r9a07g043u11, but mostly
due to

> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               scif0: serial@1004b800 {
> +                       compatible = "renesas,scif-r9a07g043",
> +                                    "renesas,scif-r9a07g044";
> +                       reg = <0 0x1004b800 0 0x400>;
> +                       interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <414 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <415 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <413 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <416 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <416 IRQ_TYPE_LEVEL_HIGH>;

vs. "interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH> ..." on
r9a07g043u11.
Interestingly, the actual hardware interrupt numbers are the same,
but the GIC DT bindings abstracts the offset of 32 by using a second
cell and GIC_SPI.  Unfortunately this cannot be handled by some CPP
magic, as dtc does not support arithmetic operations yet.

I expect this or similar issues to pop up everywhere, when more
RISCV-V SoCs will appear that share the non-CPU parts with ARM SoCs.

Ignoring this issue, which we probably can solve only later:
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
