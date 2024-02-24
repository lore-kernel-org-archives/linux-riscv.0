Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D944DC48BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Feb 2024 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVKYViKQAdYn2CyfZ68EWp+8m/WOJlW6fR+12OrHPlg=; b=DdyE4+x+t6hyJ7
	826ODqLr0F6Vo1ai1k9yjBGswh3IxpL+Ye0YuqEwAviNxvo84Yb9Blq1N3TjL7xAMvT82S5Qb4yQg
	5Drie/tBncclFyU9NhE7wm/FOQFpYYDzPzlmo302nStigC9d5fe99Xtv6CakPAzr9R4eBrOgwZQIC
	mfPRhBn3m3YzwBUWwJAVMWmlIfylelWbqjRVvccHFO+/xYkD70m1yaId27QLsIvrfsTB5z3/vS6MG
	e0d/wjc0E9OQcb2CEJKPWBFMhXLKPs3eBUa9J96S65cMbSDQnidPwG+72pViqZzgL4haOimqfYrvy
	gyKVKcUbV+zC54zzM7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdngT-0000000CNMH-3wK5;
	Sat, 24 Feb 2024 08:47:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdngR-0000000CNLr-0Yyf
	for linux-riscv@lists.infradead.org;
	Sat, 24 Feb 2024 08:47:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso144424666b.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Feb 2024 00:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708764417; x=1709369217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uQysh1tH0jeyP3+ZDv9awCKHowkCysHFdeN8I61EIUE=;
        b=ssJHAjLhK2qHALt6WkorzkPSK9ypMXeoW9fpuIONXp0qWsnHlb+DwQNLXYnkov6lcR
         EZLpC3D3jEekCpRJccIsqh1o0jVSDJoxHH7qGW8XSBncZOWFBmkUJESGJrBLmclVWVG/
         16BbBePBFh686c+12VcpdPuL+Ns95QkAU8aSJAvNr7Vca0tVeescvh2ZjihNCuTb7dH5
         D6HrzMmF6eLWyccCyf90Nk6SxoQtbhUPKvsGXASOEeAge3j2R1PVuqWvOMaRItm3MP4M
         jf7owy69ahTQzk2WnbRlWEIAjwmy2sprtV1y7j0U8fRy+T87GRcq41PIGcYyEj3ddpvo
         uEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708764417; x=1709369217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQysh1tH0jeyP3+ZDv9awCKHowkCysHFdeN8I61EIUE=;
        b=Cfg9xeeCtHlwtabBKagBLUUBMS2fOyl/3SMOMi0JCtC5OQUNjakRiEn2EvrYrxi3mS
         Grpk62FAEykWnw972zaMUt5G0WaihPM0Hk3h3/4eyq6Q4+oW34Jk2IcRat3452Eol97h
         XKwCV9tIjNWRUUe38SOQ12wavxP2ozdx3xIW2BX1hQd1uf65eH8uVHyD/Rb5ExFszjF3
         RTORBYSUy63cCt6dRqLnp6S2O3GPQZr3KGqekNbgQOiegIeZRV0MjqO9On1QF8L5bMVU
         mw6wfITqIl7234a4wx9ZT46zZ0mrcejGEaYdGTlSIKXdDDL6ShaHteoDcADlRFnx2Erv
         geNw==
X-Forwarded-Encrypted: i=1; AJvYcCXVJevhJtbdsd0wWedN70qX93MTG29xcAO9j4NTuBaOIMGRYi5cl4kAt39viBDhDICA4PzlYrCzoIuJjOvP4uq2aYAQfUX2UQ/QFqkM8awe
X-Gm-Message-State: AOJu0YzKMU1NHnyIZ9Tg/pKNh/UOEfuzH+s3MAOEzpK80dawn2UtBrTh
	ZUHpPVZCUQbPohJ/F99EVgYm96PZPLBw7C593sUQcLLXZCZqjctXaO73lSJ8mek=
X-Google-Smtp-Source: AGHT+IGH7Uz7DtLCRUzZ8GnLAm2yi0SvftEtprhNdwkbFzuM51lAqDr9sT7DV7ws1UzELrEI4O8kmg==
X-Received: by 2002:a17:906:248b:b0:a41:56a8:a967 with SMTP id e11-20020a170906248b00b00a4156a8a967mr1276901ejb.63.1708764416988;
        Sat, 24 Feb 2024 00:46:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id pk24-20020a170906d7b800b00a3ed811cff9sm387349ejb.154.2024.02.24.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 00:46:56 -0800 (PST)
Message-ID: <caea26e2-6598-4796-b199-4ee5b1b9cd30@linaro.org>
Date: Sat, 24 Feb 2024 09:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/6] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Alex Soo <yuklin.soo@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Hal Feng <hal.feng@starfivetech.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
 <20240220064246.467216-2-yuklin.soo@starfivetech.com>
 <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
 <20240220-bottling-reverence-e0ee08f48ccc@spud>
 <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
 <20240223002443.GA3877354-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240223002443.GA3877354-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_004659_259535_98E22B7C 
X-CRM114-Status: GOOD (  16.45  )
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

On 23/02/2024 01:24, Rob Herring wrote:
> On Wed, Feb 21, 2024 at 08:24:26AM +0100, Krzysztof Kozlowski wrote:
>> On 20/02/2024 20:10, Conor Dooley wrote:
>>> On Tue, Feb 20, 2024 at 09:11:43AM +0100, Krzysztof Kozlowski wrote:
>>>> On 20/02/2024 07:42, Alex Soo wrote:
>>>>> Add documentation and header file for JH8100 pinctrl driver.
>>>>>
>>>>> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
>>>>> ---
>>>>
>>>>
>>>> RFC? Why isn't this patch ready for review?
>>>
>>> The TL;DR is that Emil and I didn't want to apply the dts patches to
>>> support a platform that hadn't actually been taped out yet. 
>>> For an SoC in that state, at least the bindings for, clock and pinctrl
>>> could be subject to changes before tapeou. I think putting RFC on those
>>> patches is a good idea, but of course the rationale should be mentioned.
>>
>> That would be useful information. We also could mark some bindings
>> unstable and accept breaking ABI under certain conditions, like that it
>> is early work without users for long time.
> 
> The challenge with that is when do things get marked stable? No one has 
> any motivation to do that (unless users complain). For example, We have 
> a couple of platforms that have an unstable bindings statement that has 
> been there "forever".

I see. Let's see what I can do for existing "unstable" platforms, but
your argument makes sense - rarely people remember to un-unstable
bindings and there aren't that many incentives for maintainer to do so.

> 
> I would like a solution though. The only idea I have is passing 
> SystemReady cert, but that's an Arm thing.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
