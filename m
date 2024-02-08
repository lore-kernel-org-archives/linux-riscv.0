Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781C8C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MwwMqB6SpUzbH7xm6G5+U2GgFv1aRnnFEc9r9iCBn4=; b=1E6H9YLWHNi9c3
	R/t0a3Wcaq5TSL/tTqjOgDQMOQpxA+AL90r8vug/IkB1PnCHPvo6iq8912m3wjV11XnA4wHi+2R9t
	q8dhDge4um4n9Y/dzspoz6zn1eXIr6vjRl9JUaaZj3xVmvmJzwzPSVmkUt08+NNZeFuwPqTvqapco
	mS+CN94NiMyDpHU+MG8M9TdyI4ZbM7G9VoKDwjZT5xKXkXCodYWRc1NNnX8+fjoGaGgW8pvBHaLT4
	nHLmpwOmU39QwRdVwdAJ06yuZZ+fN5uGgGfAeLRBUG2GMGYmit+pB0/y1N6+dsLSZq6bbAKn75ir+
	dVQHhWX4Iq2kLqgXHINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7eF-0000000EMUA-1zzi;
	Thu, 08 Feb 2024 16:53:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7eC-0000000EMTP-0Jv7
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 16:53:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-410489e1a63so461225e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 08:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707411189; x=1708015989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZT1UxOiVrDHIynryw4Nlj/MmW/BLc7DWyJF67SG4DDA=;
        b=HmA3Mppam0AaJ/4SYiEEsA5WJWqhrWQCaRyqPWw4UyxdNxhLlI330pqg1cKsrbFjCH
         D+/jRVxUFSC1hmiciNUQsvzSJd54YJft0CqrtIV5OjcC6NZZ7Un2v5Oi28ebozPGaIZN
         voUXx7qViOzz4N4dUPRTcXJBfeIQFevq6OAVlkAIlDC24A3PJOaf4GJmFszw/f0xNMmV
         RQWKwg1f5KehuiF0rX5CcIPn+X2XFizB1OoOiO5c6UBFscE5e7FbuAOhguJuiWp9zV2R
         /kzeHNvUi0eszL/j2vl/qMugDxyrpoCJQ6kAkasmrB9gwKe5Q5VeCbM4cINER5DXUnEe
         ghMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707411189; x=1708015989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT1UxOiVrDHIynryw4Nlj/MmW/BLc7DWyJF67SG4DDA=;
        b=mtaumMmt1yc5ezwxy8I/JJkYvgQPaiWtdudABe1Cd2qxVhpvI5t+tfkcR0u2AoNh0x
         yz2ApHXSN1gqayGA+UZ7mu0vOdHgC2PcrFR/gq86J3OnCggscQE2Zzrl7mzJLga1wzli
         Wjlf5fkNvKKBHKjS7D8jKacGB1ZsPIjLbbM8oa8BvQmq+yzhcrQfPKxf9eZgbMHWHW+x
         XRg2eHenX6vovZS7pHdBCWWZ67EZsEWmPo2GWNvm13a+Z75eK5m+Jg5cp1EFPPW5LmtY
         4kJ/xZtbL2WwxHizAZtnx0uq0lplRCpTFhYP5PHIYPmwOyDvWnqpBLc0lP40XKP//u0u
         L04w==
X-Gm-Message-State: AOJu0YwG1Mi1KOOrY+KB2G1QZakoNCgeHP5SmL06EfBBgpD0Osuunowa
	p6C85uPFLtqnjyIq6aq28r2TWMoA4QEhWbiBa9OqHmPlzt3RcCx06H7uLvII8/0=
X-Google-Smtp-Source: AGHT+IGBr22Z6ACQ9/w6ayyS+L6lXv2vUq3SiUpYMPUXFdY2V/aOAsEGvexJMJND+A7XxxQshZubFQ==
X-Received: by 2002:a05:600c:1c21:b0:40d:3fee:97f6 with SMTP id j33-20020a05600c1c2100b0040d3fee97f6mr7052850wms.34.1707411189516;
        Thu, 08 Feb 2024 08:53:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCgbPZZ7zko4xImgI2de22H1Di8bnfniBlBZIeaYI1LCjutMSi4sL6loFFjSpUFYZdxHJ0oybDuTKnjTzavVMSE6mMXMkjuQgSRsipSN7J6QywmpRRcH21+l184D+5wMDh9ub7KkiYhlpI5Uk6pr4l09W2TDTD1vDAptzP4tRj1AkHRkZ+5nydwjKXE8zWV5LjbRGLwaBLKhWGWjTs77OfO5DJdFiPA3pUvbDbI9xohrxZbmNdn/yAqsRAxv5VGL6agf6Xre+F0FrNhbM6dL4yzJjqrAH6dVjBQZFfEEwv2ARhDqBKmizytiyBHsDxrxSZJCHmAKNnLE2x29ylkXN6T02i1p4R1Mdu/xk1+b4weFjFHsrq3es0LrUKYWfvApdFc/Fobab4yml/rVEVmCBD0xGtXcbAG8li8mIVXywL0Kn1040Q3v69VJrHwxeZ2XhDwzotc6EljttdTaPsHG2qfeipA8D6AySJ4GVA/h/D2yBK/8Dg1k+oo6cDljTReVA6KRcp9cU9+XVXo5nuf3x+ebXVTYqOr3+uD/PDI515LRJ7Z2ys/ROQLA+9hg9dpLEt87qLjQ+4Epf8OmL6+6VZOhzlIbevgGa6
Received: from [192.168.50.4] ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b004101e93d276sm2162175wmq.14.2024.02.08.08.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 08:53:08 -0800 (PST)
Message-ID: <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
Date: Thu, 8 Feb 2024 18:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
 <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_085312_280079_81D9A1A7 
X-CRM114-Status: GOOD (  16.84  )
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



On 08.02.2024 18:28, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Thursday, February 8, 2024 3:46 PM
>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
>> domain IDs
>>
>> Hi, Biju,
>>
>> On 08.02.2024 16:30, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>> Thanks for the patch.
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Thursday, February 8, 2024 12:43 PM
>>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
>>>> domain IDs
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
>>>> +++++++++++++++++++++++
>>>>  1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-
>>>> bindings/clock/r9a07g043-cpg.h index 77cde8effdc7..eabfeec7ac37
>>>> 100644
>>>> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
>>>> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
>>>> @@ -200,5 +200,53 @@
>>>>  #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
>>>>  #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
>>>>
>>>> +/* Power domain IDs. */
>>>> +#define R9A07G043_PD_ALWAYS_ON		0
>>>> +#define R9A07G043_PD_GIC		1
>>>> +#define R9A07G043_PD_IA55		2
>>>> +#define R9A07G043_PD_MHU		3
>>>> +#define R9A07G043_PD_CORESIGHT		4
>>>> +#define R9A07G043_PD_SYC		5
>>>> +#define R9A07G043_PD_DMAC		6
>>>> +#define R9A07G043_PD_GTM0		7
>>>> +#define R9A07G043_PD_GTM1		8
>>>> +#define R9A07G043_PD_GTM2		9
>>>> +#define R9A07G043_PD_MTU		10
>>>> +#define R9A07G043_PD_POE3		11
>>>> +#define R9A07G043_PD_WDT0		12
>>>> +#define R9A07G043_PD_SPI		13
>>>> +#define R9A07G043_PD_SDHI0		14
>>>> +#define R9A07G043_PD_SDHI1		15
>>>> +#define R9A07G043_PD_ISU		16
>>>> +#define R9A07G043_PD_CRU		17
>>>> +#define R9A07G043_PD_LCDC		18
>>>> +#define R9A07G043_PD_SSI0		19
>>>> +#define R9A07G043_PD_SSI1		20
>>>> +#define R9A07G043_PD_SSI2		21
>>>> +#define R9A07G043_PD_SSI3		22
>>>> +#define R9A07G043_PD_SRC		23
>>>> +#define R9A07G043_PD_USB0		24
>>>> +#define R9A07G043_PD_USB1		25
>>>> +#define R9A07G043_PD_USB_PHY		26
>>>> +#define R9A07G043_PD_ETHER0		27
>>>> +#define R9A07G043_PD_ETHER1		28
>>>> +#define R9A07G043_PD_I2C0		29
>>>> +#define R9A07G043_PD_I2C1		30
>>>> +#define R9A07G043_PD_I2C2		31
>>>> +#define R9A07G043_PD_I2C3		32
>>>> +#define R9A07G043_PD_SCIF0		33
>>>> +#define R9A07G043_PD_SCIF1		34
>>>> +#define R9A07G043_PD_SCIF2		35
>>>> +#define R9A07G043_PD_SCIF3		36
>>>> +#define R9A07G043_PD_SCIF4		37
>>>> +#define R9A07G043_PD_SCI0		38
>>>> +#define R9A07G043_PD_SCI1		39
>>>> +#define R9A07G043_PD_IRDA		40
>>>> +#define R9A07G043_PD_RSPI0		41
>>>> +#define R9A07G043_PD_RSPI1		42
>>>> +#define R9A07G043_PD_RSPI2		43
>>>> +#define R9A07G043_PD_CANFD		44
>>>> +#define R9A07G043_PD_ADC		45
>>>> +#define R9A07G043_PD_TSU		46
>>>
>>> Not sure from "Table 42.3 Registers for Module Standby Mode"
>>>
>>> Power domain ID has to be based on CPG_BUS_***_MSTOP or CPG_CLKON_***
>>> As former reduces number of IDs??
>>
>> If I understand correctly your point here, you want me to describe PM
>> domain in DT with something like:
>>
>> power-domains = <&cpg CPG_BUS_X_MSTOP>;
> 
> MSTOP bits are distinct for each IP.
> 
> <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
> 
> 2=MTU IP
> 
> 4= GPT
> 
> etc...
> 
> Is it something work??

It might work. But:

- you have to consider that some IPs have more than one MSTOP bit, thus, do
  we want to uniquely identify these with all MSTOP bits (thus the 2nd cell
  being a bitmask) or only one is enough?
- some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as of my
  current research), so, only PWRDN
- some HW blocks have both MSTOP and PWRDN
- if future hardware implementation will spread the MSTOP bits for one IP
  to more than one register then this proposal will not work

Having a unique identified decoupled from MSTOP registers or PWRDN offers
support to use the same code base for future usage. This is what I can tell
at the moment.

> 
>>
>> where X={ACPU, PERI_CPU, PERI_CPU2, REG0, REG1} ?
>>
>> With this, I still see the necessity of a 3rd identifier that will be IP
>> specific to be able to uniquely match b/w DT description and registered
>> power domain. FMPOV, this will lead to a more complicated implementation.
>>
>> We need a unique ID that the pm domain xlate will use to xlate the DT
>> binding to driver data structures.
> 
> Ok.
> 
> Cheers,
> Biju
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
