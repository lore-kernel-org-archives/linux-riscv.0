Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6DC71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 02:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5LXD4Jdd7O8HveZECHoqEAXdZ8n4WJSmvQmPhwfppc=; b=Lh2oCY7e6yE/Ce
	Xkzw2bpb0FAgB+ECqfEYt9nJ4DNpbs7L8pbrOVdYFeQ4jWgsM3fjKZMG7JweH8B1S3qsCABLWY/j3
	6GX+0mLo5dRVnWIlAhA3DPDtR2WW+HVCzuqjb8mdW5mY87vQjLHQzaXVGJoJ5UfYM3bw0OUP0Cq5B
	8B2hHiOlAQ7SoXYLPy+c6/c+P6HLTVaqdwN3zJc6s2N/RtTt+RVRKjGF3srWXxxx1taUBaH+1kDmA
	+eWlZ4T89TdEQrsdEhue1HX+bgBKXZEwzhr5xX8hPO2ZLpJ4Qgj+NYZjVtfhhlLmSB6eGdh5V+M7H
	JHhOgo0N4r6Zh1bcvCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtxj-0000000F7js-2LF5;
	Fri, 13 Jun 2025 02:16:11 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtxg-0000000F7j3-2Vmr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 02:16:09 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fabe9446a0so17536756d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 19:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749780967; x=1750385767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=qjfwLjd0N6MpmLi+Bw0wap6uTnb8HB3q+0GP7TkwIANWdcjMRmDlZXUS9hJKFX1QkJ
         4B90u2CDeXsgeQVnJfJ+XJ5P6IFZOOiwpSGxCojwM7Gx+/JJ/yG0Cdg9F8wsjW7m7zcT
         VJkQpU1slEP/RbeUH5fnX7w/4WZpA4EMdEGqmn0nidUvWftQhGrBvFcGIxtiHxw8dyuo
         7h21ojV9aD936IT6daoEybZrvfiJ7Axw38VTh/3T/31kPqzgcjIUSYdBcgKkGPXQX9Tm
         hF9oyIiaNxDqtjKtxKmrRLzqGi680PCcWfJG2T3evWYK+6ighASobI9m0wkORct5hLte
         j8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749780967; x=1750385767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkp2SwT2RePaCxrYCauyGX41s3IGrIg/X27XfJMOji4=;
        b=AwWFV0M+g9W8aNdpMA4UtxqkraKuMoWPrkWKC0ro7HNZF8pLl0bLz94AuPRb6cpiAD
         LZS3pfmrduYhxasGCzl6By0yS/uV4BrfXyTNnvA+yC0c+6J3pttXSz3lbbFJURxaY8Fm
         9oRezOcMJ2DFwf48tdNQPdL03nkzTz76MuO6IYHQmTQ3helMOgY4RkH+J/t/BERLfyeb
         7W21jhs6Ixu4Rhj16v3QkhCYMjwLp3+S4K0/J7FhGbOrBrkziEUpkqWVN1iCPSOqDZWu
         8d5MynnQFGpfWhwkzDiS0RG0q8iT/JGOJQ80eOGAKUkxcNNUn2B9VWx8dVN6tIY10hrQ
         4huA==
X-Forwarded-Encrypted: i=1; AJvYcCUMSSRP+tGtQOMqCYzMRnpBErtROJ4f/iPWgikoJXMFQ1yCTMIFRPnKkhqi2iDyOaBbBXUS4PMzcY+/xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9kUHWncb6etivdCigp62fs1s4mV/MWBBhbDw3itzac4jPD1am
	XIsO2LBxihY9Gs8ilLlZeOfbceFLMosqTo/t8Q4rByRrXYi9DuWCEONbAx6ZGIs5Dck=
X-Gm-Gg: ASbGncv6BxsVF8AMEGm7+7bWQ/H/pnJ9Lgw87Rzc5XcC+GU4cwRDmGubybTsK8zWCYC
	BbqsB/y7fh8XpHEzuz3hmZsWK7TO2qvnDIrxzoGqYUq/jXXEkWL+rFQ370izXXHRDNZCe5cTHVE
	LxwVlGZ6DjCrltrodGRlDORJ1WF3Ve4nIf9GSHyFHZU++2w+hDphFtz7ekX4qOeYypdwqL+1w+8
	p7iZRSfE52RMfHv4qgT/GEY9GYMvZPiS3TWH0XRJV4i8ytlph5YwshgW+vqlMfzWFd+nGBA9PQB
	0SGK6nYqMccsOfdv90saFLfHiQOkWdw8uXUiMf6ahfzdicfyCiWoN8+CLaZna86Xnnp82X9BN3f
	vWF+INxOAiCE9+Im8/O+YRxcacQ==
X-Google-Smtp-Source: AGHT+IEPrCYVuYaf2snbGSL6nYTSnkJ5v4bgC7WUqyASAClJfsf2Fn+WgQFF908p7KrLOpj+L5tcig==
X-Received: by 2002:a05:6214:230a:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6fb3e629659mr19306186d6.45.1749780967455;
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c895f2sm16333826d6.116.2025.06.12.19.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 19:16:07 -0700 (PDT)
Message-ID: <d7f7dc4c-5d2a-4f63-9451-5e4d2e53cf1b@riscstar.com>
Date: Thu, 12 Jun 2025 21:16:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: k1: check for transfer error
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 dlan@gentoo.org
Cc: linux-i2c@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.dev>
References: <20250612225627.1106735-1-elder@riscstar.com>
 <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aEuI9-QWCv6CRUyX@troy-wujie14pro-arch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_191608_876125_375E3CEE 
X-CRM114-Status: GOOD (  20.93  )
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

On 6/12/25 9:12 PM, Troy Mitchell wrote:
> On Thu, Jun 12, 2025 at 05:56:25PM -0500, Alex Elder wrote:
>> If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
>> complete, or if the hardware reports an error, it returns a negative
>> error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).
>>
>> The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
>> which is the i2c_algorithm->xfer callback function.  It currently
>> does not save the value returned by spacemit_i2c_xfer_msg().
>>
>> The result is that transfer errors go unreported, and a caller
>> has no indication anything is wrong.
>>
>> When this code was out for review, the return value *was* checked
>> in early versions.  But for some reason, that assignment got dropped
>> between versions 5 and 6 of the series, perhaps related to reworking
>> the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().
>>
>> Simply assigning the value returned to "ret" fixes the problem.
>>
>> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>> v2: Added Troy's Reviewed-by
> Hi Alex, you added the changelog, but the subject line
> doesn't have the "V2" suffix. Is this a mistake?

Yes it's a mistake.  I contemplated sending an immediate
"oops, this was v2!!!" but opted to wait until someone
like you asked about it.

This *is* version 2, and I made the updates I describe.

					-Alex
> 
>              - Troy
> 
>>
>>   drivers/i2c/busses/i2c-k1.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>> index 5965b4cf6220e..b68a21fff0b56 100644
>> --- a/drivers/i2c/busses/i2c-k1.c
>> +++ b/drivers/i2c/busses/i2c-k1.c
>> @@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>>   
>>   	ret = spacemit_i2c_wait_bus_idle(i2c);
>>   	if (!ret)
>> -		spacemit_i2c_xfer_msg(i2c);
>> +		ret = spacemit_i2c_xfer_msg(i2c);
>>   	else if (ret < 0)
>>   		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>>   	else
>>
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> -- 
>> 2.45.2
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
