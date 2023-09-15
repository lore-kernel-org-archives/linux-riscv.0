Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A0BEE642D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqRK8KHDBrQtqrZQPf4Ijyt1Oxvd2FKaNLE18lYZK30=; b=Oychz9g7Aubose
	zFoU4pDQjcmtDJALMmRkpHX6xtINBU43jdsKG8+vY2+CvUXTdYcRM2txtvy4JOLqWGChD8jQoyk1p
	ZEMvipTqkZ+2KGUwJGhQwLJfg80t1W93Tt9cfW3Iu83b4cgxozK6E4GUVrt4vdhvOHPDQXRo0e8XQ
	ejtE0+LQMngocU1fJKDshJJmUsaqV59wkw0zLznZGSERF9NZlPSyoFrcfHBKJCmAMuZ7EIrezZmJt
	Tbrn4U62EQC4woCYSTqEaHnUIwhOVbFbqTWiCnBTGO4Ivg5EkkSG8rNVuM5Ss0Ih/SA2I6jmZY4Ze
	XzLOGOTBmq92q18KseFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3L4-00A3js-30;
	Fri, 15 Sep 2023 07:34:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3L2-00A3iV-2J
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:34:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-404732a0700so15359565e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694763241; x=1695368041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkYzzAYu6z6sZUC/njWzLy4El1Pk9IRes3LMwHpGr1Y=;
        b=Tl5XOBE2Me+Yqv/vC5MYyuG6pdtFAfqxUtzzizl9pmBpv0X5l4dck8VJXLeq5UvuoW
         SrCfaGPqOV33WiQL2snbrqgADPrv+PIV7ADHwnj6lJNLLFlAD6JFqyAbfQ9UIUKpqQ60
         eGjSTxCrUAWF2yzcicL0Jts0MHwW5YkzO6tt7LRdW5IxsqJJcQgozzBDgXu41W3fnGdx
         OuEMtLP4bJQlyScukn1IgM411zrZ+kjHavCAsfaI3ddolfVjMkRwNRIU8m24Z7dtIRqZ
         /XhamND4+ZRIX7+h9GitcWf1stiIAY5r9npB+qxUyVsEmWxdpjtOLG8K0sMM/31+tjDB
         kKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763241; x=1695368041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gkYzzAYu6z6sZUC/njWzLy4El1Pk9IRes3LMwHpGr1Y=;
        b=ATI9CdSDhFwBWQjCobfIN9X6JKBf0onrtm7BLJ1fhtEX+auTxkgLeCWncBD7IR+5Gu
         SV/s5fr+qLiEm8+4caR2FU6FfXdVT0oevjor3h+F1bdzTRp7Z2roEywpYutDfLVdad2d
         E8mA1VxgvZopO1zBtsraj1BQousnVS/M2YZ7harXvbIxJBy1XdcUaUYhA855SJ1ihvzT
         msbZ7iYy2utDMqqVAdyvrHxAcUXpOk9Rc9mO2CnHFaeGMhuMhsu/FTw8bQzXmTT6uXoK
         BI+ZZXbbMrz/F5On02dux/TGSyZGapgLYA235ahZNenYtF8dAgf9HsrClhs5D2j97mbM
         214A==
X-Gm-Message-State: AOJu0YzUr66GnSZq5YiHpcaR4jrw44AeeWcl8aqU3spvSDfNhXukQLJV
	TYz6J4cIflKg/+DKGGR/B7u28A==
X-Google-Smtp-Source: AGHT+IE2Obhc55XP1QiiY3UGOyxumTBVdfX/RVmrGFpCslUPIRsfXHxMYvSILZfNBxFmySF3oWKyRg==
X-Received: by 2002:a05:600c:2194:b0:401:bf87:989c with SMTP id e20-20020a05600c219400b00401bf87989cmr775757wme.34.1694763241447;
        Fri, 15 Sep 2023 00:34:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003ff3b964a9asm6743292wmd.39.2023.09.15.00.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:34:01 -0700 (PDT)
Message-ID: <c4aa8d45-1248-5656-a045-a475ec737c0f@linaro.org>
Date: Fri, 15 Sep 2023 09:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 09/12] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2042 uarts
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20230915072517.118266-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072517.118266-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_003404_753319_6C8F4426 
X-CRM114-Status: GOOD (  12.41  )
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

On 15/09/2023 09:25, Wang Chen wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add compatible for the uarts on the Sophgo SG2042 RISC-V SoC.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Missing Sob.

> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 17c553123f96..6c23562f1b1e 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -48,6 +48,9 @@ properties:
>                - starfive,jh7100-hsuart
>                - starfive,jh7100-uart
>            - const: snps,dw-apb-uart
> +      - items:
> +          - const: sophgo,sg2042-uart

No, you do not get your own entry. Stuff it into previous enum.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
