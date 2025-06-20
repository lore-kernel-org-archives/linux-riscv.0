Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADCCC7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkGL5VFltfwx7SMv981rBlpQvXtxSUcFaWII6pve3TQ=; b=rroe5LYNOBNcFZ
	AW+h3uu2j5KaAt4mFxb3mIFU0UbAU3LBobnwswAFp9zP6jjc7TnoeqL+1hZcxoau6DfTmlw31DFS2
	fSi84MdD30NBpON1lqgLhMaJ24ndAeVBXQR68RFn3grMGkxduGNTKNJWDbawI22BPD1W3oBWmIOZq
	HkTwZxyok1vGS0CnOAeZcgNBv+NoRlljoxa6ML2Ab+Pch2uyC/V0+P8BetcPe51eRp5/E7Q+4k0O4
	nakjbXcvypDg4NFxmOEKvoSN1wO4xp73Mn8xmFiIPAS0gxbP4vUAHhqeKcasKZBYuMQYCq6KDtnwq
	aUzDTBnJ1W+RgsSvQCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScSB-0000000ForI-1GWq;
	Fri, 20 Jun 2025 14:10:51 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScS7-0000000FooM-3pMl
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 14:10:49 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-86d0c598433so52470239f.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750428647; x=1751033447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/V0jiwDrSai/Ua3D+JcI8BdoFAg+vd8bUJc9dl+oAL0=;
        b=I/BiCt3IydGO6+lghO+CLUJnNfuA6oDTAyErv3hz1nuhR/7Nq2Uq39am6TQV/9rJIE
         glaS7dgH+4BliBKOcecFfoyGiJ6MEOwWvzQ8pt+Z/ChrBqfMu3bbEZXxUYqM549Md3BG
         nuYtxJVYaW0k84CehepaMnvMgvawvUtUeS9qj0pJcy38F72gdjaJktkVakqIjBEgHxvR
         NiDAl2b8BfUVKbSxd7+1FMvIjXZUcx9Xxnbu3Y2DWsn9nrQQ3L1eidNwdp32LdPLU136
         7wVaDSGBe4BD4hXqdGE5NIKbnzxH34SnLFS52sBJWJhD9RxmFowBo7rBAvCAMJBSNNfb
         8oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428647; x=1751033447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V0jiwDrSai/Ua3D+JcI8BdoFAg+vd8bUJc9dl+oAL0=;
        b=YiFZVt9mN+TBykYQit2J0cjp3EBoy9JGBfhz5I04l4fICMMZNTL1SJMrBYCf+iEPJb
         J35BzlwBp3cQ/AgeLGjSW4rXs8BxgvgN+Pv7PAVtxLbfDuauamDR+DetMml7jgt47g3t
         03G+ibwRWVxvTRUKX4MntUyrUtTa41rUjaTur4S26yxj+uzJohQ1BFzT8ad8w43CKuNk
         lvG2Wiga/IOJHAk6xOUVVnEJY8VQ2vnAMrlRkIGQ0w1R9DUCN2QOT6ZtdDvsHn87P9ga
         z7WiJ+01g31MUtCYMko0fOcZ2yiZBa0Y3PqLNgi9+btmobeAA88ES2gxdJsnjVhSVKxJ
         fe7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCfI+skCtOGUP7S0F6qad4ovOKYuRdxvFiiSGq7kWMg7T+LziQKg/gmS17RBUsOHQh62SVhvWeA1lJLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz77rlkA8iU40MZhosxxFMugTlaudpL++MupTO1IEsy7fv0HULg
	jetvTMsCOQ4NGTddnE2Zt8/vg1FAxMMdQ2F1P1KIAmCYori3TV7FLPbXuJ6mARThHpU=
X-Gm-Gg: ASbGnctxdSCnDWNGv+EMdcTgExVHTmzgcEX7nukcGc1jQRY1+HTt8aKqO6RQFoqUw7E
	5VS+f/lfOZ4l+RmBBWYg2KJFcut9pvrwOGE3tANUzPSmLAFy4t+WqWh1Ery8gO/CQWUJ8Ko7P47
	B1c5AsVxx8OtkxWi6aOI2qVRjLY3OwdkNb+Uvr4osZ3zfGwjR5AF1aBdUbaTzkVFaCkjF5s9gnE
	qDKfVLca1egL0iVwYq1g4IQHSeG8p0EhEzmEDqeZNFAjJxJJGruStWqO2XxSXk4SNQ9612U0y+L
	iqksYXHo7lWkn6SoHqMUC23sGAXjuVnZWeLjL6F5/o0KsGxq21/XUYFL2Vmx4qoD2m7p87aaIJA
	Nl5EEtksxEhi6Tg6psFkgHKlZaw==
X-Google-Smtp-Source: AGHT+IF191sx1Gw+x8ilTUOKPF8dmHGnHILkCee7ddq/TBaGfyhQHSrZPkzvoftsWVolVXrmsAPBTg==
X-Received: by 2002:a05:6602:380d:b0:873:1ad3:e353 with SMTP id ca18e2360f4ac-8762d1e8c96mr306397539f.9.1750428646946;
        Fri, 20 Jun 2025 07:10:46 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b7adc23sm50782439f.35.2025.06.20.07.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:10:46 -0700 (PDT)
Message-ID: <a694de5a-50d3-4637-a8c3-f90971bf33f8@riscstar.com>
Date: Fri, 20 Jun 2025 09:10:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com> <20250619144147.GH795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250619144147.GH795775@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_071048_040014_8506DEE1 
X-CRM114-Status: GOOD (  11.43  )
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

On 6/19/25 9:41 AM, Lee Jones wrote:
> On Thu, 19 Jun 2025, Lee Jones wrote:
> 
>> On Fri, 13 Jun 2025, Alex Elder wrote:
>>
>>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>>> but the driver is structured to allow support for others to be added.
>>>
>>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
>>
>> six or 12.  Please pick a format and remain consistent.
>>
>>> regulators.  It also implements a switch, watchdog timer, real-time clock,
>>> and more, but initially we will only support its regulators.
>>
>> You have to provide support for more than one device for this to be
>> accepted into MFD.
>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/mfd/Kconfig         | 11 +++++
>>>   drivers/mfd/Makefile        |  1 +
>>>   drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 103 insertions(+)
>>>   create mode 100644 drivers/mfd/spacemit-pmic.c
> 
> Right now, it looks like all you need is:
> 
> drivers/mfd/simple-mfd-i2c.c

Now *that* is a good suggestion.  I'll look at that now and will use
that if I can.

Thanks.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
