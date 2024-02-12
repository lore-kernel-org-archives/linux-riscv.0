Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA8C48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucre04W+5Z/Mn+vQgeaB5XE5KrEeHKLaM05iqiBaZqE=; b=FpRi5p/Iz9yFNI
	INT1EhBQBGHNK+NXSMuQfW6B6+pqWYMxkEsq2MpcBe3A80KbZKfSUfwdPZhJ4Vh8rnQcSICVDUNd2
	C7SI6k5Pb/DXHKgouiWsOWzXag0hJx58oyHKGVr9e3PX6vCBzL7R9DOPQ9htiRqdoFE+DUfUCyRxl
	lAx0lzMayY/5H5/hyQAE1w0g+gice6TIFvRfMf95H+8yxC+Af1DoiRjrmaeebWpce8ewszRucYTey
	LohCeh7MYkXa4QzPMjLL0fu0hf8J+KxPlKW+aRcB3ulcAFF5pFdhnMZOMej4tZ6fdJgCPhDf+cKCH
	1gUu3/oaKvW4owuMSX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRGi-00000004ZyT-0F8D;
	Mon, 12 Feb 2024 08:02:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZRGe-00000004Zvf-2koc
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 08:02:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5118290fcd8so1356811e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707724938; x=1708329738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N6kTSFvoJSCAb4IlPNruLyHFuh4E6JyGL/srfT6B6AA=;
        b=ToVd5p31nAysAOyiTtbZ4BEemFTtjTP9NvJ5miYjDC//WUIaVM1ckOsLgqW2oSK6//
         BsJEsGn6aeaf/+ODNQ068g7WUJWY8sRyz4s0Nq7UfVueZMCMNJHIrNbY3qNIKqqWDF14
         x8kLbrH6TVCrPBBmjaOsAdq9uK6FSxAZUi3i12j/o4bDOQgAF3TrOU5Jt+1kRrKcDyHh
         riLdzEGf5TyArn4oeSXMpiSjNaJsj9uP/Pe35hIdZ+UnOE1UALPEA1guub77IuGbqxZm
         EQKKsSXkpPJwrzpZZCP9pbZHS0hc6/h63RwcX5MPqpTUzLYHsMhC36RrMP1NM7Gu7CDO
         fMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707724938; x=1708329738;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6kTSFvoJSCAb4IlPNruLyHFuh4E6JyGL/srfT6B6AA=;
        b=SmPe7FzyboxkefEmVp9YA4V51lSImuvTh+F4xBeTolZ0qyfhW6S0FNG72BXZswCjWj
         4kM/SlZiotg327/iTlpyyhLhSX7GEstndFQH5LsflLGn9y0U4LZsby56HRrkegMzlYZ5
         vpBZblHsa+MO8mvKkD4pnZo9YeadahVU1zWJkE/JkojLwR1ARpU8aA8StoDxN7V+6hDd
         0ikvr9YAU3YFSPV3lrPEzrbg2+l/hdto7xaam3l69bMAbn2IUjS64hPWXE95GPQCtdDM
         550MVPBo4lgV0vcgaPSf717lOGxhVbVmY+v5kS5XG9phfH3g0Z7PMtemim6MN/DoTnlT
         tPdA==
X-Gm-Message-State: AOJu0YzlwfrKpjpmHi7tknetx32Yg/xUCC175R5Ihw0WejfAVSl9Q+66
	y9HVOSYYAl7MQOyzNe34iqXkPWJQrQeQsRsyd+PjIforObSUNMcqnhgivNJ38sY=
X-Google-Smtp-Source: AGHT+IHG7OGpNSz9MlIuHcO4LBN+HJoInPI5M3S3vsLEw4kJHoBn2YhvjFBlChl80qBp5evbBnMI+A==
X-Received: by 2002:a05:6512:3048:b0:511:676e:a491 with SMTP id b8-20020a056512304800b00511676ea491mr4147982lfb.18.1707724938071;
        Mon, 12 Feb 2024 00:02:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUIg9O3xUyXBEbp8LJcUWz3ubiINArcruNd79t1KPHWFs+g/LKuZCzvUtAXH3hEVkWyDXCkUwHkdnGLXp0DkYfnjwNrPVajP3shIvkwB9Si2MhbQIwjXV+J+6alE2zCSKUkT3iIZeO2C4U7UOWYKp96xX54xHAZ57qTSwkzY0PhzjotDCE5cF2f/YxiPBD/ob/FQUc3uT94vQ9+vHBmg0aK+RtQle0AxKtAbompXD/Yx9c3gTPZKt4QjWbcj6MtKf+lH3FM98D/cfpkDxHsiCxmt++mcU5MM8vIFhGSYnFXNX2Q25fgZFcLE2yQSNzFMH18QBpwDhkQSqSZFjDnNehyAYzbK88R1wO5aEwAbcdBzlo4nPJOHxmkPbp727Gg+50qzLq2HzJ9xOgtcDizf6Swin/Yh572ZiUNZArYue6PJTmTwD7O8AVQitaxunV3WIBqnlZlExKDFFzE50w21RiDDwb4E6v2gZoRvekjBjoxCbhN2gCc9rmbZWFuDVEUDe9d6tSqduFB1Ej09OY9iGzwaoQV7oYU6YmsWSQDNGrCEt7pjm1UlUHcJn4SHcybH0vcIdpqfcX4qwmJGzocoFL7Np9hurPsFsH
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b00411062c123esm390222wmo.26.2024.02.12.00.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 00:02:17 -0800 (PST)
Message-ID: <786f90f4-ba47-46cb-b5e0-e3c42b1b741a@tuxon.dev>
Date: Mon, 12 Feb 2024 10:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
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
 <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
 <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_000220_836911_BED26683 
X-CRM114-Status: GOOD (  19.58  )
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

Hi, Biju,

On 08.02.2024 21:20, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Thursday, February 8, 2024 4:53 PM
>> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be;
>> mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
>> magnus.damm@gmail.com; paul.walmsley@sifive.com; palmer@dabbelt.com;
>> aou@eecs.berkeley.edu
>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> riscv@lists.infradead.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
>> domain IDs
>>
>>
>>
>> On 08.02.2024 18:28, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Thursday, February 8, 2024 3:46 PM
>>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>> power domain IDs
>>>>
>>>> Hi, Biju,
>>>>
>>>> On 08.02.2024 16:30, Biju Das wrote:
>>>>> Hi Claudiu,
>>>>>
>>>>> Thanks for the patch.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Thursday, February 8, 2024 12:43 PM
>>>>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
>>>>>> domain IDs
>>>>>>
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
>>>>>> +++++++++++++++++++++++
>>>>>>  1 file changed, 48 insertions(+)
>>>>>>
>>>>>> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h
>>>>>> b/include/dt- bindings/clock/r9a07g043-cpg.h index
>>>>>> 77cde8effdc7..eabfeec7ac37
>>>>>> 100644
>>>>>> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
>>>>>> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
>>>>>> @@ -200,5 +200,53 @@
>>>>>>  #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
>>>>>>  #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
>>>>>>
>>>>>> +/* Power domain IDs. */
>>>>>> +#define R9A07G043_PD_ALWAYS_ON		0
>>>>>> +#define R9A07G043_PD_GIC		1
>>>>>> +#define R9A07G043_PD_IA55		2
>>>>>> +#define R9A07G043_PD_MHU		3
>>>>>> +#define R9A07G043_PD_CORESIGHT		4
>>>>>> +#define R9A07G043_PD_SYC		5
>>>>>> +#define R9A07G043_PD_DMAC		6
>>>>>> +#define R9A07G043_PD_GTM0		7
>>>>>> +#define R9A07G043_PD_GTM1		8
>>>>>> +#define R9A07G043_PD_GTM2		9
>>>>>> +#define R9A07G043_PD_MTU		10
>>>>>> +#define R9A07G043_PD_POE3		11
>>>>>> +#define R9A07G043_PD_WDT0		12
>>>>>> +#define R9A07G043_PD_SPI		13
>>>>>> +#define R9A07G043_PD_SDHI0		14
>>>>>> +#define R9A07G043_PD_SDHI1		15
>>>>>> +#define R9A07G043_PD_ISU		16
>>>>>> +#define R9A07G043_PD_CRU		17
>>>>>> +#define R9A07G043_PD_LCDC		18
>>>>>> +#define R9A07G043_PD_SSI0		19
>>>>>> +#define R9A07G043_PD_SSI1		20
>>>>>> +#define R9A07G043_PD_SSI2		21
>>>>>> +#define R9A07G043_PD_SSI3		22
>>>>>> +#define R9A07G043_PD_SRC		23
>>>>>> +#define R9A07G043_PD_USB0		24
>>>>>> +#define R9A07G043_PD_USB1		25
>>>>>> +#define R9A07G043_PD_USB_PHY		26
>>>>>> +#define R9A07G043_PD_ETHER0		27
>>>>>> +#define R9A07G043_PD_ETHER1		28
>>>>>> +#define R9A07G043_PD_I2C0		29
>>>>>> +#define R9A07G043_PD_I2C1		30
>>>>>> +#define R9A07G043_PD_I2C2		31
>>>>>> +#define R9A07G043_PD_I2C3		32
>>>>>> +#define R9A07G043_PD_SCIF0		33
>>>>>> +#define R9A07G043_PD_SCIF1		34
>>>>>> +#define R9A07G043_PD_SCIF2		35
>>>>>> +#define R9A07G043_PD_SCIF3		36
>>>>>> +#define R9A07G043_PD_SCIF4		37
>>>>>> +#define R9A07G043_PD_SCI0		38
>>>>>> +#define R9A07G043_PD_SCI1		39
>>>>>> +#define R9A07G043_PD_IRDA		40
>>>>>> +#define R9A07G043_PD_RSPI0		41
>>>>>> +#define R9A07G043_PD_RSPI1		42
>>>>>> +#define R9A07G043_PD_RSPI2		43
>>>>>> +#define R9A07G043_PD_CANFD		44
>>>>>> +#define R9A07G043_PD_ADC		45
>>>>>> +#define R9A07G043_PD_TSU		46
>>>>>
>>>>> Not sure from "Table 42.3 Registers for Module Standby Mode"
>>>>>
>>>>> Power domain ID has to be based on CPG_BUS_***_MSTOP or
>>>>> CPG_CLKON_*** As former reduces number of IDs??
>>>>
>>>> If I understand correctly your point here, you want me to describe PM
>>>> domain in DT with something like:
>>>>
>>>> power-domains = <&cpg CPG_BUS_X_MSTOP>;
>>>
>>> MSTOP bits are distinct for each IP.
>>>
>>> <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
>>>
>>> 2=MTU IP
>>>
>>> 4= GPT
>>>
>>> etc...
>>>
>>> Is it something work??
>>
>> It might work. But:
>>
>> - you have to consider that some IPs have more than one MSTOP bit, thus,
>> do
>>   we want to uniquely identify these with all MSTOP bits (thus the 2nd
>> cell
>>   being a bitmask) or only one is enough?
> 
> We can have an encoding in that case 8:16 24 bit entries

I consider this complicates the bindings. I don't consider this is the way
going forward. But I may be wrong. I'll let Geert to give his opinion on it
and change it afterwards, if any.

> 
>> - some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as of my
>>   current research), so, only PWRDN
> 
> Why do we want to add power domain support for DDR?

To power it up (in case bootloader does any settings in this area) such
that the system will not block while booting.

It is explained in cover letter:

The current DT
bindings were updated with module IDs for the modules listed in tables
with name "Registers for Module Standby Mode" (see HW manual) exception
being RZ/G3S where, *due to the power down functionality*, the DDR,
TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due
to the following lines of code from patch 7/17.

+       /* Prepare for power down the BUSes in power down mode. */
+       if (info->pm_domain_pwrdn_mstop)
+               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);

> 
>> - some HW blocks have both MSTOP and PWRDN
> 
> That will be an array right?

I'm not sure what you want to say here.

> 
>> - if future hardware implementation will spread the MSTOP bits for one IP
>>   to more than one register then this proposal will not work
> 
> That will be an array right?

Same here.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
