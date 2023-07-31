Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83842C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 07:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWTZR37Qd3kFUuLjpT7cT7XK56lcjGO0jf1E7SL4juA=; b=Icl1OtdYXjX3i2
	S4xLBV8GX2VoEcu8KkSPBqv3tI4lqjwNll3ktWIUG1vw78B/+BQDdwopylfu1mdX1u16auReA+fQc
	6UYiUxDDHOgjU+Hf9HVcP6Xg1alRl+ZD6SXeYFTzb7Uy+wo5xc4ZJsEow3e9uL1PqTKsnQRxRKQV1
	aGbO5/GSJcvJiOcj5h4XmfOPFV4GiN6NLfqicz7jxK8iws/eXKbHxXfXkvPeRP55wK+lIkhLWQeNW
	Tu+g4SV41cIRLtvdoSrVhN7tdQYKP3/ByBLpX5PGNCqCrkRLofBB7WBPdm876nvSdmhM9oKU2QH3b
	b74zO1F63GUVxeA6IRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQMyx-00EGh7-1e;
	Mon, 31 Jul 2023 07:06:19 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQMyv-00EGgF-0f
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 07:06:18 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bf1f632b8so418225966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 00:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690787173; x=1691391973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2S79vQkr/Q6AsrCfTC9FA0lnKMVA5NRuZdzXti1EXs=;
        b=JWdIFUyPCSGhlS9/udGq4gNVONwXz7IgcHWdgX38rdevQIipSg0PqMICpRfm7kXMq6
         HsWcRRKT4BiOviTPUx5rvVAzEaDbr05j76NHSb2wLnYHNKAJwR+6I0s0jN9TGITjPPcD
         lYBRBUirFzBqD0/Ei32YyQeSuExCH4/XMMMN0bObvLNipjF5uxkRwl+yeUop00SwR8QG
         t4eTZ8pJSyTvmTFIkp23JyxfZbH1jGqadG0ylrkpCQePqw/pmGMeZYnkHfzvG/XLyNZ0
         DX/azZfNF4bfhgUB1bX7bY5I+Q8o5QqZ+xysWiVoIYhQZMmDJ2jqC83OsOa1CO05CvRg
         Q8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690787173; x=1691391973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2S79vQkr/Q6AsrCfTC9FA0lnKMVA5NRuZdzXti1EXs=;
        b=aexkN8rXSnrNOLZCUoCqyfGNF4lY1L8tlDTBF/wZ1JxRZH4zQmrqXwEey1twkEZQRh
         ED4CMWcneolSMpWn1C0A+FW75BpYS/VQ/OhjuP5zQ1dtAlf2IIdQ2a1JpIcPoBW37KsK
         4s9/m1HAjwazwPAJkeUdmvkL7q/chlKUabiR12v0yz2CQageWxYs4eYpjbYTCcLalf14
         R3i5TOyrPeQ9SxQTiZlO5SYugNINA8I1i04wCJocly6m2oF/7mAIHTP5oFiVtUuNZTVR
         +3y2hmy/fZDn2bhUIY6ekGwfjrqPX9UFgCsus/uU7SHAuB8LyyQGO61vJhXbwWFWzQ/x
         pJVQ==
X-Gm-Message-State: ABy/qLZObueAFL7b6rjFfdDCUp0bk4DUzBK9N+PTKPyVtgAWX0DsWyyD
	SSiNX7dN22LcL/jUshX1w+ufDQ==
X-Google-Smtp-Source: APBJJlEPFgaPUMMYauFP7cTFYrzHjUp57IMDsTKAdaxvn07SrcaBjIcW2QxMB+JxkUTO7HjFCXXPvw==
X-Received: by 2002:a17:906:4f:b0:991:d2a8:658a with SMTP id 15-20020a170906004f00b00991d2a8658amr6680496ejg.34.1690787173223;
        Mon, 31 Jul 2023 00:06:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id lj24-20020a170906f9d800b0099bca8b9a31sm5703554ejb.100.2023.07.31.00.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 00:06:12 -0700 (PDT)
Message-ID: <b938ba84-38e9-b220-9686-6656e4452c10@linaro.org>
Date: Mon, 31 Jul 2023 09:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731032829.127864-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_000617_248673_876FDB79 
X-CRM114-Status: GOOD (  12.80  )
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

On 31/07/2023 05:28, Hal Feng wrote:
> Add PWM-DAC driver support for the StarFive JH7110 SoC.
> 


...

> +static int jh7110_pwmdac_probe(struct platform_device *pdev)
> +{
> +	struct jh7110_pwmdac_dev *dev;
> +	struct resource *res;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(dev->base))
> +		return PTR_ERR(dev->base);
> +
> +	dev->mapbase = res->start;
> +
> +	dev->clks[0].id = "apb";
> +	dev->clks[1].id = "core";
> +
> +	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(dev->clks), dev->clks);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get pwmdac clocks\n");

return dev_err_probe

> +		return ret;
> +	}
> +
> +	dev->rst_apb = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(dev->rst_apb)) {
> +		dev_err(&pdev->dev, "failed to get pwmdac apb reset\n");
> +		return PTR_ERR(dev->rst_apb);

return dev_err_probe

> +	}
> +
> +	dev->dev = &pdev->dev;
> +	dev->shift = PWMDAC_SHIFT_8;
> +	dev->duty_cycle = PWMDAC_CYCLE_CENTER;
> +	dev->cnt_n = PWMDAC_SAMPLE_CNT_1;
> +	dev->data_change = NO_CHANGE;
> +	dev->data_mode = INVERTER_DATA_MSB;
> +	dev->data_shift = PWMDAC_DATA_LEFT_SHIFT_BIT_0;
> +
> +	dev_set_drvdata(&pdev->dev, dev);
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &jh7110_pwmdac_component,
> +					      &jh7110_pwmdac_dai, 1);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register dai\n");
> +		return ret;

I guess here as well for consistency and shorter code even though
EPROBE_DEFER does not happen really.

return dev_err_probe

> +	}
> +
> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register pcm\n");
> +		return ret;

return dev_err_probe

> +	}
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
