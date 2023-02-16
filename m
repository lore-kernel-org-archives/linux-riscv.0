Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87B9C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDaBf/Y5hAqlBTZUxcczcCeq4iG/zBZ4A8eCTYJrdLo=; b=T6O2ww5QxbWn1B
	ociur7zNbljxiOwVeKGyzXS7rWOoRnQvLWVoA8daZgb9t3E6usmxWsCs/FMs5Z/o2BMRIl+XxzHV3
	vVx8xrYLiIYXgtqFDLQQiAXuTUYq9bT84a0U9USFBEWaGMd2TKpIkPut8Gz3E4f5Mf6rVTOODUAhc
	LJTKyELUWzcbOhkJ+oUiI4TwvPf0Dvo4sQ1lLkcTNeszDzgJDuhHqU+JvSCo6dIijImf/P0ejtQiI
	UKIsXgsZMRLdMdqi36AWD9QrSS143V53dNwCXGUzcTt0HpcVCES6h+HTAKeQDb78NIDRhK+qsgK4k
	ANySaUM7hkBZbtXfhQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbQG-009XLI-El; Thu, 16 Feb 2023 10:23:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbQA-009XIH-JG
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:23:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id my5so3968467ejc.7
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 02:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQPmFYlzbC7KvPA9vOp38pjRFiHeLAnLDwoDfy/DHCQ=;
        b=G+3SK83ZR+HwM9/pu4pN5BF9nCzAAVMNouC4FBsdvrBx/CahgW9lfHK94lhACaEZ5Q
         tqC7+DWQZXXgTWKiSH9amNNGRs45HJ3yC983P8DQwUARHzT8F269RqvWGGybRLke1vEC
         VFVjsLaY7Hjxia/B5LHgftlTN5STrzqIwP52AGpNfCyLhMuE+TFqdFTEkBVuqpwAZuE+
         qP8CiWZOxCsfjVsoNGHIUslW8B/ozITvXANUiKYg9arfgeOqzNuMQOEwEigN7uxBLkJ/
         NaPsqvFRc8FtQP75N00Uw1mDjGiz9irCKX17djHPjqy8Jp8CXJZgyXADQ/lUkQ3bX33X
         VoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQPmFYlzbC7KvPA9vOp38pjRFiHeLAnLDwoDfy/DHCQ=;
        b=nwoZs/LEh0Bkm4Dwbekmm20X9v1sBdAFTWFICqZWusyfqBwAlYseUScRU3vcjUl5tH
         Dr/DXa+WN0Fy+qsjHHMBFNZehsP1oArU8hlQKklBVRd+4qVGFWuSGF9HG6UvqxIkLdaa
         uvOcr6LEKIOmNPUNCLrE1sxrjPfJ0RgHvGF/PZTEplxDRPwQRK4Fa8lI1xoKbAdw6wbc
         0LhZNZq+AE2noPtMoVUA8v4PVGOugWr5L4b8SBVf6iVxFQouFsj4d5gtFgzAncuX9SCw
         FTy4Jq80egLFHhI3EDkxxTtF9WZKkM1CLss57NLCAI/GbbCKWPk+CNVNDio26nxrboJN
         VMVA==
X-Gm-Message-State: AO0yUKXh6QEqVJkWR8IUcAVYx6MNionyOaDmRjYHC0F//0v2EZB7p6JZ
	UfsrImZ3t6zdbtj8frAjK62tgg==
X-Google-Smtp-Source: AK7set8RV32dZOV4847Uqa2HdLcRmRKN2CKjNW0l1ybJNPeIB6ipclW+lCXzwJkdnZR3ULc1QG2mWg==
X-Received: by 2002:a17:907:78c1:b0:8b1:32dd:3b0 with SMTP id kv1-20020a17090778c100b008b132dd03b0mr5426062ejc.57.1676543001076;
        Thu, 16 Feb 2023 02:23:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709063b4f00b008878909859bsm617630ejf.152.2023.02.16.02.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:23:06 -0800 (PST)
Message-ID: <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
Date: Thu, 16 Feb 2023 11:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230215113249.47727-5-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_022322_694554_9EE95520 
X-CRM114-Status: GOOD (  10.08  )
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

On 15/02/2023 12:32, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-stg-syscon
> +          - starfive,jh7110-sys-syscon
> +          - starfive,jh7110-aon-syscon

Maybe keep them ordered alphabetically?

> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;
> +    };

Keep only one example. All others are the same.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
