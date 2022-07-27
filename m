Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA96C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky2rv1h+mzBTNdFDFBN+62cwTc9FHoE8jHjubDVQm34=; b=tmcjztyI21Stog
	xUyfPtraz06rWAOvUdkjOfmtf7v+lQeEsYqlaGZ0dGhSJWIxCPvVFrTIaxa1MY25pyjR9M03knodH
	FZMOpVWVwopEs7lhhkCL61ypMAUrwe2FkDIRQfR7I6b2QF1llh6IiFMnAZmyGhsSgDxrvYX5IJmcZ
	0KdMr5BkdRxFwIW8H/c4AVVuVzMSf4kK2igaPQGWs45DGSn+xNYIcNBeaEG9cFw0wwzwN+wS6zAh8
	MIV/RBE/vfMyPQnHCcyKT0vlCDI6zb1DD9rDy6TQHjuhaMmrs9jUbRm4YiyNHojYvp5gYKf/Kijap
	8xr80n1MtAGX48A9p79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGc7i-00AxdC-AJ; Wed, 27 Jul 2022 08:10:30 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGc7e-00AxX5-Eu
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:10:28 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31e623a4ff4so167207917b3.4
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8WsuTI5HqjVqZ3mqJBPeJnAkwvhfGL30L5LTvOm6u4=;
        b=D5Kgg84JRiZOPD+q5N9vaIRd2tAD5RR1MMcDuqJUuLM5SoPObzBi0fHFHtSyVJUR9O
         v98JAwUINxP/fSbxHCfYR5FNx4zgpBC6hISx2oW9k0/zBoX9FE7YiJW+J1EFMEAEJ+Oq
         lA2xBcvprRZtJ+tHFoyslZUNR5dAFOwIGhqiaS9/SmpRU/TgdpMjXJ/EhTDnZfA+Dbq/
         hZYkSm7aS2gxXZFc93DL31tdTuVc1ePql257a4NK2rTX46Eqz+9E3k8hznhoenxQDIeC
         figuSrUlcgUE5iPST0Y6XB2hsacUgifsw9KnJp79loAdx2GyMHN7e1D2M4xe4ceLDo77
         /0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8WsuTI5HqjVqZ3mqJBPeJnAkwvhfGL30L5LTvOm6u4=;
        b=v25fr6ZYQftQTJtBSskHvYVH5zsyHgk+TZiMMljPxNwppqwcGtkdoetyv717srRIPu
         Aqq+HtSGq+R1pzpygl5IznIkgu1WQ0UUiVrHZKo0UMI1S/2qmZbRnViWDdbYA5JB6S4J
         Ipdv6bRP0xcYNvJz7VRsdh9K5ab1p/22ORbTtxzm5wGPiEMeJiRYk+3g+TwNyFIvqUf7
         RGvw+GBzjm4V/7B5nkcwF/MOWUD4OazOBxhC06xosIBz7W21Q91yHxPEsbQtc3iC4gPX
         Ue7AEUhjILL++Uxbw9JM2IGJd+HQ/8gRZyNj6EKSpYrJ2Ms3xlEgxP68elJGCpMvN+0u
         vskw==
X-Gm-Message-State: AJIora/IIEZA738TBiZ6OFgMKOWA5HdwSp5TTZnwUXQMzjuHAvmGOBx+
	5ws0YdVZgDJ54cjrAy1ieKqezV+iAfyrvqwm0JuXjKV2h2PFDQ==
X-Google-Smtp-Source: AGRyM1tq/fVV6xPYbEKCqMXyTJ4clWzdeyD8mpCOp2Jxixf0hphMcBS1e5sTtpCLva92LX3/MwHqdomugY1fgU0srZs=
X-Received: by 2002:a81:d542:0:b0:31e:c878:7565 with SMTP id
 l2-20020a81d542000000b0031ec8787565mr17170281ywj.382.1658909423375; Wed, 27
 Jul 2022 01:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com>
In-Reply-To: <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 09:09:55 +0100
Message-ID: <CA+V-a8vwhsa2S2UX+hi0MPnrjpfRYLzo1Ca1vffx-5A9jr6Hpg@mail.gmail.com>
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	anup@brainfault.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_011026_565191_B7537554 
X-CRM114-Status: GOOD (  29.61  )
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

On Tue, Jul 26, 2022 at 7:25 PM <Conor.Dooley@microchip.com> wrote:
>
> Hey,
> Saw your other binding patches coming in earlier & wondered if
> this would show up today ;)
>
:)

> On 26/07/2022 19:06, Lad Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > Single).
> >
> > Below is the list of IP blocks added in the initial SoC DTSI which can be
> > used to boot via initramfs on RZ/Five SMARC EVK:
> > - AX45MP CPU
> > - CPG
> > - PINCTRL
> > - PLIC
> > - SCIF0
> > - SYSC
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/riscv/boot/dts/Makefile               |   1 +
> >  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
>
> Missing files? Where is your Makefile for this directory?
> Or the board dts?
>
My plan was to get the initial minimal SoC DTSi and then later
gradually add the board DTS, but it looks like I'll have to include it
along with this series.

> Enabling CONFIG_SOC_RENESAS_RZFIVE causes dtbs_check to fail :(
>
I shall include the Makefile and boards dts in v2

> >  2 files changed, 122 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index ff174996cdfd..b0ff5fbabb0c 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -3,5 +3,6 @@ subdir-y += sifive
> >  subdir-y += starfive
> >  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> >  subdir-y += microchip
> > +subdir-y += renesas
> >
> >  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > new file mode 100644
> > index 000000000000..6e0b640c6c7f
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/Five SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
>
> Including arm gic stuff on riscv? That seems a bit odd to me.
>
Ouch this needs to be replaced with irq.h (required for IRQ_TYPE_LEVEL_* flags)

> > +#include <dt-bindings/clock/r9a07g043-cpg.h>
> > +
> > +/ {
> > +       compatible = "renesas,r9a07g043";
> > +       #address-cells = <2>;
> > +       #size-cells = <2>;
> > +
> > +       /* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> > +       extal_clk: extal-clk {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency = <0>;
>
> Why add the empty value in that case?
>
For ARM64 SoC DTSI we use the above approach so f Iollowed the same,
but you are right this can be dropped.

> > +       };
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               timebase-frequency = <24000000>;
> > +
> > +               ax45mp: cpu@0 {
> > +                       compatible = "andestech,ax45mp", "riscv";
> > +                       device_type = "cpu";
> > +                       reg = <0x0>;
> > +                       status = "okay";
> > +                       riscv,isa = "rv64imafdc";
> > +                       mmu-type = "riscv,sv39";
> > +                       i-cache-size = <0x8000>;
> > +                       i-cache-line-size = <0x40>;
> > +                       d-cache-size = <0x8000>;
> > +                       d-cache-line-size = <0x40>;
> > +                       clocks = <&cpg CPG_CORE R9A07G043_AX45MP_CORE0_CLK>,
> > +                                <&cpg CPG_CORE R9A07G043_AX45MP_ACLK>;
> > +
> > +                       cpu0_intc: interrupt-controller {
> > +                               #interrupt-cells = <1>;
> > +                               compatible = "riscv,cpu-intc";
> > +                               interrupt-controller;
> > +                       };
> > +               };
> > +       };
> > +
> > +       soc: soc {
> > +               compatible = "simple-bus";
> > +               interrupt-parent = <&plic>;
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               scif0: serial@1004b800 {
> > +                       compatible = "renesas,scif-r9a07g043",
> > +                                    "renesas,scif-r9a07g044";
> > +                       reg = <0 0x1004b800 0 0x400>;
> > +                       interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <414 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <415 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <413 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <416 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <416 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "eri", "rxi", "txi",
> > +                                         "bri", "dri", "tei";
> > +                       clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
> > +                       clock-names = "fck";
> > +                       power-domains = <&cpg>;
> > +                       resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               cpg: clock-controller@11010000 {
> > +                       compatible = "renesas,r9a07g043-cpg";
> > +                       reg = <0 0x11010000 0 0x10000>;
> > +                       clocks = <&extal_clk>;
> > +                       clock-names = "extal";
> > +                       #clock-cells = <2>;
> > +                       #reset-cells = <1>;
> > +                       #power-domain-cells = <0>;
> > +               };
> > +
> > +               sysc: system-controller@11020000 {
> > +                       compatible = "renesas,r9a07g043-sysc";
> > +                       reg = <0 0x11020000 0 0x10000>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               pinctrl: pinctrl@11030000 {
> > +                       compatible = "renesas,r9a07g043-pinctrl";
> > +                       reg = <0 0x11030000 0 0x10000>;
> > +                       gpio-controller;
> > +                       #gpio-cells = <2>;
> > +                       #interrupt-cells = <2>;
> > +                       interrupt-controller;
> > +                       gpio-ranges = <&pinctrl 0 0 152>;
> > +                       clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
> > +                       power-domains = <&cpg>;
> > +                       resets = <&cpg R9A07G043_GPIO_RSTN>,
> > +                                <&cpg R9A07G043_GPIO_PORT_RESETN>,
> > +                                <&cpg R9A07G043_GPIO_SPARE_RESETN>;
> > +               };
> > +
> > +               plic: interrupt-controller@12c00000 {
> > +                       compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
> > +                       #interrupt-cells = <2>;
> > +                       #address-cells = <0>;
> > +                       riscv,ndev = <543>;
> > +                       interrupt-controller;
> > +                       reg = <0x0 0x12c00000 0 0x400000>;
>
> Does reg not usually get sorted after compatible?
> For consistency in this file it should at least.
>
Agreed will fix that.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
