Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70755E784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 00:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8Qs3JYYQpY+IM6Rc0tO6cSde18G0iKgo3pFjcXqd+M=; b=nxDil7QArTiB15
	QTSrN2/GKAxzYfls9Brm7amDwqk5fhqqWFZXLNP/DyNRiWptZpvoMDvuayszswFJjANiDcHP8uEsC
	m3MgdP6VHq6atsmzSV1FGjoqJjv9xG4RFnnpDt0sTmDn6NKDr8QL9Xz5vxMYgjjthrVNc7lXXsj+i
	DMq4KMEcdxvsoUrOQ+dKtS2n0/zDug1D4QomFM+EAt7GZX7a0fAVYHPdRml2qRrDoYAilt9zdDgJ2
	xxl0C2zoUcoyZxpqDxLHNuDJm5xaglA2K0VrKNDaVP+MZf0EfdjDjs5j0WQcNs5vzwPCHykXOxP2u
	dMi0U59Ua67rIhReH4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1Yo-00000003A1q-3Pvk;
	Mon, 29 Dec 2025 00:56:34 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1Ym-00000003A1T-3T3A
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 00:56:34 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8b2d7c38352so983409685a.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 16:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969791; x=1767574591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3484aXOa9txdLCLTZwQ7/4HtXoJEgnjLB1QM4Bm42c=;
        b=CUtiH+J0yum/iYjYo7tJHzdaNIHJvrsxvjHjjOcNYVxg0swjgGfR7R6/oQ/mgKkw/0
         IRpRSMBymAcZarnGvLZmLqErFVRQgwgnl9ov6LIcUidWKwNKKkd3+EGtCqi35QCOqIiE
         uBHWSBoL/R3s2ZYwRwy6dMChTs9WT27KzKEF2osgUwNtOn0hZKs88osdtQG+9bjh9XiS
         RTKpVond0gkWvgz3u9SphJy3PCvOMHK6spmCewwalpfpVQP16+l5fOCuwKqsSNryM6ev
         /3uC1uQc+5vN+c4jNZ3xtK4qRWe6oKP1xUmKi9UBJeXAnokoTBcPS2/8IF3SKKIQ741I
         q4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969791; x=1767574591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3484aXOa9txdLCLTZwQ7/4HtXoJEgnjLB1QM4Bm42c=;
        b=JS2KDMjqX8qZtDqaktGwD0WVf4iFt0YHAfjJWcv14w4pu556CGMJV4I65Q5IuU9lZ7
         L4BtLtP2HeIquBnPEuK+Kn+OUTXwWfLPYCbD4NA1pWDqFINwGwu3gzjVFkyHQeZ95SIS
         P5qOmlx2Rkqvpm2S3haBtWVHNpSj8/epn1Qmjf8HPuTUaHStQLQDVprzAbhCU5tWxC7/
         Q7rREpd+tWKz4h7nP3IXFaumShoAlSlyEePqWq6/AKPM/56hx2W5HWEZ1vTZrQSdcp++
         UJgn9o/mEihLrkGCmdKA0uq8/usX+WHU3Vn08GXjHW73hwyCmBKqJFWFz3a0Hs/mjsyN
         OGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh4/isCoGDq77qPpa1BxZzu2lDo/ZpiCOK1QNZzG9U+LBArxDory7OBjebdjwqsHOJNJlATd3F0fb9Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw66K8vVs1PlzTdWPnjfCaXQRfF1minqwSwlSb5KbqOt+IKDRjV
	BtWwifC0yz4Dqrgk17E7zZbOT6RQNZSIWJViLqO61MO/a/LyDs+bV4AK4FeqiDV2u7k=
X-Gm-Gg: AY/fxX7cYhzDZB+lf3MOjpWrrMmZfjcSIqvhpmGm9eGI7ofylXr3u03/QM6mGp6oSjA
	C69+a8b9Raz1adAKZAstt4gzGHzkd685jpBO36m2ZVE/hG+5qeNcOdFRhqM0PGydluHhJMqhdZB
	GHMdoVwRB7umSMRBVmXoayC7tH+1/xKHgj2Q0E4a3r5OG1jf8YtT0KdJOybTSg2QtO5DAPETzp7
	e0Fa94QxSexOwkxWNp8kHvLPzSgCp7yhrAVp5cfSTamiOJr3KQyiLbg4BpcaUsuHhLzhiDpT8hE
	GmR7ly2akd3E7Ng3jzmriR7EfOyiv0NDgGXigWmHs2jCfAEgJtydHD2s/3PJdPy1MaH2km87PJt
	9Rx0TdhRT415f6uker6aO0Nn5OvPP5Q0fS21lRX2+LY0+nJVwtIjNcPOsUzwOFO7PkfMI8xBF6Y
	FonRrLcV1nPm79L7gCDYGreegCCsfFmYnZsHu/gIiq41Qg1pzzykk=
X-Google-Smtp-Source: AGHT+IENzT1DKL1F5+uqdNfJ9tGhxzUAN82qDRGsR1PVryT+X+ZT7PyJmy0IlyTNV3YfgZM449EDXw==
X-Received: by 2002:a05:620a:4055:b0:8b2:eb79:d37d with SMTP id af79cd13be357-8c08fc00228mr3954919785a.4.1766969791407;
        Sun, 28 Dec 2025 16:56:31 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:31 -0800 (PST)
Message-ID: <a0c9f9d0-6453-44c0-a5b1-8d1b501acfc9@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] i2c: spacemit: drop useless spaces
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_165633_124426_C95C3A8D 
X-CRM114-Status: GOOD (  11.44  )
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

On 12/26/25 2:31 AM, Troy Mitchell wrote:
> Previously, the I2C driver had an extra leading space in column 0 of
> included header lines. This commit removes the redundant whitespace.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/i2c/busses/i2c-k1.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..30cdf733deef264061c8ea565634c5a17f5aebfd 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -4,12 +4,12 @@
>    */
>   
>   #include <linux/bitfield.h>
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   
>   /* spacemit i2c registers */
>   #define SPACEMIT_ICR		 0x0		/* Control register */
> 

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
