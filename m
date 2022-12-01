Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B8C47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3jrJEakjDCtjEvQ9o6KAN3xCq5qrU3oP1yZUP+T6JA=; b=a2XUajgLT2V5C9
	lL2VqRW1esL15NdQjQIEeWMGfY+YfcUnUkjCyUptYlzMWniu90Ln1woxjbMAj1W3HlRJeoOWHR2a+
	4OtLo9+Az0XZZAssIYqLSTLyqs1duCjyb62MWzBPg62kgl/CBPOoGgaSI+Pq3QVf2zJC2ZKuYJo1s
	2khxmCx8lTRTCcWNx1vuLYoBaoQVhotFM9UtHJdC0nWwCY9r+Uth/VxzZStVj9099NaieXrgBmxOD
	eHIxLthx5XoQTMCLan0N2H9EBKywQdI/u+rNNHfotaHmQyUyJN6QmDIGs9NuN5lJovsrrvPYXoUEe
	MYUBsNxt0rwc30EPUTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fqy-006Lto-T8; Thu, 01 Dec 2022 09:27:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fqw-006Lqf-Hh
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:27:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id g12so1587753lfh.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 01:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkZOQIDhzz/ZdyYHDjJhV18ycZ3HPCl9kL7HnUmPXkQ=;
        b=Le4uia54Oxpjs04IgYxInqhcUM1oreQs7cvQXaRwmX077/HQJuZEu3jMGfVNQpJgNE
         Onb/6iYKVkPVgX1O9QlqLwMSALb6UP2BLG4RJ0MpzoFBbTaXp16BFyI/xAzzTDJCO54u
         p8wG0PhdHHVsNDZsKJMP4JghIrx4VBq30/bfQvOELY2/Uqy1uNBJlLasLcC5vADjF3LK
         0WjBC9tgxvhMIvOB3h4wirI458DoFsPvk3YSTsjlWHYIAZgUUg+/yCyAFAwNNpQY5GNA
         YA8K9uUiyI0uNihy8NPgPKdrB5jYqZuOmIM24eZXwb1ZZW38aODbHowKkt+w2wFAzz6B
         BHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkZOQIDhzz/ZdyYHDjJhV18ycZ3HPCl9kL7HnUmPXkQ=;
        b=oiISnWyQ9PieGXIsx/hoEDsM3cAen71qMKd/sHGDx1+i8e5mAdsUG5GS1ha4PSSiny
         i7SpOs9QPCTSvGCELr9Wbyq3rjC3ZlaMpKLJjGsiTfgLR4vBoJ6z1E1+bAo54ApbVkpD
         EODQddNjKHc+R/sAY+5dpoYEQL1yrrUU2rj3AzRWODD7C2MTYNiv5PDOJKK+wfQWIXHM
         d02gpKmxZ5hXPTN4hxXFcj9ZS8F39+NmTk40t8Z0P+srF61LfY+ZMytdreSyZWOPhHks
         u39pEITqduPeOLo7iCshc9p50rVuCRKcCU9A7InK66MOz+iAdRkUAoEkp2HKWkp9ZLU6
         mBUQ==
X-Gm-Message-State: ANoB5plg4q7BOlr4SH3w2p1Y6Bz/sFCRDjb6p8zBLflXNvvuA52ZsG8F
	xQkHvCbSBu5KJbaWTw6ce/HGcg==
X-Google-Smtp-Source: AA0mqf77KMFzjUsPmsFTBJD399USjthemEkZFhPHTyRnqjwDfIM4he7MzkqgIlD6tJlChwLNCC/jKQ==
X-Received: by 2002:a19:6b1a:0:b0:4b4:3313:feaf with SMTP id d26-20020a196b1a000000b004b43313feafmr21542327lfa.365.1669886849819;
        Thu, 01 Dec 2022 01:27:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a25-20020a056512201900b004b4e9580b1asm589093lfb.66.2022.12.01.01.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 01:27:28 -0800 (PST)
Message-ID: <2886dd64-435d-1cdb-168d-5851c37dc538@linaro.org>
Date: Thu, 1 Dec 2022 10:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
 driver
Content-Language: en-US
To: JiaJie Ho <jiajie.ho@starfivetech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
 <8a8f502e-e0ed-d638-0b56-74edcbca2134@linaro.org>
 <aa388c8c99b74436ad556aeb47a5c60a@EXMBX068.cuchost.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aa388c8c99b74436ad556aeb47a5c60a@EXMBX068.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_012734_673205_F7B1D12C 
X-CRM114-Status: UNSURE (   9.47  )
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

On 01/12/2022 10:01, JiaJie Ho wrote:

>>> +
>>> +  enable-side-channel-mitigation:
>>> +    description: Enable side-channel-mitigation feature for AES module.
>>> +        Enabling this feature will affect the speed performance of
>>> +        crypto engine.
>>> +    type: boolean
>>
>> Why exactly this is a hardware (DT) property, not runtime?
>>
> 
> This is a hardware setting provided in StarFive crypto engine only.
> The crypto API doesn't control this setting during runtime and leaving this always on will impact speed performance.
> So, I added this property to allow user to control this in dtb.

Devicetree should not describe policies, so without justification it
does not look like hardware property. Drop.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
