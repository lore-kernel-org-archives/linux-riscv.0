Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0695DC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INhjcn7VrTEsbXuasfE8nYP5++pcAiq2I5IR2mMPIFk=; b=CdEDQIC4Ho6g+R
	hdyT94/yLMlGUXyGlMDpJ2/kUsfnMK36atBup+HDqLnguc9mre+WU2J6F34tc76QOtoyxGWr+Vwmd
	3tyDDeutpWNOkKEuTusPcRUlNW4UYmMY2LcJfSpNUd9AV9It8emOHxusBLkE6eEcrg5lBnYUo4nvf
	yxHZy+/mDZ8FHW81ebHwc+rTsQ4eIfePjhgZGIu0cIjlbbV+pdNq7jbesqxqGnNWyWK40lYWmMhcJ
	vcQQv52pH9Ww3NjZSkwGuI/7+b+o5thlafKEv3YOwUIY6YzM9p3uVPPtG/j9VbLJcsbVhaJAUVR2w
	WBpZ7lc6A9LkAKi3Lbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDm5p-0089jd-Ps; Fri, 06 Jan 2023 12:45:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDm5m-0089hV-Nh
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 12:45:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so3455883wmb.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CcYfNDCdkNRPfZfJSmi+1aQkd/P/7ArECeWhjMr1V0=;
        b=b83V4olBWBynd3RZWkoGlDOyYAfO7STAnj82h8oM+CH/sf8n6Qqhvt9lN52tTGBwhz
         JjyltO2oIr2R+bKARi0UXQ0gY2t3nwimCCgFYN1RRrpmMJoUQV6Alcy7itwkiSNcAEvG
         TUQgZZQtSO3GsT2OasGzqdpL335+F9nuQ28HLRufut2k1Wu9FeuaT1JQwSMWnVjlk/4H
         0JP8sOxf/JQZPJfCHbwVGVz8JdiSrfcFvH7uE73KyWnHx9UU/GasmoFSCDSh0j2ug5Ox
         SZMnlaYOVsdBi8lNDdx+JcOiT0CHoVUZ6KytZ6JhJuhAmnDK8OwXqsCyB81Um6sDskWG
         mG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CcYfNDCdkNRPfZfJSmi+1aQkd/P/7ArECeWhjMr1V0=;
        b=4yHe6Ws0XmXWDU/bjAJf02E1hI9J9tFLvYYw0WJH2Fg5CnbQyhNZKSG4h6jzj63TuK
         e5MgLR3Ttb1JShG9NksciY+j/TIxLIUDUT3aiz9wvVEAkF9c3eHahkd1MjCXgdu+56HB
         v/YUf3LKX3cY9n9/YJLAlunPEwqFyxG/vmZVAMm3A+hZn1G3aSwDKdR+zq08/3HdBCdf
         O9ifQYufB799MPa8j56USWFAgjJso9RdynODE90l0kltiC0ex95xoPsu8rN3FprimMj4
         c3h2fxVVGFVpiW6WuDAcZ+CJxeP0z+nRGg8aMXFxWRZUlaZbmYQGiOU9xOCDE25dbPYM
         meSQ==
X-Gm-Message-State: AFqh2koStDranEM1Xz1KwXKiqAf9s70voS7uMYV/lA76BjZ3Wfw+Wlqg
	Xj4vwWcWH6MCEI9nGxr/S2hUog==
X-Google-Smtp-Source: AMrXdXs0Nw0FZGgzY+MbYpwEJPNEUUEFQs5u3nLUhhi811FU6DLWMstSY+bcsMkqkjrS4iaYBZzupQ==
X-Received: by 2002:a1c:2b04:0:b0:3d3:4f28:40c6 with SMTP id r4-20020a1c2b04000000b003d34f2840c6mr38207151wmr.1.1673009098662;
        Fri, 06 Jan 2023 04:44:58 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003d99fad7511sm1549137wml.22.2023.01.06.04.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:44:58 -0800 (PST)
Message-ID: <2328562d-59a2-f60e-b17b-6cf16392e01f@linaro.org>
Date: Fri, 6 Jan 2023 13:44:56 +0100
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
X-CRM114-CacheID: sfid-20230106_044502_831409_AAFCC4B4 
X-CRM114-Status: GOOD (  15.34  )
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
> -
>    power-domains:
>      maxItems: 1
>  
> @@ -463,6 +455,34 @@ allOf:
>              Enables the TSO feature otherwise it will be managed by
>              MAC HW capability register.
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-dwmac
> +

Looking at your next binding patch, this seems a bit clearer. First of
all, this patch on itself has little sense. It's not usable on its own,
because you need the next one.

Probably the snps,dwmac should be just split into common parts used by
devices. It makes code much less readable and unnecessary complicated to
support in one schema both devices and re-usability.

Otherwise I propose to make the resets/reset-names just like clocks are
made: define here wide constraints and update all other users of this
binding to explicitly restrict resets.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
