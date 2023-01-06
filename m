Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C8EC4708D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CP4fRvaz7Bn5UTG0J5f1hAZ0vHfobNl9afjNaN2ciys=; b=WjoZynDRqe5O/G
	zN7ZskfsYAUc8EllwjHcj1sJ9Wk/CuEe6GVVwRl5EXBi5TbAs8kfQfqlpXcj1ciBAhuLy/iMJdlLW
	4FpUuA4JQCSQ+mdu8OTNS8ZSngOOxROUbYQAoBAsNakGvjQX/pnClnbeEVxirBFJsh+7UDL6UFrwZ
	f9YaoszWnv96jwGK88h4Bh84cRx3b08Xyv1FhV1cp4BSB1b2muvvnBVv5SeSMqqv/kuui+0gKEBMv
	3d4qlFZP1+ZhyNDoIQhWfN3rmCzWAYHJu/T6ZpCrofMtzoBtuxiwBiB17NRFbde7pBqP9FE8fCLqw
	1lZ+5K5oQOOpHPfyJSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlzh-0087oG-Gx; Fri, 06 Jan 2023 12:38:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlzf-0087lZ-DD
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 12:38:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so3455170wms.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 04:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJ7xr6hqaFunxstN9Frwa743d6EY0RYUMvbu/BvcENU=;
        b=k533u49JmlzI9E0GmLi1/SbA4DHKKnuJLwcWPrk5dQCS8t7rkz+MHy08ABQhin/X/6
         JgRoDBIY7EFHGJgc9dMEvwbhzTO0xbC3ALki8QJnhibyoI2nI9CwYpQcqCg9P/fjNqCs
         KOGaNGKYtv0TvGzekX+Rn0gYaHJa96u63r2TCFFwoG5i49iv8XvbV92w7kwe2FydP22z
         7kn9AMzHk5eFhxiflGGLIWTzivhLMwSi6yQQpqwWwpjbXoQKRkw2MZsgbtZZ9iOmr5Qb
         IH6h6ZmVnSg3H5JJ2/HvwbK0bBIk4wLbn/xXWxNANNI6X1Kc37/4U42ZwinHarOws8PY
         bAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ7xr6hqaFunxstN9Frwa743d6EY0RYUMvbu/BvcENU=;
        b=KdGlHVrGwMAKLljBdSPBMsQAF15BHoKVUChNPdnVyD5LWelfm4qj0NCShAIegbpyh6
         5qWMCReY/VRPVMqv7IYuMANxXl9VR4kzcPnDe+13jgd7JCibkXdYpyMtyY208T3tpRyN
         siAOk8RCv9WUBj4Mfkr4jCR1hlYpsM3Qe8CIvaLpVWWfBVpJ2h6OuRX+McV0ENV2lF7g
         1Rc1SjwlZu7jycYj2Awc4CKzaX/1rbps7pbrf26CcnGrRRHoOL/roCgLfAdPeFb/wB/p
         Q/CRXrqpt0Pd77AqDlM7KLky+/c4qq0sra7J3fjRWJI9p9cTyzVxohdEtoDCF1I4IEyO
         99YQ==
X-Gm-Message-State: AFqh2kowGA3zZa6M5p/68wDlBIIOltbnQ2j8YgwvUWpdF5wuN1Jor+Sf
	zLmfmdsoUEWxoUhiYMdAbGR4UQ==
X-Google-Smtp-Source: AMrXdXuDF8odo1Q4/ENstUcn7M+3KtSn24l85y5PF2Bz6Wp1IzYdkylooKFh18FcHa+t5fjNy1Ng1A==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id n18-20020a05600c501200b003d35a4a9103mr38570557wmr.31.1673008722161;
        Fri, 06 Jan 2023 04:38:42 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s2-20020adff802000000b00241bd7a7165sm1025445wrp.82.2023.01.06.04.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:38:41 -0800 (PST)
Message-ID: <80c9fac7-36fe-293e-62f0-945515b8f481@linaro.org>
Date: Fri, 6 Jan 2023 13:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
 <20230106030001.1952-3-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106030001.1952-3-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_043843_507089_074AC8A6 
X-CRM114-Status: GOOD (  12.49  )
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

On 06/01/2023 03:59, Yanhong Wang wrote:
> Some boards(such as StarFive VisionFive v2) require more than one value
> which defined by resets property, so the original definition can not
> meet the requirements. In order to adapt to different requirements,
> adjust the maxitems number definition.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 36 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e26c3e76ebb7..f7693e8c8d6d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -132,14 +132,6 @@ properties:
>          - pclk
>          - ptp_ref
>  
> -  resets:
> -    maxItems: 1
> -    description:
> -      MAC Reset signal.
> -
> -  reset-names:
> -    const: stmmaceth

Do not remove properties from top-level properties. Instead these should
have widest constraints which are further constrain in allOf:if:then.

Here you should list items with minItems: 1.

> -

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
