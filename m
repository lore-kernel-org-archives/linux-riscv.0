Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8EECDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmRJC86yPBm6WEMjTsqTG7gtD/Ma4tu54YdXTp90wwk=; b=oxez26R2abxQXw
	X5FXYb+Q1jRv1Bz39Dvw7B7xBit42MjgsbtyDmJMyM8Qef9zWegTVo69lsLHs/EGbYviaMAMmZR+Y
	T2NZlFruydObx/OytbZDu1JWuVC4G4fQLNkUWd+Dt2JhDAZGgTxqsznFBIEXiNENZXf8SngINsIDy
	xNM2ThXIYZ28pL4gBOF8e2X7VE37Uy+8PyJdxg9yNfplKMCMxrNgaqtwxGtUV/oO+SO+VOE5F2LLq
	1Hn26lAqWZDOH00/HOssuS4/S+RCKtVheTN1cJUh4TzDJhOiUlV/ngVEDkiXcClnllsK0HL0UmRU+
	C+l9t3YguE8NzxESFa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qttrM-002p5N-0D;
	Fri, 20 Oct 2023 18:04:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qttrI-002p4g-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 18:04:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-317c3ac7339so853012f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697825065; x=1698429865; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrYybwUMXMQDct16/KSDb1AL83UYfzbsLKEmVGzNrmk=;
        b=Maikb3qR+QTSGknq4F88WH6ZUdnxfLP/Hi6qxVqrK+619er/aOQZaJXD2iGdw/DXlV
         r6+4QkXrW0o2yHY8Ih8JMqssQgdnKN/nMLZnhQ5sRhHaa3XxPsnHPbZXz9X+xWZrFkk7
         KUCYO364pclY6CV3pl7cbmjv/s0OUkjTSD42mSKHErM+hfc97tj5bMuDX4Ay3kkz9E1W
         qvSw2o4mq0rz5gGr3f0vzUZpKXSk+upqBsywGDVKf+uOPheH9/UUQcBTBqo383wmWQ+I
         lECDNGBYp1IjXJ0D3uK83WCipWyNAuL3Ehoipig5TZbcgzcM+AT5DWwNDsZtsL2b2q7V
         5b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697825065; x=1698429865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrYybwUMXMQDct16/KSDb1AL83UYfzbsLKEmVGzNrmk=;
        b=RKrGV8QttozAmRIr+DqkXoqlVgKZHojgm4V9Mh7yi3/gQs5zzwMKFuFjgXquKbeetV
         XOphhdJPST0F1tJ7UwC/Sq1IkJPyIn6C6dJkULK7j1F3Skc0/e21O6MARqGTqKCoAjXB
         nkyksnQDngnYBKzwp02G8GQrcrmskJIfo6i5rsc7HkjK2xcrC1mC4vzpOlfujit7qVlL
         F0WqDdHng1c1/SJKdxqYF5OPyffBfcGwaShyvpM9TG9jGsCcnuj3qbCvd8iScCR+cXtB
         JB10Q6kTT46ATNbWfSpDxI+RduM843b+NXj/ezyn4sm2metxCiidc7IVAFsbPgbUv6Dx
         4oFQ==
X-Gm-Message-State: AOJu0Yw5bhj1IWALDcLMOMYcFV3bTtMUr34nJPgeQlTesr2TpsX5+t4t
	kRZh+0sG4Gorp0ZNIBokteU0KQ==
X-Google-Smtp-Source: AGHT+IGAQcB/OoprNSPgK5yZLGsiVkKqJvmE66/NqlSJUrxMppe2XNIXq95JTC4Fb2lqnycn9cH6tw==
X-Received: by 2002:adf:e5c8:0:b0:32d:6891:f819 with SMTP id a8-20020adfe5c8000000b0032d6891f819mr2224887wrn.41.1697825064975;
        Fri, 20 Oct 2023 11:04:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b0032da6f17ffdsm2162312wrx.38.2023.10.20.11.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 11:04:24 -0700 (PDT)
Message-ID: <b0247572-607d-48e9-92ef-a3e0a8fe17f9@linaro.org>
Date: Fri, 20 Oct 2023 20:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: pwm: Add OpenCores PWM module
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Hal Feng <hal.feng@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-2-william.qiu@starfivetech.com>
 <20231020-barley-rosy-92c3688cd515@spud>
 <20231020-giddy-fidgety-f070ef121ff2@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231020-giddy-fidgety-f070ef121ff2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_110428_840243_E71FCB91 
X-CRM114-Status: GOOD (  14.79  )
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

On 20/10/2023 16:22, Conor Dooley wrote:
> On Fri, Oct 20, 2023 at 03:21:15PM +0100, Conor Dooley wrote:
>> Krzysztof, William,
>>
>> On Fri, Oct 20, 2023 at 06:37:38PM +0800, William Qiu wrote:
>>> Add documentation to describe OpenCores Pulse Width Modulation
>>> controller driver.
>>>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  .../bindings/pwm/opencores,pwm-ocores.yaml    | 53 +++++++++++++++++++
>>>  1 file changed, 53 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
>>> new file mode 100644
>>> index 000000000000..0f6a3434f155
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
>>> @@ -0,0 +1,53 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/pwm/opencores,pwm-ocores.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: OpenCores PWM controller
>>> +
>>> +maintainers:
>>> +  - William Qiu <william.qiu@starfivetech.com>
>>> +
>>> +description:
>>> +  OpenCores PTC ip core contains a PWM controller. When operating in PWM mode, the PTC core
>>> +  generates binary signal with user-programmable low and high periods. All PTC counters and
>>> +  registers are 32-bit.
>>> +
>>> +allOf:
>>> +  - $ref: pwm.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - opencores,pwm-ocores
>>
>> What does the extra "ocores" suffix add, when it just repeats the vendor
>> prefix?
>>
>>> +      - starfive,jh71x0-pwm
>>
>> Krzysztof, did you approve this generic compatible?

Patch was quite different than reviewed by me. This obviously does not
make any sense. Thanks for spotting.

I guess carrying tags should not be trusted.

>>
>> And the whole thing looks like it should really be something like
>>
>> items:
>>   - enum:
>>       - starfive,jh7100-pwm
>>       - starfive,jh7110-pwm
>>   - const: opencores,pwm
> 
> (assuming that the opencores,pwm compatible represents a subset of what
> is implemented on the jh7100 series)



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
