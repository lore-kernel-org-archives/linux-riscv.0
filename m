Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24043C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odVqFEwSK4IBY76qBLUwGHNI4yMOl8ex9p6YH2nn3t4=; b=PqF6typntZwTSa
	Cn2hQAsEG642/Ni6b0ud3Xu4YydIWlFMyFuN4A565PXZmCJ8TjvW6vF3QJ8qsq4I2nmIwCk4KoLrD
	z4I673prQcxKNZAR7mgO4ftPo91Lsso6bzJHyKOL96E9bfqSCAp65zS2dPD6Rm4N/5SMA/41UXJo4
	8mMTeD74VGJSrOLmmUsPSsbkgAQRlE8goKCC3oIlnNKx8+s0qha/WHFCG8Q+gT3Mr25X9JgtaC/QE
	FUg7DLlwhLELm+/iPXhgMD0tB1yGBxp00Y0nqDSsWfulzRlGBWYGnSLgZmV7D83LVBGMR/JSY/FKN
	VxxTcMwvrHL9zpVPZSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vju-00D1ti-ES; Wed, 21 Dec 2022 09:50:18 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7vj3-00D1FA-SB
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 09:49:27 +0000
Received: by mail-lj1-x22a.google.com with SMTP id q2so5801146ljp.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 01:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4pOTa7XD14Zbi1zXxlhwo2uq1WAQLtH0H1dvVBr/wM=;
        b=TatoTF6KDCty9jYvwLHt8LUJBG4EfDHIWY7OIX8gecMCtklkbUY83XvdqNexPWzVHh
         7aHcj6cell6x9syMMMUvBbd8IhMjN1Ix2O2vsj7WocOoSuFZ648iIhqPZhcTYevUeYdq
         6oxyrVV/PxZazRP/iKy3JHVjRKyCE5XANvaaI2OcyddGsO58OUrq7Z5T494E2mOB2uqA
         F1ga1FNHs+RVzr2KiNpV9JxdgiuANgeWGzt978v2rBbuOVX9+jVyPWqwofW5nJEl0mFc
         2/TqloOr9Aav3Y6Y0mHnlbIVWq9I0gPrYXhF+V/yZ9FLrz0NcxH3wTQIHdsKqLB1okOk
         uYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4pOTa7XD14Zbi1zXxlhwo2uq1WAQLtH0H1dvVBr/wM=;
        b=Fzx3wXXaOp9+IODq1eKwlm8ImNZp7madACuxyiWPlpyJ4mpB+ZTclgPBg/j8Xbs1ga
         FzoR2JiM/hbYtS/BUJzc+gsbLgdNcsy4y0j/pIPkaDNMKgkKRtGxnoPjS4QY1eoVB3YN
         dvXKwb1IAYQvM63HtLO8u4nQTZz82+Q4gfjkiX39cQwg7AwQpBZI74Gz/oFqTw7YLr3d
         /gma2dC2aB9AbnRtjOt3CN4f3VqpElZ5OOdVbPnG3Fhqwkxh9AwvMYG60hlwv5cvPUH8
         0VM1OIZaaMLdZsYJIDc5cFsEFNteW5SsK5uZsxJofjVGwxxTMVljSxuZn4oj11yjgERh
         Z94Q==
X-Gm-Message-State: AFqh2kokqD4C8J06H+WGRfLjaiAkmc7YsDaswRX3UQ5Bq90yjB0RlcWW
	3lAw/AY0YRNTJR0zNWphYbCuoGNBeNr0Y3fL
X-Google-Smtp-Source: AMrXdXssO9jKbgSHpDGsWvD2A8uvCkDgxTfqEYUdI6PAsmQUFbP3WJ19muNo/XTSwSkvzcwBi9mWuw==
X-Received: by 2002:a2e:bc87:0:b0:27f:6978:583f with SMTP id h7-20020a2ebc87000000b0027f6978583fmr419058ljf.44.1671616164053;
        Wed, 21 Dec 2022 01:49:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g5-20020a2eb5c5000000b00279a7266874sm1273754ljn.98.2022.12.21.01.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 01:49:23 -0800 (PST)
Message-ID: <05aaa9f8-7a97-51c9-e18a-1c3753f2006b@linaro.org>
Date: Wed, 21 Dec 2022 10:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Content-Language: en-US
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-3-jiajie.ho@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221090819.1259443-3-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_014926_130381_9C3001D0 
X-CRM114-Status: GOOD (  13.87  )
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

On 21/12/2022 10:08, Jia Jie Ho wrote:
> This adds driver support for the hardware random number generator in
> Starfive SoCs and adds StarFive TRNG entry to MAINTAINERS.
> 
> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  MAINTAINERS                            |   6 +
>  drivers/char/hw_random/Kconfig         |  11 +
>  drivers/char/hw_random/Makefile        |   1 +
>  drivers/char/hw_random/starfive-trng.c | 403 +++++++++++++++++++++++++
>  4 files changed, 421 insertions(+)
>  create mode 100644 drivers/char/hw_random/starfive-trng.c
> 

(...)

> +static const struct of_device_id trng_dt_ids[] = {
> +	{ .compatible = "starfive,jh7110-trng" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, trng_dt_ids);
> +
> +static struct platform_driver starfive_trng_driver = {
> +	.probe	= starfive_trng_probe,
> +	.driver	= {
> +		.name		= "starfive-trng",
> +		.pm		= &starfive_trng_pm_ops,
> +		.of_match_table	= of_match_ptr(trng_dt_ids),

of_match_ptr goes with __maybe_unused. You will have now warnings, so
please test more your patches (W=1, sparse, smatch).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
