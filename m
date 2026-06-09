Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F85CD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1ucnw4KoKl/Whcdto/pbUOMJs8IDsakpAvf4JP/Npg=; b=L8AavSlmNV0CEw
	rq0MHb6jL148hW9AdNpmUVrsP1vC6CnL35HbTx/E4OsraO2ytwmsEzVYxE/DynlEi1/3x4A8J7sy6
	zCGnKUrdh7ySPWx2hDtaWqe1dGfwxWMH9DpYUe3y7XKaX35Gwf0JGNr+dKgH9tOlHdadH762/EqoZ
	0YkoMcbY/BTWjmhhzI+2YKKOTKU3GeOJTBP8paLSRQpTarj3RUqV0/kswUlLUKMqonOrdSUj0ybrz
	BZ0NaolmqBiVrQUbMeUuYl2YPMOgRr6Uv3L6N99wFHkqYnft/keq6d90xcjIh0qUqheomBuM4R8KO
	DP592wb37Ix5HYrUm+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvzz-00000005bmp-1E80;
	Tue, 09 Jun 2026 12:56:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvzv-00000005bmK-3j35
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 12:56:05 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-842319576d5so3111815b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009763; x=1781614563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OPsd5p+bgGWj9idOjFXHdxR+Xw6jiD+Pwhu8ahFJY28=;
        b=Ln0PPmZBWwhgvqwjx+3lZyHQb/powPhKIMf1fkEexh057gMVdC1wM1m1QsOvV/O/T9
         f9xxvPFD5/f5ylsXTOBVvpwS5Hz5xtXPSfh4rcUOwXIAcqml2LNt48YlnUzQjLOIFTnB
         BPP9xjzIK2Wjt1KHyBlA8dBkEA75so/nFRC/jfyC/qO7WRLkYUvZp7Tk0Ck1hm2H2EMd
         hU8mA9UrX9AlHIi6NYMDR8deHnjqqE+vkCEAOCet12i8eqidwWY8s3Bh5leRsABcrFel
         vVWq2KooqFDuxFGiapkxhHLzTF6Wz8tAdS6MfOAYYxJolyKSd3rlhvtSsZ2h/z91em8r
         5iKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009763; x=1781614563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPsd5p+bgGWj9idOjFXHdxR+Xw6jiD+Pwhu8ahFJY28=;
        b=q3C/eshOhdOGmvNJgnDZDVMpjENkYE8mtCRfjm68L7WNo+6SHS/NUBNgroGeT9JiDJ
         TlRH2QqJdnC+G2NLxDnxB9FSHzG2QC3uGtPrQPl9+sFvPSIEAl7N8HC22Z/AF5ey2q4w
         /yjSujMMvexCpS0/CTLoSrg6hcEUpo86ypPn/EdD3kZ5be/CAIGnswS46uGeV4CVVMlw
         gltyYzf0EiweVw1u6t2EzbzZPNae7rFND4FBcWKLdFGfAU3+Lk1lCq2v1rfMXES8YcQX
         yDBqi5Io0ZYvIypN6CqFkj8qEFo8KuSLpltzBSg3RYSnxIOai+masEVnHBFfngAQL6Dl
         LE8g==
X-Forwarded-Encrypted: i=1; AFNElJ/03mwBL34qgyz1KjELXSrPb9mBFT43b+r8UTepTy3QcnUfDjnR+fCMqBbks1WACLP5QN/sqm/1dd1aig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt6q247m+oX40tFq/CiTZkNGUdo7yUVTvr2Xi7KyPh0DNuALel
	yd4CVGbI9FwqR1Sgu3LbIUNRSVIZqRDuql28RlojUoXVauyE6270wIbe
X-Gm-Gg: Acq92OHTSTyNMUvvzfZDjAzN2KBdFfGPHB3xVwz3hTQhvTFH2NENGheIXP7ZlTYCZhk
	UrjDyePqaXU6rl4b3Bi8NOxHo9dbyEz+87ZJH2t9rzr05c1ShUbT164//PVzGsl+/1xCDayRna7
	ZPc0+R++VrXIeBhwjZC94RUrv2FdfOCscmIXASw9vrrxziXygyX9yEvYmc63qYFdOB+2lnI2qh4
	ErRj5tCwnBs0n8OMN+Seazz84oyTMTi9gPWd19+J8gf+j6uze7v7/IkJ2RMSZlEWZJWIlcUyCQY
	Ww6L1H68Qt26jGR4UYx5+fRxQTbKcJbOZfgxR01yFEvnkLRtviApfew1uxLbvP4C0ufES3+ubRu
	EK7f+V433xWPo1ETYTf/4AeOBpUCABZBn1exY7i+YSv39a8f2BZnk7m8epSWdnSD3iWB0yYqEK9
	KDGhcut+pkqTa5f9EFBsnJheimF7jgQ8zU4pqu9Deq+g4wGwFRBOSp4R96Ct9CLGqZvJnb+J1HY
	c0MiHl4ZKI=
X-Received: by 2002:a05:6a00:3e1e:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-8430a6731a4mr3004260b3a.16.1781009762535;
        Tue, 09 Jun 2026 05:56:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282379db0sm20259163b3a.24.2026.06.09.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:56:01 -0700 (PDT)
Message-ID: <35577504-76cf-4dd3-8f98-5fde03fc0a1f@roeck-us.net>
Date: Tue, 9 Jun 2026 05:56:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Valentina.FernandezAlanis@microchip.com
References: <20260603-ongoing-brunette-51e35be6d93e@spud>
 <fd92d7c9-9594-47b9-bd84-a6bd5ebae66d@roeck-us.net>
 <20260609-estrogen-entangled-da00ac932481@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260609-estrogen-entangled-da00ac932481@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_055603_964297_C900DBC7 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/9/26 02:43, Conor Dooley wrote:
> On Mon, Jun 08, 2026 at 10:03:48AM -0700, Guenter Roeck wrote:
>> On 6/3/26 06:19, Conor Dooley wrote:
>>> From: Lars Randers <lranders@mail.dk>
>>>
>>> Add a driver for the temperature and voltage sensors on PolarFire SoC.
>>> The temperature reports how hot the die is, and the voltages are the
>>> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>>>
>>> The hardware supports alarms in theory, but there is an erratum that
>>> prevents clearing them once triggered, so no support is added for them.
>>>
>>> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
>>> the remainder holds the voltage as a fixed point integer value. It's
>>> improbable that the hardware will work if the voltages are negative, so
>>> the driver ignores the sign bits.
>>>
>>> There's no dt support etc here because this is the child of a simple-mfd
>>> syscon.
>>>
>>> Signed-off-by: Lars Randers <lranders@mail.dk>
>>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Comments inline.
> 
> Cheers.
> 
...
>>
>> If regmap never returns errors this needs to be documented in the driver.
> 
> It's an mmio regmap via a syscon, it evaluates to readl()/writel() so
> there's nothing that can fail /and/ return an error.
> I mean, I can add if (ret) return ret, there's not a clean place to put
> a comment about it I don't think.
> 

No, there is no need to add dummy error checks.  Just add a comment
either at the top of the driver or maybe even better where the regmap
is initialized and explain the above.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
