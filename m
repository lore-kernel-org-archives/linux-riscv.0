Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF40C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwnhTxwAC4a1N/ZPQXoG1pV6/xjYZmT2OcIAKt9n81Y=; b=t2/SK90bURu+LU
	Trt2j9KvmwxuVMaRaQPwzI5aR51+P+lJUKGhvKIM4UMqgthATWafs5HtsDsKe7Rb/JfxRrN6pCjaO
	6f5gvQ269NWDWAFywi8qIZAw9g0KGTMiX5pDbKgsAXn4hP+QQkYdyz3hWvRM9tEen6VNPOzZYNKKu
	JG7dVoL/gtAMxEsZOBUBHO8ZcfhD552W1M6nhJps8yEm+sOsJbs6ssHDbYii6HN55eMzBB7/s54sv
	epj8G9EVJCavlngiqU1kz/pNq1aGwYGn2M7TYE8q8gvyH3QqL7THpg4Z5ud25wIudItnUYYKSIEWn
	cnf+AP/odunWgeluGGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hwy-0077Q3-7W; Thu, 01 Dec 2022 11:41:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hwu-0077OE-TZ
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:41:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id f13so2070619lfa.6
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UiAnxiG5gru9IeukT0uPFqmufGik114HWN4x39w6FA=;
        b=zopg1txRN5QgqaXfvugj89RD4LqFxqoqVjHWRsqgKB0npSUazcU7D9c2uZ9eF+aBjn
         YF6qfci1wHSt4AFzDdaT6TP9OhQ3Mdaza3DpmSV5hpIUekk3KR80oodi3SN9yWI5tGS6
         BuQ4A1vklebhvhifCHCdZnMSoSeCWvFM/Ob8qdlXPxy4zsG7kk5g+VQP3o6YbOTvD/iZ
         2WoTXkrwVdgV3weLjEU6HWVghtCCvmbFUyO94sTViyHwjHW1koa5iH6wuV0IKiROfrwq
         tf+I6a/cjSMNzM9dEX7KO+nfOz8/O/3aZxCS+RhXktnqnxBEzb01V5YJ95RsD8VHUo5a
         Jrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UiAnxiG5gru9IeukT0uPFqmufGik114HWN4x39w6FA=;
        b=PDLfqr2O5th/pNuuAHeUcIyDkERbzuu/yfcK45KPmpfyuDZTBheU2lIgsm1X+5KduM
         l92sbXVnpyDhiM0o3D10YBeCQBX052BEie7nW88ZMl34KAUF4s7rSg3rtyzuIVpeprM0
         1XB1F2puW2J2GXeo33rTHn/c6ub5m5QZYfyrMubDAP2OWwi0mnPzLcWYBHeMiZk7NO6k
         ZqLeio5sAcWrg+NYCsKToeKCV8umySRIvU32g19IUugg3l5GFPnobM4TCnymIy2m6/T4
         YXXUmg+0lcB7jTZYwgQT+NWnvhqlwyRDFfyfA1La5p001KireScsGIv4PpZUOd/qLNl1
         tiKQ==
X-Gm-Message-State: ANoB5pnjUUP+zmT60/FnyNpWFj4NZT99L+mFKqinSKbd5CE09gz2TE4d
	3o22BthD+wMzy5/qyplYy6gllQ==
X-Google-Smtp-Source: AA0mqf5NJwSDFJVZ4ee0obiZShaUI/uPkLiEO75TR/uSDPOAHIZkEPvJJ1JC3LaLkJUeMh2M4XFoqQ==
X-Received: by 2002:a05:6512:a83:b0:4aa:f944:f7ec with SMTP id m3-20020a0565120a8300b004aaf944f7ecmr17809472lfu.467.1669894910308;
        Thu, 01 Dec 2022 03:41:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w10-20020a05651234ca00b0048a8c907fe9sm612837lfr.167.2022.12.01.03.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:41:47 -0800 (PST)
Message-ID: <a1d8197e-33fa-e853-ab73-81b167ec45ec@linaro.org>
Date: Thu, 1 Dec 2022 12:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 5/9] dt-bindings: riscv: Add bouffalolab bl808 board
 compatibles
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-6-jszhang@kernel.org>
 <60991459-945f-35db-f26a-fb27824728ad@linaro.org> <Y4iMrKjLAHpkCygo@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y4iMrKjLAHpkCygo@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_034152_983597_DE0351C7 
X-CRM114-Status: GOOD (  16.27  )
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

On 01/12/2022 12:14, Conor Dooley wrote:
> Hey Krzysztof,
> 
> On Thu, Dec 01, 2022 at 12:05:04PM +0100, Krzysztof Kozlowski wrote:
>> On 27/11/2022 14:24, Jisheng Zhang wrote:
>>> Several SoMs and boards are available that feature the Bouffalolab
>>> bl808 SoC. Document the compatible strings.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>  .../bindings/riscv/bouffalolab.yaml           | 34 +++++++++++++++++++
>>>  1 file changed, 34 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/bouffalolab.yaml b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
>>> new file mode 100644
>>> index 000000000000..91ca9dbdc798
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/riscv/bouffalolab.yaml
>>> @@ -0,0 +1,34 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/riscv/bouffalolab.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Bouffalo Lab Technology SoC-based boards
>>> +
>>> +maintainers:
>>> +  - Jisheng Zhang <jszhang@kernel.org>
>>> +
>>> +description:
>>> +  Bouffalo Lab Technology SoC-based boards
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    const: '/'
>>> +  compatible:
>>> +    oneOf:
>>> +      - description: Sipeed M1s SoM:
>>> +        items:
>>> +          - const: sipeed,m1s
>>> +          - const: bouffalolab,bl808
>>
>> I don't think that SoM is usable alone. It always needs a carrier, so
>> drop this entry.
> 
> For my own information, if a SoM is not capable of functioning without a
> carrier there is no merit in it having a compatible?
> Does this also apply if there are multiple possible carriers from
> different vendors?

Compatible makes sense anyway. There will be different boards using this
SoM (not only carriers, but final products) and they all will have
common piece - the SoM. It's the same for other SoM designs (e.g. for iMX).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
