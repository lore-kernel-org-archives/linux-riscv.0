Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A81CE7A8C
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJsQO5zW7A7CRuGJ5BxMDAPb8EX4kOLPnYDekJjn2co=; b=qoAPu6Hyzyxgea
	+AUVQzYba/CxC1n5/ayan5c0okLLTSI6lwGYi7NXd6nTM4NcLokQuhkDJyaGZTtlrgW2fMW3Rpmr/
	q52n1zMPYCJoAxZ1ZQyzdfO3vZ9019vfed+IFwnKhqdlWxUO7jWA7lfeI4fxw361mqG8CUcdmhyNa
	qFNg9aucX9HjCg+FV4mIM6Tb3MKqYyvvvujVMkbP9ZV/JsBylQmUZm5oj0b6aQhjiayM45QGAp3UU
	JcxujXYrc+Aas4+MLuTnEvmA7o7NY102yccSnxHfnZ63d8yk8hZUj2EzUMV6fS9bfwl4VyLJ6BntK
	75shzvmDYLxEb1nTi8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkVAY-00Cjtv-0e;
	Sun, 24 Sep 2023 19:53:30 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkVAU-00Cjt8-1y;
	Sun, 24 Sep 2023 19:53:28 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c123eed8b2so83776501fa.0;
        Sun, 24 Sep 2023 12:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585204; x=1696190004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0d3YVvRT9dZksB7Z0EZhHU3PKUHlJOKGLc8dKpN2qA=;
        b=CSyEbTxpYV2Wi/s19QE3W6CczWbFSTIOK74ALIKuMsxKsv/XzRXfr/24muYs3apAAk
         gV/XdP5NPryyZb3o4Qb3q0YfuXGXfdJOxFIjrySVxgIgSVhQUPOJwgSBn9CsRUzrYOUY
         H+sRzHWGAFJGY0+oiI3FDhKzXev5trR9PRLAjuiP0xLDUFiLSzTWCBJLvtFS830MX3WX
         JSiobTzLFsxa39nZxXljMKSJ+N6YJl3yMhMEK5bejK3GK7Nh0OQ436jEDZijtwmwYFnR
         S4knykqxpDsl04dAH2DH23HoDIjqKgWg+lwCAjfWyTFc8Gps6yEwjqbPCsCVsT4xSBPV
         WzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585204; x=1696190004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0d3YVvRT9dZksB7Z0EZhHU3PKUHlJOKGLc8dKpN2qA=;
        b=kBGEOc3/KBbzkn+Nc2/xMWh+6hN8vLPSFZ8hPx74OwRS/vyZH2T4dmaWQHEYPyvTP+
         JiKERRh9PExZ6hL51S5/+Md6C/Xiny2vR/AR92fCs5cxzoW9L6VhG3zRcjFnXLrG0Wl3
         veVQCms3k6UpOQY/d1uJgkmQfvxCG9GjpcoYxaLVt9Msrc+Pn3oaf775rl5dziQQuS05
         iDCsyTVMjobrpO9SgVsoID8NoA8WSKgBI4WzaI+bEOwLdlyRBfTMNHbfeDP+WsJo6TeG
         RveVc9TVRzjnR2PuqrZZ2znY1bg9TQUY1uP/fCyYS+mbF6fqttjKgYnu5nSEfsvIs22O
         NEJg==
X-Gm-Message-State: AOJu0YxJbXk2Nfe5lp5tIJwtl6YKH1hjFThmqNMUasNHAWz/uQE9HvtX
	68sWwrumpQ3OheRYSiX/PWM=
X-Google-Smtp-Source: AGHT+IGS18qcaUt/JSWnUE5QJPAZC0mw8nPR6JoiV75sIqS6/y3U/VEFHkRsM7E5MB6Xlp/hfv86mQ==
X-Received: by 2002:a2e:994a:0:b0:2ba:34d0:fa5f with SMTP id r10-20020a2e994a000000b002ba34d0fa5fmr3887452ljj.37.1695585203989;
        Sun, 24 Sep 2023 12:53:23 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id ce21-20020a170906b25500b009ad850d4760sm5285822ejb.219.2023.09.24.12.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:53:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in SPDX
Date: Sun, 24 Sep 2023 21:53:22 +0200
Message-ID: <3256759.44csPzL39Z@jernej-laptop>
In-Reply-To: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_125326_677010_CE6FE6B9 
X-CRM114-Status: GOOD (  14.25  )
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

Dne sreda, 23. avgust 2023 ob 10:52:38 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

Best regards,
Jernej

> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi     | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts  | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts    | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts           | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts               | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi                    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts         | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi                   | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi                | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi               | 2 +-
>  14 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> index 9b03fca2444c..ed7b12e65a10 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  / {
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> index 8785de3c9224..3a2c3281eb88 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/gpio/gpio.h>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> index 4df8ffb71561..711450ffb602 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1-lichee-rv-86-panel.dtsi"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> index 1874fc05359f..b217799e6166 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1-lichee-rv-86-panel.dtsi"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> index 6cc7dd0c1ae2..10116fb3935a 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1-lichee-rv.dts"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> index 52b91e1affed..08cf716328a0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> index d60a0562a8b1..204da82a5dc6 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> index f2e07043afb3..e2bb6bc16c13 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/gpio/gpio.h>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> index 4ed33c1e7c9c..8dbe717c79ce 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  /*
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> index 97e7cbb32597..b18f368e06e0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #include "sun20i-d1s.dtsi"
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> index e6d924f671fd..1a7d6ef33f17 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/gpio/gpio.h>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..450387265469 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> index b7156123df54..3b077dc086ab 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  / {
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 822f022eec2d..5a9d7f5a75b4 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>  
>  #include <dt-bindings/clock/sun6i-rtc.h>
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
