Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3Rrb5bR5u+YUlanXJkgldVQhYizABz1mudy2c+PXow=; b=WWaJZqPGdsCpOX
	ZHWWQM9Me4K9R0TmXM75fye5C66aMjXkEZaKMiuQbgUdGz6fCmNUrK1QHDg0aIN6E03fyQjxL02CA
	T6KlE4FiJnEICNE4nTX/P2DRsEkzQx5gX2LHGm4nEhlTiiN55gpuZow3uRmbYzxtfIujBeyKB0/hR
	ktPhRjUsBqqTuR3BRUqkGxUpsypT8Ps6fimUXPSveOmAUnsBrbWV/mlV9Vk8JfISPVToAVvDWHWpR
	lVsozXcBWrAGQvah2yRgT269jKyGXJYFbLcucPo7t3Mup6chPhAkaf2JqaJA6ZZKIdYrcoidSC3dG
	+m/QMZYOK3NEHauo0aVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFPJ-00E0zs-Qu; Tue, 12 Apr 2022 12:14:05 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFLk-00DzNY-98
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 12:10:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id bg10so36926028ejb.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ocK32DG0lOhYPfJ1YNBplhX2lk9puVGzCXiGTBbg2g0=;
 b=zUfO7dUDyEBOMKX/21JxI4KgtNEBSIGnuEa6nfW/JP01yAr4h8QOycO5YVvWUP5Zir
 2nxISBVeQSUyW+QLzP1vR8SGrd9GPcNkuUR++POk5+s7UXEpGYCF12p31LEIV37btsmV
 fQr2zCOQoJy+LumPIH+Amqy4CB4D5gL6NTJ4L2Vbq+pmcI9Ha02nPoEfiQYSvSTKsPPD
 NSiYcHUP+eilX1Q7Ouv0uuy7tHxu7fdOqeklHLJwvkQ8eG4TAWPvF6+NJLtK5utrffIg
 YWT5BQl0WpfzHDcQACXma3BRqUrvwiaVZnaW1Q4N1KU808JiPrNNrd8HzBOQPJ1tSuvK
 6dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ocK32DG0lOhYPfJ1YNBplhX2lk9puVGzCXiGTBbg2g0=;
 b=FafrpeUp1MBC3zhx690CFhVwxh4Rx/FderFX6ojMafue2+6UOhyzDtwdcs8scI+McB
 qI9NdcqVe5/ISJq1oDj/gw+ec45HO9upwXWpas6j9qJN7fxVbRiieWLcTSjSgriIT8Vd
 q/6roirtfBthaR/90B9SXSj5eoiNxJh8Ki6DYpsLaRhwmckb+yr6nR2tzX8uQFV8sxaB
 VnY8UFiFTrRWxvEKrlgfKu8x4etYPjwAUyxK3Ha0B0pN4S76buMUW1TQNVMoqxQpdqCb
 EBKcTWxHcTB6pLSzL3olmPyAlc7Wc2aw4zOyLuY9claOzOG+NyeXsZXLuqKIB24qxE8g
 TcRw==
X-Gm-Message-State: AOAM5318cmK9/9qIyDHtP1XUWq2paRmLjaXL6ZYCqh2UfxIntShTRCLW
 oiVw8QJU4dBcE8rI9LPfBSyZKQ==
X-Google-Smtp-Source: ABdhPJxUTJZ7wUn3u5SGl6HSKEmB8eB1NKh1QPd6JHIZhHDlEq/LDm25RNe5j/qDCqcQ96Akok+PsQ==
X-Received: by 2002:a17:906:4fd5:b0:6e8:76d0:e0eb with SMTP id
 i21-20020a1709064fd500b006e876d0e0ebmr12688399ejw.412.1649765418537; 
 Tue, 12 Apr 2022 05:10:18 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 w14-20020a509d8e000000b0041cd217726dsm13327476ede.4.2022.04.12.05.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:10:18 -0700 (PDT)
Message-ID: <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
Date: Tue, 12 Apr 2022 14:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To: Conor.Dooley@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, palmer@rivosinc.com,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzk+dt@kernel.org
Cc: Daire.McNamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_051024_401663_CC3DD9E8 
X-CRM114-Status: GOOD (  19.96  )
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

On 12/04/2022 14:04, Conor.Dooley@microchip.com wrote:
> On 12/04/2022 11:47, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 11/04/2022 10:59, Conor Dooley wrote:
>>> The RTC reference and MSSPLL were previously not documented or defined,
>>> as they were unused. Add their defines to the PolarFire SoC header.
>>>
>>> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
>>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
>>> index 73f2a9324857..3cba46b9191f 100644
>>> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
>>> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
>>> @@ -1,15 +1,18 @@
>>>   /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>   /*
>>>    * Daire McNamara,<daire.mcnamara@microchip.com>
>>> - * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
>>> + * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
>>>    */
>>>
>>>   #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>>>   #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>>>
>>> +#define CLK_MSSPLL   34
>>
>> You have some weird order here. Shouldn't it be under CLK_RTCREF?
> 
> Yeah numerically weirdly ordered - I grouped the clocks by type:
> MSSPLL is a pll, CPU/AXI/AHB/RTC are all dividers & the rest are on/off
> toggles. I'd've prefered to have renumbered the whole list, but that
> didn't feel like a good idea.
> 
> Additionally MSSPLL is the source for CLK_{CPI,AXI,AHB} so I put it at
> the top. I have no particular preference, so if you want them reordered
> so that MSSPLL is under RTCREF just say the word :)

Hm, are these in the same clock controller (device, not driver)? If yes,
then please order them numerically. Pretty often one binding header have
IDs for several clock controllers, so then it's a different case.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
