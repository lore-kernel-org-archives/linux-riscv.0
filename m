Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4061C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5icVG5saQwZl0j1u2DJ4EHUy0CtpGJEY6oHdldEo5o=; b=Hx/DUjZ6goF0qp
	haRgw6+3rkW+4gh91YlQPjz5sf7sOlSWIBgEfaiRI8AUd4+djYEzBp1rqw+U6dVlBT9CFSa/+Z7Vu
	oIn0CD8MEcZhc9n9AZFWcwEnGiBS7eoiBLRHmEnsrYU33rT9lrea6MLe3xIBbWcGz3hh/m0Bdp6DD
	yEt5glv07WvHzRZHrMNNHJfUqWDPAWQ70CwRZg1PpW04yQX+7bwWMa7PczqDFxtesA6uFnnlAI/mp
	UvdywY0/gy5GtwDJvO5yC87owgmO045QZ9Vvl/rUbvPrmipDxNRbUNReFDuIvvTGIZkk2M59liU1u
	J72kNEaff5inJxRZSxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHAh1-00Bh78-Is; Mon, 07 Feb 2022 20:32:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHAgy-00Bh59-KZ
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 20:32:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id r29so8978880wrr.13
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lInl3v4291y96qRj5SmrtyZWxmX1JQwpyT8w4NZCIwE=;
 b=pZIbLbD2z5lCj7TnELtOL5EzoxwY+lBVxsw2GZfWwQfoK6YNhj3asWV4g24WsrMUDE
 Pc+FJHzk1Vwb1BcSpFfE0vnjX6h1xVtFhGSNFLyr3y/cTOKmdEePr+06n3Mz+WC3/mou
 J0mx4mjkkjxyu+eFle3FufFVo+vGPTRZhg5T5jQJ48QVvrT3A0n7LcYlyg2H/OCEMVaY
 BHT2Ifq4ujfMhMkTM0aqvNDcquf+yoJ9VFmdwFRw2RZHH8edWFGZNs69BbhMWPjcKkVn
 c9XLjQf3kynVd22B2/eWeltNLSu9E35+DnSu7D8cQx+vXVd+jI/IW0YoL7wlOaXz//Kt
 lNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lInl3v4291y96qRj5SmrtyZWxmX1JQwpyT8w4NZCIwE=;
 b=GPvqbcb/3zH4T5EptaY3KZ/Gkfixh7ooJIrMkda7cJ1VFsW7PGaZomm4hiv959uOEL
 fZqj4rcnkC8Y6CZx3jF6uR5DsARZ88wk090opN4HIXSUFZDK4U3F4EmDKljQzfpR3/7b
 7OoysRSm/mV7yqenUxvaMvM+ALPphSi8kwfsYDML+4sico3NOD1xbpWFfkjA5cBlBDEs
 ffURYC509yikDhkrejVWLBAFVv6YzEm+4LsXmnvQBoqssadiYUjHDXPFL5RXDf2xpoa9
 ysfKc3eY4ombYLG9M6HaxTBfQHa07jqS3zTX0JWgVQPEuRgqgMwQgY100Ek3ygqF278k
 DMcQ==
X-Gm-Message-State: AOAM532agF0MqknWajKfG9omKqD0ubV8VnsQLh9hACFjWcht0p05WAXn
 HiisJJtedeidCLQxAb0unk5S6g==
X-Google-Smtp-Source: ABdhPJxli8C56VbUUZpTG/k9gYuJnfVphrd7Cnfcv2luFPINoxa1eE5dK6Blkudp0C9VSCUYzi1P8w==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr898486wrv.249.1644265966959; 
 Mon, 07 Feb 2022 12:32:46 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
 by smtp.gmail.com with ESMTPSA id t4sm10594105wro.71.2022.02.07.12.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 12:32:46 -0800 (PST)
Message-ID: <1cce8adf-1f49-b908-ee6e-f7c2ff6b5218@conchuod.ie>
Date: Mon, 7 Feb 2022 20:32:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 02/12] dt-bindings: soc/microchip: add services as sub
 devs of sys ctrlr
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, bin.meng@windriver.com, heiko@sntech.de,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, atishp@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-3-conor.dooley@microchip.com>
 <YgF8G/Eed03xn9iI@robh.at.kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YgF8G/Eed03xn9iI@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_123256_758190_27A5900D 
X-CRM114-Status: GOOD (  20.79  )
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

On 07/02/2022 20:07, Rob Herring wrote:
> On Mon, Feb 07, 2022 at 04:26:28PM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Document mpfs-rng and mpfs-generic-service as subdevices of the system
>> controller.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>   .../microchip,mpfs-sys-controller.yaml        | 35 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> index f699772fedf3..b02c8bd72605 100644
>> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> @@ -13,7 +13,6 @@ description: |
>>     The PolarFire SoC system controller is communicated with via a mailbox.
>>     This document describes the bindings for the client portion of that mailbox.
>>   
>> -
>>   properties:
>>     mboxes:
>>       maxItems: 1
>> @@ -21,6 +20,38 @@ properties:
>>     compatible:
>>       const: microchip,mpfs-sys-controller
>>   
>> +  rng:
>> +    type: object
>> +
>> +    description: |
>> +      The hardware random number generator on the Polarfire SoC is
>> +      accessed via the mailbox interface provided by the system controller
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-rng
>> +
>> +    required:
>> +      - compatible
>> +
>> +  sysserv:
>> +    type: object
>> +
>> +    description: |
>> +      The PolarFire SoC system controller is communicated with via a mailbox.
>> +      This binding represents several of the functions provided by the system
>> +      controller which do not belong in a specific subsystem, such as reading
>> +      the fpga device certificate, all of which follow the same format:
>> +        - a command + optional payload sent to the sys controller
>> +        - a status + a payload returned to Linux
>> +
>> +    properties:
>> +      compatible:
>> +        const: microchip,mpfs-generic-service
>> +
>> +    required:
>> +      - compatible
>> +
>>   required:
>>     - compatible
>>     - mboxes
>> @@ -29,7 +60,7 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    syscontroller: syscontroller {
>> +    syscontroller {
>>         compatible = "microchip,mpfs-sys-controller";
>>         mboxes = <&mbox 0>;
> 
> Removing the child nodes in the example doesn't address my comment. You
> still have them in the schema. IOW, this patch should be dropped unless
> you have reasons for child nodes other than I want to partition the OS
> drivers a certain way and creating DT nodes instantiates them for me.
> 
Obviously dropping this patch doesn't prevent me from instantiating the 
sub devices since it's not going to be done via DT anymore. Would you 
rather I replaced this patch with one adding a link to the online 
documentation [0] for them in the main description? I had left them in 
as I wasn't sure if you wanted the descriptions dropped entirely or not.

And yes, partition of the services is why I had originally gone for 
different drivers for the different aspects. Some of the services, like 
the RNG or reprogramming the FPGA from Linux have obvious subsystems to 
put them under, if it was just the eclectic mix of Microchip FPGA 
specific items I'd have not bothered with the partitioning.

Cheers,
Conor.

[0] 
https://onlinedocs.microchip.com/pr/GUID-1409CF11-8EF9-4C24-A94E-70979A688632-en-US-1/index.html
>>       };
>> -- 
>> 2.35.1
>>
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
