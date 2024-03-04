Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC80FC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xovy848/WOFWv6QRjnIcYfO4bgbmvBzceEFH9AQAozQ=; b=SkfxsUlL+ayoIO
	DS8nFO6HauYyD3U+DKfiI0xpIgME4ZRtg2QqAESzSNkcx3SNLzIISrvCSl712TY35yyIXCkh2LbaN
	bv23i65mW3j28sQzokzS89DR6ewpM8TNLX1GKNTTDpNVkwB+9d8XeQbycp3O92AC9OtXSYFGTHVcm
	ZiAfq8H65ir+Uj08+w/176YqHIJ2OI9x8F4cFjUPD3SJCl3qIV3HvWMR8r6qOT2B3GgjfmUcic++y
	6kwgT+d6WEf5D5JKLvm2Dfdtq+gynq8kWcPfFBcxZc3HrBrtHjijiSB85FfPgOip4ZaeSa1ogUbdF
	Jq/OIoxNKaSes/AabpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3QT-000000084oe-0CN4;
	Mon, 04 Mar 2024 08:11:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3QQ-000000084o4-0ZWX
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 08:11:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33e444c202fso78044f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 00:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709539912; x=1710144712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PuGYwI8XWNcdtH5o1abzcPhx8A0mjNetGD+1BKOovGk=;
        b=BT00GXOzhkQIDbB5uvZjfVEqU/SeeIiqNg1hq65zVt8skLhMhtFIoSFyOfwLBTVXQW
         ZudXFVBoQJrbdTV1odjwNWuEWR5Q0HOc+zMA8Q0z852tzQAiRNuA9kKYhvJQ+LGTkTmz
         z/1rUTnKD3tNkMdd2TC5HF+R9jcgMPo2qpZehE2mByfBOz8lh04mDIbWZkXSTcDHb0ZQ
         HFSGMSji2egMeStUn503d/RcfxQvA4awPDMUOnuDp8sAsYtrxWeFrw54pS+U1B97keQC
         GmaJHYY7V9IQttLstu4LYVGRRkp4mmgzPxTafFz/Rs8xc09VOL64Nl5nWBGUCaxKrzMg
         YoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539912; x=1710144712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PuGYwI8XWNcdtH5o1abzcPhx8A0mjNetGD+1BKOovGk=;
        b=L1GMw+uroLsvsTFfP+d88yGqrykS4TVjTtewPU2kgDAu8EMMgyR+y7vVKh6ONChk79
         6VUXwcWHh70YrgSEzpeG6gtDFVBg1a07piRzr9lhq2cp1v9Q+WRvcyv+PjyvgipLcJ1m
         BOOv22sPJFa6Dje9loFVvHqxomoLfiGLKD4FG+8ZQnfy9N5M85wsJtf6MV62hF1loIlB
         ANGuKFblHsLqzm2aJTxS678P7Wyn4FBgdBnySysYcOgkXgmqGCUnhAVPC70+vIALQ/6V
         a+52rhkbFBUX/krr4Pk4f3i4wPxT3S4PuRFNpudDQYy5McHVk1Yf6+0KpESgh2gYqmHx
         IV8g==
X-Forwarded-Encrypted: i=1; AJvYcCX0685NyukFfr2c22nsnEeEazVARqKw4yVsdm7tqMJ188M8QGJoEYRxrerVQgS8oMQHirifhuMjOAzMGJh8k8uusEo1+kMAG4ovhcEEcsHb
X-Gm-Message-State: AOJu0YxrQtIK2mkVYSiIZrvtGy03fGbMAY/jiWjZHoks1QrGYiGQdFf+
	V+12anZ8GYneYMbeWeYe0uqcOb07x3BLhYIxzKQaZIS3NMj4pQvB9ucdvF+8bRM=
X-Google-Smtp-Source: AGHT+IE1Qtnzv6QuEZsAk4wcrJFACFpPoafoXnJKgjkFkkmeQNqjsjRbk2WzsTz2qTNdVa7sL4jlWA==
X-Received: by 2002:adf:9dd0:0:b0:33e:1ee0:6293 with SMTP id q16-20020adf9dd0000000b0033e1ee06293mr8143843wre.14.1709539912363;
        Mon, 04 Mar 2024 00:11:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id b7-20020a05600003c700b0033e44b23921sm117559wrg.24.2024.03.04.00.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 00:11:51 -0800 (PST)
Message-ID: <7c3c578a-d662-4485-ad15-47250ad0e935@linaro.org>
Date: Mon, 4 Mar 2024 09:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: add Canaan K230 boards compatible
 strings
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
 <tencent_D5188EA5B85A31AC21588DBD7C7482ACDA08@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <tencent_D5188EA5B85A31AC21588DBD7C7482ACDA08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_001154_214529_DAD2AEB0 
X-CRM114-Status: GOOD (  14.62  )
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

On 03/03/2024 14:26, Yangyu Chen wrote:
> Since K230 was released, K210 is no longer the only SoC in the Kendryte
> series, so remove the K210 string from the description. Also, add two
> boards based on k230 to compatible strings to allow them to be used in the
> dt.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  Documentation/devicetree/bindings/riscv/canaan.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
> index 41fd11f70a49..444758db964e 100644
> --- a/Documentation/devicetree/bindings/riscv/canaan.yaml
> +++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Damien Le Moal <dlemoal@kernel.org>
>  
>  description:
> -  Canaan Kendryte K210 SoC-based boards
> +  Canaan Kendryte SoC-based boards
>  
>  properties:
>    $nodename:
> @@ -42,6 +42,17 @@ properties:
>        - items:
>            - const: canaan,kendryte-k210
>  
> +      - items:
> +          - const: canaan,k230-usip-lp3-evb
> +          - const: canaan,kendryte-k230
> +
> +      - items:
> +          - const: canaan,canmv-k230

Why this is not part of previous entry in an enum?

> +          - const: canaan,kendryte-k230
> +
> +      - items:
> +          - const: canaan,kendryte-k230

Usually you cannot run SoCs alone. What does it represent (in real life)?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
