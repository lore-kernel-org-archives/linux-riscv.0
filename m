Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC81BEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4gbTR5pcxK5fHAIeFX/et+QQsMYFXlS11cfyDMcN1E=; b=xiA94niEaWbTug
	tkMWAoF+ZDojJb/aPkGlNlx/MkKZzeUvDIVjT76XDSN2CDYy4eREFI6/XSbRCUH9114gTTOp1TXaS
	qGadNMxRrgNLM2QHnIHMAyZ3smNV/eLkc5jpMY0eKXJdRKvJSMmHRwVKIn+Y1+rlMIbIJupoJ350D
	aoVdIA+3rlax72t4IVze2C7C+4LBPhF+w4akeHEprZWrham5P6X6ri2rLbL61AmFsPj+ZER4lgOfz
	a4LGxJdVk9QxQoQVI0ozN1hz8d85AJSu8Jnss7xLmJosxPankTO/K26HL+oAsB5VHYDjcjR4F6kZo
	41Eb8qna1W+pbbGvdjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoEB-00AV3I-0w;
	Mon, 26 Jun 2023 15:34:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoE8-00AV1d-38
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:34:06 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f96d680399so4478374e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793642; x=1690385642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ya1oHLhK49gH69AdTB5fxakgV4R1n474hp6YX3YudTQ=;
        b=EgGXM+bMYi+pEr03dgQRrPMELVU3LpFQHWZBD0TASsZknInUemfRaINUKrOuK08Ar7
         rCnF7a64fWspjfDRz4S6IdH567cFSGeYKz2urJLmV4v7zKdg5LNCZEbTBLvQENwXIBCL
         /YnDX3T906rZsWLudW5iuk9UpIfn0rwLwpmZezQ5AtgAT2Z80d9b8T8DY4yKmfU2nGPv
         klbqPitwtlVcrIeLmqULeKAVkVh82yqjFxqVonB3ZeAFjEqySODm0DdcazQxEan+z143
         MYPsPVVGcDcuYCvUOQ69/cBhw3qRSHbZ2iJKQmeXeRZDRHZk3QFXtWQBjC/S1C8n75EL
         zNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793642; x=1690385642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya1oHLhK49gH69AdTB5fxakgV4R1n474hp6YX3YudTQ=;
        b=fMLFHq44qYjW0W8AIXb0GEhVR2iWX4k8mxelqz5/s1ee8vOEeYsiOBfcYrxW1ZL+J6
         7ttx0JpDy6W4eaN1LBTdAXt6gfV9c/11X+R1JOIhi7TwIL5u1WhJcNHNqPAEIQDjY0wn
         FVkFzVu/VOkaOb7G6ma406Ml+9xtaC9J+F8x+EM3VVqoN61RfowDLbOiOFIEqRQ6sfTP
         guxgGhNfgWe9t8ythy13Nc5A70Ll4DV1AhCGK4NLFmKmoEhFMWTmcVNzCnzrZr9ScA6J
         I6q6DJ9ogOJe/NVPx1kaq+l4cAubhQsgGLuC7EPgDN9bOCUyfsSJif1GUREtbSDJhySi
         M9dA==
X-Gm-Message-State: AC+VfDxQv2OqIn/sE50QZDmJq8XUMOftIymlRG4BCYCSieTT9bmFxH1a
	EMeVBaGW33AFCUNtAhFN0ogwsA==
X-Google-Smtp-Source: ACHHUZ4E0kOOnagiFcXwOV4l3ulb3LBPffWv8GdF6WdTtE8cphcbzNVQAT2Yl97D2BwtkrQNkCuX6A==
X-Received: by 2002:a19:7718:0:b0:4f8:6e6e:3f42 with SMTP id s24-20020a197718000000b004f86e6e3f42mr14189892lfc.14.1687793640007;
        Mon, 26 Jun 2023 08:34:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z20-20020a7bc7d4000000b003f90067880esm10977810wmk.47.2023.06.26.08.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:33:59 -0700 (PDT)
Message-ID: <4c421206-39a2-d98e-f75d-f5d269e881ff@linaro.org>
Date: Mon, 26 Jun 2023 17:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/5] ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC
 transmitter driver
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-3-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083405_013720_A51023D7 
X-CRM114-Status: GOOD (  13.41  )
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

On 26/06/2023 13:09, Hal Feng wrote:
> Add a dummy transmitter driver for StarFive JH7110 PWM-DAC module.
> StarFive JH7110 PWM-DAC controller uses this driver.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  sound/soc/codecs/Kconfig                     |  4 ++
>  sound/soc/codecs/Makefile                    |  2 +
>  sound/soc/codecs/jh7110_pwmdac_transmitter.c | 74 ++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c
> 

...

> +
> +static struct platform_driver pwmdac_dit_driver = {
> +	.probe		= pwmdac_dit_probe,
> +	.driver		= {
> +		.name	= DRV_NAME,
> +		.of_match_table = of_match_ptr(pwmdac_dit_dt_ids),
> +	},
> +};
> +
> +module_platform_driver(pwmdac_dit_driver);
> +
> +MODULE_DESCRIPTION("StarFive JH7110 dummy PWM-DAC transmitter driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);

Drop. You don't need it. If you need it, it means you miss proper ID table.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
