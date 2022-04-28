Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AA9C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOUewTE3rM2IQEjR0CZg2wG4mTWfFEDUBAXlY8kXNkY=; b=hp7HU9fCPw1fKF
	4Pi/rCfQK8eaiuCCHUgLkJ0nFIcM67UChmw510I0MQsMfYEPIOHZes3cJwfl578C+QYQKsYggq7Oq
	BWciF45SC05RmkGnIlSXiO9LI14R5mJcYb7ka/7bj4nVThR/kJ2+HmNjtXDapn66Q2OtEZHTzxAIf
	14lsDPs1quBBDvnZEk3AKXuep5iuG39UwiCM32VVVUz7Qclh1ZlnNdpb+5j6JGDdQropNcrUMAu/a
	coLZ3ToJeOypEAetXT54GTn8IfpIVTVNdkXcKBMoa9I/PXW1AmNqA88bWI1ufROdOu++YOa5WVqU3
	vlag8vqyRTnUnJmJtR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyRQ-0058KN-EV; Thu, 28 Apr 2022 07:19:56 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyQx-00585Q-RM
 for linux-riscv@lists.infradead.org; Thu, 28 Apr 2022 07:19:29 +0000
Received: by mail-ej1-x62b.google.com with SMTP id dk23so7720459ejb.8
 for <linux-riscv@lists.infradead.org>; Thu, 28 Apr 2022 00:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hAwV6IwbsKz6TK9I885ngU6STlgFg8jvqLzasreFMNs=;
 b=WWwtGR1t+tANDRVUo2TR9pMIModlr36I6OZLqGl0IETtQs0/rjC/uYLMlRDkNsP/eV
 2LXgsWIHL4XoHJpA14V2wkclfUNarpzbFHOEz5wVWsgrP4nikVJrpJCNjE8mKDsGTFLw
 uK2Raf8hS5WSmUAFPOeazZauXSjK7IF23+ltIA782RBeUZ3fAXByLWdr9VCPokU8LL0b
 XWv6Q4h0jEO0vu8zL62L2mTknqmb9UlvmCWNrshhxplOVVfLIttvt+RvTujsEVk+ZSQ2
 u1GIGtOx5ShFMR94uP8k6dKaqrvTsFRmr1ufo8PNJf6HZTqRkEFSLXKsDhE2TfcRIDSL
 muYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hAwV6IwbsKz6TK9I885ngU6STlgFg8jvqLzasreFMNs=;
 b=ez3AzabPPOfV44+M/2G/wBYG5D8JbqGquCi950MtbT7vwf0APj/spoKg0y+oyLWXs2
 mW7B5wu0VvLy0bQArmgiDmRtS/AyPSTweC45TvcMgLGM44sQIQSzaLGYMGtkTeICclnx
 0F0RWc+vf6y5w/mhCJAeO4Kkfzkd53UXvdv3tSQ/2G4oR2gwWzlLmh3rQLkeKaBINUT/
 RiK68JDLzgc+ADgNuruujozKRsHm0pJbglUyX4KjFkL6hoZ5CtLbpfcureoUb+n3oajU
 9cp/9c+5/TabH93vlz7e2HUGXOpS0pk9csLy+nmq0M/Xfxf9n/PGECxrw19soqlSfXoh
 dr9Q==
X-Gm-Message-State: AOAM5304Hj3m8f0P7Rl8DIZi6D4u/qfYPomq6raia7mAfjvsnlBbup6W
 XgFqEF6cLPNkhhXVwmybSrUVbg==
X-Google-Smtp-Source: ABdhPJzKq+YlOiDMLykatXEFb35oBzrQM8EqzSpwuebdQwET0rBneBiC/nW+dHlQKkRccdp/GtUgfg==
X-Received: by 2002:a17:907:1623:b0:6e8:8678:640d with SMTP id
 hb35-20020a170907162300b006e88678640dmr30461002ejc.189.1651130366356; 
 Thu, 28 Apr 2022 00:19:26 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060cc200b006d3d91e88c7sm7892815ejh.214.2022.04.28.00.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:19:25 -0700 (PDT)
Message-ID: <9dab1216-83fd-fd05-abe2-57371e365027@linaro.org>
Date: Thu, 28 Apr 2022 09:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: iommu: sun50i: Add compatible for
 Allwinner D1
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428010401.11323-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_001927_932080_117B0E4E 
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

On 28/04/2022 03:03, Samuel Holland wrote:

Thank you for your patch. There is something to discuss/improve.

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun50i-h6-iommu
> +
> +then:
> +  required:
> +    - resets

else:
  properties:
    resets: false

>  


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
