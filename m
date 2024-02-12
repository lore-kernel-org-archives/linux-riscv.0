Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4409C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh1LdgOF7W7Nsd87Uo9t0LsE9sG6UjsAMaQP9oQa1TI=; b=CUO2oRDbQxhgYz
	CtGhopkkNWvOb9b389u9hibFQimhJZoq94+taDS80uFYGRI39tVowm+FY/8WJetLH1iHXZaf1Yqj+
	Ok6J0QakUVf6QUqUwnM6DcxA7xI2VS3QUvYqF8IewhHaglhlrrY/u7yqdngoeWcW8jlumHXtkrJ+k
	fihSblzCehW55HkaSRQCoG4XYjgX9j73Pvkpl6AOEEfdTBCCXR6NDL4wUlr867jBDt5ee/XRI0Tyy
	Yz2+jnMlCpAHwMbg1et/3mCADy33RpXXxntI2K3VufuSW1V4XAKa3S5aBcSCkAmLWWc/TRmmwxwNt
	54V31H4jbUtmJcE3iBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTN9-00000004q9r-3O6p;
	Mon, 12 Feb 2024 10:17:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTN7-00000004q9R-0ovi
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 10:17:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-410e8412b54so3280965e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707733027; x=1708337827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dd4aZvMpVCCSCnP/v1/q3mbmiSL+tNaXKE5+hDn+73Y=;
        b=gAkGLw8Qh+TVfcSpAH8xqjPUDiAJgvlHYHEfct3S3s50AnHxZKZYUSYelX9vp6Bkte
         bAF5CFIOZHGfkvrrzyDzEe60O7YYzBhmhjTzhzIsgDXAw9b9weifaXIPCma89LAUhVl3
         r68CC8Tn652IaNJHSZuD/HGpeO0Xtu5872rd8yPh5IhV5qyTIeMtUSkE2GaSojNU55Gc
         Cuz7E2w9fr1D4rGfj4EimO8H/aQvO/DKd286G8cy8lKgOLq5mDBZ/0EHuhcpnaX+aSEl
         gxxOvG6GjZsyE4fnJTfNr9/0jk9t+acnevyR2BUoRRTvrJVXl7WpPC7Zk/YF5nu7cAEr
         ZYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733027; x=1708337827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd4aZvMpVCCSCnP/v1/q3mbmiSL+tNaXKE5+hDn+73Y=;
        b=m3I4AJKfWx0szB7NEq0/ZHu2HrMCEolEWDK8HFkefDr3idqPQN2IRzDKE9Pq9qtXK/
         cAcfnP9LqXxiDH46wDv3oDGMmOzPltHrdiYJii1aKp6ccjWHws/IUzG4bY4nJKCp6Hzf
         ijFlVycQFdqtZEcUgiowqg63X/Gh32OKrSIvuTDLmyjg8edCfs3OOOATfzqcUrAuqgoO
         tB2SD5NDQ+Mhve14wgRZG8j6eDpWZXr60IPhAwDtJIixZqFeDDg1KLBuBw7J3Krh/UAQ
         +WbIF6VlPcSiozpicGcjOKW9YfTfYFgfD+B4RdxN0sl3o/386jWOqKOjeoZfhdCNIA52
         MZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9EM76W/lHiWBeR5WqNVZDgplG1JZlQe7QTUygpYjsQRgrJABhVntmkP1k4C2/t7A20HqZS4AxzoYGcXecSSJ4Oc7xTZJq0vbRszfxkzLT
X-Gm-Message-State: AOJu0Yy3NZUcEeoM1i4XcOvseUd3m8HgGd7sxSzdS9+WZZCO/F1MiZRD
	UjQqIvYh+7KnfdTC3NcvqRmqJtQqA9HP9mLK/uhbnefD018hpaCJliYEe4+M8IU=
X-Google-Smtp-Source: AGHT+IGKS3cAGeO91ncUkS3BzIDpmHkJlAP3rM+a3pmivE6RK7mO5OdH3h9r0soPZ9FeRjTndSpbEg==
X-Received: by 2002:a5d:424c:0:b0:33b:2633:b527 with SMTP id s12-20020a5d424c000000b0033b2633b527mr3644735wrr.20.1707733027133;
        Mon, 12 Feb 2024 02:17:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS/3bn8x9wSB7hJgZQQQrZrpThyplym6YpI1SmaffkSK9Gu6jVbETHmPWZMZqGD1Fg2+QLCoZoCyd9dnjfWoyfsoDHlcF/jIiLKg5yZgaIjxKBAMyAuaECBDDnoc7lsqe7q88rWP0Y8l02G6zcDi/R3sZcfbP8HiKNA9OlwtBxyhH/kFA0xnSUM7pmTfpfG2DamdFGrwiEpY+BsAlIY+UIYJ+rvA78pOQo0XD9DtPzBrE7stOgKFvNrF0YLau0mvSIEGsXvfzvgPKP2TWnOk5L2DOy4ZAHx+658d/wSUiYHHFl+VaMyvKc7WMiGMteUFTbvzYgIPdG1/QLejKIcvW9pS14KJQj7yjzDwFeUA9ZixxC3gZimROIfJ9WwA3s/6TQ95ydu1DQvAvwrVB3s4EfEcbKNu16EA8e94Ti9hy3OR82BtHyNWVJCmKzfhBQ70PlX6VVj7kzL6E/PVg0YU2ntyFy+GYTF055BsUf8fQrEZA3i4qkK0EZowXjb9QWa7mY6BZFL334+cGk4S8cygYcXQMW/cy47OHIj4Xf/Q2LP4faE9KA4V4Q8F4/L2MGhdo7Dm5z/T3HVCfHQTVpqLflPKshZll1Nao2
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033b44456463sm6320751wrd.106.2024.02.12.02.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 02:17:06 -0800 (PST)
Message-ID: <b484c9ef-254e-4cdb-8409-6f0af1171335@tuxon.dev>
Date: Mon, 12 Feb 2024 12:17:05 +0200
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
 <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
 <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <786f90f4-ba47-46cb-b5e0-e3c42b1b741a@tuxon.dev>
 <TYCPR01MB11269A240E2EDD460D0B97B9786482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11269A240E2EDD460D0B97B9786482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_021709_391398_02C3C205 
X-CRM114-Status: GOOD (  26.82  )
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



On 12.02.2024 10:59, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Monday, February 12, 2024 8:02 AM
>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
>> domain IDs
>>
>> Hi, Biju,
>>
>> On 08.02.2024 21:20, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Thursday, February 8, 2024 4:53 PM
>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be;
>>>> mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
>>>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
>>>> magnus.damm@gmail.com; paul.walmsley@sifive.com; palmer@dabbelt.com;
>>>> aou@eecs.berkeley.edu
>>>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org;
>>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>>>> riscv@lists.infradead.org; Claudiu Beznea
>>>> <claudiu.beznea.uj@bp.renesas.com>
>>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>> power domain IDs
>>>>
>>>>
>>>>
>>>> On 08.02.2024 18:28, Biju Das wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Thursday, February 8, 2024 3:46 PM
>>>>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>>>> power domain IDs
>>>>>>
>>>>>> Hi, Biju,
>>>>>>
>>>>>> On 08.02.2024 16:30, Biju Das wrote:
>>>>>>> Hi Claudiu,
>>>>>>>
>>>>>>> Thanks for the patch.
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>>>> Sent: Thursday, February 8, 2024 12:43 PM
>>>>>>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
>>>>>>>> power domain IDs
>>>>>>>>
>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>
>>>>>>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
>>>>>>>>
>>>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>> ---
>>>>>>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
>>>>>>>> +++++++++++++++++++++++
>>>>>>>>  1 file changed, 48 insertions(+)
[ ... ]

>>>>>>>> +#define R9A07G043_PD_TSU		46
>>>>>>>
>>>>>>> Not sure from "Table 42.3 Registers for Module Standby Mode"
>>>>>>>
>>>>>>> Power domain ID has to be based on CPG_BUS_***_MSTOP or
>>>>>>> CPG_CLKON_*** As former reduces number of IDs??
>>>>>>
>>>>>> If I understand correctly your point here, you want me to describe
>>>>>> PM domain in DT with something like:
>>>>>>
>>>>>> power-domains = <&cpg CPG_BUS_X_MSTOP>;
>>>>>
>>>>> MSTOP bits are distinct for each IP.
>>>>>
>>>>> <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
>>>>>
>>>>> 2=MTU IP
>>>>>
>>>>> 4= GPT
>>>>>
>>>>> etc...
>>>>>
>>>>> Is it something work??
>>>>
>>>> It might work. But:
>>>>
>>>> - you have to consider that some IPs have more than one MSTOP bit,
>>>> thus, do
>>>>   we want to uniquely identify these with all MSTOP bits (thus the
>>>> 2nd cell
>>>>   being a bitmask) or only one is enough?
>>>
>>> We can have an encoding in that case 8:16 24 bit entries
>>
>> I consider this complicates the bindings. I don't consider this is the way
>> going forward. But I may be wrong. I'll let Geert to give his opinion on
>> it and change it afterwards, if any.
>>
>>>
>>>> - some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as of
>> my
>>>>   current research), so, only PWRDN
>>>
>>> Why do we want to add power domain support for DDR?
>>
>> To power it up (in case bootloader does any settings in this area) such
>> that the system will not block while booting.
> 
> DDR is enabled by TF_A and is not touched by linux, so why are we adding
> Power domain at all in first place. TZC DDR is not accessible in normal world.
> 
> So if you don't add DDR power domains, linux doesn't know about any thing about
> and it should work like current case.

It is related to the way MSTOP and PWRDN hardware features works together.
PWRDN allows you to save more power by setting IP specific bits in this
registers after you set the MSTOP.

OFTDE_DDR and TZCDDR have PWRDN bits dedicated as well as other IPs (e.g.
serial, ethernet, etc) in CPG_PWRDN_IP2. Setting CPG_PWRDN_MSTOP_ENABLE to
CPG_PWRDN_MSTOP applies the power down for the IPs specified in
CPG_PWRDN_{IP1, IP2}.

It may happen (as in my case) to have a bootloader that sets all the bits
in CPG_PWRD_{IP1,IP2}.

If you want to save power for the other IPs listed in CPG_PWRD_{IP1,IP2}
you have to instantiate power domains for the blocks that you don't want to
be powered down due to setting CPG_PWRDN_MSTOP_ENABLE to CPG_PWRDN_MSTOP,
to power them up. Otherwise the system will block when setting
CPG_PWRDN_MSTOP_ENABLE to CPG_PWRDN_MSTOP (if bootloaders previously did
some settings in the above specified registers).

Hope it was clear.

Thank you,
Claudiu Beznea

> 
>>
>> It is explained in cover letter:
>>
>> The current DT
>> bindings were updated with module IDs for the modules listed in tables
>> with name "Registers for Module Standby Mode" (see HW manual) exception
>> being RZ/G3S where, *due to the power down functionality*, the DDR,
>> TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due to
>> the following lines of code from patch 7/17.
>>
>> +       /* Prepare for power down the BUSes in power down mode. */
>> +       if (info->pm_domain_pwrdn_mstop)
>> +               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base +
>> + CPG_PWRDN_MSTOP);
>>
>>>
>>>> - some HW blocks have both MSTOP and PWRDN
>>>
>>> That will be an array right?
>>
>> I'm not sure what you want to say here.
> 
> This has to be an array PM domains(multi PM domain) like clocks?
> 
> Or 
> 
> It can be  handled as sibliling power domain like sibling clocks in RZ/G2L Gbether.
> 
> Cheers,
> Biju

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
