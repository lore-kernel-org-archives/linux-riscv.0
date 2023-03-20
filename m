Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3A1C7618D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oucahC6XBST6VO7PpfRr4zBv3pPF/eS64nTVTm8oExo=; b=ieuV7l7zIs0HV/
	CSD9MRtjEZAEpBXwE5fhuemkAIZyZBRrbJ5/vwTiqFptIHZE12ng/tMgs7nn5z6MBLI0EpSD7ii/u
	EQWL2ItKVd9sXuaSfp1h3Ducp0zC/Q//Pp5TpGow2V2eFRj3TlH7B+BsnsIuaplHhPgMGjKyDCir/
	VSHSu3uyHDoR57iz6FTeA5wadu+cgvU08c7RdhOJDF46F5yyXTkHHZIBJc1lAN63NMAyM/i0eiDIn
	S7scXtci6zUAe1b0s8E7cFDMwG3r+JtdufgzQ6olUxXcf0HhzkaenR6e9b95qUUFLoXiG+bdcliHn
	FXqV0j5X+haMN9/IC1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peE34-008t8g-2Y;
	Mon, 20 Mar 2023 11:51:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peE31-008t5m-1w
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 11:51:33 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8B9F941BE2
	for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1679313083;
	bh=GGpWfsM5C1ImSMDFhmoi1LbWjuKbL/WrII+NG9/nakI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hM94kEI8J2CWhITw3n83CPVx9YzA536hjQLxYB06Fxl+w8uG0/GUhF93JlycEI8AZ
	 dymKrPQWZZAsV/6EfntZ5gkHMMPrFq4ol60FfcOQqq+RBWxe4G4kJntWA0i6Edhofp
	 f+vtVJEfeHVPeJea8V9q+C32gk7jABGBITbezAw2GuC1weGYHVcrxta2XEtNcMVFhG
	 Ef3uD2YTZ3N0dyFcRlB7W4gtsACVUENNVpNoxJO+qE7ulF0uBcUfZ+tWdZnt/RdcO9
	 WYl4GYOgIZ7GpjdbgMQLupexlwgQhMHwbSFXJ3sExIasIIhXs2skMyEJG1X+C9/Kmk
	 Mlq+Zc0K7+q/A==
Received: by mail-qk1-f198.google.com with SMTP id s12-20020a37a90c000000b007468eaf866aso523660qke.17
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 04:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679313082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGpWfsM5C1ImSMDFhmoi1LbWjuKbL/WrII+NG9/nakI=;
        b=yyGcCLZtovzWL9yzB5M0l9ftnMIWgzdMavzWa8BHmQjNyw99Eipqo2aDDxXRM/ascM
         ug6D3FTdif7mqMZHbBnLoLIvs7ncM6duA5BhTtmseYav+heSwF4UrfntSCKK1sXVa5NL
         nVVSS8Jq8t+z7hGq3SXvotUlepzNzx3XSQ0i+qWH4EeYe6/pnxwKvyP2hg6nOsIChIoo
         0qo8UoVkLhVEPdiPT9T08Rznp3IxCJvJj3VYKiHAulqTLyeszKUhZcBaAIe82xQYyx7l
         lbQp6b1sGK6q5nbUMRFdF57CDFXQr5AOGwDnORwppFr7Yosem+PfsthZVL/LPLeOL3ey
         Lp5g==
X-Gm-Message-State: AO0yUKXn7qiDWK72lhQEJ+ojX2orn3nn4PDiislvof26SmiyGM7HJTlP
	Ielc4YZimRR80fdd+rQ3oW6zAicq63mi+WLZ2ianSNFnDzEHodRpUvOzPDfD3KKReVnOKB7M6Gn
	SvkP2ZROBT2oUfd4w3CEmM2epyWwcU0Bw/qjR/RKlB9rP2Ws1IIFdez9SqHyD/w==
X-Received: by 2002:ad4:59c7:0:b0:56f:3e5:850e with SMTP id el7-20020ad459c7000000b0056f03e5850emr6960046qvb.3.1679313082556;
        Mon, 20 Mar 2023 04:51:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set/l+AwVJZR40S7GPUVKDWevuOOVX4sYPIEehyQctIQv1qL8d4CCuDF//+jeSsWW86R+pXOcTviboByTpW6VUeI=
X-Received: by 2002:ad4:59c7:0:b0:56f:3e5:850e with SMTP id
 el7-20020ad459c7000000b0056f03e5850emr6960029qvb.3.1679313082287; Mon, 20 Mar
 2023 04:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230311090733.56918-1-hal.feng@starfivetech.com> <20230311090733.56918-6-hal.feng@starfivetech.com>
In-Reply-To: <20230311090733.56918-6-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 20 Mar 2023 12:51:06 +0100
Message-ID: <CAJM55Z-2HB4PCw3fy6n3e0FErV9DXqGazVkq4TN+X+34ozNcbw@mail.gmail.com>
Subject: Re: [PATCH v5 05/21] reset: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_045131_787960_AE2499F8 
X-CRM114-Status: GOOD (  15.28  )
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

On Sat, 11 Mar 2023 at 10:07, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> Using ARCH_FOO symbol is preferred than SOC_FOO.
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/reset/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 2a52c990d4fe..6ae5aa46a6b2 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -234,8 +234,8 @@ config RESET_SOCFPGA
>
>  config RESET_STARFIVE_JH7100
>         bool "StarFive JH7100 Reset Driver"
> -       depends on SOC_STARFIVE || COMPILE_TEST
> -       default SOC_STARFIVE
> +       depends on ARCH_STARFIVE || COMPILE_TEST
> +       default ARCH_STARFIVE
>         help
>           This enables the reset controller driver for the StarFive JH7100 SoC.
>
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
