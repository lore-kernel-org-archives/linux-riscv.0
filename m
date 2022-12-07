Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3518C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4f13PvWL5Hxxz/gQAoaNxHollhDBulN2KTLjT/5AWQ=; b=XkiBxfoQYK1v2d
	4ka+m1eiSB1+BtFHiMysmJQNmMyF3VX/RDxAGkl4j1c1hZ9x4P44GpaX8Mz8Txh2SJTuSbu+5w1e6
	zSIHiwCcqO45A/Ax1RpMaG6Ok/EcSPkuNxvsufmMXGINtaqPkili7yDuWaz1cGdRwjDj1XVU2AJh0
	WQ/Z75HiB+An3pX/tsNSOLHybjCkBsi+fDjJZD8HynHLjuqi1/xj30CvC72hfGXKSeZqJV1yrcrMW
	rHAHPdhlLjMJMfGhJCobxyBj3d/lSVUrGe38BXn/IbTwj20ZvfpVbCu4NWVW48WysYIcsfQHbYP1O
	FVnLFsEF5gDu/GGiVU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uwO-004L62-4f; Wed, 07 Dec 2022 13:58:28 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uwK-004Kxr-2J
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 13:58:26 +0000
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 52AE14152D
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1670421502;
	bh=9GCL3W6v/AmfhZbVCu5utEsH4vGz3v+tufp1/dYemRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dKUvmoqIGuOxHNNKEtH6Ri+Tj3dSZVfYeYVSgDiUN6H61FwQWPWJqUqi/e4Fn2xuu
	 cFFpbwz27G0cH6IvLJ9wk6uLw6/Ow4k3UNfLuHX976tCwLL8XzugxeKaFI6WAjjwCD
	 r6YjAgtYcE4OPdfkKhayYEYRrmzAcRTeViS01iqxhbNpV5X5rVxhSLpHF6Pin6tx5m
	 CCDm32bdgv/mRZnnZbR6BQ7pMATmx3j8ckrdtGTzDv8s5ePMbVvjv39CcD6tCAFH2J
	 /DPUK9zV3PpQsFoI78UI62t60cGEMqIy4bbVoNDTNKjGyKKiDSdg7yHEYqSm31N70d
	 JlkdjN8VAbp8g==
Received: by mail-io1-f71.google.com with SMTP id y24-20020a5ec818000000b006e2c0847835so702174iol.12
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 05:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GCL3W6v/AmfhZbVCu5utEsH4vGz3v+tufp1/dYemRM=;
        b=tyYjNBCFR/jfRbWbZhVIiikM0jWN0SwxVXg/gtp8bqs2KQBEyCNv40xnQcyRU336wz
         O2ww1zUUY8aTRfn2iR4JAvsoSabz7XE5ruBMp2vvg2O9a/Trtzyrzdt6Ia5k9yX4po2a
         ZfQgIv2CmaCXENqHuCDMZ60m6LjP+vqvgWfROhq9KRkCrKt3LOfDynViMwSezyv8MaM4
         zp7PNXviXdHy6KITtDNJv4ycwDW8tDa7GCErwrbMa3lBklXUs1MYD3MwRjXOL00Waufz
         1gLEs7aCrlujVBYRItvoW3REo761g59jMyuIqLr4V8qNRIhlwbQ/s4OtvHchlNEb5bFp
         4kFA==
X-Gm-Message-State: ANoB5pk+O3NRjmMF0SfbPkkOB6HZLr/Xm8vG8PI86zZzXCZec1F9iczG
	4LGaC0X69c99rwGMbO1DF9R0QtHH0jso6rGei/lR2f7P3wND8KJ0qc0WWFytsCkEBsg3PMTsBI6
	sy5vWrRSPD5EG//fibVcYmZl/ijySR3ile7vYjSduChx//MxQr/NnpP/nemeksQ==
X-Received: by 2002:a05:6638:15cb:b0:38a:a2c:5c1e with SMTP id i11-20020a05663815cb00b0038a0a2c5c1emr14812163jat.35.1670421501101;
        Wed, 07 Dec 2022 05:58:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6oS4WtB4AY/x9xEAWaZszCLUNeiIhVzCL4QBdnRGkNjsZUkTVArtcl3+u1LcaAO1HHytY7Lk4DCTgXk2m0eYo=
X-Received: by 2002:a05:6638:15cb:b0:38a:a2c:5c1e with SMTP id
 i11-20020a05663815cb00b0038a0a2c5c1emr14812154jat.35.1670421500857; Wed, 07
 Dec 2022 05:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com> <20221201090242.2381-3-yanhong.wang@starfivetech.com>
In-Reply-To: <20221201090242.2381-3-yanhong.wang@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 7 Dec 2022 14:58:04 +0100
Message-ID: <CAJM55Z8ZDKWEkdWuRZfcMQDrySMh4vdB1UvkAC+q1GRKMbGuEw@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] net: stmmac: platform: Add snps,dwmac-5.20 IP
 compatible string
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_055824_533829_02A22C52 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu, 1 Dec 2022 at 10:05, Yanhong Wang <yanhong.wang@starfivetech.com> wrote:
>
> Add "snps,dwmac-5.20" compatible string for 5.20 version that can avoid
> to define some platform data in the glue layer.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>

Hi Yanhong.

Thanks for submitting this.
But just as a reminder. Please don't change the author of the commits
you cherry-picked from my tree.

/Emil

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 50f6b4a14be4..cc3b701af802 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -519,7 +519,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>         if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
>             of_device_is_compatible(np, "snps,dwmac-4.10a") ||
>             of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> -           of_device_is_compatible(np, "snps,dwmac-5.10a")) {
> +           of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> +           of_device_is_compatible(np, "snps,dwmac-5.20")) {
>                 plat->has_gmac4 = 1;
>                 plat->has_gmac = 0;
>                 plat->pmt = 1;
> --
> 2.17.1
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
