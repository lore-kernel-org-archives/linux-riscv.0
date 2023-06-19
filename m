Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFF0EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vR8d1CEEubczFRwEWrVqv1uT5r12U8rTwD1ZmM1mkn0=; b=xIEGMrVMickxq3
	UZ77Klf/2nltkOojk74ehdVR36Nw30vu7DXuF2plKYtrS9PTMgWAWADADnc699j2uqyPObcJ25/9J
	g5dyL069Ls35jU1oMkMO5YFFgPq5CgUd6jKgYjxpnzJETnGEhdOmMyx1BD08ATELC7mdAO5lolArX
	1v9BORV3DE4IJXBjCJyADITWlRmgoIMSj4LqM5LZWRmKLxQvfNznlLJ/WMoty7f+cZxZ/Sgyci2UG
	WwZ5EJ+QJaMQKjeNnlr0YvskCLlu+Ckhxix3kjmqSDTOudzhzgzWOA5VFA5IPOsgqCt/Rrws2NYry
	n61DEESGuj8nL78g0hfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDpe-008Sec-1y;
	Mon, 19 Jun 2023 12:18:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDpb-008Se9-2d
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 12:18:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9829b12b80fso529483866b.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687177081; x=1689769081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3JGorfIUhRBEEat5SkdMS+cAsBErGeh9mcIh09Qj5Y=;
        b=ftxfXuW39arEC753qySrvJyMUiTqn6xXH5WaTT1BEErA00SpJLIGp9w1kBUhU5vEJv
         f6anxtOmKpET56EN48/cEnd0SwK+yj51n1MEtBCTPp7el9yUoItaJ6F/hFGj4gShuteI
         BaQ1LQa6nXrDN0P5PelotjCKHziaLP6gEuIS0sK3MPkvSK5q14sHaTbIdMqqeWK4KuUP
         Fc7Kk3JX16pEdBOl1xbceR7RizKgfzdt849uuItHQfnmyhTplWRPVWhgxectJ2aAwkrY
         NSApPi7LL9fZJGS3slUXFwI/emASv9VZqaYzA9/0RB6ZswwB0K2OAXTimSVDYDMgSXhI
         /C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687177081; x=1689769081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3JGorfIUhRBEEat5SkdMS+cAsBErGeh9mcIh09Qj5Y=;
        b=kwTy8YaAAv7PWgVzb6K+pRkOia2zPWXksoyHHcAKWzl79fZL8LD6R0U/w5VwNVpLFk
         syhIcDTbp/R4Rgm2790qIelKrH7ROBMLNY7TE/u8szsQXDlO4ZmqB2T54F+YyKV3H1hw
         yzBRJng7aEjFDUF8z6DH+r+LJrvpb1wgfUT4OrpqiWle14/NE+X+MA/ZoY9Honw1NfaH
         KDSla0UBvi/3+/LDIdchpL/VJRWOXogjld8wqdhZX5KXldX0Lu18wWz21ff4kSdiN6ga
         xnfO1pjBp2KIcO9WrOuerkBEKaOWh0rh2bNJqIKMoCPUcngO7497KxfVIf0T92/oSV3K
         njjw==
X-Gm-Message-State: AC+VfDx3hoDc6F/q66W0zJVc1BsO5i2ir0U+Don3ZTk0MiZJkqTxVpgP
	X6DbxVotRniFPIY/J0MPYqcOZg==
X-Google-Smtp-Source: ACHHUZ5dSNOSmu50TYQOnRntKgNAkfQOjYhYtzl3XEVqerIDIPhndh1rJ+XHu5SZ33ZICY6HRcEyeA==
X-Received: by 2002:a17:907:e8b:b0:988:9b29:5647 with SMTP id ho11-20020a1709070e8b00b009889b295647mr2506074ejc.77.1687177081353;
        Mon, 19 Jun 2023 05:18:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qw19-20020a170906fcb300b00988c3e96294sm1029432ejb.30.2023.06.19.05.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 05:18:00 -0700 (PDT)
Message-ID: <4937f9c4-a0e0-fd37-d71b-e7488b2a1062@linaro.org>
Date: Mon, 19 Jun 2023 14:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619083517.415597-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_051803_918230_80105CBB 
X-CRM114-Status: GOOD (  18.99  )
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

On 19/06/2023 10:35, William Qiu wrote:
> The QSPI controller needs three clock items to work properly on StarFive
> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
> platforms do not have this constraint.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/cdns,qspi-nor.yaml           | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> index b310069762dd..1b83cbb9a086 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -26,6 +26,15 @@ allOf:
>              const: starfive,jh7110-qspi
>      then:
>        properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: ahb
> +            - const: apb

You are duplicating top-level property. Define the items only in one
place. If this list is applicable to everything, then in top-level property.

> +
>          resets:
>            minItems: 2
>            maxItems: 3
> @@ -38,6 +47,9 @@ allOf:
>  
>      else:
>        properties:
> +        clocks:
> +          maxItems: 1

clock-names is missing. They must be in sync with clocks. What is the
first clock?

> +
>          resets:
>            maxItems: 2
>  
> @@ -70,7 +82,13 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    maxItems: 3


You did not test it before sending. minItems is missing.

> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: ahb
> +      - const: apb


>  
>    cdns,fifo-depth:
>      description:

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
