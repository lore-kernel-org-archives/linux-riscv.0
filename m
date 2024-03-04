Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD856C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb2Ztrhh0lq31m85o7++wovRk2Clwql9oulRvW/bh80=; b=vaXIL91TNh3oEQ
	hmclMUHWGo6K526g1uCGuE+8cPYJhKx2IN259t1wtegi9fM2kuXXuIZnIChL2qDoHsXqfPTM7in5B
	4zQCJ7x7Dqzwr1Rlc3N51mjcgQefzjtcAJ2EvRqzUwKl0OWCUm7LcpgKT/+tW6W5wDDBqDyTqKCbg
	l7zN0RjgfM232qDFD1E5lku+fSnVaT36T38Lo55T44ogVieHrdnKoMWwlUelY2Eskhiu7CE+OOyWj
	Q+CoUM7q7iNE5ukRPDMENkrcas2vCUl7bYnGDg6tXyrY894l1P7lQnkeYJ6TWRtZSBCPTKBennPcu
	phcQGVh+9AEj0VZxRv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5cH-00000008dgV-1MrR;
	Mon, 04 Mar 2024 10:32:17 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Xd-00000008bTM-2pWR
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:27:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33d568fbf62so2215952f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 02:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709548041; x=1710152841; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VRHksjEJRgpRJ54Kzj9MQUEll21nALPKdN0xNfWjwo=;
        b=eVXFjMMVPR33SrGdaaArhMrjU/iu9LXiY9rdtENpZ3XfVkerAIsE0GZa516GVkdvYl
         SXvJ9c+quPSZx58NMoc9lSmIIehhqWs4gJ0DxmN1j+tYdtLylJSk2d3XCHCAcL/nncg3
         Z08OVyCJlQB8cAWXNi3HS+bzzCQYmNRpdOCWDcPiwCZm8BxLpPrXoKEH95VWjKAYsiR/
         jsGrmikvR5dWrYE49qDkS7UWovfZIwDKhlBwJa2NOFZ2KizrTTudBUFdVkXdGWPLgsl5
         snQ4ekmOzkE+uUs1E1pU28wov7ENu2soI1f/nlxoTxLD/hO0dFWRry14gKNRKVrHP2XL
         sK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709548041; x=1710152841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VRHksjEJRgpRJ54Kzj9MQUEll21nALPKdN0xNfWjwo=;
        b=OPibEtFFrTJavMbdoua59I9TJrab9kqRQyxemBjyOsN3mQf5eAmZLQR4mnmfxPzCha
         ZbmAFgRayu/hzMHJ4VaOv/2yVLkEaPUKV7HENh6weLfpngt7CQT/SyfhLXpR+tTWlBhU
         o2x76pA6WyuCmFVINeA+/5+vAtkXPbCn9KZhPxJjd21mxUCcC6YyMOnI8leTgFUlZv+H
         SzS1c8LphohE3RfT0RmUxZeXeDNDeJASQquEgNpRL8xPDbZ0dP1MdtIDKQD2PrlNfkAj
         Z9Zcg81Q0l9b+sK8KADSQJ+UFC3wFV24YGiHxtNPMSPiA+A9xYeFuMZEnP0hU5P1cMZK
         oj9A==
X-Forwarded-Encrypted: i=1; AJvYcCVGMqPlajrJtrN9fLqNRpXz8Ol+C2rASKixnF/s5/fuKbY1N7TmY235urWisEM6ROJUQnqWJl2w+o/W6E+v8bH/mnMJWiX1CZkwabg71t3X
X-Gm-Message-State: AOJu0YxSqHGW3PlfwPA0NB2uR7oxIxVzLKlCQ1NV4mzgwFVP3n22gi4b
	j1rgaZU8ApuatW26X1nPWl37eUe9xP0TD4GJ/zyk9BUDm77oztxXGQsNsZIBk80=
X-Google-Smtp-Source: AGHT+IHt7Zd2k+hFzTOidzoi79RLJvkZffvdWquLn5rABypzFsoKwHuVYvLNqORqWKY3MslGeNS9DA==
X-Received: by 2002:a5d:6646:0:b0:33d:bb9e:9713 with SMTP id f6-20020a5d6646000000b0033dbb9e9713mr6464401wrw.44.1709548041438;
        Mon, 04 Mar 2024 02:27:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id l15-20020adfa38f000000b0033e03d37685sm11865548wrb.55.2024.03.04.02.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:27:20 -0800 (PST)
Message-ID: <5cec7a58-a14f-45d7-bd61-45baaa31a94d@linaro.org>
Date: Mon, 4 Mar 2024 11:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: add Canaan K230 boards compatible
 strings
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
 <tencent_D5188EA5B85A31AC21588DBD7C7482ACDA08@qq.com>
 <7c3c578a-d662-4485-ad15-47250ad0e935@linaro.org>
 <tencent_BF607C338244DA7F8EB2B8F2314A218B8D08@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <tencent_BF607C338244DA7F8EB2B8F2314A218B8D08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_022729_992249_8AE4BC1F 
X-CRM114-Status: GOOD (  18.70  )
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

On 04/03/2024 09:51, Yangyu Chen wrote:
> On 2024/3/4 16:11, Krzysztof Kozlowski wrote:
>> On 03/03/2024 14:26, Yangyu Chen wrote:
>>> Since K230 was released, K210 is no longer the only SoC in the Kendryte
>>> series, so remove the K210 string from the description. Also, add two
>>> boards based on k230 to compatible strings to allow them to be used in the
>>> dt.
>>>
>>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>>> ---
>>>   Documentation/devicetree/bindings/riscv/canaan.yaml | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
>>> index 41fd11f70a49..444758db964e 100644
>>> --- a/Documentation/devicetree/bindings/riscv/canaan.yaml
>>> +++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
>>> @@ -10,7 +10,7 @@ maintainers:
>>>     - Damien Le Moal <dlemoal@kernel.org>
>>>   
>>>   description:
>>> -  Canaan Kendryte K210 SoC-based boards
>>> +  Canaan Kendryte SoC-based boards
>>>   
>>>   properties:
>>>     $nodename:
>>> @@ -42,6 +42,17 @@ properties:
>>>         - items:
>>>             - const: canaan,kendryte-k210
>>>   
>>> +      - items:
>>> +          - const: canaan,k230-usip-lp3-evb
>>> +          - const: canaan,kendryte-k230
>>> +
>>> +      - items:
>>> +          - const: canaan,canmv-k230
>>
>> Why this is not part of previous entry in an enum?
>>
>>> +          - const: canaan,kendryte-k230
>>> +
>>> +      - items:
>>> +          - const: canaan,kendryte-k230
>>
>> Usually you cannot run SoCs alone. What does it represent (in real life)?
>>
> 
> I'm not sure what it means.
> 
> If you wonder why should I add a compatible string for soc, that is 
> although we cannot run SoCs alone, adding a soc compatible will allow 
> some bootloaders or SBI on RISC-V to choose an errata for a soc. Such as 
> this opensbi patch. [1]

No, this piece of code will not allow this. They choose errata
regardless of this change.

> 
> If you wonder why I should allow a soc-compatible string with soc alone, 
> that is because k210 did it previously. And provide a k210_generic.dts 

I don't remember background behind k210_generic. Any SoC-compatible
alone is exception, so needs serious justification. Drop it or provide
proper rationale.

> to use it. I haven't provided generic dts now but allowing only 
> soc-compatible string alone would also be acceptable I think.

No, it is not. Stop making own rules.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
