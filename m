Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E5DC43219
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxbU2HByyoEUOQabUp4fSoobNqnxSVdfwO8Q1yQuDfo=; b=j6gx9Mucwxiahk
	K1FML555apGJlpuLBlLV5ayGTIRupUK6SE4Lg6xN2v4XT/Pwde844G+w2ad5gf8uORm/2XwslgJva
	xLhwExSHrocvQ/yKlRpwiLXWVciK3pD7OQYf+KwhdcW76m8lC/Nkdqlw05zJPyn0WjxzYFWcVUKq7
	353b12sdITfD9sv4vL+QcjP18QyMaCx9s+aJhtrXcC8jG3dGQWkJiaB8CEP6jmB5ozgfU7kIpFX04
	ea+DjFLQ06g76iqInRUdfw0ek0wrUWagCLks/A4CG8HP7HfOJVkdcySzZ1BLhvCnZuPq4Jlq7KRyP
	dl3bpaLEsBd/8MK64ShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow50i-005jIN-NR; Fri, 18 Nov 2022 17:18:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow50f-005jHe-RG
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:18:39 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE0DB3F487
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668791915;
	bh=Ihl+Je3Z+y8gG//tf2j+pj2UsuFi/UkCnl/8sS+58OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AjLhQ40i1l+2Hc8kL1a9pZ1f0v/938FYIp2MYmTAxeVorh+GFsDhiI+gbv0aPbtsS
	 U4MmRrOQWcwtCIh5QO6AAzd8B/azM4dBob2Mmbet0+b1QE75nVnLIJXd+JpRujlfOX
	 daO5Rwk4YGVpTC9uhtGGx29sSTIpIKL+m3cDLZ8SNWgX4WPdkgaqrBelcknCbu4+VY
	 jcnCGM+8ue7H6j+SR/qDdhfIJil2ivAWsDnEECnRFsV0YK1/Q3BzvcNGYYYTXm2e4L
	 SGFJofoOHEsVwqWsPEYpsAh/qpLmxkimyaaDqEVUdLKWzMRPmCQ5FkWiEZyb7qkFdc
	 iXTlHt780PZlw==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-348608c1cd3so55147057b3.10
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ihl+Je3Z+y8gG//tf2j+pj2UsuFi/UkCnl/8sS+58OE=;
        b=FSunWnOd/FqSzB5e/5eOFrfIOLDzV3e9RkDmZ9ITE4ELrGpsIE1ERAo0SbNn9s3J/0
         LfhuXSF3eu2aMpqUcefurkBEe1IMSo2Te0oTm9rTGCg7rb5mW0p/zdDQUDuw5Hduw5ti
         y4MXqMEJeqqP9exSzFu8qhoXH3FK8pX4FNdpPBht7skZlP9sjDw3seTfR/v7Z/iDIfQH
         tq317bHO0KtfMvV+TH+gxmFf101PPEqikCzIjb11rFB2V+t+LS9+8p2ECSvvjvHx0BDK
         WxLZgN3imwMVdHY0/OaO8VyCXhEXag32TlorR5cXquNob1fE9bCVf9TPwfCdPFfyLPxu
         Etdg==
X-Gm-Message-State: ANoB5plBKiyNfJV0iRcfZ1I5/fAZxiEStruyp6Ge+aPtuDbc8A0jy3OU
	xRktTutcB+68bqwto7GaQlQSFCpHOFCLnDKDXX5S0pYWPJ7SrU/adBUTUObRgU8v7U2lsJayFff
	gUK/nbDBxSrohaERWtpay1rMRRfNGWu1tx2cxomf324qli0hb9a81h1m8EWeS9g==
X-Received: by 2002:a25:3b51:0:b0:6de:f83b:3160 with SMTP id i78-20020a253b51000000b006def83b3160mr7210020yba.467.1668791914852;
        Fri, 18 Nov 2022 09:18:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gNMjZV4v2icTvtOBtm8WnqynWPCLqrTz9saKsC/CrUDCNOM3JEQ5u9gZtmPCMVbMaRenaOlMRVu0ODuMyivY=
X-Received: by 2002:a25:3b51:0:b0:6de:f83b:3160 with SMTP id
 i78-20020a253b51000000b006def83b3160mr7210002yba.467.1668791914667; Fri, 18
 Nov 2022 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-15-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-15-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 18:18:18 +0100
Message-ID: <CAJM55Z8t8yotMTWVw2J7gtGMyx5no2onj-YcfB6d1BY0ACeDJg@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] clk: starfive: jh71x0: Don't register aux
 devices if JH7110 reset is disabled
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_091838_031549_BD6724B4 
X-CRM114-Status: GOOD (  22.04  )
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

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> The JH7110 clock drivers will not register redundant auxiliary
> devices if the JH7110 reset auxiliary driver is disabled.
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index dda19c6937cb..4e69f56b00cc 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -333,7 +333,7 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  }
>  EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
>
> -#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
> +#if IS_ENABLED(CONFIG_RESET_STARFIVE_JH7110)

I don't see any reason you'd want to build a kernel that needs the
clock driver but not the resets, so I don't think this is something we
should optimize for. I'd just drop this patch and let such broken
kernels register the auxiliary devices even when no reset driver is
there to use them.

>  static void jh7110_reset_unregister_adev(void *_adev)
>  {
> @@ -384,4 +384,13 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>
> +#else /* !CONFIG_RESET_STARFIVE_JH7110 */
> +
> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> +                                    const char *adev_name,
> +                                    u32 adev_id)
> +{
> +       return 0;
> +}
> +
>  #endif
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
