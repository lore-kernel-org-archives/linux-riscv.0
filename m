Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30C6C10F04
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj5iX5ICsTANXZttxikG4HMK/GhQj0jfL9aJLnoSTZs=; b=IENBsoPScDMqgI
	+AjDmdgwq+RbCoqpGFyq+HXQmltS28FJat8y20tQmGOxFRhdGNFnEZhryL9wExwa79bfYmBndjbpf
	Aag816t0NQfIeNfJcMokNSi5ezEFg/yphh0DqkEYH1U+7xCe0kCYh4OFEHURrX8rKFWf3IWx86wnS
	L5zfBREFxbXt7WzRvTqsZRN7jgq6dTfpscwKm/mZ8ua7++uobOZ6U9WjHEZUDdLOsnmGPjsc7tENN
	jIrjV+wsUCGx1f4/GF07vjV0uBJkZZuDsSjaYY8rwNW5biBDfxmmrxv31pLZowam3iyuofpVMrgQw
	Z6q8OjQRK1cku1uRG62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDrd-00CqaM-1k;
	Thu, 07 Dec 2023 12:52:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDrb-00CqZf-0z
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 12:52:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so1246647a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 04:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701953538; x=1702558338; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2V1Nu5Y3M7B3c5KtqzFbEZA29nzyhwL2JmdTIY4szc=;
        b=pHF0fOjAS+q1qh5rsDNo3hmK6Rml9+fN1oYPG6jLQOiiyOK6QBLJtg9Zob/GVmY5uD
         LSMWFvObR8FxGimZt5cOK2AVxIQpx5GEjVutJcweV4nLgqCARatglmX0Ggdjjj1HjjxE
         R0nXZ5f5U7hcNgA1DrbDXIyvpbYrqClS6Cyko9zVGvJtEgH3PyZKSse1U2ysf71jSShX
         2VyiGvQoH/nR3zsFi++C6/a/UWKongh7WzBEomIOQ3UVue77FcQ2GCFBKfWT7wKLmmPg
         4vp2wflKqvj01AOIXE0AoKm/wQFU8f4ol7EZ7dQKExFjbiTqVXuAqQvCDxbbRzEH113e
         Iy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953538; x=1702558338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2V1Nu5Y3M7B3c5KtqzFbEZA29nzyhwL2JmdTIY4szc=;
        b=msDaVetrZJ3WJZvBegQHY8lrrDIGdKhJJ+5Y46QCWTLpZ9YKZ264INl+ZSGgY0aOZj
         S7hyUBeWhqJbD4muA1iT6SlOBc9sIBJimXmMXPKHEMiJqz1VGUWrudoDF7ANCjjfBXq7
         tfExj8lKTyCEMSR795XXsMzVPD1DbUQzwveHtO6InCR0lHsQQL0ieaUXgs9K6nSQWUz4
         L848dA5dmRF+wzjcd7JO0Lzt0VafWJiCCe4mM9yeY7QSxHJs++bhaQqBJKE8ZGQwxhzw
         nMoQQXlTc3EPT4BI9cy77/G2VNa9LhYvgY1Qjh6lJCGjI8WVqOiHH+9iLHGwMV70MZ8J
         PNgA==
X-Gm-Message-State: AOJu0Yz51XrdsT6k0IcfNOdBdn9iu2MMWugg70nT+ufqx/Y5oR/ELPg+
	AS+W51h4KharTUBGc6/7xQk+qg==
X-Google-Smtp-Source: AGHT+IFht54XAvdFOQ/lNFTSE16Z0z3a5hJ4XsdAOJVB02lM8AR5iw4enjeAPcl2cN19a5tGdwNr6Q==
X-Received: by 2002:a50:8d53:0:b0:54c:a676:d1de with SMTP id t19-20020a508d53000000b0054ca676d1demr1377196edt.60.1701953538552;
        Thu, 07 Dec 2023 04:52:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id er9-20020a056402448900b0054c6a70a435sm736766edb.44.2023.12.07.04.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 04:52:18 -0800 (PST)
Message-ID: <375bb6e4-18dc-4f54-9a06-6f9f2ba0a0ec@linaro.org>
Date: Thu, 7 Dec 2023 13:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add clock generator for Sophgo
 CV1800 series SoC
Content-Language: en-US
To: Inochi Amaoto <inochiama@outlook.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 qiujingbao.dlmu@gmail.com, dlan@gentoo.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <f9db367c-a96b-4789-9884-f2062499765a@linaro.org>
 <IA1PR20MB49531D4EFD4626834B5C604ABB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <IA1PR20MB49531D4EFD4626834B5C604ABB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_045223_369086_51F272B1 
X-CRM114-Status: GOOD (  15.09  )
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

On 07/12/2023 10:42, Inochi Amaoto wrote:
>>> +&clk {
>>> +	compatible = "sophgo,cv1810-clk";
>>> +};
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> index 2d6f4a4b1e58..6ea1b2784db9 100644
>>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>>> @@ -53,6 +53,12 @@ soc {
>>>  		dma-noncoherent;
>>>  		ranges;
>>>
>>> +		clk: clock-controller@3002000 {
>>> +			reg = <0x03002000 0x1000>;
>>> +			clocks = <&osc>;
>>> +			#clock-cells = <1>;
>>
>> I don't find such layout readable and maintainable. I did some parts
>> like this long, long time ago for one of my SoCs (Exynos54xx), but I
>> find it over time unmaintainable approach. I strongly suggest to have
>> compatible and other properties in one place, so cv1800 and cv1812, even
>> if it duplicates the code.
>>
> 
> Hi Krzysztof:
> 
> Thanks for your advice, but I have a question about this: when I should
> use the DT override? The memory mapping of the CV1800 and CV1810 are
> almost the same (the CV1810 have more peripheral and the future SG200X
> have the same layout). IIRC, this is why conor suggested using DT override
> to make modification easier. But duplicating node seems to break thiS, so
> I's pretty confused.

Go with whatever your subarchitecture and architecture maintainers
prefer, I just shared my opinion that I find such code difficult to read
and maintain.

Extending node with supplies, pinctrl or even clocks would be readable.
But the compatible: no. The same applies when you need to delete
property or subnode: not readable/maintainable IMHO.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
