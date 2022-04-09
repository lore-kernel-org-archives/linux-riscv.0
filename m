Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8056C4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39HuwTaJYmf12uvaapt9iARipopK2phRzGRcJT4K7Ms=; b=NSRd4yzcTHlkTz
	RIWi28kRe8Dlk2u4g/yTdz8Jxhvm+52serRwYVkR00c9kc9TltAmoRtT2OXg4sxCCZUZo4twFwHbL
	DcRMrDkn1zvSGlH1vnm8lUwmS1bkXn3Dx1Jh0Zn14/zn95sueZSsiqEoNuFywMDv9lKoDeVeUFQYV
	79QPzCSf0+qkdWalrbMCshd8ohoPl129EYRbNqvHL9FqgTGEXPKUMkYTvgVZFg/q+9KnjaETO1ouV
	34FBuzm11/EhERzqhLFLZG8TLp1ayQSC0LnoO2h5+wMX5FNy6V9oI1jM4YFGHZuhmM9AcBl5xOXrL
	b3wQ5YP2+vXOQprh2ozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd8ak-002qxI-Ar; Sat, 09 Apr 2022 10:45:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd8ah-002qwL-BL
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 10:45:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id dr20so21727115ejc.6
 for <linux-riscv@lists.infradead.org>; Sat, 09 Apr 2022 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=frRIq19w6WV8+V8P0b/MeZBdiHuZnJaDLS8GaGxMM0g=;
 b=UJKPFzFkhPlU90x+FAxJJAUNeeH7VdTNuVjumrMlXey8GJyRr4IboTWF7O6V6QH40P
 BzyiQXGoEKMJK3ZbHmBlBWCO+juOwXZH/mkNUv22tE1wCwBQsw+t02oKkvNrbiY2v4Xo
 C/ASq7GQpYnkpIA7XL1FkY16BvA3JDnP/+yiEL5EqONnzfa8KSfFHU8aDEl9bvmPwHXn
 bnB54ppjFcjxIfYI3vVKVIUerU1fvwgej/6xrtwIgIIVp41TBM/F8+v7fr3AXH22t+BI
 SnfxhcJ+Lc92ACx7uzqRSyA31P7d0c4NDbPF3XJ2UfKkKE6A0uHAgVlRQcCJ6V9dN/sz
 a33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=frRIq19w6WV8+V8P0b/MeZBdiHuZnJaDLS8GaGxMM0g=;
 b=W5Le/DlLCJLP51boXLY1YT+ch8VE1GX1QGuRqVLv1WzkA2KHb4glvqbJawF3F05HVi
 5NaKy0PKtn0ontG0ThxEYpO1wV3xXXz/VPwwgKXibKraEh24Mc0Mi/rQ1A1xXCjfcpNd
 z/M3m2aFGnqMLj+1eOJAf9i2sMWsugd4LQe5dyJD7zGBJQHjr0zAvIirr6VtCw1jubLL
 ScGTDfjddJYu/L12Yi/12QdGo+F/M6yO28jEq2H9KQS323BG8I9LSUIvi0XWcvs/Pr4R
 69QZjqOgp1/ZS9r3LkO3QiPnsgI0lso5NAqPRJk7s1DlSzFnT71nRvfqGS+yJv9Ztd3B
 OsWg==
X-Gm-Message-State: AOAM531QaVGaJDypIZOTOBYtuKOaKXvitzsRHS0fEuWgM3jZIX3Lf3Bh
 ggRMVDsh1Uh+xxlB6U7Uu/jcBw==
X-Google-Smtp-Source: ABdhPJxlR4hBksawdCpREkWQEPy67NZX6AedykSUBJPPbm/DVuEiWOgbyGYtSdaFc3O1DPxEQo63kQ==
X-Received: by 2002:a17:906:2991:b0:6cf:1fd4:39a3 with SMTP id
 x17-20020a170906299100b006cf1fd439a3mr22171598eje.21.1649501113359; 
 Sat, 09 Apr 2022 03:45:13 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 mp19-20020a1709071b1300b006dfdfe15cf8sm9810278ejc.196.2022.04.09.03.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 03:45:12 -0700 (PDT)
Message-ID: <ed73017f-54d0-b303-1557-b6086ce2d155@linaro.org>
Date: Sat, 9 Apr 2022 12:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Conor Dooley
 <conor.dooley@microchip.com>, mturquette@baylibre.com, sboyd@kernel.org,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, palmer@rivosinc.com,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzk+dt@kernel.org
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_034515_446851_0B8F8CC9 
X-CRM114-Status: GOOD (  17.94  )
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

On 08/04/2022 17:29, Conor Dooley wrote:
> 
> 
> On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
>> On 08/04/2022 16:36, Conor Dooley wrote:
>>> Hey,
>>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>>> clock for the rtc is actually missing from the clock driver (and the
>>> dt binding).
>>>
>>> Currently the mpfs clock driver uses a reference clock called the
>>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>>> (config) clocks. The frequency of the msspll is determined by the FPGA
>>> bitstream & the bootloader configures the clock to match the bitstream.
>>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>>
>>> However, the msspll clock is not actually the parent of all clocks on
>>> the system - the reference clock for the rtc/mtimer actually has the
>>> off chip oscillator as its parent.
>>>
>>> This series enables reading the rate of the msspll clock, converts
>>> the refclock in the device tree to the external reference & adds
>>> the missing rtc reference clock.
>>>
>>> I assume it is okay not to add fixes tags for the rtc dt binding?
>>> Since the clock was previously missing, the binding is wrong, but
>>> idk if that qualifies as a fix?
>>
>> Usually ABI breakage, even if accepted, should be be tagged as fix
>> because it is clearly then a break of other peoples' trees...
>>
> 
> That means either a) do something messy in the clock driver or b) mark
> the whole series as fixes (and roll it into [0]).
> 
> The second option seems far more sensible to me, do you agree?

I think ate part of my sentence... it should be:
"Usually ABI breakage, even if accepted, should NOT be tagged as fix..."

So usually it should not be a fix.

The binding actually could be backported, because the driver changes
bring the real ABI breakage.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
