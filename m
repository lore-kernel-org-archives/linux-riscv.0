Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC618ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Jw2sgbG+Ezmvlt0blDZfD9Lanjyg2Qc0EV5/YMvxZE=; b=NMLz0OevFEM3/H
	enWe1vp1EbSzffbbw98Wrsy/MOyjtp4Pc9s0qrBu62iXoeR6AgIQ/ErTI+9jqv77RLcv7kH2ZdoUP
	xGnsb6yMsIhU9KUFcSEvBx78w06E79o436EO+CRFDzusnwanlziH3EYQmNK4IbQmVGG60sQmlcuad
	DJuSRT7h0SBQ1v0EyehH1IYoAyI1WroWMKst8jjuByLVFayNFCW3WywCTG/crbyiuS5qCTku65PD3
	XdQg4BIIU8xzTqZY9bbtR6S2ZSQTSoJpQiv7o2ae49io2payZQqZ9Wz+fNz6Zt/FbfJ9ScjLeNzlG
	aNsfd6BqEwG60zo23iPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGj7-003qvi-A8; Sun, 30 Oct 2022 22:24:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGj4-003qt9-9C
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 22:24:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x2so15188649edd.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 15:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ehgZaHubNZdo2CvP/zZp9+nzfQddeMRWlE6HcbIW7Bc=;
        b=fAiybpRL/t0xYJnQDs28gp1slIWnDCfdLof3SC3Fkl4g7yuZ52njLvwzyqEdePx2gY
         uzKemtzQoYrCR1UWi98cA+x39VO54pkp0J/P3mhCXjxAAMKUTbfIaEscy07tkGm2xvW4
         JxIAI3w0G7t06j8thtGI2bR2rcLsxnFJ495PDtKxaUYupEepcIg/+Baqc9hoaZ3NEYZY
         GVRNLjrrwdQTGGCjToWl72Dp1Iu07uxuGVNmtNRF9qQRLoj7cFRppgvfemUa/eP+/ICD
         PXA9V2HQn30y2x5myXeEicJqYBWrZfGH2M9hSW3K5xf1YhITGffjw+NE1GytWYX4d5uK
         VRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehgZaHubNZdo2CvP/zZp9+nzfQddeMRWlE6HcbIW7Bc=;
        b=eOJpooH45XcrfO37KdDEPPZ1KI9TtRWdRV91Utf/DGXxJt3RxOr9vYVtEr5ItILVHK
         mySNU+LVIZ6QI0uRQyNczZwwBYmLAYSa9skb5hxB8m3Poge2zRkiCQLu698loYQk8CHw
         sdTs8FdC8xhit+z8fn+9fQ3tg6kVUosl9UiIx8q33yg3Uez1W/zDi8HIQJZeXCELG9fR
         i51gmTSsXDulwHzHcFZetoqIsrYqeG/eG3f7DgI7kmOODJVLi5I2WaRB5dwkV+8gD+Ha
         9lPigLPLLRbgIHbIh/dZXqm2lH3Z3q+K676Qi/IqOCr7DxsBBjvNnNhDQU4CH2R48vNo
         48tg==
X-Gm-Message-State: ACrzQf2DtOr0XADeDjGAofSlr9RvivJ6UAqsS53f65C53YsFCqmuAa1T
	sDb5c8BHtzIYy2lLP1tLzeOCb/5QdpfgXpopeUU=
X-Google-Smtp-Source: AMsMyM4YcN1F9xu9xszEg4LkYX+BeJuqsPfuXm0qiSqiFXYi3Rf+npa6BKZj5fpEQxHUpudLRCxbwKeAW5O0Eu5nito=
X-Received: by 2002:a05:6402:158d:b0:463:2343:b980 with SMTP id
 c13-20020a056402158d00b004632343b980mr6021896edv.150.1667168654744; Sun, 30
 Oct 2022 15:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
 <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com> <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
In-Reply-To: <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 30 Oct 2022 22:23:48 +0000
Message-ID: <CA+V-a8v6Bd9byKVRsLXzh4Bzco+5gVkJm8Azwvr2y36LB5Hk3w@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_152418_361625_B21D0FFF 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Guo,

On Sun, Oct 30, 2022 at 1:02 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Oct 30, 2022 at 3:11 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Guo,
> >
> > Thank you for the review.
> >
> > On Sat, Oct 29, 2022 at 5:25 AM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > > > Single).
> > > >
> > > > RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> > > > will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> > > > r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
> > > >
> > > > Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> > > > can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > - AX45MP CPU
> > > > - PLIC
> > > >
> > > > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v4 -> v5
> > > > * Fixed riscv,ndev value (should be 511)
> > > > * Reworked completely (sort of new patch)
> > > >
> > > > v3 -> v4
> > > > * No change
> > > >
> > > > v2 -> v3
> > > > * Fixed clock entry for CPU core
> > > > * Fixed timebase frequency to 12MHz
> > > > * Fixed sorting of the nodes
> > > > * Included RB tags
> > > >
> > > > v1 -> v2
> > > > * Dropped including makefile change
> > > > * Updated ndev count
> > > > ---
> > > >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
> > > >  1 file changed, 57 insertions(+)
> > > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > >
> > > > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > new file mode 100644
> > > > index 000000000000..50134be548f5
> > > > --- /dev/null
> > > > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > @@ -0,0 +1,57 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +/*
> > > > + * Device Tree Source for the RZ/Five SoC
> > > > + *
> > > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > > + */
> > > > +
> > > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +#define SOC_PERIPHERAL_IRQ(nr) (nr + 32)
> > > > +
> > > > +#include <arm64/renesas/r9a07g043.dtsi>
^^^ look below...

> > > The initial patch shouldn't be broken. Combine them together with the
> > > minimal components and add others late. Don't separate the DTS files.
> > >
> > r9a07g043.dtsi [0] already exists in the kernel. r9a07g043.dtsi is
> > shared with the RZ/G2UL SoC (ARM64) and the RZ/Five SoC. There are two
> > more patches [1] which are required and are currently queued up in the
> > Renesas tree for v6.2 (Ive mentioned the dependencies in the cover
> > letter).
>
> You could just move the below part to the second dtsi patch. Then
> compile won't be broken.
>
>             clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
>             power-domains = <&cpg>;
>             resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
>
Compile won't break at all, the CPG node [0] and the pinctrl node [1]
already exists in the kernel which is being re-used by this SoC DTSI.

... the include file above already exists in the kernel and is not
part of the next follow up patch.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=next-20221028#n541
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=next-20221028#n563

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
