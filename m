Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC749CCD193
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiOqWn7JsC19FWp6wIqql4OSldiJX7HnxU9LKF8B/WI=; b=BcrHVGuINATSN4
	AK6m60meBaOHlG5Zw6nPNV+TZk0Gc5OZClaQC7za0WQbIq3c+Iwy8awiU2rmCAFbAk5Oitce56Bzc
	d1yVBEZ91x9zXDiGS21jz0jj9ocE+HhWt2z1v9yf2AzUqOEcnd0jNG/p0/zhsuWc01qrP8WZE8JYd
	bLz0XO/td97mGfiCYFy4fRd3mGZDdpxmd7wqccrZPTc9yNTq4M9a9aG4B88wLmhaKzH9skt28WK3p
	Pw8873SR7Tl4kARObixX2g6lQOPf7yGa+tCdd/5D2S9htlmEPVV/rTTUJdBoUKpTvxGSU1jTYIiG5
	UUfstfoYNwm1iFpf4fbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5I3-00000007s56-2lwO;
	Fri, 24 Oct 2025 00:04:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5I0-00000007s3K-07WK
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 00:04:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-78118e163e5so2442346b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 17:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264255; x=1761869055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=st9SBmAbK+pJ23fMLr1ycY9DK+4vkS9Hx7Sl87k4JR8=;
        b=0l4YQMcxP9rmXR4ubm+BqYMNcEKiyic1FTWkDh45THOKj4XWgupSHXp916yWw5whYW
         7IigUgF/glMpS6j9bfeh/qDuHBT/3caE/IT+BOuBFFY9G9Ltjv0j3IlHe/KFv7VOWHrJ
         vkkM9XW9andZq1dCxdIuj3TK7UQgaJyizxXAWdI9gGDKjJRXcCawfwtq3iHDxW0xkrXd
         0ZizROAZW4h8CLQkO83rFmllh+/DOM+uEwsC4pbEbA5mUMdGFrmIUqFAWgonmqBr/Unf
         8DIZzQep8i6kAhjb+x/ybRVxGOsNHhZNAN86q+F2iyEpSaNvt0tQiMN5/Hr58p5hYZCm
         zi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264255; x=1761869055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=st9SBmAbK+pJ23fMLr1ycY9DK+4vkS9Hx7Sl87k4JR8=;
        b=OgPZ0HHhdY7SFZDKWsrXFqyCvSZcPHeV+lYmGVji/X9NHHb5DP0e+7Tk6n71je73RM
         7QdfsLHWYWqW4CEZfioQwj0rW2VdZpNujmtUKgPRf0/nlqX+6Su58olzs5er2+voMc9f
         5o83O5qqGfOXItt+8IF4yUjJtV7n43wsIT0YlDT3h4PN+SQ7bCho4z0nZsPa4qySyO1T
         X8RELD8/uw+6ttnJOQOAYxs/n8dgq0/C4Ngky+1Jx8s9d175kDcFLW1jRnhTBxaM6ICC
         ZZJxcB/w3O4DhFs8MFVNiYz7JUwv8vJbmFG4ZVc6iLF09NEovuXYz6JPb0qSeblYWGb8
         Ac9w==
X-Forwarded-Encrypted: i=1; AJvYcCWkbKV6aK3n/MkKwY6qqGJb78IrRGaWzqeiyD0wPn9IuzFmMlz6kR+BG/KQz+cgOdBsF3kgbibAGy6gHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNr7RVt3hkKHQA5VDF5mGCbTIPdu8MK+vKvHWhFqgpksskgNlk
	xPVnGYc1O8sM6XwDuyBL0cvRGxYAStJa0q3bkRUKvhG+4nHCetigZvmsNuppKQcL0XQ=
X-Gm-Gg: ASbGncsTx380EHSnMb2cn0/2B8qWo7fDIBTrtxrwqEIPJYkDxR1AR19RtpsQdZ48ZbW
	GzSILsV+eDrqVqeO3zZQdNEVaIP4zWJ+TjBtUpUKn4MzLNfDMnfeKnaqscKVm8YEmU9XTjQc6Fz
	M9P2b3aSDwtouBS+Ya1OKOUdiW5r3QYO7H/ziRp7Hk8h87L0frS/dbAtGWFdgRtbPrs8B6VXqG2
	/s5RDcASyefHHo8VBwxerOVrKH63zl4cKzA6ZuJ0A9He/CFZ/Ijw6BOPo16xpwjSoI5hIG5s1RH
	SaGQHHtaaXAymN0rryrS0scSav58msc1RbivUHxwTsyRH8O5uJl7ceSypz9rZGiy47LbSXt/1Iz
	IdAGaDm4m+12tS7+rHROaCxaIpXRvykzt+7USXompUaN21vFg6BltEi1O3XwkBs0rK0CtsO7Lok
	dfYZhvne5PShtezwjSo5zfl1I19EE=
X-Google-Smtp-Source: AGHT+IG4cAqt2nwKmVZj2ECX6/woNYxm9obKHW2gmp+s3pOMBjf8gp6N1gNa2I6RxiJ8JXE2VP7MyQ==
X-Received: by 2002:a05:6a20:394b:b0:2c2:f61b:5ffd with SMTP id adf61e73a8af0-33db34e5145mr934623637.10.1761264255098;
        Thu, 23 Oct 2025 17:04:15 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:14 -0700 (PDT)
Message-ID: <aa306536-f09b-414c-9e6d-0b69d69040a4@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] spi: fsl-qspi: allot 1KB per chip
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-7-elder@riscstar.com>
 <aPq8ibj2KzQhtYQT@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq8ibj2KzQhtYQT@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_170417_063400_B9C4FAFD 
X-CRM114-Status: GOOD (  19.47  )
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

On 10/23/25 6:38 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:18PM -0500, Alex Elder wrote:
>> In fsl_qspi_default_setup(), four registers define the size of blocks of
>> data to written to each of four chips that comprise SPI NOR flash storage.
>> They are currently defined to be the same as the AHB buffer size (which is
>> always 1KB).
>>
>> The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
>> four sizes to be multiples of 1024 bytes.
>>
>> Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
>> non-zero, will be used instead of the AHB buffer size to define the size of
>> these chip regions.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - New field fsl_qspi_devtype_data->sfa_size now defines the size of
>>         the serial flash regions if it's non-zero
>>
>>   drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index c21e3804cb032..a474d1b341b6a 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
>>   	unsigned int txfifo;
>>   	int invalid_mstrid;
>>   	unsigned int ahb_buf_size;
>> +	unsigned int sfa_size;
>>   	unsigned int quirks;
>>   	bool little_endian;
>>   };
>> @@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
>>   {
>>   	void __iomem *base = q->iobase;
>>   	u32 reg, addr_offset = 0;
>> +	u32 size;
> 
> I think use 'sfa_size' is better to read code.

OK I'll rename in the next version.  Thanks.	-Alex

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>   	int ret;
>>
>>   	/* disable and unprepare clock to avoid glitch pass to controller */
>> @@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
>>   	 * In HW there can be a maximum of four chips on two buses with
>>   	 * two chip selects on each bus. We use four chip selects in SW
>>   	 * to differentiate between the four chips.
>> -	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
>> -	 * SFB2AD accordingly.
>> +	 *
>> +	 * By default we write the AHB buffer size to each chip, but
>> +	 * a different size can be specified with devtype_data->sfa_size.
>> +	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
>> +	 * top (end) of these four regions.
>>   	 */
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
>> -		    base + QUADSPI_SFA1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
>> -		    base + QUADSPI_SFA2AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
>> -		    base + QUADSPI_SFB1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
>> -		    base + QUADSPI_SFB2AD);
>> +	size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
>> +	qspi_writel(q, addr_offset + 1 * size, base + QUADSPI_SFA1AD);
>> +	qspi_writel(q, addr_offset + 2 * size, base + QUADSPI_SFA2AD);
>> +	qspi_writel(q, addr_offset + 3 * size, base + QUADSPI_SFB1AD);
>> +	qspi_writel(q, addr_offset + 4 * size, base + QUADSPI_SFB2AD);
>>
>>   	q->selected = -1;
>>
>> --
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
