Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E3C63705
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hy90G9Uw6ATPgKonVC9+N0Gn/8vSYPZNHdgH0BElsD8=; b=uTdh/CRXoDgv48
	m0WXC6B6//7+oBGltOFYixoJjFbMS4JMUlu5e1M3K0XL2YArNjE/kwreyXBq5KdQOfgyfwDBZGnCq
	eQ8+5/aPNJaxcBjjTWN7LjwWCSYuZJqQx2ZaWZaiOTcdPjcLsM5m5ENUGF2gXebAaZAZkqqLzXCY8
	fZcyJ1JaF3g+SaQi9NRsIt4TVF0SzIZhX4nioqsWAnKKhfosZVkghZHQPN6eQYzEEFaWHtXMiCvPU
	qFY6t56OWSvvNdyBGyYHulCSa5t71aX3CfLYi6gbYAWt4LSwuCjYHYQ2AmaWeom+S9YngJFVFpbOO
	sB5tQyVPUisUXIYvY6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Coo-00AYY4-6V; Thu, 08 Dec 2022 09:03:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cme-00AWS4-2Y
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:01:38 +0000
Received: by mail-lf1-x135.google.com with SMTP id x28so1044120lfn.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 01:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oupZ+kN7BsmQiiMOTzuSss+gc5CnRM8obTkN6ZAEyQ0=;
        b=PH5NstiDSUw9FjLTglzjiCMRNWEfR/Ko199Og1ANGhVysFgUBMD2jQ/p99HQ7F6jsq
         8RGfl9JBzqxJtHbEDJbQ9pCzBpEducsP8v9+4wzUxBdeFXCl1z4xXDXKbU+RA6hOxx7I
         6jMhHTgD91b3aSSaXEHrdovZZic5prvhy8bIvKipf3n4gLGEG/F5YDUFlF7z5J7hkMgo
         OLJs+TW2thjTm4F1HieLXWKJJ/V6+2QmcW0QyvdFY8m1aBd6mlAk55nQt/KBbzymCckG
         dtWYbvW0Sk7GlcDvSZNGxr3ltJj0S5GadjItC/u2mVMedd7546hIF7mWoiaij7p5+w8U
         x64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oupZ+kN7BsmQiiMOTzuSss+gc5CnRM8obTkN6ZAEyQ0=;
        b=mqJKqoKxLZx53CMPySfXEfNvF5eftKLQLf7/HR03qg/BpRnqmpu62nRm9NlI1/iMwc
         IqCQchLybaEdCoqeSLR3BfmfFlYoHBDhy5QSYilC9F/lgM1Rigu3RxwzOqxeIlCz351h
         BI2rjTL15Mkc+T075hCK1GXd2m/MJV9SA4oHlBsOyuomDoffV9KWoGmue3cDbrVbhAgj
         LFJ8ADmGNNySQbihUTHTSBW79+qib+2lJ9t2DjXxWMM5/FGWpdGlU2Oe2b4cjrALKmKo
         EeK7Ys3J5zcl8r89T8BinRnoEH+vz34vdtPRIJZ9zBRU+b4YSS27zDI+aQrws6arIiP5
         k/pA==
X-Gm-Message-State: ANoB5pnRx8e9pcnTpbrRg+S3PXXiW1dr/GseONUUvv7KT+ibfBunIUuI
	qhe0e27J78r3zctakWyTR0nK7w==
X-Google-Smtp-Source: AA0mqf6Eagz9JgMi7kX/o8j2qajknHJ6NB91uNWrWH/4O1j4aIvU5N4Qo529XhOn4AFPQskDqCwoHg==
X-Received: by 2002:a05:6512:3b88:b0:4a3:9533:f4c9 with SMTP id g8-20020a0565123b8800b004a39533f4c9mr27019503lfv.615.1670490092121;
        Thu, 08 Dec 2022 01:01:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o11-20020ac25e2b000000b004b55c1b5c66sm2196831lfg.157.2022.12.08.01.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:01:31 -0800 (PST)
Message-ID: <d9e92880-6efe-a528-efa8-2c49483d8530@linaro.org>
Date: Thu, 8 Dec 2022 10:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-2-william.qiu@starfivetech.com>
 <d7ecbbbf-5d6b-3254-b645-dbea369447ae@linaro.org>
 <b0dfc269-e06e-4f4d-7695-55c8522d6137@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b0dfc269-e06e-4f4d-7695-55c8522d6137@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010136_208327_C7C2437D 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

On 08/12/2022 09:44, William Qiu wrote:
> 
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: biu
>>> +      - const: ciu
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  starfive,sys-syscon:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description:
>>> +      The desired number of times that the host execute tuning when needed.
>>
>> That's not matching the property name. Missing number of items... this
>> is anyway confusing. Why number of tuning tries is a property of DT?
>>
> 
> Will update the description.

I propose first to explain what is it. Because it is not about
description only, but also type. Your driver uses this as syscon, so
this cannot be uint32-array but phandle-array...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
