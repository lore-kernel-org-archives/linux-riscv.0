Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46DBEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXZ7nArhwdZWgXoeqDTjzu3PNuhn3jXJJIPopoJleeU=; b=jBnihDX6hH+PlE
	uxiymb7mZ2vF9ajYWa+hf1O7xRiQI0v89GxxUTcR2h47ajBzCIPgthalPXXnL71eNE3aSglJ6yFqq
	mL8L7Z9Jr3eH8I/OL6ZXlj5wUVJohL6UsXJgTYUOK9CHRIyz0/y1MQFAxEnBktygwr47FQ9yMEBJK
	8CPRSMgjBAIDqnXTqrcnZ6p6HIAqHEF6TDpnKPpbfofvz4WbI5H918VIjHvoF0g4KFwaJDNAFN9oL
	6v81Cjd6td7YH+fik+arDeLDy3JSOUMbc1Z9nkhXZ6kktidf6L3fpyxNOP8G2jpoEcdyKfxjlZ9ng
	6+1D7HkxRS+bizwvi9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwrd-00F29J-2i;
	Wed, 05 Jul 2023 07:23:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwra-00F28l-1F
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 07:23:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9939fbb7191so74577666b.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 00:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688541825; x=1691133825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfHsvDQ9gANPVD8NJhKIViMe2g10IPISfPCqc4m/wEU=;
        b=Kfs3hrRItqd9Y7BwC9buaitUGmo3La9s/LDZVVR/eZeWRl8IXBxJUGjPl7VVSCujc4
         mfprd+UZdPsiwiDulfVUBm42k3zIZFk2c4fPArW5zrAVI2Dabho9AZK1IHJMrTm4QxVc
         BJoNoUgcnQzmsm2UgcJ8fyOd/nky2Btk6Zg9nTbQiAK0zAD+h+1JMkW0tb62ZT+Cl9TN
         mywdoYAQe5n8zGTXANOeEHAh/Yz/tZiJoE1zmbIHzulY024fkIX501zAcRVU2asSUpfF
         xCoLzDOtM65yiuDgTzccaVxxRbur+k4Ym9PwPejDfPX84e8pyjbzfUd513EFn5tjvj7v
         38jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688541825; x=1691133825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfHsvDQ9gANPVD8NJhKIViMe2g10IPISfPCqc4m/wEU=;
        b=hKVXblGHq9Qnci5lJw4m4BvTNnt3iyfUOrSinVfyieMXtsHT9Cc1D7fD8ieYCrsLK4
         sGgQsF+Am3D6JuBx9sEFdQoXnDKzFaE6sJT/VBVgRkDNHC1eXIGBYoMJHgs8xj0aBcWp
         AiZqxwfVNjjPoDLUteQ3ZdsFgrvKnTsO2nhisgmtIFJij7Ljiy9b5anuZBNV+rIoSzlJ
         QURHOYKxmVuydrMSCoGwZF6AUO8ZlQbup92mchMQdFuCJAnTwn1T65/CGy/5lenETj/I
         BLKOWNbUYa64UjdH9ncDIp+R94gamHp8BTMhQ4agqUaUoKqqfNwuU1K+DRON1xGx9DYQ
         xISQ==
X-Gm-Message-State: ABy/qLaUYwght901Bm70lLoAze1kkijVeE7l50SO6Mzqcv4KZT9gc1w2
	cf5fv3LHYT/V8BA43zLfLKhwQg==
X-Google-Smtp-Source: APBJJlHFN29jfTiNUx5sFWnNBEOCkG12dMSYS1/ng4NNgeX2L9P1cSy+erlCNqaNEgJair2vOCiZJw==
X-Received: by 2002:a17:906:2d1:b0:98f:8481:24b3 with SMTP id 17-20020a17090602d100b0098f848124b3mr1189990ejk.37.1688541824853;
        Wed, 05 Jul 2023 00:23:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gw26-20020a170906f15a00b009929d998abcsm8546834ejb.209.2023.07.05.00.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 00:23:44 -0700 (PDT)
Message-ID: <175d03f6-122f-bbd2-5d38-61fe4022c5cd@linaro.org>
Date: Wed, 5 Jul 2023 09:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-3-william.qiu@starfivetech.com>
 <808dac44-a72c-4675-1e4a-0ed96190efb4@linaro.org>
 <90b55926-1d0c-b9c0-3020-5837e2028809@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <90b55926-1d0c-b9c0-3020-5837e2028809@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_002346_485099_48F01933 
X-CRM114-Status: GOOD (  13.87  )
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

On 05/07/2023 09:04, William Qiu wrote:
> 
> 
> On 2023/7/5 14:21, Krzysztof Kozlowski wrote:
>> On 04/07/2023 11:04, William Qiu wrote:
>>> Add QSPI clock operation in device probe.
>>>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@intel.com/
>>> Reported-by: Julia Lawall <julia.lawall@inria.fr>
>>> Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/
>>
>>
>>>  
>>> @@ -1840,6 +1858,8 @@ static int cqspi_resume(struct device *dev)
>>>  	struct spi_master *master = dev_get_drvdata(dev);
>>>  
>>>  	clk_prepare_enable(cqspi->clk);
>>> +	if (of_device_is_compatible(dev->of_node, "starfive,jh7110-qspi"))
>>
>> Don't add compatible checks inside the code. It does not scale. We
>> expect compatibles to be listed only in one place - of_device_id - and
>> customize driver with match data / quirks / flags.
>>
>> Comment applies to all your diff hunks.
>>
> I'll use "of_device_get_match_data" to replace it. But the way I added
> reset before is also by compatible checks. Should I change this place to 
> "of_device_get_match_data" as well?

I don't know what's there, but in general driver should be written in a
consistent style.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
