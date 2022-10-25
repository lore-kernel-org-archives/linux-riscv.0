Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5180C04A95
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqeuIhDVtbeDpTPaVRvA3IDCKfz0KfbUUdQiLwRrcXI=; b=uLWX96Qwzb9UpL
	2oY9zRYUHAWrzuYr2/kTXa7HAZwmLrSePzvXLYdXNfDlG+A1B2n6hpU1qefDoKGaZER5kqyApVvNn
	GTxbXl6RWEcYCLsYXCbrd6pvZYN/BPHvwy+mTMRVAGrqEBO1MC0rOOfPjZPlEFKHoYfCtJCRGxA+4
	X7BtiB8S7aU916NkoiMXZ776gY/45CYEA7J9KrYVESIH+E6T6l3Qf7LXvjWRqNqcKyKNnwJlocn+a
	1cbxz/gskOo4RV2Mw9XxIfgK98wURa/zru9e/aDGo+8p4BPE/T1seNwNt+d+wzGH2tgdzOMvc9NDo
	r4mHEHU5eZJKsV5Y/4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMWg-006F6L-B0; Tue, 25 Oct 2022 16:11:38 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMWV-006F40-VE; Tue, 25 Oct 2022 16:11:29 +0000
Received: by mail-ed1-x529.google.com with SMTP id z97so36992220ede.8;
        Tue, 25 Oct 2022 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlXbIDv9437lExc8ejab3R1D1/KjaGnyi1kzpCh97FY=;
        b=gLjcHgW+H7vRYcAMMpizp/Ql0s90VR4SnYym1rTloiMZSZCth0n7GsoLxeVMBofFSS
         fKW5dOM0xYdyi+G1CfGzjNYq9ldtyS/J+wetGAbPYOhde5gAjMMYi/YvfoBbGJb1+hAh
         mOUQT9ilxzCCK/OLWaWFBzNKpQiPdeZTjOKrGSYZRQYxau7PMiq5bBwpbtJzZ5Ps1IrW
         mWpOrApdt4w+Nmrn4+SjhC3eoJ+LzlrXCRSY671e0BoRbSyBDcvMhPqNzqcwip7kWzYQ
         rSuVu/bZjF2NhLAamh8akKhlTWGtZuBioS7moKOJtYVyW9HAtmrKSSwRhLMj2TqD/Pde
         bZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlXbIDv9437lExc8ejab3R1D1/KjaGnyi1kzpCh97FY=;
        b=n8kzGBAUFZGdurMIWgUH88mn9xDvt45b6X5GzVilGPM/5EK5KP8Y9Z1/niX2Ki+cNg
         d7jRZXODGiA2LbbX9bOGjUnQ1lPjLzd3TMjIDbnKiNU4qgvmfiQ9KoKXRjN7873z5s71
         N+cRzHpAQYQmEcZOixPWzeVZxOhHJrAj6EQig7gqzgxOSKkhBA28pOPCfP9QfogMAVhk
         CUfMngKNhXRshRFUSXYKgvgtJGSyUAGWWjszQiGh3DbJu6gSxS4fMfdEa4Ynt8aUw9DX
         /OscgQJlwOz2wK0j7gmxs/BC62sYT/T3zSpJHQrKPH+myVl8aZm4bG3M0m7kPo8QZ9J8
         Y1ig==
X-Gm-Message-State: ACrzQf0YV+NEaEdvZQ6U2lEHASVlYltN+rt6XEvPOEXSUJUzaji04XI+
	2IyW2Lb5jW3g0Ust7IDu+yKGJEJwYaIG+YeCq2DYM0vxjYc=
X-Google-Smtp-Source: AMsMyM5IYA65H7Pr/6Jmn0rANYjXlWU97pLnIVRzuk9t3RJDMspuL/wBdeTH2rr9fzryGYGCc8oupzb6cw4vPMk3DVM=
X-Received: by 2002:a05:6402:40c2:b0:461:a29c:4ac0 with SMTP id
 z2-20020a05640240c200b00461a29c4ac0mr13289160edb.319.1666714281900; Tue, 25
 Oct 2022 09:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221017091201.199457-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 17:10:55 +0100
Message-ID: <CA+V-a8s43vAhX4gf+AtgNoru_V4tq0e=cC+oB-VsSPJ_hWjj4A@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 1/2] arm64: dts: renesas: r9a07g043: Introduce
 SOC_PERIPHERAL_IRQ() macro to specify interrupt property
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20221025_091128_025441_8D40B7C8 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Geert,

Thank you for the review.

On Tue, Oct 25, 2022 at 1:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property so
> > that we can share the common parts of the SoC DTSI with the RZ/Five
> > (RISC-V) SoC and the RZ/G2UL (ARM64) SoC.
> >
> > This patch adds a new file r9a07g043u.dtsi to separate out RZ/G2UL
> > (ARM64) SoC specific parts. No functional changes (same DTB).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> > @@ -0,0 +1,12 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/G2UL SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +#define SOC_PERIPHERAL_IRQ(nr, na)     GIC_SPI nr na
>
> s/na/flags/
>
> Originally, when I assumed incorrectly that dtc does not support
> arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
> ("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
> although the second parameter now has a completely different meaning ;-)
>
> However, as the NCEPLIC does support interrupt flags, unlike the SiFive
> PLIC, there is no need to have the flags parameter in the macro.
>
Ok, I'll drop the second parameter.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
