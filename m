Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B373C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70U/rnY72N7FMJ+Q9Wx7Elvft/BUz26FmoIZQjOWRnM=; b=XPZtrvi/fIl9Ro
	3UojpTJ1235tSVKJqVJ2G166nEn5TamzpvTVVomelqTV/iwsTaKcjkwc58oZ1ExLu5Lp7bwTe5GDy
	QKNHH+YuQEln7+6695Q345ivR8CyBZqts+y3Dc7Y/38ZtNnLTOnWg5QCSVynAribzZ9+deHESjlam
	O+OKxnw3i/0cwsneYoWHTClDPfkQHn0UfY7MXCIQYsDOw0miCR7Kb6CN0HptEv67AG56F5VcjH7vK
	fnFnta3srgZspONptRL/ybknZ09PdOS5vfyvi3KFDcjD4C4TANq6r4JtTZ7EcayeiY2t6HoRUODli
	0d6DpDNaoNBn5H5JZTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5EC-005rAQ-7h; Fri, 18 Nov 2022 17:32:36 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow5E8-005r4T-Ly
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:32:34 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2873F3F333
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668792748;
	bh=fj8UhkKeU72W/99qO15nHbhyif25XpeQl7PAW0nT2E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=POuGlPE+NFJOvhT71OwaT/WzFvptG7faZML0qpUeGl7PGg5rhfnHNuDpr1VUfVg/j
	 EXijm9bIsJbBnu2qunLoz/SjtCw9IKGa2UifsSiaxdzMlvZ+MO/GtAbqgY9MAKb4DB
	 XmcE60U6Ufq3HRrycCX6iexw7qKmeLrRPULJjvqlV5jhrv5znEkXfsYRfZqMUmgf0i
	 IZ2AKO4s0xAGlR6lqHg1Sjc1tLzbdUjD0Hpq1zzdSocnVefEcjQTffKtAOhjL113dy
	 KP6S1eTRT9aE+OZiZcuR7ARf+KVaPkR0LvpUrndkwoIvyupk2NK/6OdP6aTn9XbMBj
	 g0jZKGH2tBA5w==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-385bbf9bc8fso55422607b3.23
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fj8UhkKeU72W/99qO15nHbhyif25XpeQl7PAW0nT2E8=;
        b=HYTw5U2jbJUIfTFEyIBsNM0Z4NJ3OXgrRurIB6hJbOtwxnpUfyoUHil3JkwTQKzHdC
         XaKLgk9w8qsSea6Zifi9kRWP05AwERQIRItsHXrF8U2t9dICyt1fJOZqjzh6v+Hwji+m
         qsZrQQvOXswGDLIt+6AvbGe8XwqPrm3dbRPIVeV+kVhf5jHy0qzfdFtg0T9uQxpdbOlK
         fHogfrqGagK20U0CcfPXaWf1sU/J1KwqQmdAkB6IGm+t9NcAgKg75gr1CT99kHY1Q6hZ
         dHqZs/Ukvm1AclB3LWUrg1yhv3sPeWu7Sn42/Ym7vJR2J+vcD9txWUXz48k4+OJrbP35
         37bg==
X-Gm-Message-State: ANoB5plMW1QZqjE6qHnW1wFqVh0Z3EQA6kcuImAsL6Qj4D5kgkvpWwQd
	7LM0YbWe3zrhsjI8qXzv3k7ED+f+NZU64kPd1W4ye0eO5D3yriK6ZXJf22zeOlOUL3jgkKTDxS5
	CZ+h9l8PbI7XDkOiVVT6X4xxETr7q9Osr1kbdan19815YQtKT5vnbfp1J97lqjA==
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id r11-20020a819a0b000000b0037002d3c361mr7344322ywg.251.1668792747076;
        Fri, 18 Nov 2022 09:32:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4HcIbrHIRYmL3dgFd+JbwTuttS78s3rG17fVAdC12Ry8v5uY8zZMQE2fsjsQN8AKs73vkYgU2af/B2EOp5ODM=
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id
 r11-20020a819a0b000000b0037002d3c361mr7344294ywg.251.1668792746848; Fri, 18
 Nov 2022 09:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com> <20221118011714.70877-6-hal.feng@starfivetech.com>
In-Reply-To: <20221118011714.70877-6-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 18:32:10 +0100
Message-ID: <CAJM55Z-jo4x_qX85uFO0esqVFk12v3fS6H7ryx7-Heq1HEudNA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] soc: sifive: ccache: Add StarFive JH7110 support
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
X-CRM114-CacheID: sfid-20221118_093232_897334_5F152FC2 
X-CRM114-Status: GOOD (  22.21  )
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
> This adds support for the StarFive JH7110 SoC which also
> features this SiFive cache controller.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---

I'm fine with this, but it would be great if you could add the jh7100
support at the same time like the original patch did.

>  arch/riscv/Kconfig.socs            | 1 +
>  drivers/soc/Makefile               | 2 +-
>  drivers/soc/sifive/Kconfig         | 2 +-
>  drivers/soc/sifive/sifive_ccache.c | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..5a40e05f8cab 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,6 +22,7 @@ config SOC_STARFIVE
>         bool "StarFive SoCs"
>         select PINCTRL
>         select RESET_CONTROLLER
> +       select SIFIVE_CCACHE
>         select SIFIVE_PLIC
>         help
>           This enables support for StarFive SoC platform hardware.
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 69ba6508cf2c..534669840858 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -26,7 +26,7 @@ obj-y                         += qcom/
>  obj-y                          += renesas/
>  obj-y                          += rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)      += samsung/
> -obj-$(CONFIG_SOC_SIFIVE)       += sifive/
> +obj-y                          += sifive/
>  obj-y                          += sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)       += tegra/
>  obj-y                          += ti/
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index ed4c571f8771..e86870be34c9 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -if SOC_SIFIVE
> +if SOC_SIFIVE || SOC_STARFIVE
>
>  config SIFIVE_CCACHE
>         bool "Sifive Composable Cache controller"
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 1c171150e878..9489d1a90fbc 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -107,6 +107,7 @@ static const struct of_device_id sifive_ccache_ids[] = {
>         { .compatible = "sifive,fu540-c000-ccache" },
>         { .compatible = "sifive,fu740-c000-ccache" },
>         { .compatible = "sifive,ccache0" },
> +       { .compatible = "starfive,jh7110-ccache" },
>         { /* end of table */ }
>  };
>
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
