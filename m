Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0CBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+NZHXzsZu+FhceZf/MahWinzPfVT6i392WlcY0ISZ8=; b=QI4oPT/tIt2Jmf
	OzHxdnJmq09ww1ARwiOb5mk/4TqjiFdmQTUBZLRE5RtTboik5i6m/BJd9PGYVYEc3rBLSPwEpFQ6H
	Lg+DPCDgCZU6gd67xHFFHH5zeLL/yeT58Y3t+D/bleGYv4q79+8mXI0wXuNEdq0IGqtt+8na/bymB
	XyvjILkbilsmIcbyqhQsbNPc5ih/uLVlTHKIm2imEqrUSk4otn6aekH6Y+VSvQjzLmtUsEF1kSinK
	zDgO6kabYs9zrhItvckGKI1AwTjd7wJ2jTnd2qQyDafYSGiVebo1GyTOoZi8Ek8VInECdYtv3bmUK
	iH1Y1vCrQ2y6SK74Byfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3og-00CAhH-7b; Mon, 21 Nov 2022 10:14:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3od-00CAZQ-32
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:14:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id be13so18108446lfb.4
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huSdTSSPuNXnoZS/eHmsGnIE6FjPj9B88zrBs7fiZfk=;
        b=NeMpWLpw/VGYxrbuzW7jvw2Zj1Nfi3gDv98L2ZjOnbqAeGJjM8wn+VJxEVNkiRugSd
         OQ7Tmu6pMhD/aUFllBlGcL+AlFkZ45BPNURu7FAQQ2MCIIC6VLvPz2ip9wCP1YapZhd3
         o6/YUX4wwAo5UHnvEcz/ghquvvCy/58s5MJBKZHOl7FQxePuAbLZdDcePyjqv3XtvDX1
         oAajxBuaAmGLKZwomr/1bC1HqGit+Bs6twk6fbyyUFSBKry5hWiZao44wSNXy6tcSZzl
         EClSd9wu0hI94hhcaB+83s769n+Xk03DjJ/vOhGiQ5XZncTbY4PEWvTPBwgcXqFSqtQq
         xyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huSdTSSPuNXnoZS/eHmsGnIE6FjPj9B88zrBs7fiZfk=;
        b=nLAzLgfHOehOZ8gH5kpSEGzMTOPJJfeQupIsaFe0AfEujcv7C1JHprkXwCT0wV16SA
         bNgj5MfUUY3NISDb0pDplRzizKrVHSZr5iFBTJpCytGzlJ5nWBJxxsMc84NS+qEu5D3I
         dbP3JJLzcUauzfiNKWBFxWcYMfMqMBbTAJlF/k4esK12txrYxvkrhsaKkFtm2MQcGXVP
         1C/FTw5Hyb2tZmc2GYEhxqxMfQVJbtvQ4fq9sJDuzNdtv0Ax4dkzqBdR9clAF8JjPg8A
         RPONeP+twbmAf5xkO3vGP+Fxjvr67a5nSp4yDyhlOZ0ixhDXC9wgDpiC/bxFj8LG36TC
         GoBQ==
X-Gm-Message-State: ANoB5plKD+J2uySYc0dks20dzVRi71E4P7TpH7HzJL6NkrepTj0FUte7
	DmlB2JEQIwTnnfjqf78T+Crjfg==
X-Google-Smtp-Source: AA0mqf5MIpJ8acuij7Zyzk0NHW7RM4Gxmqrv+yzfJWyhegkhGd3Kuk6wRQYO312yoIGdnWyPdbtHxQ==
X-Received: by 2002:a05:6512:25a8:b0:4aa:a6f8:f042 with SMTP id bf40-20020a05651225a800b004aaa6f8f042mr5296215lfb.405.1669025653696;
        Mon, 21 Nov 2022 02:14:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u15-20020a056512128f00b004a2ae643b99sm1965407lfs.170.2022.11.21.02.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:14:13 -0800 (PST)
Message-ID: <15a860d8-d134-5eab-1635-74622421c5d7@linaro.org>
Date: Mon, 21 Nov 2022 11:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 3/4] soc: starfive: Add StarFive JH71XX pmu driver
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-4-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118133216.17037-4-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021415_161088_306F8B25 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 18/11/2022 14:32, Walker Chen wrote:
> Add generic power domain driver for the StarFive JH71XX SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH71XX Power Domain Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/starfive/pm_domains.h b/include/soc/starfive/pm_domains.h
> new file mode 100644
> index 000000000000..a20e28e9baf3
> --- /dev/null
> +++ b/include/soc/starfive/pm_domains.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +
> +#ifndef __SOC_STARFIVE_PMDOMAINS_H__
> +#define __SOC_STARFIVE_PMDOMAINS_H__
> +
> +#include <linux/types.h>
> +
> +void starfive_pmu_hw_event_turn_on(u32 mask);
> +void starfive_pmu_hw_event_turn_off(u32 mask);

These are not used outside of driver. Drop entire header file.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
