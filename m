Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D182C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVpMWvnIKTMMq+cOGPBatCSnRyuWsvCj+SfU1H66+eE=; b=p50QqnfwogE/4T
	oPUT0u8J1IdBPvFr++gGtG+J8DbPBm5Z91J3eL/CcAXz+BktvhcNVeRFlcyR/ZE6RHi9izd1SRKM4
	pjpQR8CtYfLr1q2oAShIm6oyyAKbbDXQ05EcZQMMitHFA7bHfFI8h03L51O5PJljYIqx3k9OvFTb+
	AzQ3fl9kUzaBzxrEzsN0cR6kF9n/NRcH/8KZzXKRjj1fqlq5NMwZhFy2EDJ//qHRxZ9Zjex3cGokJ
	R9DQgpPKsq6M/0cvdABOOOI7rBjh0nskb8+umHGf4qGP375X6D1QY5FUyJQApzwKla8nQu5yqUT13
	0UfB8lWwVc96Vf28iYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nyg-0000000Fa3m-2OrU;
	Fri, 03 May 2024 08:09:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nyd-0000000FZzu-2fgb
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 08:09:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2dd615b6c44so98875941fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714723732; x=1715328532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
        b=FYWQSXeaaegliRhYQlZvBV4DAvJqwUt+7p6sbSARrBOH/Lgr8AXa+myz27xOs/erDo
         mA7KAATGbHGk6MxC8Lq+rb62rCZJz7UKAB56+Vk2IU05YqZZyNLJe2kiVm/plftMuPcj
         gVVb+VJCsugseSbZisOicWxWB0+FYCV2iWbBF5t/4xzfK0f3JyeUnC71P9mNUvwqQZPD
         lnPf+mxm3+JW0V6UaKVijlBoZZedUB/hJ/LITxiHG+Zn4bkRuqHQhD0uPQKjOXgUmH/R
         eCVPesahQRTM0cPyP0gc4TfRLoEQ0KZSIrNv/5gMPINCFGlAXwKQx3mY21WQfwTEkmPa
         lIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714723732; x=1715328532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
        b=AD7M39hhjTgBM7RdzhTylWLd+AtBJt3HwBpjcGguJ8Eb5Yba0lKpc36jqXA9QOB1Zm
         FUJcw8aSFn4pa93CwtbBZ3R+OZDVTtKhuW6nnq/37MBnpYWn1LB4eo0n3tWvb7PdKf5n
         mR4GLQrKxCfr2ch+LXyhQjLn4vNrioL+98s9VOeaU6FbFFidvqpb22m1ZmSjkgXtaxHT
         xjj+eEgqRq3vstxJ4gXl8XAANvv6pzN4F5WkbXVFxc8hZUq1X4110gfGwrrZXazCR03u
         pMOovzLZjnRM95T9Rf3NTlzgFn4qGyYkbboQELIpKmYT/h50FlDEQcyWXwgupgoW5Yyd
         V0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUngpsRR05NFq0rGtkMxKLPaccp4QCjSq6JVz/xCkwnIh0eTExeGdqUPdiUj8ieHIOqN8z8WEqlHW3N6GEFWMVXlKCVafOgfaYoUVBo2Z+z
X-Gm-Message-State: AOJu0YwLhQZtxrX7y2iZOKr8GyQDN5PB+kFoqLrGwOCk0TT0ABjIaE0M
	0fjD8ObAwXL5Q7tA3iZLdAlvyj0EdQOKMf+Konn0aarQWPRRks71GXPLgqJ80uE=
X-Google-Smtp-Source: AGHT+IEyVSxtgBjxgwR445qD/sr1uxqCDskSMlyg7yV9YjhIzBtojmFjs//+3uZsQR/8QqR1GYTL8Q==
X-Received: by 2002:a2e:b0d5:0:b0:2dd:7712:efcf with SMTP id g21-20020a2eb0d5000000b002dd7712efcfmr1255172ljl.10.1714723732369;
        Fri, 03 May 2024 01:08:52 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c445200b0041bf21a62bcsm8456940wmn.1.2024.05.03.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:08:51 -0700 (PDT)
Message-ID: <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
Date: Fri, 3 May 2024 09:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_010907_695429_69DECE07 
X-CRM114-Status: UNSURE (   5.02  )
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



On 5/3/24 08:21, Krzysztof Kozlowski wrote:
>  .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>  .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>  .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
