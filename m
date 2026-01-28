Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141A0D25B76
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oZUCFzRzNHS6k4eTQNsK3iiydY0ErTc8dcUaG86Jxc=; b=Gy/p3b1IXmzp4j
	7H7ApczlyAzCWhX+rO95AvZo1O2WtPRdchcx4UFtvwh4r7rfYfTdMKKYutPgwAohPBCb7MVNOUxcj
	63tjVUpgoVo1m4IgasBjaHXxXfsJ7jPzq+tArI5b1foyqmF64Pq402v9KU3y46gzCzZt0TvMdsF1z
	jq0ZPLdhtUYLUMHugq2ZJqVEi7W5CuP9H19q7Oj0i6xTN8Qxv0ucAhOA1Ejs1k1k6ThJDEYGenZO7
	cOwuMHYwuNei/Ofqs0SyAaocQTZzRn/OOfliC3K37bRmtuYTqac4vYCJbJauOJdddLHedNCQCrFlZ
	GNHswL/2rEvRQU2wogYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bK-0000000G48C-2zhX;
	Wed, 28 Jan 2026 13:28:54 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bH-0000000G46n-2AUM
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:28:52 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-662ecc42c2fso696560eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606930; x=1770211730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CR+ZvBkGA0rmoAszJtyMWrCYonp7pdFBqImvRwPUKjc=;
        b=IOX8jI9jN4dGHZvHyE2h7HAuWH7B+V2BQ1HyGFRtBvYojVQdtBFSzJy9Z5PEHIUQnn
         G8hnedhbG6DnRxzPRjqGo88GYxCAfzYH7fllejVwjFj01pZCQMnnkhGgi3cbeRmuLezI
         skePTOWAYyvUbVIgNlGpNyI597YX5XjHBL2pgJpEshyzGvMvJfqtmIctu8GPTxv6PtnF
         nLeDzhNNG/ZchlqUlQg7e8oAQuu6lrWmwlEKtE3vpZGwc9WeqSzNtP6i/G8dpF+mY9DZ
         DxOwiomdc6iE6Lsw6nK6th9f3cLZrpOdzNyrNjdPJ/Y4sH7lX16x3NHTTrEpOx1GSvvJ
         gjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606930; x=1770211730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR+ZvBkGA0rmoAszJtyMWrCYonp7pdFBqImvRwPUKjc=;
        b=gcMtGccpaRvc03J0wCnrRAP/2VerkFtuUPmvKPA+0XFyytGv+mEs1+1oJ50Q72aCbf
         j4iVwspXzJ8R7L9C9Ph9DLakZcIhM77JmwAFjcDb3c2G1zQc4WKM29hIEiHaiPntdUBi
         7MVTUDMurGCmM4kbtbSlQTqcJE/NPE0PGTLQqu9wFTz4VC2AHVV1zKD9XpSYGCziGCcI
         l0og5CHg+15Rh1bxTpLMRd1pE7iorrrEpH2jPrU/F8eoyMUAMCjZORVWGH2ET7EV4f5i
         kau1xfuw7JC1L1Uv3D/u1ASeJ723x41ktHaLv3GJjd9xu+9bmKDbPgX5Gar/7fr2usq/
         6+yA==
X-Forwarded-Encrypted: i=1; AJvYcCXr56bEWCEskC3soVEZWdaACezhnES0J3Iu1sMUXAARH377sABiuyjDAZA0EkAVJ1msVQiRVKcPNY2KIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQs1MnaYlY2W2wd+HLCYmc30YD1DV3v9tw1n/+a8coTF3/waCd
	Y2LzIv8rEmZH+PasgeIIar6eUmBEB/mfp+DjRNXoQMmXKL0LrPfkqsk4XgeHaUX5Lpc=
X-Gm-Gg: AZuq6aLLLItuUnnMw+vUS9p1qARnONqf1Q+0c3YPfpnPrMl1HNlcyuCe6pARQ8UTycp
	9ybZYcdfaQOyDluhCx6OEtV2c9eNu678zPTXsB8m02Ont8hhPXAMAfZ6FDnI2Mc9PZpHyKNUnfw
	kWkaWrnSdlXu0wZKWQkdRi+kOsC/OCQRpU75TkISJHfpG7+i5NxuL/MdnDMkYEaRcuV529nUSWY
	qPvK5EwlRb18CFKuhs65VRvM+6jqz+4xrlIuCOONDyMxd9z/nKmCLJgxpN3oGEGcVpGMgv0W/gg
	DXIA2cWFAhCe4mScJJC8dbimB0zcmi3ngJXh9gP+JvoqmcRuAPW4qFouiaDoJhEoN694XMeCa2J
	rvvdYSRWIbRdsHq3+y9n81mVDXtQZtOV18/Db+fhJyqeEjluvSAL7tT5gicV8LxV84WVRW8Rst2
	iQTdvOAViJSL8rszGqo2+SAesp2Oe/JmXqQJYFH9XE4LtQcpWfjAE=
X-Received: by 2002:a05:6820:f061:b0:662:f493:181 with SMTP id 006d021491bc7-662f49306cbmr2051118eaf.76.1769606930064;
        Wed, 28 Jan 2026 05:28:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:28:49 -0800 (PST)
Message-ID: <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
Date: Wed, 28 Jan 2026 07:28:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK
 and LDO regulators
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052851_701251_9585A254 
X-CRM114-Status: GOOD (  20.07  )
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

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Higher voltage settings were unusable due to incorrect n_voltages values
> causing registration failures. For example, setting aldo4 to 3.3V failed
> with -EINVAL because the required selector (123) exceeded the allowed
> range (n_voltages=117).
> 
> Fix by aligning n_voltages with the hardware register widths per the P1
> datasheet [1]:
> - BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
> - LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
>    suspend mode, valid operational range is 11-127
> 
> This enables the full voltage range supported by the hardware.
> 
> Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
> Link: https://developer.spacemit.com/documentation [1]
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: No change.
> ---
>   drivers/regulator/spacemit-p1.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
> index 2bf9137e12b1..2b585ba01a93 100644
> --- a/drivers/regulator/spacemit-p1.c
> +++ b/drivers/regulator/spacemit-p1.c
> @@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
>   	}
>   
>   #define P1_BUCK_DESC(_n) \
> -	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
> +	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)

This is correct.  There are 255 possible ranges, 0..254, and
255 is an illegal value.

I think this bug is an artifact of a change I made while
chasing an issue during development, and I neglected to
change it back.

Technically this is a bug fix but it doesn't matter because
this voltage value (255 represents 3.450 volts) was not
required.

>   #define P1_ALDO_DESC(_n) \
> -	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
> +	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)

I would say this is not correct.

The valid range of values in this register is 0xd-0x1f (11-127),
which is 117 values; 0xd represents 0.500V and 0x1f represents
3.400V.

Technically, all other values represent 0.5v (and could therefore
be considered valid), but I believe those should never be used
and intentionally considered them invalid.  If 0.5V is desired,
0xd should be used.

Do you disagree with this?
>   #define P1_DLDO_DESC(_n) \
> -	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
> +	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
>   
>   static const struct regulator_desc p1_regulator_desc[] = {
>   	P1_BUCK_DESC(1),
> 

I have exactly the same comment about this change to the
number of supported values.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
