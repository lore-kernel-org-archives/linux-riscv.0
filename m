Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F4C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvAX74qBoEYWlAWY91h1/Eh7S+mPZNM22GSOI61MHwE=; b=sIl2puFwJZwkqE
	xp3GnwWUNoG+CfJxTanBFAlxDHB8yFkJ5qlnTXQJTFRWW6/FOpRRaMcg7yDpXLYMGMTgttJqDYYIX
	NYQB8kOnYdC9saByMbIXBYA7c8iJNdSAt2+1CTtVOo9u95r1q/GEtsO5vx4V9qmK3o91CE4kkIzwH
	y1gcW19lri1C6HshBBs2h8vUQmaYdT6M/VhHXuZPWsyJVFhEhFjx7N3JdvZUDjzXUVk8/Fc4rdW3z
	RTWPiK7A88g7c5Nj6E0rzepEsoaCDnmduCXDQg+x2AVJ4kxjCoBwyMvSFXTtV4AavvndyfzKhsv9L
	ajA/FqJhCXHRwjg6SBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMOU-00B5a3-1k;
	Fri, 12 May 2023 06:36:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMOR-00B5ZQ-30
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 06:36:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-96a5903758fso369339866b.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683873401; x=1686465401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHMOSAlolDJzGPoektY7MZE9dXHoLFYx7cEk41VbQNo=;
        b=Xr7f+3Oug1zfWQ0ZKMKvoULx0EYQbGRf/8rpU+HQJU7rTaam/SMRpcZkqrZY5+RVwQ
         Av24pr7xVKoCbRxkBjRqHbJ7PG1DorYp1SIjptyMLeXLmwPDRgyGYxdohEuVMwiwbpWA
         FBXyJNdKanHXVUrNxP1cBhE62XMQ2Vy+i98fuXZ0UQ2a+ewfqSTmzqlgOlCpKQsA/81a
         kCDT1Vdv/mzDS0yvPzD6kVyRCHQeNqjb2jo3qD1phKN9i9L0LzUk04B5t5i0gBVglxbp
         B6pslcmEQn1B7+tnW/QEoJoY8trkNLb6AzBagwmrpfckHvld82d2Z0eQ9J05O7PuV4Rt
         Xr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683873401; x=1686465401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHMOSAlolDJzGPoektY7MZE9dXHoLFYx7cEk41VbQNo=;
        b=EdwHFKwOkyd8dEB17OEtfYLHiLqrVbEtsE6kK0Ruf9O4JIFkoOtSRWXHo81FERs2kP
         4ufP7dVCJnD0a34+uU3DcxHNS0s9QE3hmiTPi0BoCfVTkXReeq8TW7ACXsIKosrHgoFO
         qbrTWXOiT5+8yUNP5/KSPMJE2itaH6XGupYbbGpCnB0L37QwB5iyE+Pqf1SOq9+xFJnU
         TjbnaBo4UM/De8sPtmNill2grOZRiiY7WcO+BdJC4vcGCHrjdnNiqWk6mv3lWee8d2ly
         +q1FmWjpgBN/d41mu5MGOPiA214bk4ojN7mLi2uICEsFV+2UV28mcrz7dga2HY/tqZi8
         UGyw==
X-Gm-Message-State: AC+VfDz+LGRB8kp1RpgN6gajhL/h9TnmW3Ck/ixUR63Hr64C5iplz0KZ
	/i0PxjFMgS8Yuy26exsCSm889A==
X-Google-Smtp-Source: ACHHUZ7gC5BEhT5G+mMuFNLabNgMWzL4lmE+SVW1OOiywba73Vfx8aP3OiCsgtB5gUphas7SISEpGA==
X-Received: by 2002:a17:906:fe0c:b0:961:78c2:1d27 with SMTP id wy12-20020a170906fe0c00b0096178c21d27mr20465597ejb.19.1683873401620;
        Thu, 11 May 2023 23:36:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id y13-20020a170906070d00b0093313f4fc3csm5038979ejb.70.2023.05.11.23.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:36:41 -0700 (PDT)
Message-ID: <3bb6c544-0b21-4728-683d-70db0f80394f@linaro.org>
Date: Fri, 12 May 2023 08:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 6/7] riscv: dts: starfive: jh7110: Add syscon nodes
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-7-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512022036.97987-7-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_233643_976067_15F1277E 
X-CRM114-Status: GOOD (  13.02  )
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

On 12/05/2023 04:20, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add stg_syscon/sys_syscon/aon_syscon nodes for JH7110 Soc.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4c5fdb905da8..fa27fd4169a8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -353,6 +353,11 @@ i2c2: i2c@10050000 {
>  			status = "disabled";
>  		};
>  
> +		stg_syscon: syscon@10240000 {
> +			compatible = "starfive,jh7110-stg-syscon", "syscon";
> +			reg = <0x0 0x10240000 0x0 0x1000>;
> +		};
> +
>  		uart3: serial@12000000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x0 0x12000000 0x0 0x10000>;
> @@ -457,6 +462,11 @@ syscrg: clock-controller@13020000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		sys_syscon: syscon@13030000 {
> +			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +			reg = <0x0 0x13030000 0x0 0x1000>;

No children, drop the simple-mfd. Or your binding is incorrect or your
DTS is incomplete (you mentioned clock-controller). DTS should be complete.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
