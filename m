Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927ECFA373D
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 01:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtqdkQy3xM6X9UL5RaaVNlatfnAtxv2Rwwr2a2lAIig=; b=oquHK9b/xxQiU7
	D9cHZezZrgkvD7HBDUnU2pr5zFdl1dWrttpCu18yrq2DzEENFNdBmblsFdmulxzWiXY+pzNRIXgD3
	jsd1GAG1wUmPXf7gYqo+ETZ++9qjkNJ6dI0N8fR5y1jjVyNw5O/3D/vtkW631gZMJ4MHP1pmWlbpi
	swMXzKoABo25z4/aP+anTd7rt8pUo8HYJWpLVqGJzk++EQ71h0gT/+Q8JWy1jCGf37d1Yu0XnMnpb
	GIRBk2tvb9D9faEtfKqnvLKnbTyp/VHvxgjkm3cQroq3ljJTtYuMHLzRZJnnlRV9KZl1dohOL3diF
	WYcdY0DXynjrL24yhV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opJLL-005eut-Hu; Mon, 31 Oct 2022 01:11:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opJLI-005etF-Ek
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 01:11:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C750360F95
	for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5C5C433B5
	for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667178715;
	bh=xtgHnB5H7FEL8NvoLBnWlLaYF4pAr6sLR85QXAmTFBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hMkxcuX+jiRX3D3XL1+hb7aDVnJEqUkB/jB+e/e1W9owOn27DsshETHpqF5ConNZc
	 hpbDZntNj4jnqs2ym+8fCYxN4RAgMKlL+AUneh6WRgF22brnqqfiuoqsnZhQJdnLXa
	 MBJ110u2Bc/uLbcJrgPP5rjisXkw+2jm512Gq3p59fnz64Vo0T/0sQxbr8/2rGOqAB
	 6j8/09hJ+wY/10b4sTNfnyk1U+eH+guQ18TrsBaPYsI/yoNsPZFNk0aC9Ncm710vO+
	 nj3k7RH+0tUlWxVfyQOd/dA8LgbbD+KHkXBmDZ6JFse6GwqEJZb/dQLeU+t3dHYYv+
	 ztRLMYMoMUfQQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso12069720fac.13
        for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 18:11:55 -0700 (PDT)
X-Gm-Message-State: ACrzQf2kXwoHyuqWv+DK7ClMolpU86EWrQraetIw9TBszVCSzyUyOj/s
	+exEb0WLb8N/HLBOsK5VihTzTFeTMifL5VqCSF4=
X-Google-Smtp-Source: AMsMyM5YffQDzr4FZcxz9urfVbuCFu/0rR++ppFsy2T3KvqpS2lZzj9GI8kgBPLqT+THZWLCIJ6fChiw2RfdmVEmRKk=
X-Received: by 2002:a05:6870:64a1:b0:13c:d09d:79f9 with SMTP id
 cz33-20020a05687064a100b0013cd09d79f9mr3510873oab.112.1667178714338; Sun, 30
 Oct 2022 18:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
 <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
 <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
 <Y16/YQTOW3DuQvo9@spud> <CA+V-a8vCNx-bqjeOa13LewaEJOGW-0ypqJTvZo7om6XcM4T7UA@mail.gmail.com>
In-Reply-To: <CA+V-a8vCNx-bqjeOa13LewaEJOGW-0ypqJTvZo7om6XcM4T7UA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Oct 2022 09:11:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRrLOxZt0qhcpC9_fx4bFc1Rj9TDyQVBXdKbwboh-ZGyQ@mail.gmail.com>
Message-ID: <CAJF2gTRrLOxZt0qhcpC9_fx4bFc1Rj9TDyQVBXdKbwboh-ZGyQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_181156_610554_6ACDE9CE 
X-CRM114-Status: GOOD (  38.90  )
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

On Mon, Oct 31, 2022 at 6:27 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Conor,
>
> On Sun, Oct 30, 2022 at 6:16 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Sun, Oct 30, 2022 at 08:02:10AM +0800, Guo Ren wrote:
> > > On Sun, Oct 30, 2022 at 3:11 AM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > >
> > > > Hi Guo,
> > > >
> > > > Thank you for the review.
> > > >
> > > > On Sat, Oct 29, 2022 at 5:25 AM Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > >
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > > > > > Single).
> > > > > >
> > > > > > RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> > > > > > will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> > > > > > r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
> > > > > >
> > > > > > Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> > > > > > can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > > > - AX45MP CPU
> > > > > > - PLIC
> > > > > >
> > > > > > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > ---
> > > > > > v4 -> v5
> > > > > > * Fixed riscv,ndev value (should be 511)
> > > > > > * Reworked completely (sort of new patch)
> > > > > >
> > > > > > v3 -> v4
> > > > > > * No change
> > > > > >
> > > > > > v2 -> v3
> > > > > > * Fixed clock entry for CPU core
> > > > > > * Fixed timebase frequency to 12MHz
> > > > > > * Fixed sorting of the nodes
> > > > > > * Included RB tags
> > > > > >
> > > > > > v1 -> v2
> > > > > > * Dropped including makefile change
> > > > > > * Updated ndev count
> > > > > > ---
> > > > > >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
> > > > > >  1 file changed, 57 insertions(+)
> > > > > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > > >
> > > > > > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > > > new file mode 100644
> > > > > > index 000000000000..50134be548f5
> > > > > > --- /dev/null
> > > > > > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > > > @@ -0,0 +1,57 @@
> > > > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +/*
> > > > > > + * Device Tree Source for the RZ/Five SoC
> > > > > > + *
> > > > > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > > > > + */
> > > > > > +
> > > > > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > > > > +
> > > > > > +#define SOC_PERIPHERAL_IRQ(nr) (nr + 32)
> > > > > > +
> > > > > > +#include <arm64/renesas/r9a07g043.dtsi>
> > > > > The initial patch shouldn't be broken. Combine them together with the
> > > > > minimal components and add others late. Don't separate the DTS files.
> > > > >
> > > > r9a07g043.dtsi [0] already exists in the kernel. r9a07g043.dtsi is
> > > > shared with the RZ/G2UL SoC (ARM64) and the RZ/Five SoC. There are two
> > > > more patches [1] which are required and are currently queued up in the
> > > > Renesas tree for v6.2 (Ive mentioned the dependencies in the cover
> > > > letter).
> > >
> > > You could just move the below part to the second dtsi patch. Then
> > > compile won't be broken.
> > >
> > >             clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> > >             power-domains = <&cpg>;
> > >             resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> >
> > The makefile for this directory is not added until the next patch right?
> > The compile shouldn't be broken here since it therefore cannot be
> > compiled?
> >
> These nodes are already present in the kernel [0]  so the makefile
> change in the next patch if made here still won't break the
> compilation alone of SoC DTSI (included in dts).
Oh... Sorry, I screwed up. The
arch/arm64/boot/dts/renesas/r9a07g043.dtsi is not belonged to the
patch series.

>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=next-20221028#n563
>
> Cheers,
> Prabhakar



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
