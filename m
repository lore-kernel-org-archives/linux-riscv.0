Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA2FCAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zizxdggsz0ubIR+nOYBU2ROmNrq1yr4OzZPSpxAlV9k=; b=l8fE+W7Benjbgl
	rA6BLzpkV3v55jGPKGDo/cE9yzEAhyYm7shsEj6weqBBBmAYr20Ifrd5h78arAXq84KSOmAwkm0ZV
	HyXea3WMohXygbR0+a+MksgG4dd63AP0p9FlVfzzOTDH1GGyKckxJ/wZwccse+nfIl/wx67RVw9/h
	obMxBhpharj6+uiWZx/1RP+sUWPT0YSHFt4P7YOztAsLD/gnhKyHphnG2Q32DfQlI5BtVrq4+pX1L
	qSavDSuZl4QDVTjJWw9cSHwRNDFvdo/Okrrd8EuxH90fi11XwjA128Z0zr8nfXcjgBqeQ54El0Dqw
	7AcVdgEoFBrn2QYVbSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFv5-00000000CEN-0Bsn;
	Thu, 18 Sep 2025 14:47:35 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFv1-00000000CDj-3fhR
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:47:33 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-424197bd073so9890425ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758206851; x=1758811651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAKrVBT0TdCvSecGbjneeeJlKJ2CfD2yiQLwxahqo/M=;
        b=DIC+rjw19hA+V23ecxtV5pZGRgMZqruU3ChdZoeuYKd5u25PJskBC9DRWUJg3oHPdH
         W25qyimbTMkHJWebtgrCEpwDjpxmlRTbCDnY31NzwsdH9Uhi1dhCEeZ8t0Tp15mJ/AsN
         t1UBYwojFsgEp87qpVW+5jDXiTrlBZu+8amtKqmQPFIC2lX77RNHE3JUdJX6JEmyrdTs
         j65ZdqDzrsd+vFOYCo5yX5Zukv3ifbSv6Wof3UecFrZ9sITbxuZ3jy5dDuxslhxGa6K6
         kRU3AYs8Pkn7PuUXVQr4oSZKhTxifCxDiQ+8LWUJ3HJq5WigbngktzwnwkAjSODsOYnb
         VzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206851; x=1758811651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAKrVBT0TdCvSecGbjneeeJlKJ2CfD2yiQLwxahqo/M=;
        b=mCzUpZgeQMtlgGc5KSSLuLFsKdYPoOg3+ezVimF2lY04cBUncY7qwl2cnj/fRK7/m6
         NimFPk8zSjJSYfdAlOFjEz28TD8Rg3KwuqTZ/SpOaIYKd0310sJSW8mHKA3o4jIKoAWS
         3JSSXoAvwFoiKc5zffuVqT6NnYVOBOvF3WRfQmK+mYOmUFaQ+sHMx5cPJ1nOXRdBHly2
         tBCKJx8UrLB8nBH021CciY6vHy1vzsoielUGyeCY/jCKn0R+dUA7D4w3Na2OTiCg+9m/
         IK5ux6SHYHfQT2ri+3tBc8aeTz3DWCeFoGbHWAOZevJSPpV9GRemlYaloJ0kX+1ndVzO
         L5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUurUW05dVbADgwRq6VEYXXgdF5teLGNHpKJPX9OKlaYOqDnvq3Midm4o2IZkm+Ii0heBq8YYgUZiA3uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMNLSFptH9VGS0jxi0dk9rq2isFAKpzt+z9fblWTcmo6ft8cll
	R8T4DLHThhztXLPe2d4FoHiqKN5+3KiCgPDkzAq/U9K0/WbFQU39mlwFPzZYfPMa430=
X-Gm-Gg: ASbGncufP2Wu6qjICep01zWPsG3/U38cUUysF/owEitLQWfSDHMCgEfx453LfdqNMsI
	D33UmnaukunSvNQtmNl7bC+fkTz7lOD6gGG+d3Ge9TY9q5WHp2I2nlEAYnChoWYvqQF//F8AsUp
	lEnzsX4HpiOYKJ+VcWg2xx18JK7bcZcmwv6AzlueDu77mkGkgrsB4wdXv6qPtB39kkpQiBJ0zZa
	QxNmMZgSJw9g/V8lc5gmX1eXz8BoVCQx7jGynLmSzRg70IyWGwHwLuMsQbFqZlsg+rL1+uqnPbt
	enq2X6e65Wc5z0gsL/kpl0LUmFCaccy7KHNhQ+1tNTm0jo1S0CIxoRB6FRGzQnDevcHxgbxshMa
	D4XhyVU25xDobe06J37DgWLj7Hbg5x9r3Plf0YHXzKcmAzAhmJzM661RN/ztgTA5Rw2Oz+Msic4
	AK3rhc6w==
X-Google-Smtp-Source: AGHT+IEwi75aX21g/zBSieivVckv6HnF5UMX8645TVtHJlraH1tEzr8ABh0L6G+D5Sf9/VskB4583Q==
X-Received: by 2002:a05:6e02:338c:b0:422:fc2f:b809 with SMTP id e9e14a558f8ab-424414d6c95mr62078845ab.6.1758206850744;
        Thu, 18 Sep 2025 07:47:30 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa6538sm995541173.51.2025.09.18.07.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:47:30 -0700 (PDT)
Message-ID: <cedaad98-1eba-431f-af4a-b84e106e5f65@riscstar.com>
Date: Thu, 18 Sep 2025 09:47:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_074732_034207_89E29902 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	u32 data_reg_addr;		/* DMA address of the data register */
>>> s/data_reg_addr/ssp_data/? I just feel uncomfortable with redundant 'reg_addr'
>> My convention is normally "virt" or maybe "base" to represent
>> a virtual address, and "addr" to represent I/O addresses.
>>
>> This symbol represents the physical address that underlies the
>> "SSP Data Register", which fills the TX FIFO when written and
>> drains the RX FIFO when read.
>>
>> How about "data_addr"?  I know you wouldn't like "reg_addr".
>>
> another idea here, instead of introducing a variable here,
> how about simply using plain iores->start + SSP_DATAR?
> 
> so you can cache "iores" instead..

This code has gone through a huge amount of refactoring.

I hadn't looked, but now I see this field is used exactly one
place in the code, in k1_spi_prepare_dma_io().  It's still
needed though.

Here's what I plan to do.  Rather than saving data_reg_addr,
I will simply save base_addr, which is the I/O resource start
address that corresponds to the mapped virtual pointer, "base".

Then in k1_spi_prepare_dma_io() I'll use base_addr + SSP_DATAR.

OK?

					-Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
