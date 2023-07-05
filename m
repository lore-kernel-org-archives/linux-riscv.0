Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EB1EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 06:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gU9GIRogv6coR99u9IOV0wUKy/ZP2g9WLD+Lum3HHo=; b=hwzpKeWz3HZsfa
	AoqEt8wVSIKscKpTgLKOBqzUGE+Eff7laPgxFtreIqoouwrCf9yxSR6iEkIsZBtVuAKPGfl4Oe1gq
	TxHIlz2oTPkiuR37rlekR96BeDnKTxdW07CGMMTvDzUUGKMyAcRnsk2N2Xprd8wy5udVYqMsGo0ff
	Vht47lpqTN+3rX2KJWfU4uP29FPtnFDQTRChGA3l++bbDC4VQyYDJe+UOxoZ1ZkPxF/iw8GD8OTJ8
	5lO4kAv9DbNIc6WxGQNv/dW2sjQ1dbheEz55F1YhJLgonox7udNmJooTUoJwWGrhmht8oY4ACe1a7
	YMr704V90zaJVc9EMD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvYj-00Er9t-1t;
	Wed, 05 Jul 2023 06:00:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGvYg-00Er8q-2q
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 06:00:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51d804c7d14so7111925a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 23:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688536805; x=1691128805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lg4p70yBEKgSpD1cT2YGaKlK1TI1DMTxkPYru7t7pjo=;
        b=JuxdT/xEit4IrqGeHlnyYjKmGmvgAzwPA8szxaSJH3EZcEWwW63T44Zc6/atD6SZSi
         OHBv//7Ewd32S3ndKkXVvv1U81h/6FDKWuKhz9E+VHS0Yx0Ubstgg3xT7IuJxr5DLfQ/
         +Y9WBvvo46+zTP4dmeFiih5GUAD+tGqaTA9cwBhlS5YhmHgci/emfftL3DCoHUhRaHFo
         nbvT1yD4uC9SPhEGcPcsR99OcyBwYSVxCz+PlpodlKeuhew8rvdUVl5L4Kbvb2TZopri
         4DcwPfXRWwC4l35FCWKhfZg70GjOlvVeaFYDjB8AQhR2Oh+rajLl5L6dXXbcFzPVSNqf
         lBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688536805; x=1691128805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lg4p70yBEKgSpD1cT2YGaKlK1TI1DMTxkPYru7t7pjo=;
        b=CylLfDmhRf6+YclGxmqKYCR4dK+hZtE2D7XIJGgsD78W/9kOurmIWtQyVAhkG0um1k
         mG14y2vtUl3MCpORbX06w4NJFM5RXT3sSYOpEwTPqNVb416ibLA7RKiI+t1A/+tJLoZC
         WgORRrgrfwh+eorGVSLDHcVyiXhYtZBw0GFede/9qIZGghHf8q8WGxrUzr0KfB8aPkDf
         iOkH1CqiYT5Djc/fGhrRhjhbqkvP50QaQS6r9E6MigY9bEHZifHEGdotRydNWOqpWAmx
         7r0uQIP3T6An1xLWlpdvN9KzDzEj71L6EoaselNZuDGcERv4rVo7JYkuKjyxEukfEjvT
         3G9w==
X-Gm-Message-State: ABy/qLYCdCUHnPAVyrjBov0XfaRbKzDzQX/2fe/l+UzjPXLaOfWQ684T
	yTqh2SCJzlF3+v5PIsvYJS9lkw==
X-Google-Smtp-Source: APBJJlHovpZJ6c+S3ijS7SQT3N5tbS5WFllsIv8PWnLvlpcF+jgm5rZjp5jo94AHu/4D3FFDZ5JmTA==
X-Received: by 2002:a17:906:a38b:b0:991:f207:411e with SMTP id k11-20020a170906a38b00b00991f207411emr10107006ejz.69.1688536804831;
        Tue, 04 Jul 2023 23:00:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k25-20020a17090666d900b00982842ea98bsm14071542ejp.195.2023.07.04.23.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:00:04 -0700 (PDT)
Message-ID: <afcf67e3-a017-b747-a0cf-284a87a8d24a@linaro.org>
Date: Wed, 5 Jul 2023 08:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 1/2] dt-binding: spi: constrain minItems of clocks and
 clock-names
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-2-william.qiu@starfivetech.com>
 <1b65e8d1-d5e1-0d6b-1248-d9683be44db8@linaro.org>
 <c5027d42-b9be-090d-bd43-86c9b1448c99@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c5027d42-b9be-090d-bd43-86c9b1448c99@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_230010_960358_24A2A26D 
X-CRM114-Status: GOOD (  10.39  )
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

On 05/07/2023 05:37, William Qiu wrote:
>>> ---
>>>  Documentation/devicetree/bindings/spi/spi-pl022.yaml | 11 ++++++++---
>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>>> index 91e540a92faf..42bb34c39971 100644
>>> --- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>>> @@ -11,6 +11,7 @@ maintainers:
>>>
>>>  allOf:
>>>    - $ref: spi-controller.yaml#
>>> +  - $ref: /schemas/arm/primecell.yaml#
>>
>> This looks unrelated, so keep it as separate commit with its own rationale.
>>
> Because "arm,primecell-periphid"  is need in JH7110 SoC, so I added them in
> one commit, so do I need to put them in two commit?

You need to provide rationale why this is needed. I would assume this is
needed for every primecell, not only JH7110, right?



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
