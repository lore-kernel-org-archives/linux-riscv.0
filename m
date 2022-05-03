Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B35C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jpRn0Tzhajs/5YjsuQu1bs6LA36e/TQ9ZKA9iUUo6U=; b=agDv5uAQAxcA+j
	2OkDGHbrYU0CQJ2A2d7IvhPoGX4hHbO9zrvlULeFYLhbiAHKoMdT5CDafHXAXuNQFr4AO7o2nsfKi
	dlesS9jim0B1lq8phlk4571tSR5JWLmzqhVT+6H6BA4HowitQ94Fz8Svur0PsU4yDh/33r69Atp1G
	mmYgKDnQEYT8yazQnqta9+OLmGFAqr4M1CLy0gPRy2bXAiN3UD2N9FCydqXZNgpr//Qr2wwMzXcGq
	xi7WpbHK+0aTy1lm0ZMBEovPsk1yUcPsl5CqcDakAJO/85QYm/LEwaxVNucpk1tFh8EZB0kEXNxqN
	dImLEk1CjxGz5NJTWF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluR8-006ULM-8n; Tue, 03 May 2022 15:27:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluR4-006UIu-T8
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 15:27:36 +0000
Received: by mail-ej1-x630.google.com with SMTP id j6so34115946ejc.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 May 2022 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=L6oXqkRjevAiSpdcYfwuhncdluuEc39LTg7cz7sxv44=;
 b=p6Wlte4YRrG+PPoS7TrcRAaMr0qDMD7PmWOJ0pJJPpeH1mP4X9eBUE4gCMjniy7uxz
 7TRw9XBlGC5WN3G9wMym34kIRrPfJZ1gH3lBd7GelJX8UMX+bgNxIhauP2vff+6gtV2u
 7Xr4SYvE3iqG/A5Oy3ggbYQH9eaWJmLTsi1qbXEvWcQ3Z4No9G8A41dBoGRJhMHeAIN3
 cuTZIrVB0uMy0tnY3GPAWjQzsu/k0GNhOds+pgjoOIbOwkYafWtLi4mxYKK2barRqIWD
 nq6XjcsOoELKrONoKu4SNeYzC4Uu4asvRpF+jiQWmRn1BysUbjyROfa8t4mm7JC3DE98
 2zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L6oXqkRjevAiSpdcYfwuhncdluuEc39LTg7cz7sxv44=;
 b=Ke25vV+C4Ixw7zCW1ELlFPGUekinx8HGWvulxa+0Yz6CRgTxUSjfk/o5q6Nda/pVYw
 KnDSmD610u/PNRLR9ACob3XV/Np+vlJH9azhVe2CTkRpIih/nlhDWlKXPjw9hTq3cfzS
 lhfCYikwiPxWOHJo+/K1brcSOcSf64S1yYPiNH+ezN93N8aGIXPe4dW8/kxcNV4fXRAX
 fSLHKSneGWfMhNEmDctz2LlRh18CEBVq/HMazCrt6l6GfmCiE41PO/CnLTOZjyy0iXNE
 qgniHmijzyugvCrfoXuTpxa2il3+cLPR9vGdSatUnfRwUkxAyA8qd0r93UJ+szGbrsJE
 GH5w==
X-Gm-Message-State: AOAM533OhlorTdxc5GRbi/m4zCov3nEEzTaQLmZygfHWcdghDtK69tdY
 2//gEs+0wRU0zwfvC61YX27UwA==
X-Google-Smtp-Source: ABdhPJxc19WIlaFr9ahic1DRLVpqXf8A75EvOm0t8s1BnTCQdBOeU9gDZlV2u/An2woqNeimRSjzZA==
X-Received: by 2002:a17:907:6e2a:b0:6f4:69bb:7ef6 with SMTP id
 sd42-20020a1709076e2a00b006f469bb7ef6mr7018280ejc.0.1651591652601; 
 Tue, 03 May 2022 08:27:32 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056402150c00b0042617ba638esm7963161edw.24.2022.05.03.08.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:27:31 -0700 (PDT)
Message-ID: <bcf0eb84-c749-c900-1be4-aa5ecb1a5a8e@linaro.org>
Date: Tue, 3 May 2022 17:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, krzk+dt@kernel.org, palmer@dabbelt.com,
 robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-5-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501192557.2631936-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_082735_016710_05D09971 
X-CRM114-Status: GOOD (  14.17  )
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

On 01/05/2022 21:25, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a compatible for the icicle kit's reference design. This represents
> the FPGA fabric's contents & is versioned to denote which release of the
> reference design it applies to.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..7a1f883a39b5 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -20,8 +20,10 @@ properties:
>      items:
>        - enum:
>            - microchip,mpfs-icicle-kit
> +          - microchip,mpfs-icicle-reference-rtlv2203
>        - const: microchip,mpfs
>  
> +

No need for this line break.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  additionalProperties: true
>  
>  ...


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
