Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51830C6FA8B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHz5N/OSvpsH5xX2v6tsjpX3jdGsn562Kygzf/3djNU=; b=rXRCCruYsrAyx+
	QCUoGQrDKPHqrMJ0SpmokDTnfIDBtiJ+ftoFJeLXKsspZuRSf5W6uFDzRW1Xxk4Stlcmko/+/dZ0Q
	5z2XmG3YNPrRsmfEU5WYyw2J0tN7CRhErayOoggGORNRQCsPxlDFK5QcCcMYAKFSXLBYBGHw3hvJZ
	UHbvqeMuspzxWgpGHTSPH40psTy9+rSeqQTPBLh9xMhVs6QTE+2q71cpzDNT6qVBEH+LbPXheGDVo
	QjY46rltG65jtHwi2RVfiMOq4p1JZzsZwhKmeh5lZVVwJQdNaOXRBZT//BoWhRhvJ321+FcRVVEKd
	BDEvpRIXlLjzwNfFy4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacQd-003j4N-E8; Tue, 20 Sep 2022 12:32:43 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacQa-003j1g-BG
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 12:32:41 +0000
Received: by mail-qk1-f172.google.com with SMTP id d17so1419528qko.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Wf+OpOOgKm2MQUZNT6fzDTc2lerh5dFGABEYb4COJ4Y=;
        b=GsaehqKYj0JKE2sD1aTuT/APjVKpQAqCAd2n6VJhtZ3cZqNjiS6dPc4n3+Lnod/949
         PZU4h0f7P7asnogOa4TDubVZXdMV1YVmqXET8ibu4+Zz+VOyqub10fceDlU2VW8Yks/l
         vqTITVKYn9E3+qIALmWdWqAZTnadCQ7LV/BoPZscEy5C1VmguPB9tTyOMZIQrOtSpOuF
         QjCodgO3W1tcDjjBEAsM7YmRWm4+xCOkEWCxY0yWQZrgoHM7g0p2wT4PytEOnjE5ek5O
         VvQuPRU6mURG9wrcdEnahCQZuKGVHWmZ5uu5rauvs6Yx4vwqN0YZ9vZKFjn2g5l4YaCu
         sReA==
X-Gm-Message-State: ACrzQf2BEy4ifRMklsfkK4zy/CPxup8qECx/CUVEQYEwEF029RB8rvVk
	GNIhr7kh43dqxVbDKuDiDKIugabgpb5JUw==
X-Google-Smtp-Source: AMsMyM4Gx3Z6V9XX32WjnUCADZVSzZBpezoI17RuOSl+fmolGp1Riy8W3D1QYQ6mwa9yfjso0jRQhg==
X-Received: by 2002:a05:620a:21c7:b0:6cd:52bc:b578 with SMTP id h7-20020a05620a21c700b006cd52bcb578mr16030159qka.385.1663677157838;
        Tue, 20 Sep 2022 05:32:37 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c27-20020a05620a269b00b006b5bf5d45casm74491qkp.27.2022.09.20.05.32.37
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 05:32:37 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-345528ceb87so24772907b3.11
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:32:37 -0700 (PDT)
X-Received: by 2002:a81:6756:0:b0:345:525e:38 with SMTP id b83-20020a816756000000b00345525e0038mr19491451ywc.47.1663677157058;
 Tue, 20 Sep 2022 05:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Sep 2022 14:32:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW99EutciosPtOTU9AztfvfMdKTaS+YRmpmS4VnhZ9KAA@mail.gmail.com>
Message-ID: <CAMuHMdW99EutciosPtOTU9AztfvfMdKTaS+YRmpmS4VnhZ9KAA@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_053240_406345_C8759280 
X-CRM114-Status: GOOD (  25.14  )
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

On Thu, Sep 15, 2022 at 8:17 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the minimal blocks required for booting the Renesas RZ/Five
> SMARC EVK with initramfs.
>
> Below are the blocks enabled:
> - CPG
> - CPU0
> - DDR (memory regions)
> - PINCTRL
> - PLIC
> - SCIF0
>
> Note we have deleted the nodes from the DT for which support needs to be
> added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> board DTS/I.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> * Dropped RB tags from Conor and Geert
> * Now re-using the SoM and carrier board DTS/I from RZ/G2UL

Thanks for the update!

> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +/*
> + * DIP-Switch SW1 setting
> + * 1 : High; 0: Low
> + * SW1-2 : SW_SD0_DEV_SEL      (0: uSD; 1: eMMC)
> + * SW1-3 : SW_ET0_EN_N         (0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
> + * Please change below macros according to SW1 setting on SoM

"on the SoM" (like in r9a07g043u11-smarc.dts)?

> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK SOM
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
> +
> +/ {
> +       aliases {
> +               /delete-property/ ethernet0;
> +               /delete-property/ ethernet1;

OK

> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel";
> +       };
> +};
> +
> +#if (SW_SW0_DEV_SEL)
> +/delete-node/ &adc;
> +#endif
> +
> +#if (!SW_ET0_EN_N)
> +/delete-node/ &eth0;
> +#endif
> +/delete-node/ &eth1;
> +
> +/delete-node/ &ostm1;
> +/delete-node/ &ostm2;

Given they are all placeholders, do you really need to delete them?
(more below)

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
