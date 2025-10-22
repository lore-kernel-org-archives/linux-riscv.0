Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EF3CCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9T/TjzbzokBC2eBDazasC4PK/axeuXvy3XVzLpRBmQ=; b=t9NE4d4RRliEgm
	ESDRjClTdaIPiE7lROBt6+LazmNratnWKXy8naoCTUX321OM8flqOtMpBf7RTAw3cqEgOOlc028Xw
	yt5Vt/7yzThHWQrKvBgf6+4KX1rfWhUMbEm8M0OY9JG6Edgxc/5qfljTbLHh7zFMx737wu4KMNjlQ
	NFPv0DtUMQ0vyU6uOxAxTHPAAxVxOjpYR7DJFRt87Sx0s2ZXrjugmnQuvebERMiW6RPkqTi6ONAxX
	/p7h2efStrDTqwnqgfSMlVXHnzsSHWe2ValXPjdQJSbEPtYCvb0Rg1bnBB+ObMF7bd5CMebov7DTl
	vXlGmw+MvAWYmOesVNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYK-00000001R9g-1zfU;
	Wed, 22 Oct 2025 04:34:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYI-00000001R8w-27ei
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:34:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-26d0fbe238bso46739015ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 21:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107662; x=1761712462; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXV9nPTtzRS7GB0GpGCBfWyozkzIjx5wpujc/niwppI=;
        b=p3qDfl3cFvJInJoDFioWFo7yr/rQoV7q636VcFR2eLuDdc6FZEeqeGq3jYO6hKW7gh
         Ce3PYTn2KJfhaQB4I9WniAtwU5eq+L/deX+l64Did56rH6A6GNnajNpo1UX5xGPp1pQ+
         alAeNo2BvNhmmgHfW7px32HG7EhAdLleoqFto88303ecGZ9aATr3KuQUc8FbNNh4VJqM
         /Z+caTlgjOmHmJlwNDl13rDUkT9y8mQPW2RfTiR9pEXfGC7zj2xS4W5pxODM7BIK/+u5
         zWOcJlvpedV8b/n2/IFXt6H5MoM1N16g6BB1hU/eYwqk9fLhDyNDV7b5BNpA4wDgXXD5
         qroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107662; x=1761712462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXV9nPTtzRS7GB0GpGCBfWyozkzIjx5wpujc/niwppI=;
        b=WMbC1K/x05VlFgUChmQINuePu+yaYcCIgfW3H/6iKdgcTKKZXYVagCbr8TEy04Q35j
         E+71xPo+/xD1vwOZaKdeqaVhrIL2XZeivxbVvY1y+SKtcLQGpMqfNNT5dsYv+O5SXcd+
         CuPVsaKHz66iHKm6LVP5wlRNxizOkRRZJeS8cTB5yGixf1n/Zc3aiY0Yg6QvDqqnYT+z
         iiPNsV7IaZ2HmFdromSN9/07hXltLnhnhFCn8UwMKnzaI4pjBMCU7pT8WjJmHRf9GPa0
         a8xseyy3IoJQur+6x/zccT09VGC+W1ZoUfbfHUq/1RFMsomLZrHHPgax/BeX6V+vgcNw
         hetw==
X-Forwarded-Encrypted: i=1; AJvYcCU3hNup2D19Kb++1MU74PR0a2kqtCdSDYLU0fTiDa9BCL1H4j1TO3y9uLsgFpdyHyScDD6YMn0Giit0Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSaoOZZoBgCBrVr4NbeUL1ePiyNIzwdQCf1kiO52/NI2bhh4T5
	fRGxkyP27L86pVpAEGik7ykuh41AvBvx1GAB4ciLnCch1TL2yQ+DuLHTZYaJy8jOYSM=
X-Gm-Gg: ASbGnctBAQ7r7VieDOjEPumKsB3NQN/DKo/9Re/AZvPILfBKWaJ9GoGn7HcvzUgHq8J
	EceIgIHPNNzmtwlxcOhIe8t/9Ljb4cD+H6VTXOCVkD/RMgapUJ1zxcWhC8Mebvbb3uplNdjfa+y
	ii5U0oEXTIAetMv5KjEK2wxOXB7kTLzO0iMnU3VL/G5zRIocNIVRIFDf7btJWkZAstNMdCD5dCV
	ECAX7F3gp5uUNTV2/pBEa8m0rI1OpcdNrvo0nFloxpq8TbbtA4xEo9kg8K4RgYDZ0QXRSI+XJM5
	YUqHun65rkztczHJe+OWbHG2+AFlVt0v2tOvYZXz0O9i8ccGci/T6AzDo213IxkrkngTanIJECq
	zyJWNbb6DhAb9evfnp8y0gzEUyZKFwccqSoeNs9QMv665ljQYsxfY4diU2Tx6eXynI6xIJ5PJTV
	U24c95TpMcNntN
X-Google-Smtp-Source: AGHT+IGMxMq8ODA384WIjA22NE56jXOrifm3A5Z150bOKY/fGOgxvMMpMNK8BhQcEf3SEUsHJhYpWg==
X-Received: by 2002:a17:903:298d:b0:267:87be:505e with SMTP id d9443c01a7336-290c9cbc185mr219746635ad.23.1761107661774;
        Tue, 21 Oct 2025 21:34:21 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:21 -0700 (PDT)
Message-ID: <c93c1319-2f1f-4303-bb4b-751979f58149@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] spi: fsl-qspi: add optional reset support
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, p.zabel@pengutronix.de,
 dlan@gentoo.org, guodong@riscstar.com, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-4-elder@riscstar.com>
 <aPaIezCu/gXxJC01@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaIezCu/gXxJC01@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213422_564361_AAFF2C7F 
X-CRM114-Status: GOOD (  16.90  )
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

On 10/20/25 2:07 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:46AM -0500, Alex Elder wrote:
>> Add support for one or more optional exclusive resets.  These
>> simply need to be deasserted at probe time, and can remain that
>> way for the life of the device.
> 
> Nit: please wrap at 75 chars

You're saying wrap at *longer* lengths, right?  If not, please
clarify.  I'll update in v2.

Thanks for the  review.

					-Alex

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index c887abb028d77..1e27647dd2a09 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_qos.h>
>> +#include <linux/reset.h>
>>   #include <linux/sizes.h>
>>
>>   #include <linux/spi/spi.h>
>> @@ -267,6 +268,7 @@ struct fsl_qspi {
>>   	const struct fsl_qspi_devtype_data *devtype_data;
>>   	struct mutex lock;
>>   	struct completion c;
>> +	struct reset_control *resets;
>>   	struct clk *clk, *clk_en;
>>   	struct pm_qos_request pm_qos_req;
>>   	struct device *dev;
>> @@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
>>   {
>>   	struct fsl_qspi *q = data;
>>
>> +	reset_control_assert(q->resets);
>> +
>>   	fsl_qspi_clk_disable_unprep(q);
>>
>>   	mutex_destroy(&q->lock);
>> @@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>   	if (!q->ahb_addr)
>>   		return -ENOMEM;
>>
>> +	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
>> +	if (IS_ERR(q->resets))
>> +		return PTR_ERR(q->resets);
>> +
>>   	/* find the clocks */
>>   	q->clk_en = devm_clk_get(dev, "qspi_en");
>>   	if (IS_ERR(q->clk_en))
>> @@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>
>> +	ret = reset_control_deassert(q->resets);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* find the irq */
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret < 0)
>> --
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
