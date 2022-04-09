Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C6C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbaiA5gnEJjfVFrfp45in+JNlGrTdAzP65m/NWdpvHI=; b=D6MzeDjiZrHWTq
	EWMB7tazcGi6w24u/SVToqEpm8PLnT2ebeqcjZ8Lq/E74o3ZFwwC6+Ga1yUCymoaLbC/OT/Lzy1bR
	mcShrr919sm41dwJVUHtLEJ3AV/SZxqbmn3vQuwnb4ZqIaPn99YWGy030pEyYGaHJhCV0C4/XveJP
	Kq1Qaz++5+Ex1/WEC0jZgN31iNb4hN97KLyUNgOLvmtOmowyF8X39fla0WhhYIC+cNfEB73Czvmmg
	4bLtXfypxLXbz9fxjyrGTAoSKVocdxLu36hZ6s0bDXsaaaFGQD0l7ZCV0LqukebP8J2qZzoL0lQb0
	yLQojtczATiLMx0e+eFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd8dm-002rSu-Hj; Sat, 09 Apr 2022 10:48:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd8dj-002rS0-HF
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 10:48:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id k23so21825905ejd.3
 for <linux-riscv@lists.infradead.org>; Sat, 09 Apr 2022 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zurZzrPnoV4r9DOy+KZk14qxFnOBvVLhR9qywD2QyTw=;
 b=odUO6U5irUD1TkbGAOs9IgaVtCu9ZJQSdzKAbAtU03h2pKET2StPIxNP0ccPnw6ryi
 7L7QpO3e2/HsMEJWXV0X9STvzCCGfy2/Z4+Dw9Ug89GBEHB+W6wSaFFDmkF0Z+OrdzDQ
 oqRCfKhYtQOMKBEQ/EHifuKnX7bKjrllz/fIYy1Xvsi4F/Z+aqZj864bj8pXz1fWKf7e
 0sDo0lmj0IjbinYYlxcY1qNS5L8++7zZnS/J7TtRaTzf0rg/mWPfEAiObNqJAAHVl6wb
 Vgr+tqTCLMgh0oC3kuozx6TgQ5GQ2qNEvLfD1anUDzs+G7yqwhKZYaxxOUmwHFXm9Any
 Cv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zurZzrPnoV4r9DOy+KZk14qxFnOBvVLhR9qywD2QyTw=;
 b=avl+nwGOVjJ8wvIktr2+GJNayJNFdNp+GJxLJ5WHwCxOc6fWCPZ7PGhqj4b3EMwFNn
 STVKoTj9C1dDWOJzuXXqKvK90o0QGmJjpOnwUyzsoStGm0/KbbnA8tI7nm6/c8FFmV3F
 Yf6f52QRS19zBBJX9SaQtuJAgAveCVigXCgQ8jCmkSAxQiVQUetUXlj0QAHRE9/Qwjdp
 oGUy2z4/I9VvYQcjdHHz1HNjjBNqTLi21coxVrs1Z/25hnTL5fKUrr93K9JR4aBYPA6u
 eEvBdI6mKVTPj2RfUKBpwHdrtHuYwKcj+P09Wa1rvB7+LWJ0iXrsFkTdVSI9HReZ2gfI
 cO7A==
X-Gm-Message-State: AOAM5308Jf8x67nge7rJsq+JIRYM+PEc3GDeiA6PyfTzQW9BaB0OlkO7
 NvGNZ9mSySZaPCYZRxe1ANpunQ==
X-Google-Smtp-Source: ABdhPJw9pBeXg2SGuQ2eXUyY6HU7X577pbo9P5dDrtLudpd5GXm2ecpBgXeFvECzMwpI0j1dbrfsyA==
X-Received: by 2002:a17:907:1b27:b0:6d9:ceb6:7967 with SMTP id
 mp39-20020a1709071b2700b006d9ceb67967mr23101859ejc.186.1649501299954; 
 Sat, 09 Apr 2022 03:48:19 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 jv20-20020a170907769400b006e7f859e683sm6045929ejc.19.2022.04.09.03.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 03:48:19 -0700 (PDT)
Message-ID: <7e6a0489-f90f-a362-e37b-b219fe2d71fe@linaro.org>
Date: Sat, 9 Apr 2022 12:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Conor Dooley
 <conor.dooley@microchip.com>, sboyd@kernel.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, palmer@rivosinc.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, krzk+dt@kernel.org,
 mturquette@baylibre.com
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
 <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_034823_622440_293C2251 
X-CRM114-Status: GOOD (  20.89  )
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

On 09/04/2022 09:14, Conor Dooley wrote:
> 
> 
> On 08/04/2022 16:29, Conor Dooley wrote:
>>
>>
>> On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
>>> On 08/04/2022 16:36, Conor Dooley wrote:
>>>> Hey,
>>>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>>>> clock for the rtc is actually missing from the clock driver (and the
>>>> dt binding).
>>>>
>>>> Currently the mpfs clock driver uses a reference clock called the
>>>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>>>> (config) clocks. The frequency of the msspll is determined by the FPGA
>>>> bitstream & the bootloader configures the clock to match the bitstream.
>>>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>>>
>>>> However, the msspll clock is not actually the parent of all clocks on
>>>> the system - the reference clock for the rtc/mtimer actually has the
>>>> off chip oscillator as its parent.
>>>>
>>>> This series enables reading the rate of the msspll clock, converts
>>>> the refclock in the device tree to the external reference & adds
>>>> the missing rtc reference clock.
>>>>
>>>> I assume it is okay not to add fixes tags for the rtc dt binding?
>>>> Since the clock was previously missing, the binding is wrong, but
>>>> idk if that qualifies as a fix?
>>>
>>> Usually ABI breakage, even if accepted, should be be tagged as fix
>>> because it is clearly then a break of other peoples' trees...
>>>
>>
>> That means either a) do something messy in the clock driver or b) mark
>> the whole series as fixes (and roll it into [0]).
>>
>> The second option seems far more sensible to me, do you agree?
> 
> Having thought some more about it, patches 2, 3 and the rtc part of 7
> should be moved into [0] since they're fixing a binding that only
> arrived in 5.18-rc1.
> For the rest, make the second part of the reg optional and if it doesnt
> exist just return prate for the msspll clock?

Ah, so this got into v5.18-rc1? I think I missed that information from
the patches description and focused on backporting to stables. Then
indeed you could combine all fixes together, mark them with Fixes.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
