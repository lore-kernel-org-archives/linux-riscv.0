Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F070C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNQ5n77ZmmPRtDqxxyeid7CowH/a/xNhmfmvKnb6Mp8=; b=MTrwI2XfUolu5n
	8OP4JoW6L/Z/4PIK5NuUDoExHTvGARW3tJUpVLtBcestA3eNniaptd+NdGvVyLnVT6u53XL1Sm6Ze
	ZXNSBD1ZTvIIA1gH4KwAPDyG9WvgaqiHeGn2/5IViZr4uBEDqVZg39w4KZfv99UfBemWcL7k0AtvD
	YDcvRId2y+qK0/NRM7WaLAVEy+b6OgVlQ7qZFm3dOHJGYnMIqPiSyvWgvBjBkBncg87Dn67eQer22
	iti6V2WSxN7HLa4x8Rby3ywWJyhKzKziNpBDsWPLaML8SinLKM4gkzWVN1Cr65XK0/PmoaeE7phVH
	ebSeEP6whRopqtvANoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pchyn-00FUSu-2q;
	Thu, 16 Mar 2023 07:24:53 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pchyj-00FURI-3B
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 07:24:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id eh3so3731678edb.11
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678951486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bgdteaO78IPJ8n05LVHoYGGSz252y+t9b/EMMp5aSg=;
        b=dWKdaX0KZEWMsPomMM/eVXxVb5lA9IaL7Chvky6Eh7fU1g0naZPWTi9exr7AlxuQXY
         LSKe6vGXzhKh962b933I/lyc+pqTFDovPtLB9SLs3cOC9/Zemt9VjbsTk75u3xBJ+/RA
         55mm3kgRdoI9The16qeJS6P8f6f8sXLkdlyCAidXBWR6IUI0BcJQkRIdkcswGWqMP0mC
         K8M3yYeHu4esP41yTID/n0J+VkvAWSSo/F0fyEbh2YUW3VKUgV7nrXmmz6s8wNeYToUv
         38DgzPHLC2Xw2CY8dB4FtFmdTAFsoXxCemuPe/qLAYNKhmCu+VkEAqw9E3yfoxwBecDA
         r7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678951486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bgdteaO78IPJ8n05LVHoYGGSz252y+t9b/EMMp5aSg=;
        b=HfiZnZA0PFpOvXMwoNx28GUoxW1M4/ayDvO01xsT5wfJ4C6aHyEAq1zVZR0nWF5T/G
         vMvYvm+d3hKGgQdadFVQ/P6FtU1IRZU8Q7TW+aJuNnLQuWl3DyhfVAYYSm2mYrx416jq
         YBweXoH++tRk1QILnIa+0glOIqtd517qELmG9Z6Hn5ea4k1VxubS58ALf2FWn5YAR7BM
         5o4qEvp9AgVX27zG8N3K3oUyJFqZ575itoZhFwOBc0/Odb3QG1VGy9o3WR/H5X5b7FUn
         V7cppKWuJBULWMtaPNIrlSNoLXYvVZx9y0fFYJ8271/X+i4EzRusLGMRbbEbhls63wCb
         razw==
X-Gm-Message-State: AO0yUKWE+ojQtrHXhimiANa0FdrxAjFPC5M4c42fhRYajW+7DQ88vxps
	/Xbqnd1HLmjxq4qp7JpIyfzPqQ==
X-Google-Smtp-Source: AK7set8n1LQzlsokldgijr1RYIG80emZgfFLksKIExrU5Iu/kN9VQx86ychaKjlFf+qUbkPa/gENug==
X-Received: by 2002:a17:907:6297:b0:930:7324:2766 with SMTP id nd23-20020a170907629700b0093073242766mr1165143ejc.35.1678951486084;
        Thu, 16 Mar 2023 00:24:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906584700b0091fdc2b4fa2sm3493484ejs.145.2023.03.16.00.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:24:45 -0700 (PDT)
Message-ID: <aa21d3df-0aa5-64b2-060c-3b360ad86917@linaro.org>
Date: Thu, 16 Mar 2023 08:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/6] dt-bindings: net: snps,dwmac: Add 'ahb'
 reset/reset-name
Content-Language: en-US
To: Samin Guo <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-4-samin.guo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316043714.24279-4-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_002450_026842_A37668FF 
X-CRM114-Status: UNSURE (   8.48  )
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

On 16/03/2023 05:37, Samin Guo wrote:
> According to:
> stmmac_platform.c: stmmac_probe_config_dt
> stmmac_main.c: stmmac_dvr_probe
> 
> dwmac controller may require one (stmmaceth) or two (stmmaceth+ahb)
> reset signals, and the maxItems of resets/reset-names is going to be 2.
> 
> The gmac of Starfive Jh7110 SOC must have two resets.
> it uses snps,dwmac-5.20 IP.
> 
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

How do you test the bindings on hardware?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
