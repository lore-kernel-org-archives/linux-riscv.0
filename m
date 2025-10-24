Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E537CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvXcOA+BYdEnQS8ExJh4JPKqj3UoDF0ePNDUzfxiTiI=; b=K5fqvaWtGQo0Ki
	Cncf38SPBXH//+B7oPJ7Ecyge+54aX7XULMd6Wv2Pc5gYuX/MBC5XeBQhvYn0IypoEp+ie7jAZXws
	2F3IMnorfuG42FLNODz7MQbkn9AajuNHQPTPgAO4d0jSygIBKJkX7Of9zrNvKkfL9t+hm415T3scc
	L7LH42ZSRxQRWdXcE3UFr6wOCqmNRbc0MQN/TVh+nP0YRHLi2ZJpinvQwb0Pkhd+L1oMThtMEfMMc
	yO3zQAtexKl/iNdFhMxoUEiTwjKNtdWMj35jnZHovnAx6vAHFE/NC0yEesUMDEO5IgDvqF0qwT4Qm
	VXThhgp3xrQ41/j+LZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Hv-00000007s0H-0Cd6;
	Fri, 24 Oct 2025 00:04:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Hs-00000007rzL-3epr
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 00:04:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-292322d10feso12353285ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 17:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264248; x=1761869048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB+cZBHLCpSws7+7BlwrY++97OnOWh6DYfkP9FhnwvQ=;
        b=spMxojfkGq+9H0WJJys45+/JwCZaDxja5f7LgfSLW+HSlCnfpLJdf0E/byqSyGeQa5
         hBSF+kkaMX9lSzbEl0V5NaRLu/kXeFCmZ2+kC4FIh12mCCAQWZdNVP3CKJHg79aZM9G1
         uLer0iPATHnjf90Rt/JJlEE5rZ8DON07u9RqAW8hLJcGUaCtlNUOhjGascTJ0POUzKht
         Jq8q3ff9qBP3T2OsOn1q11+DDwBbVhbWkb3QqKvmuv2bj3wIE/MJQYE8QpgztO+DY0jl
         0Tu+0U2Cvro4AOoi+fJWLejrT7aREH8QR8X4D8i2jqjoDtBrtN8Ms3S4T9jUl0i59ZnK
         bGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264248; x=1761869048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB+cZBHLCpSws7+7BlwrY++97OnOWh6DYfkP9FhnwvQ=;
        b=C9OXRrhk47oKZNh2RNCBDKYLywjd9g/NJ8V8AySa0aSRushD2zvpvxtBM2B9M2Gj5C
         M9wkpkUrk+NQOvdYCMbgAUVBWbcAs5T+wufSVDj+Wl10F/VQ53g4bnuBXmbbbUPOw1iH
         SzsOjRE6IpoOAn75LiwosbNJIIwsCZ4l53kJzLYgPCVxuIWIJ1iKaISwx5poJV7KlGf7
         7/nCgvwZc0dkWKe6RTWoN7KFWX0ZrAosfOMgvYI+jYA0ck7k7XsURndklmh7jOmyuzE9
         BG98u2w09DRIAlV74pOCMxskHZupdOTVXbS+r3xzQ8S81sfrt406LB258DZGvkr5DU43
         litw==
X-Forwarded-Encrypted: i=1; AJvYcCV+ERSFBxdsaLSFHUWPwpA+2vssagfl/F0E+9nQac01brYMyxq61kW8W3/BhdF80hH0zH1j5J9JALRZgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0L7ji/LCvNrQyRp9hBZpt7EWb/qqzGzHgZAuASjIy6MfHVvkC
	Vhqr5fRaayJdEa1cWlz1+FVZkJ6XMUuKf+q0iqOEb2IKytZ6IP6oWfpFP6IBvg6m88M=
X-Gm-Gg: ASbGncsS9Iw73LOBfSsNHOJ9PVhCppWp/K9mvj+DTEmPSewLLwBUk7zBKcCRkQ1Xm0K
	ilxmPOiUGT1sOKez7F1GtmZgaqV/HIHWa4Ry5bS6zVCWRE1aolxl20Yy63g48t8H6XZ6y4UXJsF
	gzZFdn2AfRDovuCoMcgM5u8mCja8vfNsbCSMqlULyMZD11NoHebkIwfFizOkqi17B9sD6gA0pzE
	bGQdRSRfwY5SlMoSf7c2c+f0Yy0Vs1xz87ECQYgRlVn0+rze76ZPfNpOAkr2TFLmBph3FPuzg3C
	Tc6ZFVi4LlJYlZ+dp0BTB4+2uWkwac0GWkJdr9jkW5qP2xabpPnabx+h7pPrFtmLqu/gGUu+sam
	94109XJYBLGUyj5b9tYx7RGHWd/OP3Vh5b2rWJyk2QCQvfUaei/VFJJX3NaR5fpR+JgHhXQB9yP
	hv7QFsGd4pafW/eKWx
X-Google-Smtp-Source: AGHT+IG1GOEsittfwiwfypAgRO1bXivhphlMMbLL2fhQ3i2Er7Mu9kpHhxTrXPCZNYaEGYBC76LFsA==
X-Received: by 2002:a17:902:ef4e:b0:290:d8f0:60be with SMTP id d9443c01a7336-29489e70291mr8426785ad.30.1761264248064;
        Thu, 23 Oct 2025 17:04:08 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:07 -0700 (PDT)
Message-ID: <aea95912-9f06-4a3c-897b-d985c18e89e8@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] spi: fsl-qspi: switch predicates to bool
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-5-elder@riscstar.com>
 <aPq7ZnKrxbokwHxP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq7ZnKrxbokwHxP@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_170408_924469_EB8F4712 
X-CRM114-Status: GOOD (  12.42  )
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

On 10/23/25 6:33 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:16PM -0500, Alex Elder wrote:
>> Change all the needs_*() functions so they are no longer inline, and return
>> bool rather than int.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - New patch: predicates now return bool type and drop inline
>>
>>    patch (patch 4).
>>   drivers/spi/spi-fsl-qspi.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1e27647dd2a09..1944e63169d36 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -276,34 +276,34 @@ struct fsl_qspi {
>>   	u32 memmap_phy;
>>   };
>>
>> -static inline int needs_swap_endian(struct fsl_qspi *q)
>> +static bool needs_swap_endian(struct fsl_qspi *q)
> 
> why drop inline, and next patch needs_disable_clk() have inline.

That was a mistake.  I intend to drop inline on all of them.
Will fix.

					-Alex

> 
> Frank
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
>>   }
>>
>> -static inline int needs_4x_clock(struct fsl_qspi *q)
>> +static bool needs_4x_clock(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK);
>>   }
>>
>> -static inline int needs_fill_txfifo(struct fsl_qspi *q)
>> +static bool needs_fill_txfifo(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890);
>>   }
>>
>> -static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
>> +static bool needs_wakeup_wait_mode(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618);
>>   }
>>
>> -static inline int needs_amba_base_offset(struct fsl_qspi *q)
>> +static bool needs_amba_base_offset(struct fsl_qspi *q)
>>   {
>>   	return !(q->devtype_data->quirks & QUADSPI_QUIRK_BASE_INTERNAL);
>>   }
>>
>> -static inline int needs_tdh_setting(struct fsl_qspi *q)
>> +static bool needs_tdh_setting(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
>>   }
>>
>>   /*
>> --
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
