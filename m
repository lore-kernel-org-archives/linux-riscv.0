Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40083C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrxH7EkS0eBLOXHBTHJwOm7jnCJeH1OJGMlzeSNR6Z4=; b=gfgJDeISe7k7tg
	8Eumra2CQa+fIuOmC9btWHp4zDNujgJez9L5cjR2kaTAIFkCUmw2LvHKHAUwVzZwE4+lc6GaWChmh
	L1p+k29eeAaVYaW/JFZIEXb0EClUSKxcQir7NlIO5GQGmP7jb05BNzH74tqJARvnN+BzjRGiWn78N
	xAYfFmYB0ZSbBKfG72eiIz12yC3GoJXka+WzguSmkt6LDrdEJf2cabHxqaexlGNLW00WaaFGwfO1G
	9YxPkJF5U5J5EhwOu43if9+y4JuGeFj9DVhyzFY7TdmpJp+LDI/Gw9ewSvW6vIny/8mq1eNk4zpsZ
	CNprIeD6ZkDVcId212Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5ax-0066yb-O1; Fri, 18 Nov 2022 17:56:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5ar-0066rv-Fp
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:56:06 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F8073F339
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668794159;
	bh=0Yx4LwoxGO4gELBT8j84eKvAZSVRQJCcfAAZoOkW6xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QZ//FurYMEjnt/4UOOWuMKVe3PV50AWfL9EHNndvwqwABHuz0dQh1Um8ScgziQ6fq
	 z8fpHpMaUceAQDKU86BPnoW2CME3CvIkQ+MLGAa6W0rQcSPt/Rqb8TNTkLXi/16y1k
	 alEeINqRZzG4U7W7xIN7ft65PfS/FfsyGPtTkc/Eo4FvRKI/eYqw1fkkoCsQZ2NUnk
	 9vv8nJHLZD7SrRFyBlhW1wsZGGQeaCQHE50/R9l/8+Mxt5nCk1kUUrDsTzbb1/CN4K
	 +532bF6r3TXbuXBbb7Vxku3kr2/Mflq9fD6OntYHRNh8Crr4a6utr7dZZom6Gl7meL
	 ktcis7dEr1dTw==
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-398d108a04cso5740617b3.16
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Yx4LwoxGO4gELBT8j84eKvAZSVRQJCcfAAZoOkW6xo=;
        b=gj7thZuMIV9KxjgSj9b4l6PRrLCyCKXWhN/DGcR+c8KGiSh+ekeva40Z+1wqNNaSW6
         8i4AWVvERN9ntY4X83tMtrTxVdSCtrFSKBy5LXfcye5aZY0/s0cTXu9F6DcrwaeI/1Qn
         RI9KjPlGdT55aE4gfPJ4ovmiTGHgyw6ijW+Zq0pdx/d9C86GXzW9zSrzjJaAQo0zC+u6
         occtwkOrPVcPXofdOJTBiC+4yxOZOgg5m1lFKnePt5WKbIlzcrK3fzuhyrKeLHgoyk6P
         clLdfNRi4EWky1sygGT0D6HXtORzFhEucC1/ayqWhf+xqN24YU7RCuukPL1ocEw0a5A+
         ZD5g==
X-Gm-Message-State: ANoB5plBRJfRr+Zc75N+ivBOJqtoZR3HLK5+tw02ZXaTFWWcPA5Zdham
	k02Mko5xpfwM85OslY0kIWXzHTi2H4fyuRmYqk3d4cDon9CXKRb0G25MkvkyIbYPcG5cVIqz0pv
	Focfd4jjbluXr+NY5m8XJmD8MXM9xfv5NmDVWKqqeefwAV7CeNXROIliZGYD2Rw==
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id r11-20020a819a0b000000b0037002d3c361mr7429922ywg.251.1668794157272;
        Fri, 18 Nov 2022 09:55:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4X/I6qvXUaj8j659xYAf6Xh78fhOeaJMLEVRA7IEhZ0OhKSxtwJeWXI961OdXwiSzv2eekCAOkOn6eBdnAOrs=
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id
 r11-20020a819a0b000000b0037002d3c361mr7429904ywg.251.1668794157042; Fri, 18
 Nov 2022 09:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com> <20221118011714.70877-8-hal.feng@starfivetech.com>
In-Reply-To: <20221118011714.70877-8-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 18:55:40 +0100
Message-ID: <CAJM55Z-rdicV69otq=YFsTSUNsg==Svf18b+3w-cMfb_BYcbGg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: starfive: Add StarFive JH7110
 VisionFive2 board device tree
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_095601_985410_D3003C13 
X-CRM114-Status: GOOD (  18.80  )
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

On Fri, 18 Nov 2022 at 02:17, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add a minimal device tree for StarFive JH7110 VisionFive2 board.
Missing space between VisionFive and 2.

> Support booting and basic clock/reset/pinctrl/uart drivers.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>  .../jh7110-starfive-visionfive-v2.dts         | 116 ++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 0ea1bc15ab30..e1237dbc6aac 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-v2.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> new file mode 100644
> index 000000000000..c8946cf3a268
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/pinctrl-starfive-jh7110.h>
> +
> +/ {
> +       model = "StarFive VisionFive V2";
> +       compatible = "starfive,visionfive-v2", "starfive,jh7110";

Again, please consult your colleagues if you're calling the board
"VisionFive 2" or "VisionFive V2" and name the file, model and board
accordingly.

> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               linux,initrd-start = <0x46100000>;
> +               linux,initrd-end = <0x4c000000>;

These two lines don't belong here. They're added by the bootloader dynamically.

> +               stdout-path = "serial0:115200";

You're missing a n8.

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
> +&clk_rtc {
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
> +                       bias-pull-up;

There are external pull-ups, so maybe change this line to

bias-disable; /* external pull-up */

> +                       drive-strength = <2>;
> +                       input-enable;
> +                       input-schmitt-enable;
> +                       slew-rate = <0>;
> +               };
> +       };
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_pins>;
> +       status = "okay";
> +};
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
