Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937C2C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9wvCGjz7Dmu3i+zEOhBbMfwaBHEwBnCCASll4SFjbo=; b=UpEbgGXqhLb2eH
	4d1MGUyiMyoy7/kebJBkGOGobG/Z12nbuyyzbw6TeTsTQyYyVrkMSr/zqFH8wwGGtaROj7Rw+evw0
	HIHMJKSKpuOCx6guuanFKC9CE3g4EGCVa/62zQMi8ABFwwbV1zcgW5ll5ByK6kQoO186ETRm8pa8V
	up3JWQP5XunuFh17rr2pB2c0KnyuvgGNweG9/lHLLS6HTjwdMN/g04IvVyVulK8rvimJdVfDeOQLU
	Ib2oFT+PtN1IGkBZhnu5KIa+H3mN97ssRvvXb6TkclrO/t7DkxkVM/GMKXfz0dBKpiT4pc2gYVrS8
	amueEVhtaRBxmANohG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owllQ-0054T3-P4; Sun, 20 Nov 2022 14:57:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owllM-0054Ls-N2
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 14:57:43 +0000
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DFA213F12E
	for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668956255;
	bh=EAN+jo73jsNjm6NxFzDUZqmJuYIU7qlxt8bnncU4Mvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EweKhtbH0S4qHM3v9TJZWO4zW5LGRlwI3e55xlQOmYfJBZPVcIwG43FJah3h9/Loo
	 VUaMHTXJQodT2fa7ASDA+f2Cnn0kyGB8seZ0KGs0dPC/V0Xx1+Lyp+6gaXrL5Ma8V1
	 fjPf35TYhk+BVklKXQulT2RPxAAFQ8ZbBfbjSqKKJ6CKkaeaZ+oU3oLTCD+bX2+2Hq
	 vzjGc8C1azmt4LubMx3RyAaWd4Wbw/NUSKnj9K5tw4zgM4uXn6TElTwCIaWqLSYwtD
	 U5+xOW/shvAzj21CB1VmDChL76vMreGSMBOyyhB2wGccZ9x9Ct23rh3cclEpXu902F
	 Oa6dm4htjpYfw==
Received: by mail-yb1-f199.google.com with SMTP id f8-20020a25bd88000000b006dda2c86272so8952393ybh.5
        for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 06:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAN+jo73jsNjm6NxFzDUZqmJuYIU7qlxt8bnncU4Mvs=;
        b=PoZaGnOFQa1jdtulVQZdP1RxO05IBaYWjsFCwNVcT9injSvxdr+1FgR8Q74HCyLU1Z
         Awo8mMV1kjDQwkCNZfyAgHINSAK1RT6N5a4ftgXU2F/RNrAItbedt0jnmpEysY2NfFrQ
         z2aUFv9jlOkhkoZEmS7Di8DXi5vWMWd3vvi7blQF+KuKCSazeGXzxPgVCaxvjLoiDF80
         qyGEMFOF99culstG0cbJdmUK821wxaKREKUmCQWrvrK7MANbxD1rbhUjMtEWn2TLyITt
         ztDlNGMiKevt+Cbwz6TfZ4Oty6vGYhS3g3uTzuDIo3BVnRlijujo10lwMpBwStqjYyrt
         7Vvw==
X-Gm-Message-State: ANoB5pmMaMRco3++bL0DdAU0FgNaalDDIJod5qSrGaBlUECS8Lfec8OX
	f9VqqkH4trTt2tifHDUiU12QkE0qoXV8q/IIkR/7yc6vrGB6GXehuqs+ZmCqmNdGDSL34qwZRaR
	gU03C71uP1qUfDjHUna3EqRhPrBTozthCJUOkhNlzezRsnX+L3NjSgHL5SJ01eg==
X-Received: by 2002:a25:ce45:0:b0:6de:39c1:9cb3 with SMTP id x66-20020a25ce45000000b006de39c19cb3mr3991252ybe.469.1668956254635;
        Sun, 20 Nov 2022 06:57:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6QE5DtMEWnYNqTxZPXyHbUY3mIe3kVEW/kzSrOH//tkMR00zlzUTh2qwSJqJcuQ+yytC0Ib4Ivku6ASbIQfe0=
X-Received: by 2002:a25:ce45:0:b0:6de:39c1:9cb3 with SMTP id
 x66-20020a25ce45000000b006de39c19cb3mr3991228ybe.469.1668956254419; Sun, 20
 Nov 2022 06:57:34 -0800 (PST)
MIME-Version: 1.0
References: <20221120082114.3030-1-jszhang@kernel.org> <20221120082114.3030-6-jszhang@kernel.org>
In-Reply-To: <20221120082114.3030-6-jszhang@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 20 Nov 2022 15:57:17 +0100
Message-ID: <CAJM55Z_f=zp3Z=wno_yr7csAUMQ472RiZXD19CrDTTxmGAmU4w@mail.gmail.com>
Subject: Re: [PATCH 5/7] riscv: dts: bouffalolab: add the bl808 SoC base
 device tree
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_065741_152033_8FF1967B 
X-CRM114-Status: GOOD (  21.43  )
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

On Sun, 20 Nov 2022 at 09:32, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Add a baisc dtsi for the bouffalolab bl808 SoC.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/Makefile               |  1 +
>  arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 74 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b525467152b2 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += bouffalolab
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> new file mode 100644
> index 000000000000..c98ebb14ee10
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       compatible = "bouffalolab,bl808";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       cpus {
> +               timebase-frequency = <1000000>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       compatible = "thead,c906", "riscv";
> +                       device_type = "cpu";
> +                       reg = <0>;
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <256>;
> +                       d-cache-size = <32768>;
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       mmu-type = "riscv,sv39";
> +                       riscv,isa = "rv64imafdc";
> +
> +                       cpu0_intc: interrupt-controller {
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                               #address-cells = <0>;
> +                               #interrupt-cells = <1>;
> +                       };
> +               };
> +       };
> +
> +       xtal: xtal-clk {
> +               compatible = "fixed-clock";
> +               clock-frequency = <40000000>;

This was discussed many times before, but I think the conclusion was
that the frequency is a property of the crystal on the board, so this
should be 0 in the SoC dtsi, and then overwritten in the board device
tree.

> +               clock-output-names = "xtal";
> +               #clock-cells = <0>;
> +       };
> +
> +       soc {
> +               compatible = "simple-bus";
> +               ranges;
> +               interrupt-parent = <&plic>;
> +               dma-noncoherent;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               uart0: serial@30002000 {
> +                       compatible = "bouffalolab,uart";
> +                       reg = <0x30002000 0x1000>;
> +                       interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&xtal>;
> +                       status = "disabled";
> +               };
> +
> +               plic: interrupt-controller@e0000000 {
> +                       compatible = "thead,c900-plic";
> +                       reg = <0xe0000000 0x4000000>;
> +                       interrupts-extended = <&cpu0_intc 0xffffffff>,
> +                                             <&cpu0_intc 9>;
> +                       interrupt-controller;
> +                       #address-cells = <0>;
> +                       #interrupt-cells = <2>;
> +                       riscv,ndev = <64>;
> +               };
> +       };
> +};
> --
> 2.37.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
