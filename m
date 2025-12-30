Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB5E94108
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 00:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ER1O7tLHxzYz7phHGy7OGKfBjaGSsnzZVMY+/H+94n8=; b=M1VapdNwylc7+R
	vzAQq2FGfDxpMUd0A7mU86ONVozryuOFX+Y8lUGo8emKuTjBEBJR9P5f/LPV5xs0oBcRaO13/0Pec
	q/9Xjvj5pjSnhkqXph1IGn+ym2FNpuoW4Ox9sjbFDm0EcjwVJYY1S3EgJ1DSOhP8+VT/ajDhpjVz+
	/H1uf1r5I1gY0urrp/11a1oVSbH3xiWab4zZXggwYV2lp3MdNmZ5YndP3IOTY0qDQsrNqxcNP1svY
	/sJLqza+f16XUhrTcHkG0JN4CvN2RqaDmRdE9951CVcWXGO4Zm7EusB/+YpxGh86HixbgDy/pK5Uv
	Eku/2kbMuRxr5LOX3IBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNwH-00000004C2P-15Cs;
	Tue, 30 Dec 2025 00:50:17 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNwE-00000004C1m-3fwU
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 00:50:16 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8b2d7c38352so1069995785a.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 16:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055813; x=1767660613; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXi9h2F6u/+Ag/dMKJ4V4r8/OUgCm6fykDTUehBQdYg=;
        b=m6J+GxTHyAd2JN8r30fIVYog+8E2IogQdJDiyyPo7CJZCyqFetkahRNbGzs7csZ8pE
         Ed/9o3Gh/9SWHMHcyDMJYtsHPOYMTYEYfL6u4ieEc2hm/eaT9YZ5ns/8rtm29LEI4SFD
         9Jw4TouMf1r7ZSFQf28C0hL0venxR+yOYmWVtfubizFFDuVA+LGJFKPdiAJqlyzotwwM
         lXwr1evLAIG0yJyOYw0VKoCzuVktMCanx+o3Swp4AOda7nugwP6zhwMJma1DR9kdqtFw
         HFHwrz+F5AybbM2T0KDqcF3ZBuDhbIu9JBHXy6WxAbKUc3tQkzYu8BJ6FUgD/9rkD5Pv
         xN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055813; x=1767660613;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXi9h2F6u/+Ag/dMKJ4V4r8/OUgCm6fykDTUehBQdYg=;
        b=K2xvxDi5F3glOUoQGIaI6qdYDytvunEcHrUIXq+fj+I+Cw/rJv7gkly0P4KQHWkHyI
         RAavHOMp2Kudfjhn+hD6o0jVNwNZglCbRpZPPpgW3p95nHM6E0cEvFXD3bXOL96bhy80
         DXVEUzw1Be72LsKE3Nqs0Wpky6TvacbEB/S5otPOA2J8BYq+GoNmRxEpZNt3vuh1ntPm
         xf0gaepHKgvxXR94vlXP69OeAMaukC6HcBC8Z1DWSgiKoQj2EWxxSMReiDmdrZENi33S
         rLtkQND6naouBTVQBiRDYEfJQmqb6FOrzeta+jLX/Me2DKXGXfnnU6lRmR0y5dPN/S7l
         bITg==
X-Forwarded-Encrypted: i=1; AJvYcCUfF6YDieopKmSeNi6HK8VFvCmNvC2HtEukyVEN3NaambIDWNqqF1TT89YepY38IIUl9gt20mMHyjLohg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+e4H3EBDR50W86rMa06emVlyOKTkK12LEElCL9dyj0ElZSkgJ
	j6p67ijVsQOlLEdvt4s5dOe1PQCgi/s2vZOTvXBto/8JjcyH4MvMaON2zC5loWxMHWU=
X-Gm-Gg: AY/fxX5SKzheCF5tchA3mh5z94LOjIjwQ2ABUnS7IT6p2LRyHi3hjrgqS+AHTHtID10
	mwJvxzC6HaSaXoiDn958i8M2i1LPj+sTkw0A0hJLCW09sBK+PQu2Gmrh0EK+oEagrPhm7E3q27E
	valrHcUf4k43Y8RhXAi2Zgykf5K9Q4a/X9cjKedumisTbDcNrriU9WzQhFFKN9OiOht1uZMcq9o
	Tp620Y3AkE9eB7wdFNjqTLpIeWDxGMkxVcuemqmYwIAFArxACfvbFP2RBqWJRYCJFzjVVzzI1qq
	jMy048FUR81fXiQdUQ4zDsU0JigYfi80T6uEJZwL2bsCka4EaiLuvtfGG2IhIpKpd56khguyuBO
	ngYk/Vih93dSjSC/Eagyssyvd/QHz3xH1IWT3e2Q4Xu9yjF00XZWHG5sn6DWCVHd59Q4vKQ2a6h
	t6haLFB/+9nCUdkvXxIkCsF6novUVI9x5erBMRg3RTSJZjjdeMDaaCItwrP8saVA==
X-Google-Smtp-Source: AGHT+IHk1jnBQLry143qcwBHNuIgjGX/ECeDXUHHBnJflR5W+2APDyw+OrUHlSdhTu9nzhHG4A7//Q==
X-Received: by 2002:a05:620a:3f85:b0:8a2:595f:657 with SMTP id af79cd13be357-8bee76c8eb7mr5352874385a.21.1767055813193;
        Mon, 29 Dec 2025 16:50:13 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:12 -0800 (PST)
Message-ID: <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_165015_040191_7B47FC23 
X-CRM114-Status: GOOD (  22.36  )
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

On 12/26/25 12:55 AM, Yixun Lan wrote:
> In order to prepare adding clock driver for new SoC, extract common
> ccu header file, so it can be shared by all drivers.

You are moving the definition of the SpacemiT CCU auxiliary
device structure, plus the to_spacemit_ccu_adev() function,
into a new header file.  The reason you're doing this is
because these two things are generic, but they're defined
in the K1 SoC-specific header file "k1-syscon.h".  So you
are creating a new header file for this purpose.

These are things you should explain here, to help orient
reviewers and will inform anyone in the future looking at
commit history.

> Also introduce a reset name macro, so it can be both used in clock
> and reset subsystem, explicitly to make them match each other.

This should go in a separate patch, and should change the
code to use the macro so it builds and continues to function
with the new change place.

However I don't understand why you think it's necessary to
introduce the reset name macro.  Is it because you want to
incorporate an SoC identifier in the name?

Even if this is your reason, I still don't think you need
the macro.  I'll try to explain what I mean in the
next patch.

One more comment, below.

> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h | 13 +++----------
>   2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> new file mode 100644
> index 000000000000..84dcdecccc05
> --- /dev/null
> +++ b/include/soc/spacemit/ccu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_SPACEMIT_CCU_H__
> +#define __SOC_SPACEMIT_CCU_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +
> +/* Auxiliary device used to represent a CCU reset controller */
> +struct spacemit_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct spacemit_ccu_adev *
> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> +{
> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> +}
> +
> +#endif /* __SOC_SPACEMIT_CCU_H__ */
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 354751562c55..13efa7a30853 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,17 +5,10 @@
>   #ifndef __SOC_K1_SYSCON_H__
>   #define __SOC_K1_SYSCON_H__
>   
> -/* Auxiliary device used to represent a CCU reset controller */
> -struct spacemit_ccu_adev {
> -	struct auxiliary_device adev;
> -	struct regmap *regmap;
> -};
> +#include "ccu.h"
>   
> -static inline struct spacemit_ccu_adev *
> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> -{
> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> -}
> +/* Reset name macro, should match in clock and reset */
> +#define _K_RST(_unit)			"k1-" #_unit "-reset"

The generic-sounding _K_RST() encodes "k1" in the name,
and it shouldn't.  Also, why do you use the underscore
prefix?

Anyway, I'll keep reading.

					-Alex

>   
>   /* APBS register offset */
>   #define APBS_PLL1_SWCR1			0x100
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
