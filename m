Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5EC38147
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHLWUPb2viNnmmaxK4caTCl5YDBmxvEUHCFWO9Moxfk=; b=Pj1X4tJ5wbsygP
	HIIA2B0PcQzjYomNTDCecRCqBQSPS1gPFN//taGYJAVIKJX+if8rMYFxrJqBHlApZtnokSWR4EnUs
	kTctXOnZnZFgOMN0LL2eiPAYUTlxSOia31M0WnMm5TMJD3VewYJj0jkQ/B2bwCuowmHyol8eoqYql
	HDTJ9la1at+zxYrj/1ZyP9d1uRxHMpIZnPxmGqT8+tWzjmuEfNsmD453c4eMSls3EPImrE/EevVwH
	Od2gWhV+0AZ9Fqs1r8K8Fz8l8db+hNkn0OrwqzTn/oLIG1Cv7JHEL/elVl9jbjKoTQICYl4KY1gK3
	j5vqT2HYBmcV3BnDIYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAhp-001gIJ-8W; Wed, 18 Jan 2023 15:50:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAe3-001eHF-2n
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 15:46:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id q8so13201058wmo.5
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5JIxwYLdszz3QtNNn14zH3G7fOay6yeEWK2c2U4Apw=;
        b=GvKQjdx9H9NyRni27g+w3f02ZkRz/gMShcGghXCiF8mXUrmhI19CHpdiabajvKBHuI
         b8muNVsw9ZM/4lp5D2aRM1rLOPa2Ujs95U9Vzhub0VQaxOKKUATCn4wfKPq5SgfuxhIa
         wX1rHbMp2INsDs56pBjMWQvWPrWMty7+Cvxk5KlBtYwkFQKYwLNzWDwImxk8e5to0OVs
         YzWLZKxLPE1qREDcuf9Ql/DJ0F3RKa6+vgsTQ30HAB+yZoLAxPfTxOcaaskvTwkHEI0g
         Qlwb+ghaMZhsI3qQfJWtPVeQVBvH7DSDUzZfBR8k4pzaCkjJs1ypFcQONTK52w+vmse/
         DNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5JIxwYLdszz3QtNNn14zH3G7fOay6yeEWK2c2U4Apw=;
        b=PAvBBKET4cJ26z0PSd2T7FGVDCjYAgMxSnUPe19v8l1EHnwO5o4ZRCfIh9BIVeMtIe
         V2VDhF3DXCrG5FKJ7owe9jLmAqHwxUJ2MTUb7K0DBYW8bt147j3kaU1uWNILWng/YSHZ
         mXiKcc/QA3h2Ev3i4n4Pi+Z5tq+J4ujtiaMsgWjWmyxOmvtoOeh888OOPfBQQkaYYzvX
         XIKzHItIQnxHRXkUFm4Gmc2ny6pcAJbLiM+b37AT7g8jqQDMTn1v/iTQCBDgpjp/3XCz
         F9F5vwpnGKapOatFqwkPMjfiQd3Z2ltSVxbmPrty4wSniTWkywi/4w6DIVPqAEeWQMnm
         74Kw==
X-Gm-Message-State: AFqh2konT2gcxmwBoW2BkxmqrQwQAi7/HnwfrQjUf2i9qWXREQyVK7Jt
	OhVijG6hfxAHXJt0v9xxFAGqeVUG9cOtRRsG
X-Google-Smtp-Source: AMrXdXsi8lT14Wy6b9Ye83A/k0/x6hjIf5EUq5UIA/MVGjHWG+iux9sBuvphRRMwb25HsHdRFMabpg==
X-Received: by 2002:a05:600c:198a:b0:3d9:cb4c:af5a with SMTP id t10-20020a05600c198a00b003d9cb4caf5amr7424430wmq.33.1674056792976;
        Wed, 18 Jan 2023 07:46:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z12-20020adfd0cc000000b002bdff778d87sm8738509wrh.34.2023.01.18.07.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:46:31 -0800 (PST)
Message-ID: <d4314561-bdcd-5e93-d329-e755d5316476@linaro.org>
Date: Wed, 18 Jan 2023 16:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
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
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118061701.30047-3-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074635_240528_61C84880 
X-CRM114-Status: GOOD (  12.50  )
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

On 18/01/2023 07:16, Yanhong Wang wrote:
> Some boards(such as StarFive VisionFive v2) require more than one value
> which defined by resets property, so the original definition can not
> meet the requirements. In order to adapt to different requirements,
> adjust the maxitems number definition.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e26c3e76ebb7..baf2c5b9e92d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -133,12 +133,9 @@ properties:
>          - ptp_ref
>  
>    resets:
> -    maxItems: 1
> -    description:
> -      MAC Reset signal.
> -
> -  reset-names:
> -    const: stmmaceth
> +    minItems: 1
> +    maxItems: 3
> +    additionalItems: true

NAK, because I told you twice to drop this one. So this is third time -
drop this line...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
