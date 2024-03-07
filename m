Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4FC54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 17:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgdTQDIjbDq0slaB5ASWfd2B/5lvV2M9v8ZLykgoN+s=; b=CBZYBnW8Sk/sZQ
	xRD+XedCzd6aKsS+FvJg6Q7KXNZudme1ZHJrxcY0m2hU4Vp5f3FfeqhLIeWB4fuYIClZAcUPJ5EK3
	eEiqns3YPHHxace1B+lhjrlvkUGtzHDflO6yOf1QBm1Zz9Xfi2qIUmDiuneUh5fnLSEONMnaR3Ldn
	mdWBFRHOwPiLrw/MatrDHgJcbJk8NBcICN5XXO48Mk+4KxJpTrdc35LO0uwfEuFze4HzQAzhG8ve7
	xqKr7ESKPyDjVB1cbdIQadD/hbq0x6KZPlnQ0Kth3bXxAUtumfMlwtCzDjmtLQOW7/E4yLhE0uJ+7
	HzS3/orGvgByoWDKeILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHmi-00000005kj9-2RMf;
	Thu, 07 Mar 2024 17:44:00 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHme-00000005kiL-3z2k
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 17:43:59 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7db36dbd474so15347241.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709833435; x=1710438235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGhxsCrSlIL1H5bPGz05hojfL4uxXqMBgjkZvvXNIfs=;
        b=EK5dndR72nI+3dcfKbaXPdaYa4dmLNrI/3GdsVA1VrTCKJOu82D+WUZro9qpU01p/7
         B37s0QXq18CKXhb/H+GjGJraHHhciiVLOF5/FVaJ5nuKULxKRYyxr1GLV6y1BocRQdBe
         Hdk+eL0bQvhxLF4XfzzJhHnaFC33QulJWVyccWIZnicAiIE2EoyYnzJ7hsoSv4Btjnrz
         3HGNEtgGSbHyVUVZg2vmJHtuySo2gc+rExSC1d6miNaFLbpZG0QXAM5DykZDwNruvmyl
         Gm9il9GG8oG8FMHd04fabbcxRMGRJlU8zIckxGb2z798DOSsiHj8ftJCmusJW3dbspRI
         I93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709833435; x=1710438235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGhxsCrSlIL1H5bPGz05hojfL4uxXqMBgjkZvvXNIfs=;
        b=TqhgbGZE/mrm0FoDTyh2W8psFTbtC5o0b1nmb90kmF/Hq/R7hxRXFktlkFQCVZVlLV
         JpUJaIK1ZCOGiGUeEIMbYcCP97XyaXNNblwq3LfbOmxoNLSgYEdx09clyTIrhjnEoWW+
         t+ursDCDcYRZYdQLVuMH3FNODdHYjeKian4mdHPmiz8ejTAKrwyB64P6wkWuWsUlRzrR
         V8JtGcueV/tIdnIqVg/DOYzBQHiXDQGJNCL7RSU841KGKwlcfTP9gIC/wg1MApCOwB9X
         dhbYrlhq7M+Pec6m6XX+lhuj/ScCu08/t55U/331BsVK1WrUB99jdV7WjkrejwmUyRnf
         a/iQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/r2JWiQ1+7ZxRwmvEyYxaIpUv8tEWsVjToCN39ydGX8GvW802J3ufJe66OGxxd/Qv4YdDhX2eWoTLdJzZ9y+TFY/qkVELg3YdRRZ2o9+s
X-Gm-Message-State: AOJu0YxTRGONbFW0RVP+KeFpAmFIbuZq+fOuOfbr7p15pYAtGMzfyYUE
	Tl1nkCeY9X5U9dLPchr1M/0gbKUR9U5qadYbbXRM11LT5OwEWo5+v/iz1KsP4rY=
X-Google-Smtp-Source: AGHT+IHmKnQCHSzfI8s8d2OPjXV6i3chOIHlVgGQnD/3C11o0velNtkBVN4Qz0YnOiMcDdD/zL06Fg==
X-Received: by 2002:a05:6122:2912:b0:4d3:48b9:3c91 with SMTP id fm18-20020a056122291200b004d348b93c91mr9559208vkb.5.1709833434964;
        Thu, 07 Mar 2024 09:43:54 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id vq5-20020a05620a558500b00788242166dbsm4994715qkn.133.2024.03.07.09.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 09:43:54 -0800 (PST)
Message-ID: <4d85215e-64ca-491c-8f69-f2c83c7e72d7@sifive.com>
Date: Thu, 7 Mar 2024 11:43:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: sifive: Remove 0 from fu540-c000-uart0 binding.
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20240304105947.SJcVAdr1@linutronix.de>
 <20240304-whomever-gladly-d43da7ad2fe6@spud>
 <229b34c1-5419-93ae-0a6f-a21cf4e4a276@sifive.com>
 <20240307090950.eLELkuyK@linutronix.de>
 <20240307-sacrifice-dares-09c91fc8fefe@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240307-sacrifice-dares-09c91fc8fefe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_094357_062087_4878FA4B 
X-CRM114-Status: GOOD (  22.77  )
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

Hi Conor, Sebastian,

On 2024-03-07 11:39 AM, Conor Dooley wrote:
> On Thu, Mar 07, 2024 at 10:09:50AM +0100, Sebastian Andrzej Siewior wrote:
>> The driver is using "sifive,fu540-c000-uart0" as a binding. The device
>> tree and documentation states "sifive,fu540-c000-uart" instead. This
>> means the binding is not matched and not used.
>>
>> This did not cause any problems because the alternative binding, used in
>> the device tree, "sifive,uart0" is not handling the hardware any
>> different.
>>
>> Align the binding in the driver with the documentation.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>> On 2024-03-06 18:48:13 [-0800], Paul Walmsley wrote:
>>> On Mon, 4 Mar 2024, Conor Dooley wrote:
>>>> I suspect that the driver is what's incorrect, given there's little
>>>> value in putting the IP version in the SoC-specific compatible as it's
>>>> a fixed implementation. I'd change the driver to match the bindings.
>>>
>>> Agreed
>>
> 
>> I didn't add any stable/ fixes tags as I guess there is no point in
>> backporting this.
> 
> Every documented device falls back to "sifive,uart0", as you mention
> above, so I think that's reasonable.

Right. In fact this means the sifive,fu540-c000-uart compatible can be removed
from the driver entirely, since the driver would match sifive,uart0 anyway.

Regards,
Samuel

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
>>
>>> - Paul
>>
>>  drivers/tty/serial/sifive.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
>> index 0670fd9f84967..cbfce65c9d221 100644
>> --- a/drivers/tty/serial/sifive.c
>> +++ b/drivers/tty/serial/sifive.c
>> @@ -761,7 +761,7 @@ static int __init early_sifive_serial_setup(struct earlycon_device *dev,
>>  }
>>  
>>  OF_EARLYCON_DECLARE(sifive, "sifive,uart0", early_sifive_serial_setup);
>> -OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart0",
>> +OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart",
>>  		    early_sifive_serial_setup);
>>  #endif /* CONFIG_SERIAL_EARLYCON */
>>  
>> @@ -1032,7 +1032,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
>>  				sifive_serial_resume);
>>  
>>  static const struct of_device_id sifive_serial_of_match[] = {
>> -	{ .compatible = "sifive,fu540-c000-uart0" },
>> +	{ .compatible = "sifive,fu540-c000-uart" },
>>  	{ .compatible = "sifive,uart0" },
>>  	{},
>>  };
>> -- 
>> 2.43.0
>>
>> Sebastian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
