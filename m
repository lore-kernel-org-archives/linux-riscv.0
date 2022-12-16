Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8BFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JJ1OUO+U4cgps5+MuurgJCFUxPWWEfqz7xDMt0U3P8=; b=Q5yNXwO5Abvod7
	+BeqZL4KX+HxRndAk17oQJE0civZEpagCSkVBxR7ttWvYgYaIabROUYoWUQZylU0c7AlDePtxIx2I
	vpK4rpvn4fLZ99Njh0zD7nJofCsAhSMfyI8J7NnKZev+FBpbTwbW8JPazTMwR1e3UiV3DYyrPs72O
	eWBWOWFkcGXP48zW1JgZWemIi2Lm6jxUFl6MOp/I1cfU8z3mz92KROCunxsr2RbfSekAM9LxhAW2/
	+y9W0/p/bbEs+A4EQlqWz04kq3jJXpXfQg+tdqc2bYwwi5UOOIxAFckPcoquFDpj6vrfLHwB4qyBZ
	eb1cBcm5SYWFBFvkSIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68km-00EQ1C-LU; Fri, 16 Dec 2022 11:19:48 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68kd-00EPvq-2Q
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 11:19:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id 1so3003484lfz.4
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMQ7FpzOBZak5beUJf6CKIqGy2hYvzKsc2zFOmDZfvI=;
        b=VajkuKQ58L51MwGIWzeMZwYkKycZ9q0wbkB1HOl/hNWLovr27Lwx/zr4ybvlMmx8TJ
         r3AGkzqvSPRKpIAjeq0l8ashsfg49oXwhgiIMyKL5JZnxct2+2R4Lx5iJK7g7oHvbR+g
         8stREbOkWE/EmW7/8p/rLR8h9fXX9lCcWF6w1/altSMURpQvN5fedvRZ9fAiC7D6SZzN
         wxghaIQkrOtU7qVoIHBZi0TBjnPGOFARn+BOMkZUSPrOTTHPZo1ijgpUKTZXwuVPBc0k
         pDbaiCKRDxWMKNRdUjKVdQegrIQGE+Trcij+1COkAukUJxXs0yPUbU2Ovt1Ro53kdDb3
         Bl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMQ7FpzOBZak5beUJf6CKIqGy2hYvzKsc2zFOmDZfvI=;
        b=t7LOCCbc/8tooDwBwbDev+Kg2uUdWjFRi+YZzq1zafyWXSTq4H0XiGIk6y+YLbsgll
         TbhWeQRlLcYYffQthGucRmn4xE0+9KRhI0RasuG2T7sHK6Pn4xIIjJhHYn7hOTnFyG1a
         umia1a7IZCR7qFFZJZA7sZfYjL65BGGK13yneL/724HVmlIXLoipGa1M5x5FfKvBgRW+
         czXq0eRk2OG8S8RxQ0E9GaVdwfdwzxsoxwTo5TkvuImkoJGTuNujv5bFxOTl39s/0BQo
         0ri2HsJr7yeE1o8yDUGzcddOE+uRu37AiNMmEX5WS/rtJNWUPmQ7c65ExG5kSX4v9ums
         w7/w==
X-Gm-Message-State: ANoB5pl/KkPCDHKDUIkgwdxaouesueLiGcABMa0Joz6eIdYHRVY+sG8e
	ZCLwFYGcjqTqNHxdlgCtE7VCeA==
X-Google-Smtp-Source: AA0mqf6E6R7NQ3gUyV3W6qibunKn/6TjbRWAoTtVX70oaOyFl1rGOA7DpTMXfyBr3vwnp2Szdebr7A==
X-Received: by 2002:ac2:4f0a:0:b0:4ac:ec52:e063 with SMTP id k10-20020ac24f0a000000b004acec52e063mr8769192lfr.29.1671189577159;
        Fri, 16 Dec 2022 03:19:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k11-20020ac257cb000000b004b55da01d3csm190489lfo.191.2022.12.16.03.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:19:36 -0800 (PST)
Message-ID: <332ccb85-fb71-cf4e-0516-50b30420c49a@linaro.org>
Date: Fri, 16 Dec 2022 12:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/9] net: stmmac: Add glue layer for StarFive JH71x0
 SoCs
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-8-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216070632.11444-8-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031939_152067_1F376BB8 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16/12/2022 08:06, Yanhong Wang wrote:
> This adds StarFive dwmac driver support on the StarFive JH71x0 SoCs.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>


> +
> +static const struct of_device_id starfive_eth_plat_match[] = {
> +	{
> +		.compatible = "starfive,jh7110-dwmac"
> +	},
> +	{
> +		.compatible = "starfive,jh7100-dwmac",

NAK.

This wasn't even checked with checkpatch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
