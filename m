Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3030C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlyIXjemQP0JNDXn8pInJbJjukegAEg27w+wPmbT8E8=; b=xZR2iWcpRu7a0i
	erYxIHPNAooku2E511WzH+6ZCPREkGRddm5qRf1GDvSGr6sZCZKcnLSK2P92y/dHX64WQ7/4jDG59
	twLVE2t5TlvS7VJyTpRwhSD71cLkxUAwesDI5YR3K86g7un7SWXPutJhby7Naz5VqfwNlIensr68V
	rARt3WFLSrHPLuSFQIzvISbASRr5zYWz4eQygFxydIuqCOHT4pfnmZ1ZNxolwmotPL1EQyCG1DARd
	UqIp9IbnoCn1gms24icpuE9hwwXOhDA1UCtMkY53Vs5OjNnNLqCoCN/4ZIyu88sBBSNmKerEviFWR
	o2Je5Km2Hz9/yFt4dP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqvb-000soC-7r; Fri, 03 Feb 2023 07:56:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqvV-000smv-VL
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:56:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg26so3228236wmb.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 23:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivm6r3tpNQowG//92mCAHfte+CaKrUHgYJvXLe7B7mU=;
        b=lnnsXuYH5rARYqnO+up2OKbp0nSa8onZ8YllWznUSatVPuvHud4tRVRkzJSK52dQDV
         sOV0y9bF4YJzdIE0bYRbzrGC5HaXgiD+DHhvjvJBGpA0oc4ziBS2u93k2aLTg/T1pA67
         QvzbIzWDzOEiHI877bi93vobVQLSPl2uH0w2nMsnPWPzQDieWG4b0pzw67/vHbRPJgkd
         1YY+Uh7M3AhvM8rOaM8GMykVaI/78XTpj61xmthqsBMnCkw9MuCBBOjCYn42rix5kcV/
         z2v/Ctv0i/0gjuI4jCjM6CVeyfzDxS9VVWQiXmGcr2+4jMxnNCqWIrtMHvRFtYO5LpFb
         okkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivm6r3tpNQowG//92mCAHfte+CaKrUHgYJvXLe7B7mU=;
        b=LIPGug6mtUI2kMswpmSy5rutO8zgbrDB9BpWjINUEV3Z+MeRd1BCDaIO2uqYYNXTrH
         H7fpbB9lZdGfbvzOx+xbiOH4c/LMtRKMCaULlsV00F7dHKgR+3UxhrbEsCGuTSZrpNTT
         6fWfDMKqMGqu9JpZSrBeDeI/nSWpNCkTc/VL/oG00x5eOfgwO87SCWghOR9h45ht3PKU
         4M9MBQaAr4GA0KBrxqP4tVU6Xe/iU3pJ6ezsC5vgToq4q0qn4V2jKu88Xy84qx4SgWpi
         eK4sjgfmBLhAT0ABbXlN11EKZiSNrMpCL/9ccNbDpNZ0jN7OVIxEgC2i5EnLXSKw3ggP
         BsSg==
X-Gm-Message-State: AO0yUKUJ5GmpNVnljVq8NRbP8y10QUcPVSOBtFSmk3zQU0DRuAl68ct0
	h4hYkaUjzr2bBVmWJEnWriI4GA==
X-Google-Smtp-Source: AK7set9G3IWsiBZkWUgmPHC8yBWmJSGtb/Ke6q1FfPYVUm9SmHD/t3099ZkK1goE0VZd+x1QrOslrw==
X-Received: by 2002:a05:600c:1d04:b0:3cf:85f7:bbc4 with SMTP id l4-20020a05600c1d0400b003cf85f7bbc4mr8448870wms.2.1675410964694;
        Thu, 02 Feb 2023 23:56:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b003ddf2865aeasm7638369wms.41.2023.02.02.23.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:56:04 -0800 (PST)
Message-ID: <f937ed98-a65e-e75e-24b4-0219e0403ac0@linaro.org>
Date: Fri, 3 Feb 2023 08:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 6/7] riscv: dts: starfive: jh7110: Add ethernet device
 node
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-7-yanhong.wang@starfivetech.com>
 <55f020de-6058-67d2-ea68-6006186daee3@linaro.org>
 <f22614b4-80ae-8b16-b53e-e43c44722668@starfivetech.com>
 <870f6ec5-5378-760b-7a30-324ee2d178cf@linaro.org>
 <048b3ab0-7c13-b7f7-403c-f4e1d5574a10@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <048b3ab0-7c13-b7f7-403c-f4e1d5574a10@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_235606_037024_7E8B34C6 
X-CRM114-Status: UNSURE (   9.39  )
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

On 03/02/2023 08:40, yanhong wang wrote:
>>
> 
> Sorry, I didn't check all the bindings, only the modified ones, the command 
> used is as follows: 
> "make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/snps,dwmac.yaml"
> "make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml"

That's good actually, except that you change binding used by others, so
you affect other files.

However in this DTS you will have now warnings (dtbs_check with
simple-bus or dtbs W=1) because of using non-MMIO node in your soc-bus.
The stmmac-axi-config probably should be moved outside of soc node. Or
you keep two of them - one in each ethernet node.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
