Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855CAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Dec 2021 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=q9PoW9j0Y/CKM9glwKHJxXWMTcFkiBNpIoyfUXKpA4Q=; b=UZ/6DhypH8BsV0cW7UpZ3xChuo
	d4kHFt7FI3Bm9B49KOMOO1ghMjgHGf99gMZkrbXYHOK+AFy7oRO+1zJhaEqq3p03tUnbS3pwTU5qs
	WlKxKhHXEKC2DRPI7Of7FNwf8MpMCBNrupXuesmbzmB29NKiQCzCvHzetRsijNsZcHEE/G64OLuXq
	t0fcUCdb4iLV4j2MqkswRErcOhfkQiaWqml323oVSIQ4sa29aFk4QhAdk6DyW8ijGsc8/PW+FRdpr
	EASX5GbTff93f0ysuJPrKdSUWtTF8/vJZCcOIriUdbyMcEPiTIDNNyQt9cnlmd4dJ8p4XuEryxUHZ
	aBrwiQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0S0z-00DEqO-RN; Thu, 23 Dec 2021 17:36:29 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0S0w-00DEo6-4E
 for linux-riscv@lists.infradead.org; Thu, 23 Dec 2021 17:36:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so4130177pjf.3
 for <linux-riscv@lists.infradead.org>; Thu, 23 Dec 2021 09:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dPYUZWC+77UBrBLBUUxU9fHb6AxVTt9UdaUWIxpei+o=;
 b=L0sjRUzYInvoF3lTrWwfgbrnXNR7T+eXsaPmPTag7OLNZPysAOAy+7D/eWdc8Y8pWa
 ZYd8pC2fEDwzZy3dX8MHG6cokMq+LvNvhyVHt7n4Ot4zwmRwldtutxXO3oyyhccGcTGj
 6HqoZZOHqzyqhn2YiN2yvj0pdcsduMD2RNXRxGoK6VCf9RFwFffI4Bcz668E4CDGnHCe
 W9InkcEY0CD9FxjiRL4s4xROMFQ19FlU2EzPctV1dHFiCYC2qFsXNDzh4+eMW8ZOMg0i
 GvYkYHgDSayVhkayneoGjmk9tIMU7TKP2/FjiXoGEbnsbQKYI7gPlGu5VC6SGmmrwTQd
 Q6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dPYUZWC+77UBrBLBUUxU9fHb6AxVTt9UdaUWIxpei+o=;
 b=RbMrTXJD8+DznaS9km9F1IXQM4rdBaCFL4w2MXF3YGiD7jORWEzCRCGwWX88wTYpZJ
 NWYltUJMiegktKXX8XjsfKoHnfTpVVJiuNVsTOrg6QDyWsI/u79PMB3GVCw8IN4G9N7R
 YqYwN3ofXOdWzBhHcNUL0kASKjtudCGlgEek8bwgRkjSYovwuLyB6I6mFPE9aUG+e+zG
 YP3FGZ7LM9TvSZd01wF/VHnn6MfKQ3oW2jvg5Hn9Bkde3W4l3nUEMHSqvh3E54v5g14G
 OsROrRBqgNle9f6Fp7QdJUH4CfarwO9ACWw/2u12N3qsJP8TsNZdPhT2ZsUV6pa012s9
 MioQ==
X-Gm-Message-State: AOAM531ffOJKJVeP0uO5msHjwW/+nuYIDPNUCgj4ZKRO71SXcWAmqQ2w
 mNC6ED48XKMAAQ0HVBbLMsjDQw==
X-Google-Smtp-Source: ABdhPJypoRaM/7mbkBhlfvlUN6kGHVEF9KQ22b8kXscmQCQL7JNkF0LVo3y3phgMBogpBLz4jmYGaw==
X-Received: by 2002:a17:90b:4d07:: with SMTP id
 mw7mr3712671pjb.69.1640280983976; 
 Thu, 23 Dec 2021 09:36:23 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id g6sm7407727pfj.156.2021.12.23.09.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 09:36:23 -0800 (PST)
Date: Thu, 23 Dec 2021 09:36:23 -0800 (PST)
X-Google-Original-Date: Thu, 23 Dec 2021 09:36:07 PST (-0800)
Subject: Re: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
In-Reply-To: <05d6a273-19f6-2147-75ba-1fff726a0f70@microchip.com>
CC: krzysztof.kozlowski@canonical.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, 
 broonie@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 thierry.reding@gmail.com, 
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, geert@linux-m68k.org,
 bin.meng@windriver.com, 
 heiko@sntech.de, Lewis.Hanly@microchip.com, Daire.McNamara@microchip.com,
 Ivan.Griffin@microchip.com, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-0e4cde83-cfa1-4bf6-9f2c-611d9a4ddb5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_093626_207977_E6863FDA 
X-CRM114-Status: GOOD (  14.99  )
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

On Thu, 23 Dec 2021 06:56:45 PST (-0800), Conor.Dooley@microchip.com wrote:
> On 17/12/2021 15:09, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Update the RISC-V/Microchip entry by adding the microchip dts
>>> directory and myself as maintainer
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   MAINTAINERS | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7a2345ce8521..3b1d6be7bd56 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -16348,8 +16348,10 @@ K:   riscv
>>>
>>>   RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>>>   M:   Lewis Hanly <lewis.hanly@microchip.com>
>>> +M:   Conor Dooley <conor.dooley@microchip.com>
>>>   L:   linux-riscv@lists.infradead.org
>>>   S:   Supported
>>> +F:   arch/riscv/boot/dts/microchip/
>>>   F:   drivers/mailbox/mailbox-mpfs.c
>>>   F:   drivers/soc/microchip/
>>>   F:   include/soc/microchip/mpfs.h
>>>
>> 
>> Good to have the DTS covered, so FWIW:
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> 
>> You still should get Lewis' ack (unless he merges it)
> Aye, it'll be an ack. We don't currently have a tree & would rather do 
> this via risc-v than the at91/sam arm soc tree.

WFM.  I'll be awaiting the ack.  I don't see any fundamental issues from 
my end, as long is it's got all the acks/reviews then I'm generally fine 
with this sort of stuff.  I'll take a look before merging it, I'm kind 
of buried right now.  Sorry!

>> 
>> Best regards,
>> Krzysztof
>> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
