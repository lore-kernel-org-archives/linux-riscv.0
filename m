Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CC7C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjbTPgGJVvJbTzdjgtf6MDtYbuhbNAc6DJNJAtkqx+Y=; b=PLNrp2y0zcQGYq
	cOxUXPR2RpK+rIPkkhoe3YSTDIaGasXlYQcD9HBav8dARGQlTABg7wYt0PVpRaAd04Rv/FPF6WCCi
	8TqTMrBNkgCZg/jMSlpKjQKyb1r42TUkzm1I5b5THM8xjve0bbLXNvG9zxUrq2RzScOdPJGH4Ifi/
	ziuDpAUOtpmk3qiVCoy6X5uKPkiT55r+kG698vHcHHSfIe/PMc1lXu7UObf8XTK3tCVZO6pmV3uVO
	YY6TwRbCqSW9onxlgbXIHsLEnpXF0Zhp/7/pjw/0fggm+LkePHt4BDIpEYqwVVpMelPoGkgyEmy7D
	eQszjW+fqz344VPliwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhZE-00DMRI-Fw; Tue, 17 Jan 2023 08:43:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhZB-00DMQO-ND
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 08:43:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h16so29766920wrz.12
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jan 2023 00:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWm/D5U36CBBZnisDCQc8jy48M3+XXeWpLI/3U6tBZA=;
        b=TupwNN700Dfm2HUutSMwjPlmPKv1qxM6rYQyMm0mpHkjqxUP6/0EINC3oD3RQ0ssr9
         ZzPtSYa/mGq4cHtJcahITvOZmStCZdZWU1jfRSTQRltvQy18nreIqtAjQBDUJ5qUqWPj
         Vmigbtmqu/qh3Crc2SEdV8EfGgnlOdVOyKxP8c2Fl4gjbBFiArELiXSHSbu9YA15LyiR
         YFwyzD8iLVSiyiiQ62RpEg3nb5p1ifgQxrmUkaEAewQmadv8mXnL7W9/QY9FGQsohvEg
         WVZAiCvLCyWsyG2KrU8FpyT04KS1EJ5k+p4CSGwyZJbNMrSOVPp4L6n3+x6r1ynkMaFR
         vzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWm/D5U36CBBZnisDCQc8jy48M3+XXeWpLI/3U6tBZA=;
        b=SSZAp3F4r2BSrSAQK8nZE34gH9Rw/0R5J9TXVicC36VnDx7aHNXCM7s6XN8XruEtvf
         qOXvxgXtgdZmKjQV616ZI44s4h6AuC/RYHRuLQd0yAxKhd446xuo9DQ234VTcgWYKkjR
         U9jAAyiDCCxYN/lyzLfaud2/mLpstzPqJzOsrHNlyQumsx0HWNB7eQR2bmgeyZgJGfcd
         +Qnm/5BxjIMIjI+sTFXtNuDnc39CJuMoCwi49asniWa1J9pgF85i9m1NIKayzBNxfAmR
         jQnNskgTOj1/JLZslMD+So2Of2ixLFo1JqDVFiEQ3Jt32/SX6oh2mSh6iE9SejT8QGLP
         Px/Q==
X-Gm-Message-State: AFqh2koQvXFoF5Az4+EYY4Sm2EGK9mY/Wpo1IPAzFBd//K2fYC/AfJpD
	G8Qb69khpLvriwglW8jyuSqEwQ==
X-Google-Smtp-Source: AMrXdXtxE8deHQ9xEqdyikgOrukHsDlEQ6sxKfSMn8K6gVKnLxFmtiGijYttJ+TeIIPxhisAU9lAVw==
X-Received: by 2002:adf:e195:0:b0:2bd:d26c:ccc4 with SMTP id az21-20020adfe195000000b002bdd26cccc4mr2366095wrb.42.1673945015641;
        Tue, 17 Jan 2023 00:43:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bu3-20020a056000078300b002bbe7efd88csm23519456wrb.41.2023.01.17.00.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 00:43:35 -0800 (PST)
Message-ID: <17f910a8-186f-48a3-8817-6a2fa4fe06ec@linaro.org>
Date: Tue, 17 Jan 2023 09:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
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
 <2328562d-59a2-f60e-b17b-6cf16392e01f@linaro.org>
 <84e783a6-0aea-a6ba-13a0-fb29c66cc81a@starfivetech.com>
 <8ee5f6ef-80cb-2e0f-6681-598ccc697291@linaro.org>
 <bb1f3c71-e1a7-cd2d-b728-6e9027dae150@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bb1f3c71-e1a7-cd2d-b728-6e9027dae150@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_004337_791770_E550915E 
X-CRM114-Status: GOOD (  10.96  )
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

On 17/01/2023 09:14, yanhong wang wrote:
>>> Thanks, refer to the definition of clocks. If it is defined as follows, is it OK?
>>>
>>> properties:
>>>   resets:
>>>     minItems: 1
>>>     maxItems: 3
>>>     additionalItems: true
>>
>> Drop
>>
>>>     items:
>>>       - description: MAC Reset signal.
>>
>> Drop both
>>
>>>
>>>   reset-names:
>>>     minItems: 1
>>>     maxItems: 3
>>>     additionalItems: true
>>
>> Drop
>>
>>>     contains:
>>>       enum:
>>>         - stmmaceth
>>
>> Drop all
>>
>>>
>>>
>>> allOf:
>>>   - if:
>>>       properties:
>>>         compatible:
>>>           contains:
>>>             const: starfive,jh7110-dwmac
>>>     then:
>>>       properties:
>>>         resets:
>>>           minItems: 2
>>>           maxItems: 2
>>>         reset-names:
>>>           items:
>>>             - const: stmmaceth
>>>             - const: ahb
>>>       required:
>>>         - resets
>>>         - reset-names  
>>>     else:
>>>       properties:
>>>         resets:
>>>           maxItems: 1
>>>           description:
>>>             MAC Reset signal.
>>>
>>>         reset-names:
>>>           const: stmmaceth
>>>
>>> Do you have any other better suggestions?
>>
>> More or less like this but the allOf should not be in snps,dwmac schema
>> but in individual schemas. The snps,dwmac is growing unmaintainable...
>>
> 
> Thanks, it is defined as follows, is it right?
> 
> properties:
>   resets:
>     minItems: 1
>     maxItems: 3
>     additionalItems: true
> 

Read my comments above. Drop.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
