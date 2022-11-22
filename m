Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FBBC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOonZu9vfI+E3wjLBPcl5OJzpdWn5TJQtI8FEmCTMvQ=; b=ke4YDY8CB96Shb
	q2I6LCkx6BLQMPvXhQaeIpfOOoAAlbnS0cv6/RorBoispe+KFOKtshB8AjZ2dVdthGmz/9y3OdA6n
	qxCYmSH0uvy2N9RthzHQMCc9vP/j7unK9JTx3NYYVK0fqDEZrArPi+znktjjNViAZcwKwT5EYYuyZ
	799KCnEUwT6oOfjj7KNTQV12bPqtcHZsHrq8OJbbJE4CwuqgmjxYQOOpIZO5b+DdNVGTKoT6ETIUV
	fxNNB0ESvcsILBnh5cDdsO+WoKBxiLb4qIoFAxFTixzYBDtNcMX0K9lJXZYfbxnUnlev0jTg+xTxv
	KrjgwZmOP3t3770kxV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNuS-005nQs-78; Tue, 22 Nov 2022 07:41:36 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNuO-005nAl-IJ
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:41:33 +0000
Received: by mail-lf1-x12c.google.com with SMTP id a29so22284659lfj.9
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 23:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZgEuShZPFvGmlrbVu6jnnJSD8pbk7ahYnQJQ5wn0pk=;
        b=Mk8EUJ3Sx3oXYHl0xM9T+/JmMikNxAA2Jrijsah9gHwhOsarE7+/7rCOMgRVdAi7he
         gaBKk2R37J1zzOGVATS8wpJjoOveMvsWH54RGMYWhoN2mFEyUG9pEy/E/HzTVTiMoY05
         vPYpwi0km37F0pHzCWXY8b9paAgeF87jdox71Tildp7I8n1GDimBZ6+Plo0ymvElmMTZ
         41zSo/Gxf44sC1e41wOXEVJchH/l7efH/9D5Fu3bwhbGkcNaDtwjTENM0u/iKV8XCDZA
         pC4osLGbF0ZX1vfmVE+/163BmTggGjlGrnLQneRP5jYptizwJgIjFy8wPtl9fv5UsuYS
         clig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZgEuShZPFvGmlrbVu6jnnJSD8pbk7ahYnQJQ5wn0pk=;
        b=Ykjk/V9ElYKuK6ep9sEjT+gX0xPP0ZhcQS2VsQ++3io2qLewtAEEYMGEuRx8emhsQX
         PjdsJooVFIcF5Kgp9QrdKPGpwcXdqIPA8Ivtj31HKvmcZEkxyXiupZuiW9OIgNUmCzqV
         4JnDTpp0L+uqqfK4SgeGYN1kIq9Qy4b+nhF9sy3cz38nBGDVvErfdTk791CqLy81wt0W
         zmRurXtbAaWCjyPpKKi6Sh3+Amf9TBl+OPYjZ6el4DOO5a7gZVE8ta/63AARRNG7AlD5
         dxbFCJ8cDQRvGJqThOYrQbNwg3DVuZLSzC+sR+ORNRod5ZvbzEb5jqodG/FZnxz9HP/R
         S+yQ==
X-Gm-Message-State: ANoB5pkMljsv8C9ilcq/frUMYTXCp4O0nvhMt8zNawterQVdNNAWou/4
	XZGqq+MHah3XKN09muKMp4l8FOhUBy0UzJ9T
X-Google-Smtp-Source: AA0mqf7TStaiGDTFZUcD6Pjywwt89ly9JYpeR/JJ6ptzRJUT6v6QpzUVC8GK8nCrwcmjKs0mJw01tw==
X-Received: by 2002:a19:4f52:0:b0:4a6:2ff5:ddd2 with SMTP id a18-20020a194f52000000b004a62ff5ddd2mr8167514lfk.166.1669102888604;
        Mon, 21 Nov 2022 23:41:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y22-20020a2eb016000000b0026daf4fc0f7sm1758305ljk.92.2022.11.21.23.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:41:27 -0800 (PST)
Message-ID: <f59e53b0-0915-e8e9-7e49-05ca6a9eac95@linaro.org>
Date: Tue, 22 Nov 2022 08:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/14] dt-bindings: clock: Add StarFive JH7110 system
 and always-on clock definitions
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-8-hal.feng@starfivetech.com>
 <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
 <1db979d5-1fb6-f3c9-8ce0-e3e2e23e5d14@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1db979d5-1fb6-f3c9-8ce0-e3e2e23e5d14@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_234132_646562_ACE52DF0 
X-CRM114-Status: GOOD (  12.25  )
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

On 22/11/2022 02:02, Hal Feng wrote:
> On Mon, 21 Nov 2022 09:45:11 +0100, Krzysztof Kozlowski wrote:
>> On 18/11/2022 02:06, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add all clock outputs for the StarFive JH7110 system (SYS) and
>>> always-on (AON) clock generator.
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  MAINTAINERS                                 |   5 +-
>>>  include/dt-bindings/clock/starfive-jh7110.h | 234 ++++++++++++++++++++
>>>  2 files changed, 237 insertions(+), 2 deletions(-)
>>>  create mode 100644 include/dt-bindings/clock/starfive-jh7110.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e6f1060e7964..e97dac9c0ee4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19598,12 +19598,13 @@ M:	Ion Badulescu <ionut@badula.org>
>>>  S:	Odd Fixes
>>>  F:	drivers/net/ethernet/adaptec/starfire*
>>>  
>>> -STARFIVE JH7100 CLOCK DRIVERS
>>> +STARFIVE CLOCK DRIVERS
>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>> +M:	Hal Feng <hal.feng@starfivetech.com>
>>>  S:	Maintained
>>>  F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
>>>  F:	drivers/clk/starfive/
>>> -F:	include/dt-bindings/clock/starfive-jh7100*.h
>>> +F:	include/dt-bindings/clock/starfive*
>>>  
>>>  STARFIVE JH7100 PINCTRL DRIVER
>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>> diff --git a/include/dt-bindings/clock/starfive-jh7110.h b/include/dt-bindings/clock/starfive-jh7110.h
>>
>> Filename based / the same as compatible (or bindings filename).
> 
> Should I split this file into two files for "SYSCRG" and "AONCRG", which
> maybe named as "starfive-jh7110-sys.h" and "starfive-jh7110-aon.h". Ditto
> for the patch 8.

Does not have to be, but anyway naming must follow compatible naming, so
vendor,soc-device.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
