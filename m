Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A2C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 05:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCFFcbYrLL63wDluNGXvCeqS7jYtHiboAIatL6Kc4pI=; b=aB+HN4z5aeGkbE
	2YM8GOdufvZRRg72roUC5dCGVtZ2gxZFIBKbQNiZ16mPfcbe+YNxXWRH1+8grnF0R5kqgk48yDhiz
	GW5e8fzt3TrNokLobE+nsruweaHh4L2SjSe1aPq0welxBwE/Rr+148mZoYNYIP1dR/3/VndkD/opM
	bNX3VWwYmIEu2mSPBtSauvMAGlLmHwX/0oFhbkTSDBRpCFbJh5SyrOpwsSLJIeb5h/rR3+/4hBlyE
	SVhVX64lIk5oYc8l3wrlfnuhGBh17HOArP0R2K6Ixk65YITrp2flr48SLvsdTfwR7SK5SY1KDi0Ak
	1DESUQtrjo/r7znsE26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhcI-004aXm-22;
	Tue, 31 Oct 2023 05:48:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxhcF-004aVx-1d
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 05:48:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso8295250a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 22:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698731317; x=1699336117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8tsL5oB87Rx8sJrlG5ElUtswTptcOb5Z68cZ32EAsY=;
        b=N5H0jdus++XyJyRisP0hqkXAqU4iRahxt0183PdJ8rG4Pgy9SKLukrmFX3KkVPdbag
         ZOksqh1T8O3T0UNROz9hbmAbVkPMT6QcCMjYppCZfIkfD7efZpSwbybERGH+U117n8ki
         05t0+x7g+Wh5aN+gqjguzVomKHpjJ2XEoLbB1CtQExUL9xJaI51/z9se2njwVMatFh9E
         pmzvKkGT6gEks94aAMbpVnbgAZeUmrWnHVFxg57V1AXIMVD8ySHUio/Su9uKuaDH3z85
         KJavjIYZ9T9lHFNaOTLajMgsBtCcVLHmbx4dPEULXv1YojfSTh5lboroJYicU/4vFocn
         BQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698731317; x=1699336117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8tsL5oB87Rx8sJrlG5ElUtswTptcOb5Z68cZ32EAsY=;
        b=ELda6ZifodB267k9mp0EpuQv8heiwk5c8Wr/NKVImGhb406z2Yb952zZYvIrk2InWU
         wwI+r9Ge/Ht6OH5e5XPglO3mmVT3wcYDMqK6xeOcYVmj7FT1rd/q/+IxSF2a3T3hgYR2
         lTcEoypYR5M5rwrzb/tUkDgj8IQNNzSeLKRLqaxcM63+zjiTAyh9yj9+ZcSV5G0y73UQ
         c2weS/7avX0aPM3W0fuHloFleFCnTg2/n378lLuti5XtgN/m/w40pW+WClmpoSo2+B8E
         zbRQas9aQhf/5/UWFq+lnbAnLRKKhUj8LhAzkXN4fIBDrI0OnRoT1RP3FvZL/QTMDPWs
         CN6g==
X-Gm-Message-State: AOJu0YwapC6YoZgXg/dtzKn/feSftZYZ2sEkp7aR/wviwUOehpP3Uejc
	uSLeLqv8fy5gpCDmc9SDNWdJTg==
X-Google-Smtp-Source: AGHT+IH7TmlrhHtGaYMSqpY2i7vK1vgWIGw5a4YiJB8UtrNg8R8oC1mb+KBwD5+C5OPY2DzZOFMUxQ==
X-Received: by 2002:a05:6402:379:b0:540:9b47:4f70 with SMTP id s25-20020a056402037900b005409b474f70mr9028247edw.26.1698731317311;
        Mon, 30 Oct 2023 22:48:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id ks24-20020a170906f85800b009ad8acac02asm361918ejb.172.2023.10.30.22.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 22:48:36 -0700 (PDT)
Message-ID: <b67ee496-397b-42f1-8109-542878934385@linaro.org>
Date: Tue, 31 Oct 2023 06:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: net: snps,dwmac: Allow exclusive
 usage of ahb reset
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-2-cristian.ciocaltea@collabora.com>
 <3016eff2-fce5-4b5e-bbb2-d56cbb45df85@linaro.org>
 <05186c62-fcad-4d56-8ae8-d802f87a39e2@collabora.com>
 <98d90ba9-7e69-4b54-830d-bdbc0e6c54fe@linaro.org>
 <d532514a-524c-4607-b97b-2f89bc563406@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d532514a-524c-4607-b97b-2f89bc563406@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_224839_556455_ECD8C4B8 
X-CRM114-Status: GOOD (  28.50  )
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

On 30/10/2023 20:07, Cristian Ciocaltea wrote:
> On 10/30/23 09:26, Krzysztof Kozlowski wrote:
>> On 29/10/2023 23:24, Cristian Ciocaltea wrote:
>>> On 10/29/23 13:25, Krzysztof Kozlowski wrote:
>>>> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>>>>> The Synopsys DesignWare MAC found on the StarFive JH7100 SoC requires
>>>>> just the 'ahb' reset name, but the binding allows selecting it only in
>>>>> conjunction with 'stmmaceth'.
>>>>>
>>>>> Fix the issue by permitting exclusive usage of the 'ahb' reset name.
>>>>>
>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> index 5c2769dc689a..a4d7172ea701 100644
>>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> @@ -146,7 +146,7 @@ properties:
>>>>>    reset-names:
>>>>>      minItems: 1
>>>>>      items:
>>>>> -      - const: stmmaceth
>>>>> +      - enum: [stmmaceth, ahb]
>>>>
>>>> Also, this makes sense only with patch #4, so this should be squashed there.
>>>
>>> I added this as a separate patch since it changes the generic schema
>>> which is included by many other bindings.  JH7100 just happens to be the
>>> first use-case requiring this update.  But I can squash the patch if
>>> that's not a good enough reason to keep it separately.
>>
>> If there is no single user of this, why changing this? I would even
>> argue that it is not correct from existing bindings point of view -
>> nothing allows and uses ahb as the only reset. Even the commit msg
>> mentions your hardware from patch 4.
> 
> Sorry, I'm not sure I follow. JH7100 is (or will be) the user of it and,
> as a matter of fact, something similar has been done recently while
> adding support for JH7110.

Every patch should stand on its own and at this point nothing uses it.
We apply this patch #1 and we add dead code, unused case.

> 
> In particular, commit [1] changed this binding before the JH7110
> compatible was introduced in a subsequent patch. On a closer look that
> commit made a statement which is not entirely correct:
> 
> "dwmac controller may require one (stmmaceth) or two (stmmaceth+ahb)
> reset signals"
> 
> That's because stmmaceth is also optional in dwmac's driver, hence the
> correct message would have been:
> 
> "[...] may require one (stmmaceth OR ahb) [...]"

Driver does not describe the hardware. The bindings do, so according to
that description all supported hardware required MAC reset (stmmaceth).
Otherwise please point me to any hardware which skips MAC reset and
requires AHB reset instead (not future hardware, but current).

> 
> Hence, I think it makes sense to keep this patch, after adding the above
> details in the commit message.
> 
> [1] 843f603762a5 ("dt-bindings: net: snps,dwmac: Add 'ahb'
> reset/reset-name")
> 
> Thanks,
> Cristian

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
