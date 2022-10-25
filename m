Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B238C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvAtwQ8aOvrB1p8WAOaOiBuqMTkvcUQFVHkom58Ud9g=; b=Fu9Zbh1O+gra7+
	seO0iLVwh64bZCOqGAjolUcyXXcI2ShpXymuUkjedjrSxunWD4qojkQR3598eOaqDb84Sg404rFY3
	hvmSqiZ/GvG8QOKL2zxvGZi5CT1oBQH8VUwP5oN/0zQQmHaPL1iTP24JtjJd2GA8MKQep9v4eI9W8
	KOvj5fi2m1BW7DHgryq2mJLNBH5QLWWDY42MBBVK5LQpmsaksTzsUGwIzvgubaZo4m2QLvyDwbxt6
	mwlU5AwgdYLoxz1O3Cb7CComnuU5L56rWb7IsclaqV/7jEIW+Xfk0m4HhvidVEI6ONc7pYX5Kh9S8
	e3isvmDAvL8+SyRNLdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJ3G-005B1P-O8; Tue, 25 Oct 2022 12:29:02 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJ35-005Axh-Fb; Tue, 25 Oct 2022 12:28:53 +0000
Received: by mail-qk1-f177.google.com with SMTP id b25so7865226qkk.7;
        Tue, 25 Oct 2022 05:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zk1x69BorUq5EOLXWvjLkthJmpSNSl2Oga4mvV/7nWM=;
        b=QBAvWggdD+yZaY70huvmncC6l23e3xWqiACBgFZM6JzG4LWcfJcvayNbXXfNug2GTv
         OFVcgd0ZkGRX/u0HncTYGUnL+OpkRwkuPVE1kF+aCDdhiib0KMrDWwZA52Wb6XnHf7WJ
         dsbPrPsTVNByXWwcjA++HGFEFbZy+7+5d5bDOPulH4Y6sULCL8L55/CT7g8qkLrwBuqC
         CoAUJV6a6KU3/D+pNIpbWheCNXTnENOGSQsCEnKXFKIWO3bEy91g4xcsrfolgFMWNq3Z
         e0d8w3uqCvj6lMZYGB3q5gPpy9tb1sLp1MlhAqdlfHmB/qjHzi4yn9CQCQmf94SZHN2f
         49Ew==
X-Gm-Message-State: ACrzQf3m3tWLKqzGu3do3YWEo8vgMjxZeXoq1SXmteAsygEVfv/in5Xg
	vQGVx8CLHJnudZukppvZh7KDnOVrN1KI0w==
X-Google-Smtp-Source: AMsMyM62AXdklGtKK0dMm+cQKnEn523XJwXJNQKFcnlrRvo+8nAVHzEtb+g5J1XM38URgRiWA3eRXQ==
X-Received: by 2002:a05:620a:2809:b0:6bc:5e42:fef9 with SMTP id f9-20020a05620a280900b006bc5e42fef9mr26349918qkp.278.1666700927702;
        Tue, 25 Oct 2022 05:28:47 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a430500b006bb78d095c5sm1982523qko.79.2022.10.25.05.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:28:46 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-367b8adf788so111845927b3.2;
        Tue, 25 Oct 2022 05:28:45 -0700 (PDT)
X-Received: by 2002:a81:12c8:0:b0:36a:bd6b:92fb with SMTP id
 191-20020a8112c8000000b0036abd6b92fbmr16103916yws.316.1666700925399; Tue, 25
 Oct 2022 05:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221017091201.199457-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221017091201.199457-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:28:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
Message-ID: <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 1/2] arm64: dts: renesas: r9a07g043: Introduce
 SOC_PERIPHERAL_IRQ() macro to specify interrupt property
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
X-CRM114-CacheID: sfid-20221025_052851_539884_CB0ABC30 
X-CRM114-Status: GOOD (  24.28  )
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
> Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property so
> that we can share the common parts of the SoC DTSI with the RZ/Five
> (RISC-V) SoC and the RZ/G2UL (ARM64) SoC.
>
> This patch adds a new file r9a07g043u.dtsi to separate out RZ/G2UL
> (ARM64) SoC specific parts. No functional changes (same DTB).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2UL SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#define SOC_PERIPHERAL_IRQ(nr, na)     GIC_SPI nr na

s/na/flags/

Originally, when I assumed incorrectly that dtc does not support
arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
although the second parameter now has a completely different meaning ;-)

However, as the NCEPLIC does support interrupt flags, unlike the SiFive
PLIC, there is no need to have the flags parameter in the macro.

> +
> +#include "r9a07g043.dtsi"

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
