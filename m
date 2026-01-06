Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5DDCE9D40
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9rWCDGmNn5EJg+SommLbuL/1L3DOS2CQsw8JogTPw8=; b=3RgcTFsENxm4ZF
	btriwRbV3reAcShin+T4pnD3wb6tIts2yp2JfxppzJNig4nSiI2Outkn/9y/OnL/9ms8gEhsDtYLE
	30+KvqfW4f81Iflszwg46yw4QTdsu+2D46tfGx2+yxUHm3dvSwADOJsEecp13kIUNWFriB7cLdG2t
	T6+E955juEHMjT1PsZRsAPwc50PYuqHZV0Z3fU1FkUxOxE4Lt32L9XzQfSDAoc0BYAQ9YWXRhqniT
	iTgL2MOxK+EONmN0GC7TkVeTGbWt6hFCL+GZUblZ1/T7xCQE2qSbdOk3es8UNts6AR/VaPI3yDPQI
	TX7//5Byh5q1F45/5jMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Hv-0000000DJJG-3XYh;
	Tue, 06 Jan 2026 14:43:59 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Ht-0000000DJHO-1bNy
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 14:43:58 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b25ed53fcbso132189085a.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 06:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710635; x=1768315435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjnd3cJi73pItwYWnZ/AGVro8SITV6ewWmgFqzGpdOc=;
        b=YoMr77gEQVL3RtyBP5Ckr1MyRn/LOXk6qCdTQu2DoxSVUDGBigm1DJNzvJlpeyJIBU
         egZjSwiM7Ng7RVWlzbmJNNi3DaOmNZYXiHHe7sAKexfR2qG0YHE4iS+dnLXH5Ba67tiE
         yqnyBHtSIvhkssu1Hjbo5llDdVjWEduUEWBUvBSkGZ26jd1nHOJANHoDJHOBgnL5llcn
         lSNjZLnJGZpZHg389I0ooyLs4gI/0sMXbmbcvUcjAPbVHFH+hROM8z3Edr3qeP4JjkHT
         kvgGhvgfkDbIvXiQAZiikEqzozfj3oEtGY6K3RDHhhAE+PVrPo3RmHOcdfCXtmADNDlg
         rCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710635; x=1768315435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjnd3cJi73pItwYWnZ/AGVro8SITV6ewWmgFqzGpdOc=;
        b=Xp2/MXLYZw5IbRInuMzo0tYoVtc7a6y5GL/Oaq3RmbqfeBLbQacRfH5FJHUcgpWAUi
         a0o3Vi6ekvJh6A+ytgsuQ9TSF5q+pJvETdENuTB/OQx1HNfoUuJJ+5lqDE6Mp2xhFMJF
         HLRvMw17uT/zHiN7zsObAo5ewlbIsf8CnMAtnRAoYrS13jVWFyNiar5y8mfPrQMgMaBD
         mueKl0/EOsN/kZySYpGJwIsFg8ia0oC50GOMf5nZqzT3OG6c5rcxFAVkrWQGXjrbLt/s
         X5Fz0d9XGUaN2oLypAMD80FstgErx3dO5BNdeCowfPJlM056lkH/TiTYytr90XtWC1LM
         DmbA==
X-Forwarded-Encrypted: i=1; AJvYcCWWmS9hK97VAHYdef/2ZHODWMAtdZcmyq4RVl79ehxyY2q2gDrSJhim74O4VtKKZAIftG8Qnb+7HT6WfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6XXuXqwYq950ERSjEd7DAaj7jwHTBa2kI4/ufm1aoSGUaDPhj
	GIrsxgFgp2njxydjtcoGt6G9Rygf/uhUidU5HvzjbtfazvRmsoBeq+q9m9VDHiqQAGw=
X-Gm-Gg: AY/fxX4nHssLicAaJF9hnSx9RUNxTaVI/65g0wLf1rc5xH5+8fFJyxw0MpM2HYbVJIt
	BdvJ0AMTrHCXm3EGsOpyKuzc+/FCpApVmfcHcFADN/uZFlM8ecLLqWbq855MkPXgdLZPKF+il7g
	5A8BYA9WEATr4lymDDCVI+CTjyRUbntupacXWwarRFB2ayEz4r71CfZoBWyUizHp57fGEfGKTOL
	EEe09iaDGWS8n2nAuW6da2N+u+9D1IH57qaSolow+VptwgLUsoI/6tMczuSRwdHsnsrIO2bEqCL
	oty+Y50auQlzMFOuGUpRXp+pj9LH1WFvwsUMb+a4xJoMv3sFg36mmQ4nHSzCTDTJ3cyWoFcvVGI
	oPhcdxnxexfKXTNTkOdvI9rOxjp06bHrh9Z6smoO30lyEOn0qQNkHp1ss4SVdbBOm03WWJN+huk
	iIhT4uPcQi+tcKXMQ4n10FSFamqB2aFADQqP+l7MXqgA7l2xQn0uw=
X-Google-Smtp-Source: AGHT+IEt3VwJP5rxykKJZ4q+39Q3RxlylF53FJBHrqUXpOK98r/RkrMmPUkkduDxAmcDVa9qHWO1bA==
X-Received: by 2002:a05:620a:254a:b0:8b2:1f8d:f115 with SMTP id af79cd13be357-8c37ebcb5b5mr442348785a.65.1767710634577;
        Tue, 06 Jan 2026 06:43:54 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:54 -0800 (PST)
Message-ID: <9ceca23a-8709-43b4-b266-38cc0d924aac@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064357_576646_BF0B8EE2 
X-CRM114-Status: GOOD (  16.58  )
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

On 1/3/26 1:26 AM, Yixun Lan wrote:
> In order to prepare adding clock driver for new K3 SoC, extract generic
> code to a separate common ccu header file, so they are not defined
> in K1 SoC-specific file, and then can be shared by all clock drivers.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h | 12 +-----------
>   2 files changed, 22 insertions(+), 11 deletions(-)
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
> index 354751562c55..0be7a2e8d445 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,17 +5,7 @@
>   #ifndef __SOC_K1_SYSCON_H__
>   #define __SOC_K1_SYSCON_H__
>   
> -/* Auxiliary device used to represent a CCU reset controller */
> -struct spacemit_ccu_adev {
> -	struct auxiliary_device adev;
> -	struct regmap *regmap;
> -};
> -
> -static inline struct spacemit_ccu_adev *
> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> -{
> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> -}
> +#include "ccu.h"
>   
>   /* APBS register offset */
>   #define APBS_PLL1_SWCR1			0x100
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
