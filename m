Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A257C38159
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNEgHs6OSRyuG9lrZpiYLrwqwVF88CFlgofvvlbXyCo=; b=Daiug1Yhm5koYD
	mB1LtGLl/ZC1r5HcZNDdhF0WgAepp+CkO+QwwGaghW8WLdYh8zNbqWgDWh7auidnU/rXRgzvpXryV
	mHrxwy+UZmEW8Ean3zZ5M0XfaYq8uudqbzO/L1dVHRvlxrNrpoQoiLifXst3vs9usY9nmubIzTLUk
	FbZ32TOVqJKkLuzHFAsocj5tD+RsZ5h79FZe8p9A8nfcGkNpBs9sPZbFCrG7ziLrwIf99CQwvdao6
	y0Y3/rZQ5UClqKHeTJIduBOfbcc65NsDoSV1qhad099PMhBbPoK4/i3TpXs3pNltkvsNGkQx62Z3j
	cUARIcTqUwpYY17RfxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6ia-000YfB-Jo; Wed, 18 Jan 2023 11:35:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6iY-000Ycp-4F
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 11:34:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id m15so3253153wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmrZHvM1DlPNSOW3Xlkk3jNqiZi+8RsKuRw9Ed+dB6M=;
        b=soyoUjyM6lCyBm738nBiG3QZMffXSdK/FAbzUKQqOOnOa1KE2ODZHiW4vHSpHOAkWH
         nlnuprkLbTVnqi1A7qa3Awa/oQyrcNjg/L7DKmSm6W64tZR+JTG/QAZgZmeW3OfvIoG/
         o/6xscBJP90jIQPwbDIwnEd8lGR0NVafYEvz7yK2nRTP3HL2A3GlW60c+l35lzqdAmdB
         P/M8gGXfNWf1T1dyCYupm/TM/DtBF5vVW/DSNnsib+1GXYKfeZBov8cFJ4gnypsY8Wfi
         Q/CUdcrNIu57jnqT3/Txa1tbUBUTK6XFZeF6BJSUkJ8qeODvXHWWs0KVxa/l9xra8kLx
         hxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmrZHvM1DlPNSOW3Xlkk3jNqiZi+8RsKuRw9Ed+dB6M=;
        b=tG76jne7Upc9l/9UeAx01AAwaIfMmckECvf4lg5aYYEnTA8gI961Yi/quqHGlrcp2X
         CqJr+Jv/8n8fh8ZHupZdcca2MocFXbnYE6N7h1g10qYkb+2hgce7g+LOyyLA3NdQSfWM
         rMsAH9If9p+empSeHE+gKLbJ0jQFq7p1DpS8xtO2LYIHuYzbS4LUse5N9oHHS+kyTiF+
         /T/MulW6ehmkZ+nElltuXsSfK8vwKMvNG91aYMujbeTs3P77M7TczprfrtolBCrS6YUj
         nOLEsvl3zUBYoAbNtss6WZmjmFltPYmX+CHwedoGntcToYfTf5XQj43C7YbiADztDEhQ
         dCWg==
X-Gm-Message-State: AFqh2kp4VDifsFpbWNhmyUe3hZMS5AeKDtU0/946C0cfLumlF44Mw2He
	teGxALq6A4Ui3b3xs+e0OKDwwA==
X-Google-Smtp-Source: AMrXdXsLfr9LdA2Qpx9wkQv4kWlO1tu+d9Q9P47dtmh/jHU40qAohVcnlAkJVbaTTAmxwXJnbjnN4A==
X-Received: by 2002:a05:600c:c8d:b0:3da:fcee:2ef1 with SMTP id fj13-20020a05600c0c8d00b003dafcee2ef1mr6266128wmb.32.1674041694337;
        Wed, 18 Jan 2023 03:34:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c458900b003d35acb0fd7sm1716356wmo.34.2023.01.18.03.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:34:53 -0800 (PST)
Message-ID: <d2b84b4c-1529-8709-b9eb-3cf21ad8cc7e@linaro.org>
Date: Wed, 18 Jan 2023 12:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx
 I2C PCIe clock generators
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20230117231626.134588-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117231626.134588-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_033458_235262_936E6F64 
X-CRM114-Status: GOOD (  10.83  )
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

On 18/01/2023 00:16, Marek Vasut wrote:
> Add binding for Skyworks Si521xx PCIe clock generators. This binding
> is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
> generators, tested model is Si52144. It should be possible to add
> Si5213x series as well.
> 

Thank you for your patch. There is something to discuss/improve.

> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: XTal input clock
> +
> +  skyworks,out-amplitude-microvolt:
> +    enum: [ 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000 ]
> +    description: Output clock signal amplitude
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c@0 {

Just i2c {

> +        reg = <0x0 0x100>;

And drop this one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
