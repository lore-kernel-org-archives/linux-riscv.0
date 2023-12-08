Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1065EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 13:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=51w4gZr1y/K/lOFglPsuKNJZo260QbT2yRkkw3E0s9g=; b=gcpGaJNdyAJh4YJfyZzAPNQM5T
	Q1+Kq1P2rsNetjxpsW7vrrJgpoHL4DAKW8IHmjEvQDJ79Quuad1SC33vjSQqyKm6czZg8aymAnAdM
	66ObNqpNfomC+0micxCMbNS6v103UwwLgT3TWvT2YASLRtiQvIWKWAfuxt9+zXw1cUqZr1++Ja+fe
	cobAaDricBvLEAq2xPU82Y6a48S57GzluSHdJ+OaAX5GPdCtJHtyjMntwMKUTxHLfchaH/Tp6VLvM
	mzfCKVMjLPLWLuwAXjEf6IqoEI3YsaUjSoGxpWbyZTfCnd5aj8PjZbOzvqw/MWEYIa8TN48veOQzr
	wMmjmUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBaiX-00Ffny-1t;
	Fri, 08 Dec 2023 13:16:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBaiU-00FfnS-0n
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 13:16:31 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E1C833F15F
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702041388;
	bh=5OGFeeZf5m0bMG5GtisyOq/eek7cqESU/OhJA19L9VA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=eUtZytU4O7R0hL8fK8O1fvvqlIPuYJJcbY8QmgCsOifUrxPwvsT/ifJv+E+ewCRO5
	 YgDQyAucqdWi9fQUoNZAw6t62kG3vUyMRhd3qpWbWKJtJp51AI/5jpGssp0Wlpfbk+
	 5xUXURHmRexAQNl9E8I7+R8OaTx45ulJPdhEgwkjZmXWfx/NueX0gbfhmssY0+ooRd
	 pDpkl+wgEDR+jlZf2wrlcjYii7N5kJOWdVbT7VT1NI64vvQKz4ExoFu53iDzzMIfty
	 2lpPHS9tSNhoa3I9gh5xRcDZtBx8rHBnZAVcsD/nKOJwnH0FN2LHCu4AD05JerCMxR
	 TSiO7fKhgC+zg==
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ca23b6f61eso10308181fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 05:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041388; x=1702646188;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OGFeeZf5m0bMG5GtisyOq/eek7cqESU/OhJA19L9VA=;
        b=lz6/I0BrtxyG51mRIK2ZTxwpPsi34Ql5569DcCWl47efRinsSnhppln8XFaDyQijNC
         y3dbObi3ZYy014nibxvKi8RZlsmIzYOT5m8V9NmG4V1cdEgwkLGlT70c3y8wIXVQcHay
         jUuCeT35U2Cs3J663JiKcUslWh/3XtWxCfLpy02ZFZ8RpEH4aDOmtD+xgIzAY4NsaDjq
         IHgG7HBIpWm3MuHy1sfubx9HazhbtdHSomq66ve6yWB1X3PkxCIeXKdnQIJ8+p/l/+wI
         uzwO+ex2wXCi/PbUgbVUg+D90ep0veI6XCwnoWrAzPqAOLn12beB3jhAK8znaWFQty0I
         DekA==
X-Gm-Message-State: AOJu0Yw22TTJPEGz11AAMedbMOv4f5z6/jOn7GMwxto4a5jEMIt91Ey/
	a6Q55Q/cEA4s3UhNJ0FcBEW71nio08JcnT+HBupjsktOG/Hcbn9f8mfYMWM0JF2ycPYIgEfehcu
	zANjttV0080+xgF9WfpBuC0WMWdaF0IJJaZ2Og++JUw1uW527E6bjKBqloJycLQ==
X-Received: by 2002:a19:9108:0:b0:50b:fd3c:5dab with SMTP id t8-20020a199108000000b0050bfd3c5dabmr66150lfd.27.1702041387907;
        Fri, 08 Dec 2023 05:16:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGksnQ48tiMDGwLrQKVaPnOs0v9pxKkmcT1acbXZkH1CCKvDD7B4YKfWLimQP/LAPMt6WElHwTfhZsSr/Lh3Sk=
X-Received: by 2002:a19:9108:0:b0:50b:fd3c:5dab with SMTP id
 t8-20020a199108000000b0050bfd3c5dabmr66137lfd.27.1702041387548; Fri, 08 Dec
 2023 05:16:27 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 07:16:26 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-4-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-4-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 07:16:26 -0600
Message-ID: <CAJM55Z8_0ght6hH8j6JaEjA1eoiLxbaeX2-Juf=D0yk-wi5mqQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/16] clk: starfive: Rename file name "jh71x0" to "common"
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_051630_430623_B77A911D 
X-CRM114-Status: GOOD (  15.97  )
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

Sia Jee Heng wrote:
> StarFive JH8100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the "jh71x0" naming convention are renamed to use the
> "common" wording.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/clk/starfive/Kconfig                              | 8 ++++----
>  drivers/clk/starfive/Makefile                             | 2 +-
>  .../{clk-starfive-jh71x0.c => clk-starfive-common.c}      | 4 ++--
>  .../{clk-starfive-jh71x0.h => clk-starfive-common.h}      | 4 ++--
>  drivers/clk/starfive/clk-starfive-jh7100-audio.c          | 2 +-
>  drivers/clk/starfive/clk-starfive-jh7100.c                | 2 +-
>  drivers/clk/starfive/clk-starfive-jh7110.h                | 2 +-
>  7 files changed, 12 insertions(+), 12 deletions(-)
>  rename drivers/clk/starfive/{clk-starfive-jh71x0.c => clk-starfive-common.c} (99%)
>  rename drivers/clk/starfive/{clk-starfive-jh71x0.h => clk-starfive-common.h} (97%)
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index bd29358ffeec..ff8eace36e64 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -config CLK_STARFIVE_JH71X0
> +config CLK_STARFIVE_COMMON
>  	bool
>
>  config CLK_STARFIVE_JH7100
>  	bool "StarFive JH7100 clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select CLK_STARFIVE_JH71X0
> +	select CLK_STARFIVE_COMMON
>  	default ARCH_STARFIVE
>  	help
>  	  Say yes here to support the clock controller on the StarFive JH7100
> @@ -15,7 +15,7 @@ config CLK_STARFIVE_JH7100
>  config CLK_STARFIVE_JH7100_AUDIO
>  	tristate "StarFive JH7100 audio clock support"
>  	depends on CLK_STARFIVE_JH7100
> -	select CLK_STARFIVE_JH71X0
> +	select CLK_STARFIVE_COMMON
>  	default m if ARCH_STARFIVE
>  	help
>  	  Say Y or M here to support the audio clocks on the StarFive JH7100
> @@ -33,7 +33,7 @@ config CLK_STARFIVE_JH7110_SYS
>  	bool "StarFive JH7110 system clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
>  	select AUXILIARY_BUS
> -	select CLK_STARFIVE_JH71X0
> +	select CLK_STARFIVE_COMMON
>  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
>  	select CLK_STARFIVE_JH7110_PLL
>  	default ARCH_STARFIVE
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 199ac0f37a2f..012f7ee83f8e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_CLK_STARFIVE_JH71X0)	+= clk-starfive-jh71x0.o
> +obj-$(CONFIG_CLK_STARFIVE_COMMON)	+= clk-starfive-common.o
>
>  obj-$(CONFIG_CLK_STARFIVE_JH7100)	+= clk-starfive-jh7100.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)	+= clk-starfive-jh7100-audio.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-common.c
> similarity index 99%
> rename from drivers/clk/starfive/clk-starfive-jh71x0.c
> rename to drivers/clk/starfive/clk-starfive-common.c
> index aebc99264a0b..a12490c97957 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-common.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * StarFive JH71X0 Clock Generator Driver
> + * StarFive Clock Generator Driver
>   *
>   * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
>   */
> @@ -10,7 +10,7 @@
>  #include <linux/device.h>
>  #include <linux/io.h>
>
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>
>  static struct jh71x0_clk *jh71x0_clk_from(struct clk_hw *hw)
>  {
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-common.h
> similarity index 97%
> rename from drivers/clk/starfive/clk-starfive-jh71x0.h
> rename to drivers/clk/starfive/clk-starfive-common.h
> index 34bb11c72eb7..1f32f7024e9f 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-common.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __CLK_STARFIVE_JH71X0_H
> -#define __CLK_STARFIVE_JH71X0_H
> +#ifndef __CLK_STARFIVE_COMMON_H
> +#define __CLK_STARFIVE_COMMON_H
>
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100-audio.c b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> index ee4bda14a40e..dc4c278606d7 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> @@ -15,7 +15,7 @@
>
>  #include <dt-bindings/clock/starfive-jh7100-audio.h>
>
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>
>  /* external clocks */
>  #define JH7100_AUDCLK_AUDIO_SRC			(JH7100_AUDCLK_END + 0)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 69cc11ea7e33..6bb6a6af9f28 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -15,7 +15,7 @@
>
>  #include <dt-bindings/clock/starfive-jh7100.h>
>
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>
>  /* external clocks */
>  #define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + 0)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110.h b/drivers/clk/starfive/clk-starfive-jh7110.h
> index 0659adae4d76..6b1bdf860f00 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110.h
> +++ b/drivers/clk/starfive/clk-starfive-jh7110.h
> @@ -2,7 +2,7 @@
>  #ifndef __CLK_STARFIVE_JH7110_H
>  #define __CLK_STARFIVE_JH7110_H
>
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>
>  /* top clocks of ISP/VOUT domain from JH7110 SYSCRG */
>  struct jh7110_top_sysclk {
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
