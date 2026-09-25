Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADF2C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4BcNWSDcSJXyC6ZtM/sc2pg+buUMxDo+VWfL4T7jPM=; b=lyBruuTWwqHUcK
	TX5IagywkSnUzekBjMzN1y3WsD/HtI1OszCk4UvP0XWikMIual81m40/h4vyGRj84tvaJLtt9A30c
	Q2J3jLX7FZPMIHl58D4qzmtqtdi7dXxQLUOGIOLxzDzI+eNNpXOVQ0K3SjxYM2c/wlUCKf9yPczrv
	nvGHaZIdUacg7ebbkcBU/JCgxDGrk6ooymMCBLlmC74oc8DE+taaOBKsvewazV4jZGMLf0vFabTDk
	8/i6zd/PogoLY7eN3q44z97rjuhVtVQGgfNshkKUPeTUoKz/IKxlNoO0tVHjjm6IBA264VwJA3Fq2
	t7Qpza02znfsQCihaypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7op-0000000DmYD-3O0a;
	Fri, 25 Sep 2026 15:26:35 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7om-0000000DmXl-25cL
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:26:34 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so10528725e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790349990; x=1790954790; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaDR7gLTMcuaZYjvT6IfS3NURHPj6dBBuLJSgRQzTEY=;
        b=YLO94eemTSw14n095RxD0twFuy/V1F+G/83EZ5fRbNI9lh3hcXBHXqTTE5z89XN0zA
         9sxYJSPpngc0GVBrFDqyiZbnIxlrMTw/aCoeK/J147ln9w+01xkv8R6atk0lNmvRMv5X
         0E2RZrWKZPst8UppUSfgtBYq3AeUhJP1KnFusSh2m+Bri5GD4QfXZ4NsAlAkZG90Nujh
         j5ZJRJWadQgk025PEws+BaCC5ipiZWIepQZxSzU8ZrJd1kyrY1yTVW/3QbuHAozGBKZU
         Ru0ZgMoyQFDR+5V5cFpVUAjBHCzScUQlOmPUeWkSw+g4fV3jryz231ZxmqmJzGdct/vG
         Gf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349990; x=1790954790;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaDR7gLTMcuaZYjvT6IfS3NURHPj6dBBuLJSgRQzTEY=;
        b=ynEpq+sJOfRk/r1tvVaYTbl+qY5iCPkkq+loOQoXpg/HS5dZQ8xvezPMICEvFdrBMq
         VLK2+BtToeCf073qPRqfZytiJsTOJsu5IzxkUbjNQT1LVjtW2CmZji648HZXznnkg9hj
         1qAgmKrxB1oLBwxi0fE85Dmo1Piw6qIgFs5SY2FrrrrHSvdDpgsK1ZgKtxFE5KEzjnUS
         bZMRHxVBC2kqLCCM5XvaUmhK7MfeLc9oikpfBVwWtgXHkGp5SBvSF0DmQVHHHS2i17Rn
         2EOP0gBMjIgKJyL/3lLaDoDRDqgoLfI7KoKRPhOvGeOWyfIGd1djqG6zhuonMl49hLiC
         yjGw==
X-Forwarded-Encrypted: i=1; AKwUvBwSifGyCuFMScZlNjkvy0SjcnXFfURzhbogaNq/8b0NKgDAWxJm/Svw4giG/UaLSLWoysJwuT55SdYeFw==@lists.infradead.org
X-Gm-Message-State: AFuF++mQh2V8eHPyr2HXXrt17pT5KM0M4QNPdMFcGBBv3aokBE4A7WNB
	KrXaoV0KqsUoSIXgfHf5w1caIvvjQNM4TnRQM+aPt9OfT7qmyXkh//5ki8B/wG6bjqQ=
X-Gm-Gg: AYBFou3Difx6O1TXijyH1+VVB0X4vPTneN0hLo6zupDQIiYS0JHdncikbylSPdO7zn9
	NhLRb6zv5Nxru5e00GX+xqHhQsw+zyrLNQTraXoPRDnD/xZb/W9Ss81AqOyaP9r3oJE83eVlHAd
	E2R+aW8Pmg1gUteNdFVb7htLOMDSvjlLYdwqA0Lnxll0pV5sxms4Z0O3kkwt4PVKLMxtUxgwh5n
	tS7ur6dYrHC+vUudSl4jTzVN9TNmfIlOu2C2I3xbTyTgf1wba3up/x5eM53UvsZpwll2qcq4Pov
	koHKmsFtgtcK19ptzlZR6475HOKnS80uUi82Xq0dXSlmn4bPAo6j1YLzeMk95/yFylqrIWsL0bL
	j87aLDgaWym5mj44X0PUSoKRe5W+zd8NTAbZIkCZYyu9rsfmBCpzcfYA1ur3YtTGmawIDXheO6b
	isGevwApRcyb49fjSCip2j52xByNcOBp7cFA5FqbCYfEl02SfUcOC+3nVdFzlm4rmvKYqe71Agc
	HyH+5MiDXCSh39K6g==
X-Received: by 2002:a05:600c:8b26:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49fe66d83camr120484355e9.15.1790349990326;
        Fri, 25 Sep 2026 08:26:30 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0f1f2e3sm109952885e9.0.2026.09.25.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette
 <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org, Hal Feng
 <hal.feng@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v4 03/22] clk: starfive: Rename file name "jh71x0" to
 "common"
In-Reply-To: <20260920120044.194901-4-changhuang.liang@starfivetech.com>
References: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
 <20260920120044.194901-4-changhuang.liang@starfivetech.com>
Date: Fri, 25 Sep 2026 17:26:28 +0200
Message-ID: <1jqzih73ob.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_082632_599248_212F56A8 
X-CRM114-Status: GOOD (  22.96  )
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

On dim. 20 sept. 2026 at 05:00, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>
> StarFive JHB100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the "jh71x0" naming convention are renamed to use the
> "common" wording.

Is this really necessary ? Rename are generally not recommended.
Do we really care if your new soc use something named after the older
one ?

You are naming it common now but how long is it going to stay "common" ?
If your next SoC does not use this anymore it won't be common for long ...

>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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
>  rename drivers/clk/starfive/{clk-starfive-jh71x0.h => clk-starfive-common.h} (98%)
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
> index 80e9157347eb..4aecb65e9fd7 100644
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
> similarity index 98%
> rename from drivers/clk/starfive/clk-starfive-jh71x0.h
> rename to drivers/clk/starfive/clk-starfive-common.h
> index 9d5dec1d5cd1..f634c62c196a 100644
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
> index de1cf717e391..0e363b971e9d 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> @@ -14,7 +14,7 @@
>  
>  #include <dt-bindings/clock/starfive-jh7100-audio.h>
>  
> -#include "clk-starfive-jh71x0.h"
> +#include "clk-starfive-common.h"
>  
>  /* external clocks */
>  #define JH7100_AUDCLK_AUDIO_SRC			(JH7100_AUDCLK_END + 0)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 761e46ed0ffd..ca81ccb5af94 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -14,7 +14,7 @@
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
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
