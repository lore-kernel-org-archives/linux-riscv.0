Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56894C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze4zK2mf/LAzU1aQoUZX8A+0gOADcJi4l8ffonUFC0Y=; b=Iyro8dzStRKLBt
	iTqLOEqR+u0BuHtxy/S5RAD/RS1Cq3cAO0TXA9xYjGJpe83xig77E6PWQ5WUOs1pLjGWWwB2RXUj6
	UoU5xKgF/aQmOjo50lm8+7IODV6mm01XZc808SSUGPvyqugFrNaCjQrgPGJnVAdQ7qv4aJz4uQuf2
	geY4OakGLQT6mxF5CzeHeMNw8Xd57qIhOLUER/wvzaKq9xIlpNGBOOPKnWUM+p5mra8i3okJW/xC3
	sBSK1Vp5x33Bj2GunLOcv7n+NqqTYGHjQpcjPu0T29yw/FjpXWtYufciAOivcguI7oN5/JWVaJ0pe
	Wff4YkGQKxUV4kXg7voQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMASM-008DtQ-25;
	Wed, 19 Jul 2023 16:55:18 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMASJ-008DrJ-0L
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:55:16 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-403e7472b28so26260941cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689785713; x=1690390513;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xaknZ+WQXJ6kJPUpwHcZWxBULSRjgk951uD8BaEmJU=;
        b=aPUCeq/XP3LmF7NuRP26v0Ge989d6G7AGSAJCXIRKXQAgd1xsjUx1DAtIBfGkxmxt6
         P24KcgnWKabeJoWjDmdO8WzrixJy45+ZWk///46bnP8O7+8IOSYXX2YQv2ge/GCKHLAR
         vK9LYCbBmo75UvZx7pxPL5K5EXxkrHw8JXRvMdc/4lyfIPNCThSEc7lNF6wxZ+Lr8/Vm
         MLOIYl4A0BEt20JSXblMlyFmE75sZmRpaFiBxy61LhhAarRUWEh+p7yt+uWz5mTStslZ
         HdDdsQhADeG7HDbHzxwL28T8hUQ97MY6/WjeYue/hVljKA2HDS+qRdk306qBDcsDEalj
         VAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785713; x=1690390513;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xaknZ+WQXJ6kJPUpwHcZWxBULSRjgk951uD8BaEmJU=;
        b=JFkV9/gPhKejwpPUBYrNwTT2gwajFI5oILZAm7TgjaV2H9Fox9rVkUr1iwL8tJA2Sy
         7Nee77yvXpi3uTfL840lL8j6FKeJPCEq3Ab0PSegBzek5fzQ4xdx3Bmb8YfQgF29jEv5
         9JH6SdRQb6KIs2uWtBmJIlqa546u1qwneGieTKNAd2LtA31eA85LPnY1aeR4PWEKbwgw
         A/DTEmQyHpeY2ZbtohJZp3DOyqNtXUrOIydm2HHWDtAEdpxjTq6zBHba8u4cWWdjk8il
         h2jHwq1rzSiSfnZYwJdOgitpY4U9udECcTbrOUipYhz978vrvX8vlMgaQFbJMRWEf9jK
         dOIw==
X-Gm-Message-State: ABy/qLbt5/MWEk0sbK5gKZy9sC56FjsnWYBkRfRVREF4VJ6O72Q8hJ83
	4GWU6a+7JOvXtkKb5nJvjb8XqQ==
X-Google-Smtp-Source: APBJJlEPsbeM2nGzrTcEBeX746FG7Qyy/DhvSGKqoQV2FqRjNNJfHAVrQWcpMXH6G6hSipJSYJxWVw==
X-Received: by 2002:a05:622a:1883:b0:403:eb6a:5f5f with SMTP id v3-20020a05622a188300b00403eb6a5f5fmr11425456qtc.42.1689785713469;
        Wed, 19 Jul 2023 09:55:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:8499:3c3c:78f6:f355? ([2600:1700:2000:b002:8499:3c3c:78f6:f355])
        by smtp.gmail.com with ESMTPSA id g10-20020ac8774a000000b00403f0e47dd6sm1436861qtu.67.2023.07.19.09.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 09:55:13 -0700 (PDT)
Message-ID: <44c057f5-d229-86f1-adc4-5585334d3113@sifive.com>
Date: Wed, 19 Jul 2023 11:55:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 2/4] gpio: sifive: Look up IRQs only once during probe
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
 <20230719163446.1398961-3-samuel.holland@sifive.com>
 <ZLgTwiTzykDhCd5w@smile.fi.intel.com>
Content-Language: en-US
In-Reply-To: <ZLgTwiTzykDhCd5w@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_095515_208679_65C90581 
X-CRM114-Status: GOOD (  17.83  )
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



On 2023-07-19 11:48 AM, Andy Shevchenko wrote:
> On Wed, Jul 19, 2023 at 09:34:43AM -0700, Samuel Holland wrote:
>> of_irq_count(), or eqivalently platform_irq_count(), simply looks up
>> successively-numbered IRQs until that fails. Since this driver needs to
>> look up each IRQ anyway to get its virq number, use that existing loop
>> to count the IRQs at the same time.
> 
> ...
> 
>> -	ngpio = of_irq_count(node);
>> -	if (ngpio > SIFIVE_GPIO_MAX) {
>> -		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
>> -			SIFIVE_GPIO_MAX);
>> -		return -ENXIO;
> 
> Do we still need this check?

I don't think so. I think this check was only intended to prevent overflowing
the irq_number array, and that is now handled by the loop condition.

>> -	}
> 
> ...
> 
>> +	for (ngpio = 0; ngpio < SIFIVE_GPIO_MAX; ngpio++) {
>> +		ret = platform_get_irq_optional(pdev, ngpio);
>>  		if (ret < 0)
>> -			return ret;
>> -		chip->irq_number[i] = ret;
>> +			break;
>> +		chip->irq_number[ngpio] = ret;
>>  	}
> 
> If so, here we need something like
> 
> 	ret = platform_get_irq_optional(pdev, ngpio);
> 	if (ret > 0) {
> 		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> 			SIFIVE_GPIO_MAX);
> 		return -ENXIO;
> 	}
> 
> Otherwise you need to mention this relaxation in the commit message.

OK, I will add something to the commit message in v3.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
