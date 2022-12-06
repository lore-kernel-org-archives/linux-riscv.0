Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737DFC3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVO0nLYEW0Q+9vcX809KOjYy1vRe5VOKPPfCuRDNOiw=; b=Q2EYAKXHbf6UMF
	GCibyf49DVdLG/LRBVXU+7Oskfd5YXpXjGcwLrIQ0vIz7+Ejx36Eha5FpTYvzksR44NWzHB45CyXH
	bVSeFUv3J8FuzgyLCQMfP4mQ7K6tQQGld0sZtDJhQQm0jXz4yDxFeeJrj9NJHPd+o3fAj/WTxr1iy
	YV2gS4QUhJQgH0yWxuM1wxMTOnSbno8d5Ufcz4vw4RRncHZwcLEOrfjjt8eOjofRWnc9gjGrp1J5H
	syw1OmdYeC7rauwPAgYgfZqgEG4zrzHxoKj7TgXbzyj5PwpNzVfCgsraY18OrEHH2mUjg+biJ2hDm
	rwSZKSgYVV317FNctIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2THD-004nZa-DQ; Tue, 06 Dec 2022 08:26:07 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2THA-004nUw-Pv
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 08:26:06 +0000
Received: by mail-lj1-x22d.google.com with SMTP id z4so16377766ljq.6
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 00:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkMxJjoW8X4kUNC+47c7765KzpRNV4xbB6ThuqIXaYA=;
        b=g7x6H4cWlQJYECi+8ttT+RfB1nYdfNW9EGfg3yL2ZSCKJzsrTlP9H+YuWwotc2pTyW
         shOdEKTrbkHbyrusr8EHbTlAkluPeftoC4Uzu44f7DI/6kwPn6sU1zafHnA24XvFX49O
         ClEDTzTODxK5PYAIErwbkN/pc0HIs+EIh02NhHO8XKNyMlmz5ZMxiC92dQ7Klpr38FcL
         HdnAg+WZZfFU4uki65XSz+HL4vc411PpfBLYLUHlGkWM+SYuONwyD0ggxZd6S3GdU4Aw
         Wc+MhpH4G9cxIG04n/C0Y9DVTrW4ydlDCrLLXFyEcJwHgpHrZxn/fQcEP7R39qY6M6fR
         0vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkMxJjoW8X4kUNC+47c7765KzpRNV4xbB6ThuqIXaYA=;
        b=UaEiUt3Nqr+vrHBBDbOyBjpd2qb8YQupPc7erdFsul4bp4AJx26VlIG5aW1R7ZqieG
         wpXmiAus+E6SlHb0SVkKEAtcyZ7hgIU6bvri7VR9fbtLM8p8q4x1IQEPfA84FJMNLQvZ
         a7mjNG9X3rjqouRKnmx524Cpg+Lsl58kiwX8IY/zu1CR4OLvTATP5lLSHNngX4qp4z7L
         +ppdmKhTLGRtYPslE0hCHe0DvOmuJjq+KI8hl6nTSniMhmGhg/GWvXjJYMSOqlLLX1nx
         pu02xgw0qucfcokoJCsGk4BhE0Te1ts9yRMXfJUWUcd09Ev8rG5rT8b9z9n2Hx3cUhhe
         ZiXA==
X-Gm-Message-State: ANoB5pnJitrrYjDQaNiV9PbRMUsrKNbesOFyj5jqhICnwLxyd3tB60nz
	jlQbii4s+pt0803C3A8CYPaKXg==
X-Google-Smtp-Source: AA0mqf5hJt4mcZkr+hduYVC1h4gFFiYEe5e/seICQH3DF+vHQDg04AGpXBwDBxE+G5FcRm2BXk2Vwg==
X-Received: by 2002:a2e:b8c3:0:b0:277:2e91:e9d6 with SMTP id s3-20020a2eb8c3000000b002772e91e9d6mr22193667ljp.372.1670315162821;
        Tue, 06 Dec 2022 00:26:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512214800b004b4823f02b0sm2411927lfr.152.2022.12.06.00.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 00:26:02 -0800 (PST)
Message-ID: <0a2056f9-0126-4dd7-55fa-930ce61e2e81@linaro.org>
Date: Tue, 6 Dec 2022 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
 driver
Content-Language: en-US
To: JiaJie Ho <jiajie.ho@starfivetech.com>, Rob Herring <robh@kernel.org>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
 <166981596611.1846501.537832446745968339.robh@kernel.org>
 <14a3facb1fe642cba0048f2f2d0eb2e9@EXMBX068.cuchost.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <14a3facb1fe642cba0048f2f2d0eb2e9@EXMBX068.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_002604_890155_7116C092 
X-CRM114-Status: GOOD (  16.39  )
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

On 06/12/2022 04:48, JiaJie Ho wrote:
> 
> 
>> -----Original Message-----
>> From: Rob Herring <robh@kernel.org>
>> Sent: Wednesday, November 30, 2022 9:48 PM
>> To: JiaJie Ho <jiajie.ho@starfivetech.com>
>> Cc: linux-crypto@vger.kernel.org; linux-riscv@lists.infradead.org; Rob
>> Herring <robh+dt@kernel.org>; Herbert Xu
>> <herbert@gondor.apana.org.au>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; David S . Miller <davem@davemloft.net>
>> Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
>> driver
>>
>>
>> On Wed, 30 Nov 2022 13:52:13 +0800, Jia Jie Ho wrote:
>>> Add documentation to describe Starfive crypto driver bindings.
>>>
>>> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
>>> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>>> ---
>>>  .../bindings/crypto/starfive-crypto.yaml      | 109 ++++++++++++++++++
>>>  1 file changed, 109 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m
>> dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/crypto/starfive-
>> crypto.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No
>> such file or directory
>>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
>>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[1]: *** [scripts/Makefile.lib:406:
>> Documentation/devicetree/bindings/crypto/starfive-crypto.example.dtb]
>> Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make: *** [Makefile:1492: dt_binding_check] Error 2
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-
>> bindings/patch/20221130055214.2416888-6-jiajie.ho@starfivetech.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
> 
> Hi Rob Herring,
> 
> The #include in example have dependencies on the following patches:
> https://patchwork.kernel.org/project/linux-riscv/cover/20221118010627.70576-1-hal.feng@starfivetech.com/
> https://patchwork.kernel.org/project/linux-riscv/cover/20221118011714.70877-1-hal.feng@starfivetech.com/
> I've noted them in the cover letter.
> How do I add them in this patch?

You cannot. Testing bot does not take dependencies, so it did not have
above clock IDs. This also should point your attention that if crypto
maintainers pick up this patch, they also won't have the clock IDs so
their tree will have such failure as well.

You can wait with your patch till dependency hits mainline or you can
just replace clock IDs with numbers and drop the header (and later you
can correct the example if needed... or leave it as is).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
