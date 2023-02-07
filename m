Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F4BC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzvh4D6yrVZFjfCDXVCOugP4C6rxU4fPjfDk6SSyuBs=; b=0f30DgE7IGN7Ye
	422wDMr2uGs8Q2VJ+ay/ICw9wYqUJEP/ypPtEMpuW2BAPXWQ9gwxf0opttYp/ZRtAqZhr9rDfJTfH
	YftjQkOttlFDBHkDWNBK1uOarXKJC4opOXO37KvoIIbAXTyhuZAyNHyeSBdO0TORM42OW1u+KnKZz
	fw1XRE88Xe4c6LscofJTqGud0cQMC7uDtafg0i1x6dUtU+5fmyHs/PxffMAWPTOeIRc7poFn+fpfr
	A5fgLbqnGfWwxrRyVr87uv4N2DxOZHfJiyzonidORWkB0etzH53RaE61H0J+7975mOf4bfGGgoWTC
	zwlxopx581c9iz9fl43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIsp-00BDeB-7F; Tue, 07 Feb 2023 07:59:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIsk-00BDbd-O7
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 07:59:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so9253545wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 23:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7VB0jzwnOxKfmTOOzDR17bwgY03oYhE2KBFynIQKYk=;
        b=jAx6zmTdhp+G9FV94pkDTLjS8skfz6TZbOO0uBKFi+LDNSNV8QtcIY+RtU83JITlZT
         vcpbwxilx8Ir4QSMnsWmyKjFTIAgewWI2Ad/rWk4jESbPk6xKQKo6c7OtBNSJmfSsGAZ
         v2JvS/tM1IouLaI0ZaXwAFIbIkK3Ul6zwLJiIiFrbeIJ/SKwbV0E2u//69bmC+O6vflC
         fk4g96py9Fs7kRxnoozdgQCJgg1X1ALSurzAEzHbVgsy/WrxtbrO2YOdSoRhVjVR9Dqi
         1MioNeydHl0K90eHgsYjp1gbMO7PDE2wfGWMiEUFjgjUz3/+Cqy6p9J7/HdaUfyVo0Jc
         e6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7VB0jzwnOxKfmTOOzDR17bwgY03oYhE2KBFynIQKYk=;
        b=puGm3ppGCzq1llg+M+JAldRum+RNa1BXHVOJz7ZLT+coRgq39IamTnyeFFtpTYqhTB
         /EfOrMkb7Nk5QapQ8krv3OTMrSPHSACRuIs6iSHrWoAIlNFHXhcPKLLga3TnSk1Ripcj
         URWCxMV+pYOY6Cx8GpzQSlPSttB0oRs7YncZYe2zGcWWtr5k6VYI1vM3q0pJIp++XA/J
         6xYhdP7Cg3ux38C0eCNc46EY0j0j8Q7WrYveFu5kC3pkJbPUSwILIEJ+qAB2BGniVYYG
         1Cngoj8vzHaYJFm519qKFto281Mlj5vpYqkC7iw1q7EZ9/bm221ZBtT6mxsibfKWzY2E
         mswg==
X-Gm-Message-State: AO0yUKV7/3UGPCkPTk8ZAbUSL9r/Oh+AIk1HlZ4tdTq2CQZrHlX/f5Gy
	LLAmXh6lK6019H2aOBUAklwt7w==
X-Google-Smtp-Source: AK7set+izeJf1L9+viuy6hL3eXG0OPxOYCFMp/qcAnZZhl4TTkIhcl0lIgta0AjT+ch0CYmfrPlIhA==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:5b48:ee5 with SMTP id b26-20020a05600c4a9a00b003dc5b480ee5mr2266222wmp.2.1675756751053;
        Mon, 06 Feb 2023 23:59:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b003c6bbe910fdsm19929143wms.9.2023.02.06.23.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 23:59:10 -0800 (PST)
Message-ID: <aa85caa3-6051-46ab-d927-8c552d5a718d@linaro.org>
Date: Tue, 7 Feb 2023 08:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
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
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
 <15a87640-d8c7-d7aa-bdfb-608fa2e497cb@linaro.org>
 <c9ab22b5-3ffb-d034-b8b8-b056b82a96ce@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c9ab22b5-3ffb-d034-b8b8-b056b82a96ce@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_235914_835704_15AAC036 
X-CRM114-Status: GOOD (  11.99  )
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

On 07/02/2023 03:43, yanhong wang wrote:
> 
> 
> On 2023/1/18 23:47, Krzysztof Kozlowski wrote:
>> On 18/01/2023 07:16, Yanhong Wang wrote:
>>> Some boards(such as StarFive VisionFive v2) require more than one value
>>> which defined by resets property, so the original definition can not
>>> meet the requirements. In order to adapt to different requirements,
>>> adjust the maxitems number definition.
>>>
>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>> ---
>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index e26c3e76ebb7..baf2c5b9e92d 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -133,12 +133,9 @@ properties:
>>>          - ptp_ref
>>>  
>>>    resets:
>>> -    maxItems: 1
>>
>> Also, this does not make sense on its own and messes constraints for all
>> other users. So another no for entire patch.
>>
> 
> Thanks. Change the properties of 'resets' and reset-names like this:
> 
>   resets:
>     minItems: 1
>     maxItems: 2
> 
>   reset-names:
>     minItems: 1
>     maxItems: 2
> 
> Is it right?  Do you have any other better suggestions?

Isn't this allowing two reset items for every variant of snps,dwmac?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
