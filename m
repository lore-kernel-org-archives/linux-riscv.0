Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C676EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eEajdlx9zixGIhgaIBFn+VAbcD9PURNz90g7qLlpPq0=; b=xcMQGMqRnLkQFFrPckY9PMbmuT
	gd1C8T3eEWetyqUigNo9exevoUwKOiAvDSyHa7h8Wemn8k7OGfe1rvdbuACQ/4AhpwpjNixMmfwsX
	69xocUIeEAK6O216fcp+ysztIR1dvCOQsaEvmnvQ4/4whCYULtyqgWo2t0PaKPEuq2ETOR+/srcFK
	wAQGitUIlOrSWtMB+kQjSiVBJnMmj3gPfKIbWAVSaIFlXQ20iAhAn9AOHxhf8mTjWrRPpEqKHTz0S
	5iegMXX6Kb+L/vpSR56q3xJVIApsiKPxek5rwkC/sDDeewfx7wkB16WNaJ5Qavyejc3cyvrPArHNS
	9Gtnrw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx6v-0000ga-1E;
	Wed, 20 Dec 2023 13:59:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx6s-0000es-2X
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 13:59:44 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 142453F73A
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703080779;
	bh=GORz2Rp468DG/BOConaMtErEasFxTme5lVfMMQP4MUs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hnMlaTWXATqxlutyL15CYB/jXzsNvxV3DyelCltS8S6JwzOSaJxMP9pgmtPJtcFvD
	 ZpC7WFNUslAhETHJYItj0RxRZ/rr0XZbjNl85g5CaT20rrMO2zPvoFfG2So4mQuTIx
	 zRNZaNPqZ8bZ0GGyi9gSpeIZvQnWY3cak0Bh91Y0JYuQeCdUUDBqQr3indLq9lFMLH
	 L47CZfgJMk30BAaB3RYtb4y5QC9A+4BR6sZdTy0f874oJ3Q5xlvlAqupOpFQpZfSgu
	 bv8DnVdmc1ji616+zbSbCWHQxEWkdvjV9NrW4KwBCsnBgWMOANzEw8gZZd4IDKARzx
	 pRaxaKcB/1ESw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42786dd75a3so11982411cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 05:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080778; x=1703685578;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GORz2Rp468DG/BOConaMtErEasFxTme5lVfMMQP4MUs=;
        b=L5rACe9WjYAq2rMBy+3msSUhMbm1NMtCXuudqgFDDV0UCowqEDOFWp2pH86aRcJY6P
         cM60LxB9cpRl/wzrGjvf6e5IE3REpoRWM0Mfbbv5qupvO1Fso8rHx94zmkPrA7IoUJAZ
         LOdcqjI2yLgVLaUlozXeZVNz9LPN6LfzWdTz4FSp0uA6hgj2idxK7VWr8jKMXVS62UYE
         vuq/3GF8ZWAnx8C8E4riI/flXHa7HtvoNTXAUXgFvP7uG5prAIWDJvlAjGRyoXpM+x9O
         DE8ZjVbNQ5nblGUPrVPlZDDmdH3jTWBzYAIZuzwxr9mn33iWhyJmd1+HBoS0+N5kdcqi
         JdpQ==
X-Gm-Message-State: AOJu0Yxk86fXLy551oyKFwq1lQ7+LI4j4a/UzkFNY7tu9waKJAbnJZvK
	oG5yzbhC62guOCaObfjaQCib5dU/3iCTcJtCuWWlUPJ50ifjGW9baahzS3i2B4FRbZjp7/0rQma
	GVJKSOG4UtsM0gmbm+N86xKShwR4AulusDtwojo93UeM85cwAuZF8TMkTt511Kg==
X-Received: by 2002:ac8:7f48:0:b0:423:93ce:bde2 with SMTP id g8-20020ac87f48000000b0042393cebde2mr29365878qtk.63.1703080778010;
        Wed, 20 Dec 2023 05:59:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSaFdvONz8qARVl9xk2ogiIoiNQxVWQOGFEh6uNs6/Cm8/+RY61RyiZi9PYlTSrc0KpTX0sX3yWrbwWUM9sdQ=
X-Received: by 2002:ac8:7f48:0:b0:423:93ce:bde2 with SMTP id
 g8-20020ac87f48000000b0042393cebde2mr29365861qtk.63.1703080777739; Wed, 20
 Dec 2023 05:59:37 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Dec 2023 05:59:37 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231219145402.7879-3-xingyu.wu@starfivetech.com>
References: <20231219145402.7879-1-xingyu.wu@starfivetech.com> <20231219145402.7879-3-xingyu.wu@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 20 Dec 2023 05:59:37 -0800
Message-ID: <CAJM55Z_X9b=TJt7343kQ68ndN1MvH-rFM9hyEZMJRvQnOk72Yg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] clocksource: Add JH7110 timer driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Walker Chen <walker.chen@starfivetech.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_055943_146932_08520232 
X-CRM114-Status: GOOD (  13.48  )
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

Xingyu Wu wrote:
> Add timer driver for the StarFive JH7110 SoC and select it by
> CONFIG_SOC_STARFIVE.
>
> This timer has four free-running and independent 32-bit counters.
> Each channel(counter) can trigger an interrupt when timeout even
> CPU is sleeping. So this timer is used as global timer and register
> clockevent for each CPU core after riscv-timer registration on the
> StarFive JH7110 SoC.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  MAINTAINERS                        |   7 +
>  arch/riscv/Kconfig.socs            |   1 +
>  drivers/clocksource/Kconfig        |   9 +
>  drivers/clocksource/Makefile       |   1 +
>  drivers/clocksource/timer-jh7110.c | 360 +++++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h         |   1 +
>  6 files changed, 379 insertions(+)
>  create mode 100644 drivers/clocksource/timer-jh7110.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9104430e148e..fe0e803606a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20617,6 +20617,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>  F:	sound/soc/starfive/jh7110_tdm.c
>
> +STARFIVE JH7110 TIMER DRIVER
> +M:	Samin Guo <samin.guo@starfivetech.com>

Last time I sent a mail to samin.guo@starfivetech.com it bounced. Was that just
a temporary error?

/Emil

> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
> +F:	drivers/clocksource/timer-jh7110.c
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
