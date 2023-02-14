Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE292C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=814IEXLopmWOjwFn0lSpgPiSYBS8I7PuYXARkCOMUbs=; b=QkWqJWgZpvM+H3
	z5uowF99ju/jUIB36DsmZYAmMX6MfSq5NKZJtwbgyXXrZJTZvOw0Y6b47NhfdBNhPr6cvki4sqYcq
	fowggwUj+9c9D8oJBZ9DB0u8Txy7wB1XJdmfXIJia06wlk2K3D/FtpErwMKdvTF44bqBdfg3AM14y
	iu1r8MSTM6bsSZalUm/gmGN2qntRp6K9R9w8orTqwxuygpRvZbVl1MhZig+XZMVIrchn+nWJIs4my
	eo70e3OgsZR7Xpp8hKngFEmrTidHwhNQ+Kx69Is7F/x/KZi30H0l//TZoB1Lrmw+Byc+3/PquwloD
	1gWaQ8Cjn91zuXXVhK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs0u-000pBv-R2; Tue, 14 Feb 2023 09:54:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs0q-000pAb-Tg
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:54:15 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC3083F138
	for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676368439;
	bh=JE/306lAIMQuM4AipngiHVIJwz47UBkV+PO3Q0pMIF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=YmgCoHQZG+A61GRK1u+T2GEhjKRQyAEy4eFcxeQSDvcPBgectNvGdbymus08pYAiW
	 c3NACCGemyl7d9PqeNFg6yrnayxALRerQiiKNBiQQ1HuduvWlAb97mf4Q5GlQBoAFA
	 +jP+ksXsp2zHmDTwHIHuVmpnO0AtBy2mdlbHVeeNTU6Et+aJPQLXOLleoY5Ob0EjVx
	 x8NOW0jQwDsfVoySTdllrMJWmcEJz0p9QeeJ/NXWWk78QqQdY4grh9MCjJolyUi5mJ
	 CFvSjM+Hj0BuHOqBSNXnZhaPmXSzr2UaYoPzmNEEsV638p1i5fd4gG8IS18JIU8fCk
	 aZB1zu7dHuwWA==
Received: by mail-qk1-f198.google.com with SMTP id 130-20020a370588000000b0072fcbe20069so9190303qkf.22
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 01:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE/306lAIMQuM4AipngiHVIJwz47UBkV+PO3Q0pMIF8=;
        b=z/DXL4+wPaYr+eBIeqk9ZAY60Ngv4YBj36p0qgT84Pkgb3es+PK+tGa9qPHGbDW0r+
         sUbFBBW7f0MflUzwrUNIGaHDveIg0O2fkedidF4yU5lj6I8fUWGVJJzPqF46AKcpS79D
         f2tP61GzFvHrR5YVqwcJAzn4u11pMr63hx2Wn/ArhOMzrZyUu86GDjngJfur3fNT9R5c
         JboP1dCKOon6dYmFQnJCzlbX9xz2jIcebRaa9bwnb3d6ZJVynKOQSLykPb00n1pd+uEw
         dR7Ispp3hu9DzD4HjwgNH6oQX0gHmwDTgRAyofsnnxs4CX3OQG5vzDvJ2K867fZ/WI//
         c5Mg==
X-Gm-Message-State: AO0yUKUIL07P4vDEY5lyKKt0FbMMO3UinkIEkG5bJuMO+1lZumaurwlG
	MLGaT5wjzplrNp6NbzuQO3qwt+wDOC7WE1uzOpWhpBSQxTcvQYWXTeYSd1dY+5TmNLEov887eP9
	I95xsJG75SwMotCEyBPifWLd0SWthrMJ+fMHXJb8voyZFZG/rKi09b+30eOS41w==
X-Received: by 2002:a37:be82:0:b0:706:865e:b9a with SMTP id o124-20020a37be82000000b00706865e0b9amr55179qkf.118.1676368438345;
        Tue, 14 Feb 2023 01:53:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+P1tLvVDMoWJksLgtZmywCs4zIgltb1yweBhnu/pJ0jYCGp6Zovo2ROkR5fEIrexl5hhzt+EmJIcp1JbGGxLw=
X-Received: by 2002:a37:be82:0:b0:706:865e:b9a with SMTP id
 o124-20020a37be82000000b00706865e0b9amr55163qkf.118.1676368438074; Tue, 14
 Feb 2023 01:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20221220011247.35560-1-hal.feng@starfivetech.com> <20221220011247.35560-8-hal.feng@starfivetech.com>
In-Reply-To: <20221220011247.35560-8-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 14 Feb 2023 10:53:41 +0100
Message-ID: <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_015413_413417_D611CA8E 
X-CRM114-Status: GOOD (  20.98  )
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

On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
> which has version A and version B. Support booting and basic
> clock/reset/pinctrl/uart drivers.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>  .../jh7110-starfive-visionfive-2-va.dts       |  13 ++
>  .../jh7110-starfive-visionfive-2-vb.dts       |  13 ++
>  .../jh7110-starfive-visionfive-2.dtsi         | 111 ++++++++++++++++++
>  4 files changed, 138 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 0ea1bc15ab30..79e925a4a227 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-va.dtb jh7110-starfive-visionfive-2-vb.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
> new file mode 100644
> index 000000000000..188d3fddbe88
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-starfive-visionfive-2.dtsi"
> +
> +/ {
> +       model = "StarFive VisionFive 2 VA";
> +       compatible = "starfive,visionfive-2-va", "starfive,jh7110";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
> new file mode 100644
> index 000000000000..f75c10536f84
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-starfive-visionfive-2.dtsi"
> +
> +/ {
> +       model = "StarFive VisionFive 2 VB";
> +       compatible = "starfive,visionfive-2-vb", "starfive,jh7110";

Hi Hal,

I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-va"
and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
still think having these names match what is printed on the silkscreen
makes it a lot easier for everybody. Even your own releases calls the
boards "v1.2A" and "v1.3B":
https://github.com/starfive-tech/VisionFive2/releases/

So I'd suggest
model = "StarFive VisionFive 2 v1.3B";
compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";

I haven't seen these "VA" and "VB" anywhere else, so if you don't want
the version numbers and can promise that there will be no incompatible
future revisions of the boards then maybe just drop the "V". Eg.
model = "StarFive VisionFive 2 B";
compatible = "starfive,visionfive-2-b", "starfive,jh7110";

/Emil

> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> new file mode 100644
> index 000000000000..c60280b89c73
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110.dtsi"
> +#include "jh7110-pinfunc.h"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       cpus {
> +               timebase-frequency = <4000000>;
> +       };
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x40000000 0x1 0x0>;
> +       };
> +
> +       gpio-restart {
> +               compatible = "gpio-restart";
> +               gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
> +               priority = <224>;
> +       };
> +};
> +
> +&osc {
> +       clock-frequency = <24000000>;
> +};
> +
> +&rtc_osc {
> +       clock-frequency = <32768>;
> +};
> +
> +&gmac0_rmii_refin {
> +       clock-frequency = <50000000>;
> +};
> +
> +&gmac0_rgmii_rxin {
> +       clock-frequency = <125000000>;
> +};
> +
> +&gmac1_rmii_refin {
> +       clock-frequency = <50000000>;
> +};
> +
> +&gmac1_rgmii_rxin {
> +       clock-frequency = <125000000>;
> +};
> +
> +&i2stx_bclk_ext {
> +       clock-frequency = <12288000>;
> +};
> +
> +&i2stx_lrck_ext {
> +       clock-frequency = <192000>;
> +};
> +
> +&i2srx_bclk_ext {
> +       clock-frequency = <12288000>;
> +};
> +
> +&i2srx_lrck_ext {
> +       clock-frequency = <192000>;
> +};
> +
> +&tdm_ext {
> +       clock-frequency = <49152000>;
> +};
> +
> +&mclk_ext {
> +       clock-frequency = <12288000>;
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_pins>;
> +       status = "okay";
> +};
> +
> +&gpio {
> +       uart0_pins: uart0-0 {
> +               tx-pins {
> +                       pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX, GPOEN_ENABLE, GPI_NONE)>;
> +                       bias-disable;
> +                       drive-strength = <12>;
> +                       input-disable;
> +                       input-schmitt-disable;
> +                       slew-rate = <0>;
> +               };
> +
> +               rx-pins {
> +                       pinmux = <GPIOMUX(6, GPOUT_LOW, GPOEN_DISABLE, GPI_SYS_UART0_RX)>;
> +                       bias-disable; /* external pull-up */
> +                       drive-strength = <2>;
> +                       input-enable;
> +                       input-schmitt-enable;
> +                       slew-rate = <0>;
> +               };
> +       };
> +};
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
