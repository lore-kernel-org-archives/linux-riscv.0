Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5755C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Feb 2022 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSObKtUSIKwRwxx86rsVHkZLmEjQjT8CmWpCRqeWzjg=; b=EKz9YTtAHSNfDI
	dWRDTR86hmnNZDtym1A+b3vuBrlX7v46unqsSY8PD95KfSItxC/rcWoj3/o4nbQkVKEsmmbvwE40Y
	ixox8qQCZFzQQCSnPaH8RHp/GF6VGATvCFD2CssyPXIOpIZASv7uc4nSsroNaQNMUEvphx0sPa8FV
	U+B7jjGi71Grcc304gzlF0GYIRpqIOilJrA5hooWSQkEcGRuMEn3c9LnY0BpVtofjzTpuKS0x+lXm
	JTSKP/2HhzNmpXYlYZt5U9abyijMc56dyQe5tHeW9VgN9d2TmtQLGAHk0QP/+l/OQqbcdDxlh2BMy
	o0Aw1fP1Iqfx4nFy9WuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGJd1-006RQ4-4E; Sat, 05 Feb 2022 11:53:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGJcx-006RPR-Iq
 for linux-riscv@lists.infradead.org; Sat, 05 Feb 2022 11:53:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso5334132wms.4
 for <linux-riscv@lists.infradead.org>; Sat, 05 Feb 2022 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rtVdDv1SeuwFPst+Z3HZwK7VoU9zHizWiVCZ6cJ+BIo=;
 b=cITyTzHhFb0YMzr+7/e0HR4JRCbfeP0KZUPmTysb/4NCGjw33dKpu8L8wjGdrraAy3
 gV0ontgxmFJZX9kz8NpfJuYkSi6dCKmFGv7wOyu0tLnIIAzj1iyKmi12nCzjq6HauMdu
 Mobbeh7Myhso5XnpHy2OQnfrc7DX76yyUQX02j1eDINyAdE8cSsvDhwHPpJ2uKiUgjRo
 VkGC3wQDdc6Vx7VTELanwNrv6LBW+AQIKz8nLyweRXKMiLW3uld6/Vna14X8txEtoDzz
 +yqWSte/QpfEf0iIq7hgR3lplxyZhXVkBYzF3GmJGCfSmPdfrxqMt0FChwfmBf+GDV3u
 XEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rtVdDv1SeuwFPst+Z3HZwK7VoU9zHizWiVCZ6cJ+BIo=;
 b=nULQzQDdojRH9ZCQBOFO48aIoxgg04IZ8D8qWeFSYngcMT/tcGWFJKXNGUYp/tzSuG
 oZ5UhLlF/3jxIVxyQx/XvhI+2hX1EoZDhXVbU3/yiQIoUwWWQ3ElfkvZZoi9DeQ1+ktR
 8BdBFl5lMF3t/1DGCh1l38mAzTsf0TI7dlIDpr9oxuFdZij5SzhAfGLH2YVT3CRZWzoo
 ofxs52czYTMaxL3XhM0FkCTEnYobrmnM2wR0Bk/lweqt8nQXqpcZtsnIj1YpREA2+Rza
 dTp2MlXtT8IrAxGjM84KfFV3uVsrskoJ9fBhiCn7EHI2fdBSd2bgXpFUeSkKYB9JUInn
 2d6Q==
X-Gm-Message-State: AOAM530MI9SeON+e+mkzbc53wAMmByX2QlEJPR1MH5Z6Vc+3y9W3uKki
 N4SWZ8BnGfcmdQwHO+dwyZ06AQ==
X-Google-Smtp-Source: ABdhPJxeJTKPg8tXjCf0sXV/a7RsIqYexP/xQzazsuPTUGiHexWKDv2XfFJqtgOghrL+rcR9WPkPWg==
X-Received: by 2002:a1c:4e07:: with SMTP id g7mr6209206wmh.38.1644061993045;
 Sat, 05 Feb 2022 03:53:13 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
 by smtp.gmail.com with ESMTPSA id o2sm12859992wmq.21.2022.02.05.03.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 03:53:12 -0800 (PST)
Message-ID: <81cb8c53-c703-1a44-11cd-9f79e169147d@conchuod.ie>
Date: Sat, 5 Feb 2022 11:53:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Conor.Dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 krzysztof.kozlowski@canonical.com, bin.meng@windriver.com, heiko@sntech.de,
 Lewis.Hanly@microchip.com, Daire.McNamara@microchip.com,
 Ivan.Griffin@microchip.com, atishp@rivosinc.com
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-4-conor.dooley@microchip.com>
 <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
 <84e1d43f-4d3d-1501-5bc1-c982272e1ce3@microchip.com>
 <Yf2scqKFRFwWBIlC@robh.at.kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <Yf2scqKFRFwWBIlC@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220205_035315_698303_97160478 
X-CRM114-Status: GOOD (  12.83  )
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



On 04/02/2022 22:45, Rob Herring wrote:
> On Mon, Jan 31, 2022 at 03:55:32PM +0000, Conor.Dooley@microchip.com wrote:
>> On 31/01/2022 15:39, Rob Herring wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Mon, Jan 31, 2022 at 5:45 AM <conor.dooley@microchip.com> wrote:
>>>>
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> Add device tree bindings for the i2c controller on
>>>> the Microchip PolarFire SoC.
>>>>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>
>>> There should not be a blank line here.
>>>
>>> Also, tags should be in chronological order typically. If Daire sent
>>> this patch out with my tag, then the order is correct. If I gave it on
>>> a version you sent, then it goes between Daire's and your S-o-b which
>>> is the case here.
>> Oh, thanks. Probably been messing this up right/left/centre.
>>
>> On another note, I know I'm still missing a RB still on some of the
>> bindings, but what is the acceptance path for this series?
>> Any left over bindings not taken by subsystems via yourself and the dts
>> changes via Palmer's tree?
> 
> They should go via subsystems. I can take if you want, but not with
> missing dependencies. I need my tree working.

I should just drop the dependency on the clock binding from the 
examples, not really much reason to have it there. Still a dep. for the 
device tree itself but would just make it easier for the bindings 
themselves.

Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
