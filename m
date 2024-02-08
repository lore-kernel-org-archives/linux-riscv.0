Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E656CC48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds11JsZsdQUQmAKExDGbDFLFVcPk++2vVDh9g4oNY5E=; b=3w7jlYIWgxnqAU
	0L1n3B5/XIn/Johm4PWeEbIcosCn2bFfakOkmXDNVK54YzBVclT8MJk1/973sovYxODjIZCZcpYVY
	SLfuKXJhS1WS8B4aveIVZCS/zt9aqRp07SOzXietLiq0K0VqAHe07yq6jGtBPx8iS+9c1kPQdQ577
	bcLLZftKkjyQ/16pf13JiRutcE388QT0FOn+i1nh5OaOQ1ac8rCEefUNCrdUENLIS/atstsj0tdLT
	edL8+XTG4qv8W7WDsNfSbFZYelDLju74Rqk1wtg/eir2/3FW4Ffhrw8EYyC4JsqX6QE2+wzTKMD14
	m5/Z10kUNrtJCeg/hegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY6bI-0000000ECcz-3aCu;
	Thu, 08 Feb 2024 15:46:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY6bD-0000000ECbu-0GHJ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 15:46:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40fe03cd1caso112595e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707407159; x=1708011959; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdw1R25OH/oj1h+/23MCaEFMxMiuRqj0tdTYwVW8hgc=;
        b=mcfGVkOsLkkGQXqRIvCLopCfQOpPyOnAdLFyUO5Cu0tto1eIUqu3WZUsuaGA8VMJve
         +duq56OuEnVr4AnVzLR/nwv9FYJcxeSQyKCHRr34YX2rXB2gfkSkg9E6w9B66YOi6bDt
         M9kLWehmryA1Eby+YuuZYKD7uyxFAyXAnb9q170c8yNOCe9sKKRL87ObjWlLkCJIp2ZG
         fIF9ODAum0/vEUf9A6sP2spJfBMcWDSKE9ns3AowCHaA4Ko/2cfvq0nTnylnR5KSaTTU
         p7mC6NOkEv33FS2wc8BeQMc1aMrBaT0jgow0iXC0l+gIKYykGKtxlCBAHIgBdt61FHxn
         nrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407159; x=1708011959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdw1R25OH/oj1h+/23MCaEFMxMiuRqj0tdTYwVW8hgc=;
        b=SKK9HAbJR44idTJfhqxxez7z1Q46ehdd3VafC+xN4Av6LhqzhzequiF0CiQJwj5ZiV
         xOawu37qsliskLLRGFe0PeVz7yO4KztYR/04I08kjhwTUjBPXCQoAA3Iu1RvT12Fsn4W
         0C9ZwVxL6uKVfShPLtQiwMcsClGV8aejQAgsmFX12quYyJfRyM5nH5+KG9yCiA08nZiD
         HFHFEuXKhEVPoaIu2EvsYLW/1WTBE7HZdWkJkw/idZfEHzct0Y/rn+KbusxkFGlb3PWU
         +HPHqnKsJkEA47fGToSfNkzsCnrwAUxF1nN66LMdtvXmKUTFGuaLfxfcKHlMDRJaq9FF
         WYSQ==
X-Gm-Message-State: AOJu0YwkKv9wfwYTSqPhgGYxd5GSUg1dRXFdtwzllptqVVdmnV7Yvcyx
	iDnzYtmvy/fDSwnw9PwYfUpCMf6E4bUcvZnshioQHm5QkeF+xpAF7C030/uuXlQ=
X-Google-Smtp-Source: AGHT+IGAkVBgi2v/9rwm8yJ8TS8SQmm7MTHynY1Wd3oKB5eyxjrqqLsN0IR9u4OlbaJ/45wh27lESw==
X-Received: by 2002:a05:600c:1910:b0:40e:fb76:5344 with SMTP id j16-20020a05600c191000b0040efb765344mr7185602wmq.11.1707407159502;
        Thu, 08 Feb 2024 07:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcyGuyqyRlo0NUXLCGq0I6rMtLOkVAraDOwhjdq9cKgLyFxUECiO4kdkrmZ1kQaMSAvok8ZDc8xbR4uGFS8qxzrtaGNGrJd+40sHT96YHNndFupwkup/1NCh0YbMfd50pRAKhBJbtERteZ2GToMHUJ7+i/t7P2ZO3eE0/VMJGm/NiRLdo3W82kRYO2vefJ0BPjXdpJtNwFX836t6EAs2SP0XZ6HlVb+2vHEbHwqgkb62ky2kpUXdSknN6wkvgcQFkNIaOqWT8l1VxcOvAmA8AVhE/siwkfNpbo2bUM3IwCf5inwF/inAk0kt/46uc/cMNDcfYLisRDRv3V7QzVB7OfxioKLn7sWGbW51WYd7UPfTtRGiMqzI99hrCoWVVHmV9N5viwzkI7zgauTyDgXXpXRXyXBQOdbbqr5rKn9o+19lJN0RGIBMDVd1V0dOewI4Y8jmfc8NEY5QOmroUEJM/WaGmfBq9BsQOsBD23WVzvA4Ldfi1ZxJIWSDABDRGesF0zwoDujL0ntkcUHEpaEZoVdMqovSuCv9cOluPCcwjy/P718QDgIZwCET7HU+xrsvY7j608GVrctHNxaSjT6t9mC6pb42lrROg+
Received: from [192.168.50.4] ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id w9-20020a05600c474900b004101f27737asm1981436wmo.29.2024.02.08.07.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 07:45:58 -0800 (PST)
Message-ID: <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
Date: Thu, 8 Feb 2024 17:45:57 +0200
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_074603_248327_734EFC97 
X-CRM114-Status: GOOD (  12.85  )
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

On 08.02.2024 16:30, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Thursday, February 8, 2024 12:43 PM
>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
>> IDs
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48 +++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-
>> bindings/clock/r9a07g043-cpg.h
>> index 77cde8effdc7..eabfeec7ac37 100644
>> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
>> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
>> @@ -200,5 +200,53 @@
>>  #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
>>  #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
>>
>> +/* Power domain IDs. */
>> +#define R9A07G043_PD_ALWAYS_ON		0
>> +#define R9A07G043_PD_GIC		1
>> +#define R9A07G043_PD_IA55		2
>> +#define R9A07G043_PD_MHU		3
>> +#define R9A07G043_PD_CORESIGHT		4
>> +#define R9A07G043_PD_SYC		5
>> +#define R9A07G043_PD_DMAC		6
>> +#define R9A07G043_PD_GTM0		7
>> +#define R9A07G043_PD_GTM1		8
>> +#define R9A07G043_PD_GTM2		9
>> +#define R9A07G043_PD_MTU		10
>> +#define R9A07G043_PD_POE3		11
>> +#define R9A07G043_PD_WDT0		12
>> +#define R9A07G043_PD_SPI		13
>> +#define R9A07G043_PD_SDHI0		14
>> +#define R9A07G043_PD_SDHI1		15
>> +#define R9A07G043_PD_ISU		16
>> +#define R9A07G043_PD_CRU		17
>> +#define R9A07G043_PD_LCDC		18
>> +#define R9A07G043_PD_SSI0		19
>> +#define R9A07G043_PD_SSI1		20
>> +#define R9A07G043_PD_SSI2		21
>> +#define R9A07G043_PD_SSI3		22
>> +#define R9A07G043_PD_SRC		23
>> +#define R9A07G043_PD_USB0		24
>> +#define R9A07G043_PD_USB1		25
>> +#define R9A07G043_PD_USB_PHY		26
>> +#define R9A07G043_PD_ETHER0		27
>> +#define R9A07G043_PD_ETHER1		28
>> +#define R9A07G043_PD_I2C0		29
>> +#define R9A07G043_PD_I2C1		30
>> +#define R9A07G043_PD_I2C2		31
>> +#define R9A07G043_PD_I2C3		32
>> +#define R9A07G043_PD_SCIF0		33
>> +#define R9A07G043_PD_SCIF1		34
>> +#define R9A07G043_PD_SCIF2		35
>> +#define R9A07G043_PD_SCIF3		36
>> +#define R9A07G043_PD_SCIF4		37
>> +#define R9A07G043_PD_SCI0		38
>> +#define R9A07G043_PD_SCI1		39
>> +#define R9A07G043_PD_IRDA		40
>> +#define R9A07G043_PD_RSPI0		41
>> +#define R9A07G043_PD_RSPI1		42
>> +#define R9A07G043_PD_RSPI2		43
>> +#define R9A07G043_PD_CANFD		44
>> +#define R9A07G043_PD_ADC		45
>> +#define R9A07G043_PD_TSU		46
> 
> Not sure from "Table 42.3 Registers for Module Standby Mode"
> 
> Power domain ID has to be based on CPG_BUS_***_MSTOP or CPG_CLKON_***
> As former reduces number of IDs??

If I understand correctly your point here, you want me to describe PM
domain in DT with something like:

power-domains = <&cpg CPG_BUS_X_MSTOP>;

where X={ACPU, PERI_CPU, PERI_CPU2, REG0, REG1} ?

With this, I still see the necessity of a 3rd identifier that will be IP
specific to be able to uniquely match b/w DT description and registered
power domain. FMPOV, this will lead to a more complicated implementation.

We need a unique ID that the pm domain xlate will use to xlate the DT
binding to driver data structures.

Thank you,
Claudiu Beznea
> 
> Cheers,
> Biju
> 
>  
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
