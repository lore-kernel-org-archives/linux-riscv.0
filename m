Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CEFD3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 00:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSxM0k685F0Oj9xLWURRNC/7PB/kN1KvMjCF3wyyUv0=; b=LGkEoRJpD5Xs0X
	PckkVQJhZg8n5QRfQ2Wa+kc0zS/63vg0fGIe+seNXTw8HY/7suK19WnqkYOkAhQE5Hmzf63HQc4x5
	e4jn/s9fiRLaKOiIheEn0XzH9BAueB24sQXuS5ebmCcWwjQGGX8eOnCHyxX0i50e74rwPBL5fU6/e
	QQkJ/+H5TYhlKT3YelN4JZE6sE9tYQ6YCBtcEpFlS4QpxSEsUJrcNkwILf78nByqI81yHiTq/Gnec
	05kq+POrcc3Wpu9tuuEJ0Bgq0uNniaJ8A2T6SPqfLHEphNUAOZ4ef8Qlw3boZHpAmwQiaYwVOXILN
	C8l6lYYLEhXQaMeltviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1Yx-00000003A3e-1iLp;
	Mon, 29 Dec 2025 00:56:43 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1Yu-00000003A2k-2HdC
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 00:56:41 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8bb6a27d3edso869610585a.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 16:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969799; x=1767574599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5YcKwFkMbcJ8/aWNC56rcK6ZT2Jj+wm+CfNyGhVwCA=;
        b=t4IN3Xs70UlUIr5/bdxN9CSY2F4So2WhBoISQZGwskNBWu9x4VVLuVQuBHv+yvgOP3
         2bLXbE0DwIs/XKCrJ2OZ6OrCXTbW1NMsiURyRuUdTvNXgbpJwuCXVs1K8Cw8Hsdvu9Wy
         vTTuWcc4TCR0/ZfACem/WRjsphHPg0ebNCPxz/aIihxemdYOxx7A2PbC7Qx4tDCXC0Ju
         bAXnOIORSiTJ9GljIQp9ooXdtXC2eo+UQ8jXEtQvbI/AkNoOu/oKWacqPKn2XN7UVjF2
         82dVccBbNL7HBFLPaXgyhvIPsJPw6GGa9EUjmCQoNI5xOcDRwBq7EqRX6666HevZTixK
         aIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969799; x=1767574599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5YcKwFkMbcJ8/aWNC56rcK6ZT2Jj+wm+CfNyGhVwCA=;
        b=W3ObNTPGFspEwDg+CJhCf/3VO/MSWuMs5fXqk77r/5hi5QKqm4a0XyLBFCbq9pgdqx
         SDkEec6e/yQVyBgMAEqadtqh8cne/vHta/3cTxyxDH3riZDw8eZ1WXMhJAzY7vSeVCS0
         VLV66ptP/xfJ7Ha/znBa6+6TRRGoArkk8Ef7lM1ISLaVpxqopMbG3FuJwEgxP9feZTv2
         8VHElezXxfkRBOoZlxttcYPVZa2AxoRf1d1sf6O2uMgIxSbUuEePTDF5sOy2f5U57rwR
         o9OF474CjoEJmcMZ0whxnQaixj1Mh3zC1fM9us/ALoaLl8SQjZf+Bi4FuIgOz/1qATH7
         +Dzg==
X-Forwarded-Encrypted: i=1; AJvYcCXfCIltg6EDd8M84PfqRvn7QBufFFLzvA7/p/zPPSmo03LDRdnIwcYtE+hO254Ms+Gvy9anvkZQDkKxeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz1v0MVDoNCD0fjdRRQodI8ngA290EheR/RmghZB4eMh7Ho0vb
	BbBDjXjgO2fJhZ1vvFNIDu2dj8ZSI/aWRDOy4BgXqN7umHgk0qB+/6kGKYFtCFA/kQ1YyiFYHno
	ksg6TlmI=
X-Gm-Gg: AY/fxX6BzZ2vaTiIAefNRjq2gJssqrITORWnejUEs+1SexbdXEnLDxM5EsnWVS2jdwi
	Vw7KxiLE1t15wFjXeX+DqN1hfOSuAKNPu+AIb0sBElR1yDaAXmXxZZ+6Av6bSBWrRU2OQfT1sGV
	jVdOZkB8KI6n38n8vWEVCu5ozB8RJQo7vqmCfzDq1/n4iW2Mto0bRCodld2UwQDYTsIYsCC1Z3i
	vQe6y0UKcy086YSNLNMEX7ozuckIakSVKETYxRmufrwACYH86l605hcTnaTwoOeU/o/N+S+nl+w
	r2R15Imys5pshNJeYff692+3jxIiMwOZi5wrOmM447xfxD4//37bRh66FLCrlomBvUBL+l+sCjV
	6YWDpB//p6WNIejO/QlOSMXXAA2lQuIR5NzS9N43kRIiOWVIneOV7HAG2/evQj1WN41djNHaP5L
	tIk3H4z8AAnAQ46KsnlqZI7UrI1Os5wtBqDim+pWu7Ps6riZ/8dnI=
X-Google-Smtp-Source: AGHT+IEX3O6y7wxbcIj6mJ9uEHV/yCicWvg4d6PHddWSgifd55NeGPWTFcT2cuAr4CpJraSKfFGlGA==
X-Received: by 2002:a05:620a:4489:b0:8b2:f1f3:900e with SMTP id af79cd13be357-8c08fac0b38mr4258385485a.62.1766969799303;
        Sun, 28 Dec 2025 16:56:39 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:38 -0800 (PST)
Message-ID: <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_165640_619274_93E0AEDA 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/26/25 2:32 AM, Troy Mitchell wrote:
> The clock-frequency property is optional according to the DT binding.
> Do not emit a warning when the property is missing and fall back to the
> default frequency instead.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Any error reading the "clock-frequency" property will simply leave
i2c->clock_freq alone.  This is good.

But the lines that follow this issue a warning if i2c->clock_freq
is 0.  If it's optional, you should simply use a default value,
and although you could state that rate with dev_info(), you should
not warn about it.

					-Alex
> ---
>   drivers/i2c/busses/i2c-k1.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index f0c35e23f4f2e139da0d09f314f3eb0e0462a382..c829618a66a214a12b46d63bf06ba7947b9dbbb8 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -651,9 +651,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (!i2c)
>   		return -ENOMEM;
>   
> -	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> -	if (ret && ret != -EINVAL)
> -		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> +	of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>   
>   	/* For now, this driver doesn't support high-speed. */
>   	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
