Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45D9C38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0ow9nrDt+v07qcfO2icMQDGNZ3ISmGOxDhh7cFOhBk=; b=UkNg65a4LmgDqe
	sJypHK07CnqIapMhmD+8PBMt+PFc1oXORfgpPO3PxIN+QUdgJK0sAAYmVTqOixBAxAq0hmk1AThxs
	V8LzcKHBi1OK7QS6i8UnTwjkBsKl7Qlv9AVTZhR2//NVBM33nSAtSb3gf5EBkC0IudldwHsR+4nNP
	nR1R7Eyd2kcmpEkKKCJ6XMs/yRNtUR1dv3snPQJCk5HLjV4h3bks96hLGGXYR0x74o+855mg+hOqe
	CteXJYLfuG7hicxax+M7lp4rxZ7p8cOo0A4ATSp2MV1PWhqYVB6buNTGchG8OBTXUxhX9nFku8p/m
	+L2VCnnizgN/MKkzD2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGmS-003szX-U6; Sun, 30 Oct 2022 22:27:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGmQ-003suC-9L
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 22:27:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id kt23so25331794ejc.7
        for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YjgCwoppK5K4nAEcrBSrmaQ1uKTp6E8RaEwIZih6jLM=;
        b=Jh394vPLEoW0E+X/YoMd5kBFuQoOkW2YgCG1HOxCUDscvWe5tICJlcY3q95HgMFBCO
         b0dMHamfqrs7LzVMUpzv+YuYiItJ9XFCoXp2EnsPlClzMjVqbgxT2zPhP4weXF59Ozsc
         bfOD2upPMuGvtjjHmmYz7Kis/shVYEuPz378q6AVA7LAwg9En9FxRsLTMdtNNGl1MoUx
         X5r8FLh67rigiYKQyNtwJWf+kUd74usf4V3l2VhMwePaJYOWP0WBihntzVYPNh4IKZq4
         C8hTSN19RlX5QDlcaK0c/idsqikmfh7HsBjNokACCDlKXmP5CDNxXd9HBf/hoh+vsm/s
         Lp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjgCwoppK5K4nAEcrBSrmaQ1uKTp6E8RaEwIZih6jLM=;
        b=2X7KkaAcchHmKv6YmF+M6FsPWPdxnMORQlocr8COIcFIQMdRm+xv6YcDy48JVs3n9P
         ZgoMaTOEjczaz0YKMRmRIlCUfQHedUCiFD4b7uyEp3ODokCuOTo0snFtyXwM7l/Nso2t
         jCRW1wAGeucxVDp9i5D/nNOyeP44h8fhmRbKxbhT/De83/uNHzwLWVUAC5hZQdbED55J
         aV4rS2QgGznTPXuv/XC3QNeNtK9H7CyTGSU7vjpbDJA0R129sFjRkKpVwjUc5L/U37u7
         3hN2AF1gExyQJsPG3AvBTaQb269QlOkVrUpTaRoFhBQp0iBfHMKZJ3Jqp2Q/sU+qpcPV
         avBA==
X-Gm-Message-State: ACrzQf1zx28J2wPPdhdEJp1qVCXE1oiFZYUrytpQWMDaIgHVaaeNN7tR
	jZjby3aGOnG3gVrsA7vusfMn5xkPyjIQnEuDkqM=
X-Google-Smtp-Source: AMsMyM54fK8eb6S54ouxM/QZy65Og+WDxH2XLbBwQAA9DctNt0hxRLrGS7O3oKWP5nJ9Z0b2Z4QijdIJm0rsTWc6dVY=
X-Received: by 2002:a17:906:c14f:b0:793:30e1:96be with SMTP id
 dp15-20020a170906c14f00b0079330e196bemr10118283ejc.447.1667168863525; Sun, 30
 Oct 2022 15:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
 <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
 <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com> <Y16/YQTOW3DuQvo9@spud>
In-Reply-To: <Y16/YQTOW3DuQvo9@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 30 Oct 2022 22:27:17 +0000
Message-ID: <CA+V-a8vCNx-bqjeOa13LewaEJOGW-0ypqJTvZo7om6XcM4T7UA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
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
X-CRM114-CacheID: sfid-20221030_152746_348189_FC0C2802 
X-CRM114-Status: GOOD (  34.07  )
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

Hi Conor,

On Sun, Oct 30, 2022 at 6:16 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Sun, Oct 30, 2022 at 08:02:10AM +0800, Guo Ren wrote:
> > On Sun, Oct 30, 2022 at 3:11 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > >
> > > Hi Guo,
> > >
> > > Thank you for the review.
> > >
> > > On Sat, Oct 29, 2022 at 5:25 AM Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > >
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > > > > Single).
> > > > >
> > > > > RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
> > > > > will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
> > > > > r9a07g043f.dtsi includes RZ/Five SoC specific blocks.
> > > > >
> > > > > Below are the RZ/Five SoC specific blocks added in the initial DTSI which
> > > > > can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > > - AX45MP CPU
> > > > > - PLIC
> > > > >
> > > > > [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > > v4 -> v5
> > > > > * Fixed riscv,ndev value (should be 511)
> > > > > * Reworked completely (sort of new patch)
> > > > >
> > > > > v3 -> v4
> > > > > * No change
> > > > >
> > > > > v2 -> v3
> > > > > * Fixed clock entry for CPU core
> > > > > * Fixed timebase frequency to 12MHz
> > > > > * Fixed sorting of the nodes
> > > > > * Included RB tags
> > > > >
> > > > > v1 -> v2
> > > > > * Dropped including makefile change
> > > > > * Updated ndev count
> > > > > ---
> > > > >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
> > > > >  1 file changed, 57 insertions(+)
> > > > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > >
> > > > > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > > new file mode 100644
> > > > > index 000000000000..50134be548f5
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> > > > > @@ -0,0 +1,57 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +/*
> > > > > + * Device Tree Source for the RZ/Five SoC
> > > > > + *
> > > > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > > > + */
> > > > > +
> > > > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > > > +
> > > > > +#define SOC_PERIPHERAL_IRQ(nr) (nr + 32)
> > > > > +
> > > > > +#include <arm64/renesas/r9a07g043.dtsi>
> > > > The initial patch shouldn't be broken. Combine them together with the
> > > > minimal components and add others late. Don't separate the DTS files.
> > > >
> > > r9a07g043.dtsi [0] already exists in the kernel. r9a07g043.dtsi is
> > > shared with the RZ/G2UL SoC (ARM64) and the RZ/Five SoC. There are two
> > > more patches [1] which are required and are currently queued up in the
> > > Renesas tree for v6.2 (Ive mentioned the dependencies in the cover
> > > letter).
> >
> > You could just move the below part to the second dtsi patch. Then
> > compile won't be broken.
> >
> >             clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> >             power-domains = <&cpg>;
> >             resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
>
> The makefile for this directory is not added until the next patch right?
> The compile shouldn't be broken here since it therefore cannot be
> compiled?
>
These nodes are already present in the kernel [0]  so the makefile
change in the next patch if made here still won't break the
compilation alone of SoC DTSI (included in dts).

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=next-20221028#n563

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
