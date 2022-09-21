Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DF2C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvHB3rdcR+mFyE5nZckww/ip4jj3wRMkN1fPRrfLhUs=; b=tar3zWTDM60Yc+
	AxSPZxxwT7rY3mviTXqaHmk9nL658S9gP05W9r9ITtnV846cG/493BoLhhbhZ/CJlWDc6qbXUpT96
	7g8KMmONMyqVd9TKABEEJm3dzlnyiUFMgt3pjjG9e1AsQH8e4uazzccFxHPAp8d61rkN0zej2eBQF
	vidUCIDc1QK7K3G4MW32xKbJukqIAnsPyArxLRnXjjttchYk6slKLz7xV9FTYnYsnlJkiFC/VafMD
	bFG9Ry+0Zxjrn4rSLCaF3+6nIsau+aiBA2PaHM0u0pIymGpv9tyTDMegDlIuOgaRzVsNMqwjQ+Qr8
	5U2TWvCbu4GY0C1J7Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaw1P-00AOsd-2E; Wed, 21 Sep 2022 09:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavty-00AL49-UZ; Wed, 21 Sep 2022 09:20:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22BC2139F;
	Wed, 21 Sep 2022 02:20:23 -0700 (PDT)
Received: from [10.57.18.118] (unknown [10.57.18.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 661D83F73D;
	Wed, 21 Sep 2022 02:20:14 -0700 (PDT)
Message-ID: <45d2e6c2-3b4b-5720-0431-002c74b1f9cc@arm.com>
Date: Wed, 21 Sep 2022 10:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Atish Patra <atishp@atishpatra.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_022019_138289_6B25436B 
X-CRM114-Status: GOOD (  30.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-09-21 08:46, Geert Uytterhoeven wrote:
>          Hi Rob, Krzysztof,
> 
> This is a topic that came up at the RISC-V BoF at Plumbers, and it was
> suggested to bring it up with you.
> 
> The same SoC may be available with either RISC-V or other (e.g. ARM) CPU
> cores (an example of this are the Renesas RZ/Five and RZ/G2UL SoCs).
> To avoid duplication, we would like to have:
>    - <riscv-soc>.dtsi includes <base-soc>.dtsi,
>    - <arm-soc>.dtsi includes <base-soc>.dtsi.
> 
> Unfortunately RISC-V and ARM typically use different types of interrupt
> controllers, using different bindings (e.g. 2-cell vs. 3-cell), and
> possibly using different interrupt numbers.  Hence the interrupt-parent
> and interrupts{-extended} properties should be different, too.
> 
> Possible solutions[1]:
>    1. interrupt-map
> 
>    2. Use a SOC_PERIPHERAL_IRQ() macro in interrupts properties in
>       <base-soc>.dtsi, with
>         - #define SOC_PERIPHERAL_IRQ(nr, na) nr          // RISC-V
>         - #define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI na  // ARM
>       Note that the cpp/dtc combo does not support arithmetic, so even
>       the simple case where nr = 32 + na cannot be simplified.
> 
>    3. Wrap inside RISCV() and ARM() macros, e.g.:
> 
>          RISCV(interrupts = <412 IRQ_TYPE_LEVEL_HIGH>;)
>          ARM(interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;)
> 
>       Cfr. ARM() and THUMB() in arch/arm/include/asm/unified.h, as used
>       to express the same operation using plain ARM or ARM Thumb
>       instructions.

4. Put all the "interrupts" properties in the SoC-specific DTSI at the 
same level as the interrupt controller to which they correspond. Works 
out of the box with no horrible mystery macros, and is really no more or 
less error-prone than any other approach. Yes, it means replicating a 
bit of structure and/or having labels for everything (many of which may 
be wanted anyway), but that's not necessarily a bad thing for 
readability anyway. Hierarchical definitions are standard FDT practice 
and should be well understood, so this is arguably the simplest and 
least surprising approach :)

Cheers,
Robin.

> Personally, I'm leaning towards the third solution, as it is the most
> flexible, and allows us to extend to more than 2 interrupt controllers.
> 
> Note that this is actually not a new issue.  For years, ARM SoCs have
> existed with multiple types of cores on the same die, using Cortex-A
> cores for the application, and Cortex-R/SuperH/V850/... cores for
> real-time and/or baseband operation.  So far this wasn't an issue, as
> only the Cortex-A cores ran Linux, and we ignored the other cores (and
> the related interrupt controllers and hierarchy) in DT.
> 
> What do you think?
> Thanks for your comments!
> 
> [1] https://lore.kernel.org/lkml/20220815050815.22340-7-samuel@sholland.org
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
