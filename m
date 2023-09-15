Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47456EE644B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4ctMRSJx25j1mgfogDj4XBCx2I2X+KbKA0K9+t/fzA=; b=D2ckLVhVdaMZUN
	ePd7VbT3UBzQQMo9+/O7+91Pscq9BsFH4slvHHJz43tpXAAYQrldSSsSHd6B1ENujlTwIa9Lb4c/Q
	OtWkbsnv/16tHDiVm5ZUzBFPZlcLZ8Jfzqll5l/XltAYohDd+KVlBDOfa+zn4lgVOlgpZIOHSo4o0
	eXH2F+NsIbn/zoSRXeGAkqpvmgw4DhKUUe3wRKQWAbTumTOjFa1il4wb/oysFBiqwx4XONGmgDjyg
	X7KIlc5JeREblFowFl8Ou1HD5daMwut+dTv7uUaUuN23UsZ/k1iM8y1SHY2BDlq86WwWYO4avEbpU
	1+bHIq6D8isDvTNXqLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5jQ-00AMVP-1S;
	Fri, 15 Sep 2023 10:07:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5jL-00AMUC-1S
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 10:07:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bf3f59905so255751266b.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 03:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694772436; x=1695377236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIOsoLWZh5rJG/1YfIOAx2GIO6JUFBkc7NqnYEd6i84=;
        b=CC4N02EyjLq81ti7flIW6EtVt7VwbByZeA3jYa2KNlWVX9smAT1j1K9RFmHhofWO0z
         l/pM3QOYVdf7jwlivLzmmlMuvSy7GgByzZgadaJcI31DKTYl6r6TiKuiKpUiDEzvy13n
         AuWlFovxCww+m4j14EkUTADz1HPJOIbAm2OgoSP24C4fFIPTPV+CzW4IZRO6Zy35CNFM
         CgVSlK5ut/VAuUI7j4/TYnharJMncPD6dMbWmxC73+0ffCFHNb2MJYundhMCMeyVt7KU
         V2LFRiCZAT2Y6RB72yIdJabA5Qxxr3VnJgXrJObfK8biv1+XDeDjPF5JltRhjElr4y6U
         iAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772436; x=1695377236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIOsoLWZh5rJG/1YfIOAx2GIO6JUFBkc7NqnYEd6i84=;
        b=gydIsiapYYf5TYi93RgUyYE99zeV56I7VIAItgt9yO1rMMaBois/4Hwgl7ruzwzsMB
         npj7PhVJhCsV58PAqBQHo9w8YvO6ygNbkyyfwEgqzHGQO5Gzrrggqx2BM4+NxPyr7lTG
         bNp+UkI3hZetMUyZEfxEHYfpbxE9V6ZwoeBcYnM8e6/gf2nsXydn+i0zU6f2/UBWyd7C
         1Zeqt8sTWJvGms7/t/87o2rH3ek59qNhUPgi7ESPrJfu4b2JDM759Q136kPZJlj8WHX4
         94UL0EkjiuxCX0lYOZaivY2W5Z/i6Q5ndDRiW+8gv5ldpr6GDXtnXPCxNa/lmZ6qA7XY
         J8Hw==
X-Gm-Message-State: AOJu0Yz8Lxuz2ljPNqnd1PS9HgHY3hv4BzpF+5x75uHZG25qZmXiKSbK
	y48C6PY/QbXjdFDZTUKHG5oCnQ==
X-Google-Smtp-Source: AGHT+IHVDXtlJMX8pYFZuW54VGTOuf0bTZVgZR6yMV40BZzJvKHWbNORMLTbJ3Zb0tHHlGkaQajY2A==
X-Received: by 2002:a17:907:2cc9:b0:9aa:1e43:d0b9 with SMTP id hg9-20020a1709072cc900b009aa1e43d0b9mr886782ejc.5.1694772436590;
        Fri, 15 Sep 2023 03:07:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ay21-20020a170906d29500b00992e14af9b9sm2192760ejb.134.2023.09.15.03.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:07:16 -0700 (PDT)
Message-ID: <862905cc-48c3-2dc9-6032-6ee189a629e6@linaro.org>
Date: Fri, 15 Sep 2023 12:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
 <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org>
 <CAJM55Z-GMm5Hmk7-QWt8Prvp7qyFzOrQVjOjB7jfoX-oiT_C1A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJM55Z-GMm5Hmk7-QWt8Prvp7qyFzOrQVjOjB7jfoX-oiT_C1A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_030721_066591_44A70671 
X-CRM114-Status: GOOD (  20.11  )
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

On 15/09/2023 12:02, Emil Renner Berthing wrote:
> Krzysztof Kozlowski wrote:
>> On 15/09/2023 09:25, Wang Chen wrote:
>>> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>>
>>> Add quirk to skip setting the input clock rate for the uarts on the
>>> Sophgo SG2042 SoC similar to the StarFive JH7100.
>>>
>>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>
>> Missing SoB.
>>
>>> ---
>>>  drivers/tty/serial/8250/8250_dw.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
>>> index f4cafca1a7da..6c344877a07f 100644
>>> --- a/drivers/tty/serial/8250/8250_dw.c
>>> +++ b/drivers/tty/serial/8250/8250_dw.c
>>> @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
>>>  	.quirks = DW_UART_QUIRK_IS_DMA_FC,
>>>  };
>>>
>>> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
>>> +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
>>
>> Why? What is wrong with old name?
>>
>>>  	.usr_reg = DW_UART_USR,
>>>  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
>>>  };
>>> @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
>>>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>>>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>>>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
>>> -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
>>> +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
>>> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
>>
>> So devices are fully compatible? Then use compatibility and drop this
>> patch entirely.
> 
> I'm fine with this, but these are two different companies and SoCs that just
> happens to have both implemented the Designware UART with an inflexible input
> clock. So if fx. a real quirk is found on the JH7110 then we'd need to either
> change the compatible on an unrelated SoC or change compatible on the JH7110 to

Wait, why? The compatible is still there, so you just add here proper
entry, if ever needed.

> something like "starfive,jh7100-uart-with-quirk" and "starfive,jh7100-uart" will
> forever be a quirky way to spell "dw8250 with inflexible input clock".
> Is that how device trees are supposed to work?

I don't get this part. But anyway if the blocks are really designed or
done independently and there is no shared part, except the DWC block,
then indeed the compatibility might be just a coincidence...



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
