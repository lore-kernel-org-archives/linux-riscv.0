Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDDEC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5y2MeSp9VetT076v1VqM8MGVKR77tUTM6UrgbBifPE=; b=T2M1jAiY5f4c89
	Zn88maBWCeipd+yw1C56z4xhAG0csRsRHQRSJX82QfNCh1S14aEI1CO1aWebwImtpV21l+zwLpdUW
	vdkO5YLyzS1m34NY4M95xMnXAyOC9C8GjZsLgQ0LIJj6O8NE7JLk3WyFBaxc0GyN/0d5XUpehNsho
	VIIsI1bsOPOpQHng4nKBZ/N8CfX8WR0j1JCd02iWy62VyHOcDYVA13+pp5wW1lns86K/obXpmunhz
	6jNaSnc05ENqA8rzK7F2kiK8UlU/CVIgKQz3ls0wf46ExL8LGHPZIX+m/X+dScB526psvZAj2xMkM
	o+Tu+M3p+KUhXMuT6UPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bzZ-00A9Yj-1m;
	Thu, 30 Nov 2023 08:01:49 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bzV-00A9XQ-2A
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 08:01:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54c0bca218dso277686a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 00:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701331301; x=1701936101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gk2JbtMlo6WQoDmF8ccbRSSYTd1fSytcQhz6DQC0L9M=;
        b=wLKh0wU42gNWn1N+zVKmjJQSnwBtY7yEG1FSxfRMr8RFbC4wfiH/90cvSmQXDYBvAr
         ynLHtPNh0mAgend/j4/ecyDjYvjDFNyClR21AWsplfSTlA8pVvaDeAPEH62RLqu6+DBJ
         rFMh+ACotv3hIDlHzIetau2mUjNap3F61oKiy3cDt7gm5D49BzxADamVfR0UCJyTGn66
         wXWDQCjFwtYgNrnxWvzf/5q32knc/c/a9JrHn3ZWIwM7ArehuSvCr1WnMdxa/s3bmPsP
         8vbBMUke4RteqK+unIy1Ek8LTjWeFkxSuIwty7ekQcB0rlRCuvP8jv63aCU8vsMlkhKH
         kJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701331301; x=1701936101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gk2JbtMlo6WQoDmF8ccbRSSYTd1fSytcQhz6DQC0L9M=;
        b=XArJ4hadKdR4fV+gI+amgPYW1Qvp66Dj9E/nfC7F4Z1rRBa9xgLpOQYrahm3M9EDMO
         MOU3LEjteEShFU5HY+obR4+V2z/XADpZyy3eVbbY4A7jzQy6d9YN9D7kQRGZr35xKwgp
         68wyjc/Z2bcUwAejlgF3Jhw6cUFeRELvxeCLtX+fgYzzFm17A+FG9DsVdYaInV5NW9Pq
         bhHX9iYpBLItpbKCXhCKhQfkkrx5HAoFxH5+msA0g7o+6Y+QD3x0zWjOBkhSD8RLiAeu
         pOrWZ/l53ulsNdZ9beCQowmGBYVrVvf3hELk7BsfmQVaiQAEhymP4r0xgsra8de36Oc9
         wmaA==
X-Gm-Message-State: AOJu0Yypy6uWBd/gyKI2GguVIs+v9CibsgBS3arQ1C0E/Fkd41rXor3+
	0o9yruANsWqCCHWDjEMszSxICw==
X-Google-Smtp-Source: AGHT+IHNM7VsJ8U2JIjdtjCguhq6a0MblOnIQOqCBIDRxqJp1d4EDgJ10iue6LDC42RswFndilTUKQ==
X-Received: by 2002:aa7:db8d:0:b0:54b:dc3c:7c9e with SMTP id u13-20020aa7db8d000000b0054bdc3c7c9emr2540356edt.31.1701331301566;
        Thu, 30 Nov 2023 00:01:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7df96000000b0054b3a6243b1sm291363edy.71.2023.11.30.00.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 00:01:41 -0800 (PST)
Message-ID: <15a46a91-d539-4580-b676-1177fc0530a5@linaro.org>
Date: Thu, 30 Nov 2023 09:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: sophgo: Add SG2042 clock generator driver
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1701044106.git.unicorn_wang@outlook.com>
 <c06130afb4bdc1890b4e8d29388fa6feef1f1826.1701044106.git.unicorn_wang@outlook.com>
 <81d421c8-bfd6-42b5-9da1-f067792f8f48@linaro.org>
 <MA0P287MB03329CFBA3BB6A4E4F322F99FEBDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <2a268c8c-ce55-4321-b390-092b8df61407@linaro.org>
 <MA0P287MB03320824AB953465E00394FEFE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB03320824AB953465E00394FEFE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_000145_709573_5F75011F 
X-CRM114-Status: GOOD (  31.84  )
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

On 30/11/2023 07:37, Chen Wang wrote:
> 
> On 2023/11/27 17:16, Krzysztof Kozlowski wrote:
>> On 27/11/2023 09:07, Chen Wang wrote:
>>> On 2023/11/27 15:12, Krzysztof Kozlowski wrote:
>>>> On 27/11/2023 02:15, Chen Wang wrote:
>>>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>>>
>>>>> Add a driver for the SOPHGO SG2042 clock generator.
>>>>>
>>>>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>>> ...
>>>>
>>>> +}
>>>> +
>>>> +CLK_OF_DECLARE(sg2042_clk, "sophgo,sg2042-clkgen", sg2042_clk_init);
>>>> No, this should be platform device. It's a child of another device, so
>>>> you cannot use other way of init ordering.
>>> hi, Krzysztof,
>>>
>>> Thanks for your review.
>>>
>>> I don't quite understand your opinion. Do you mean CLK_OF_DECLARE is
>>> only used for platform device so it can not be use here? But I think
>> No, I meant you mix init ordering: you depend now on syscon earlier
>> initcall than CLK_OF_DECLARE. Do you remember which one is first? If
>> anything changes here, your driver is broken. There is no dependency, no
>> probe deferral.
> 
> hi, Krzysztof,
> 
> I found that the initcall method cannot be used for the clock controller 
> of sg2042. We need to initialize the clock earlier because there are two 
> dw-apb-timers in sg2042 (Sorry, I have not added them in the current DTS 
> of sg2042, will be submitted later). The initialization of these timers 
> (timer_probe()) depends on the initialization of the clock controller. 
> If we use the initcall mechanism, it will be too late for the timer. So 
> it seems better to use CLK_OF_DECLARE provided by CCF.

Sure, that's fine, but don't use syscon in such case.

> 
> I have a question here that I would like to discuss. The design of 
> sg2042 is like this, according to the design of memorymap in its TRM:
> 
> 070:3001:0000 ~ 070:3001:0FFF SYS_CTRL 4K
> 070:3001:1000 ~ 070:3001:1FFF PINMUX 4K
> 070:3001:2000 ~ 070:3001:2FFF CLOCK 4K
> 070:3001:3000 ~ 070:3001:3FFF RESET 4K
> 
> But also as per hw design (I don't know why and I don't like it also :( 
> ), some of the PLL/GATE CLOCK control registers are defined in the scope 
> of SYS_CTRL, and others are defined in the scope of CLOCK. That's why in 
> the current code, I define the syscon node corresponding to SYS_CTRL. 
> The purpose is just to get the regmap of syscon for the clock controller 
> through the device tree (through device_node_to_regmap()), so that the 
> syscon defined in SYS_CTRL can be accessed through the regmap from 
> clock. The clock controller driver itself does not rely on other 
> operations of syscon.
> 
> So based on the above analysis, is it still necessary for us to define 
> the clock controller as a child node of syscon? In the version v1 of 
> this patch, I actually did not define the clock controller as a child 
> node of syscon, but only accessed syscon through the phandle method. [1]

I have impression you ask me if your solution is ok, but I already
pointed the problem. Address the problem - how do you enforce ordering
of syscon and CLK_OF_DECLARE? What initcalls are both?

> 
> After more read of the TRM, I believe this situation only exists for 
> clock. That is to say, there will be only one child node of clook under 
> syscon. From a hardware design perspective, CLOCK and SYS_CTRL are two 
> different blocks. So I think it is better to restore the original 
> method, that is, restore clock and syscon to nodes of the same level, 
> and let clock use phandle to access syscon.
> 
> What do you think or do you have any good suggestions?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
