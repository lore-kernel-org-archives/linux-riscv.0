Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F62CCD195
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cCpQb78ge8u+QgdSEcnSZ41pMjlV/eMYVtzk/7Wo8I=; b=eDqMZaVXIJzGaj
	uhTeXPA7iTnJgEPuytG4cCBIAlU53B7/CgZ7gJTlCODHDdu15+O7ktP6iBuCmwtZCnFRx2pzwGObW
	SMnov5BLms6XEfLF+ceiL+7iGkZwXiE9uUgNCzkHtLPw5SI0hhtSRyuq12zDoEeWlMaUAy2J9WMr9
	zJndSmeR1ieHbHUWkGuaJz2dKzcXwwpYOMIHLxhLv9nXuF56/cAyQDDqisrpY5Pu32Y02zg7oOj2o
	ANtIgPLCGIOmTujY7h+drlWXIMvAYcUHMDJFyHy2ngu4+y2KmDgLHHfsxhNOYtLQi2qagMMeNqslj
	daxA+DELYG5QvzBp2MTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYN-00000001RB4-3Kk9;
	Wed, 22 Oct 2025 04:34:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYL-00000001RA3-12yE
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:34:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-269af38418aso79654145ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 21:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107664; x=1761712464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EssM+PiDmpcGAGhJSWtJ6fJ+4b18HXlZ45HuXkPg0+A=;
        b=h3IfFYF77kOFYhHn3SHNGBF6OFBkmmon0y15kJvrzWdKiQaHz7FcN+DeYez2+ihM4C
         HeVHDMawmpSuNBER9mN+Efu/Ax6CntKmO2W+dKCGSguhtTgvOlq0XnU51cokt9K1Cs3B
         f/x6809vVTis1cGx67ksh8f16qEupFtIz1S4+mTZa7IcC21Qw0BlYpxdY6x8VFeKp/Ud
         v51hblGEKL4V6Xhj5rvI9F1rtvm30UWZbmbRVLatcSkhElCVMVFKnQi7tDP4gufjOE69
         D8fWb36sBYCB7aGGDqZ3pvYGm21Hg4QWrCnRsEuxNgGGKAniuw6D1L4hCANibgsYJWFC
         ZDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107664; x=1761712464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EssM+PiDmpcGAGhJSWtJ6fJ+4b18HXlZ45HuXkPg0+A=;
        b=E7whiffgsR7gxYZq+SmZhtdNd09MJtZz2tSR69BUn82Rt3WgnJEev03LZULETqYS+B
         CVuv/YjgEgo3tz3F74VP0yEIOc+8RoefHkkDP6Og0Rap1GxzAm0OAmKAjs33wlOEEbjA
         BFVc07TRYXFZuCkYn+xpnLAAIGeGh0ps3mbAaxOD5M17mG9JeoSqQv7mv4Vpj+wUkR5C
         RHDVw7YYsz0RojeFu6cnf+USC6d90yCee7DcX1WUud5FoYgGQ74MeEfOkbOiWXxQHUa+
         4UUFR3G2V5rmqApP7DcuMq0RXotiUgoKk0EUoWoRLUsSAblqp7EbXaijPx6IeQEbl9p6
         5Ftw==
X-Forwarded-Encrypted: i=1; AJvYcCXwCIg4E4cZS2WeC8/N0QeeUY7k4frUZepFr3V4/xLw0Y4Dd1x0dX8DyfuhFZ+33Z8wF/IkPEmi6+qNUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo+n8vIGclbX5wjZHHE83QOKXZmAjsgZf4wC25OLh0b1qf9nLw
	JkK3layD34lupDKO28G3EmbxvTcXCnO3ANiFfCibTzxKzzhesvCXhSrewVYgiOThsBw=
X-Gm-Gg: ASbGncsMCt1SJlTKd9Im9PahaeO+GHYpj1LJPz7XEoskvIbfKFREtVqMFMwu4Ghbohu
	E2Rf7+5F+BE8qyksPgOeaY85vJf581jgg8XdQIBd8PcW+byP9kgQ5puCKHcGOs68vOhjqK1jgc5
	ls0vqWrU+RI3bc9OHmh5G6oHRCky2E+bjindjpPozWcCCB+I3tCXTis7GSTHYcm+kf2M+f6OLsk
	5TaCZdABEjOmw8ZvQyAW1ew8n6gj+WOuHjP02x+9ZKl7XRDx2tprmk/ePKsSRxQGPWxLeAISXm2
	ogkNIt5phCHJZ+It8mIYaV7KQ7p6YZkBqghLYVrslhjIbAQIkQnCq7o6FeT9bjRn32Ytg1lF1dN
	m9KvJzEiLVnQ8gueQbSvCt4gKVo/V5JHj/ESg52z6AY7l/vp11Y6LcqWcug27oVVI5hpI0sSxsk
	sgUDU4l63UY085
X-Google-Smtp-Source: AGHT+IF+2IOi2vlkb7frAQI7xnO/+5ggSuzSXcXZ4DCJ3RIWA9BMWmGP9exglnUcXrvVgUWfIgCoyg==
X-Received: by 2002:a17:903:228f:b0:24c:ea17:e322 with SMTP id d9443c01a7336-290c9c89cbemr234187615ad.3.1761107664444;
        Tue, 21 Oct 2025 21:34:24 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:24 -0700 (PDT)
Message-ID: <d13590f1-937d-4ef6-8d2f-d0647557b695@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-5-elder@riscstar.com>
 <aPaJ479zH/90fJ2d@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaJ479zH/90fJ2d@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213425_309912_B0CB9742 
X-CRM114-Status: GOOD (  17.56  )
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

On 10/20/25 2:13 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:47AM -0500, Alex Elder wrote:
>> The SpacemiT K1 SoC QSPI implementation needs to avoid shutting
>> off the clock when changing its rate.  Add a new quirk to indicate
>> the clock should not be disabled/enabled when changing its rate
>> for operations.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1e27647dd2a09..703a7df394c00 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -197,6 +197,11 @@
>>    */
>>   #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
>>
>> +/*
>> + * Do not disable the "qspi" clock when changing its rate.
>> + */
>> +#define QUADSPI_QUIRK_NO_CLK_DISABLE	BIT(6)
> 
> NO_CLK_DISALBE look likes not clk disable capability. Maybe
> 
> QUADSPI_QUIRK_SKIP_CLK_DISABLE

OK, that's better.

> 
>> +
>>   struct fsl_qspi_devtype_data {
>>   	unsigned int rxfifo;
>>   	unsigned int txfifo;
>> @@ -306,6 +311,11 @@ static inline int needs_tdh_setting(struct fsl_qspi *q)
>>   	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
>>   }
>>
>> +static inline int needs_clk_disable(struct fsl_qspi *q)
> 
> bool type?

Yes I agree with this suggestion.  However all of the other
needs_*() functions return int and are marked inline (neither
of which I would normally do).

You want me to add a patch to update the others too?  If I
do that it will look more like this:

static bool needs_swap_endian(struct fsl_qspi *q)
{
         return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
}


					-Alex

> 
> Frank
> 
>> +{
>> +	return !(q->devtype_data->quirks & QUADSPI_QUIRK_NO_CLK_DISABLE);
>> +}
>> +
>>   /*
>>    * An IC bug makes it necessary to rearrange the 32-bit data.
>>    * Later chips, such as IMX6SLX, have fixed this bug.
>> @@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
>>   	if (needs_4x_clock(q))
>>   		rate *= 4;
>>
>> -	fsl_qspi_clk_disable_unprep(q);
>> +	if (needs_clk_disable(q))
>> +		fsl_qspi_clk_disable_unprep(q);
>>
>>   	ret = clk_set_rate(q->clk, rate);
>>   	if (ret)
>>   		return;
>>
>> -	ret = fsl_qspi_clk_prep_enable(q);
>> -	if (ret)
>> -		return;
>> +	if (needs_clk_disable(q)) {
>> +		ret = fsl_qspi_clk_prep_enable(q);
>> +		if (ret)
>> +			return;
>> +	}
>>
>>   	q->selected = spi_get_chipselect(spi, 0);
>>
>> --
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
