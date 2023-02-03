Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F5AC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN4EZuDfH70HOYbaVJO3F0R8GzH7t1+YAymG442wh24=; b=O56dquL+h5QkMx
	uro2HCTA+08J3DhwzclDqpRr/OH1eH5wwnUM1siHB0BQi3Pd2FVZdBTLesGgxs910cZCcw0s0V6YF
	gRAiUOTnGNmukTlEKW652iBs/6YRLAFbwCjOGacfnuZ1BqUYwlv7my529hnJJIHDt261AZg0bMaOb
	DJdkRdh8ikz71b64wAkjeYVzo4ftE4gSpSKlPk5KGUSZ3R01QynMyUKonuNtMNOaMNC4NCgnRMDix
	K8DyoVutbaDz+AEZkxOvbvtHZzUCMHQnJFr6D3V8Z6Bab2F7x0n7U9Xg7Q+XOuDFRS+9JorbEU64N
	xAvGuRdnWVzQk2yXwDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrxx-0015oL-W1; Fri, 03 Feb 2023 09:02:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrxv-0015mt-18
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 09:02:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso5533564wms.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 01:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2aiCKLplfBwX38ykcuLOaza164bQFv98FeeJ7x8FKo=;
        b=IHQ5dxA3E39PcS7l2mnGFejvdya63XtTLOxXnNaryTsGL35LJ3P+W/+O17cVjN8CBQ
         Vl6p8iCa92W+Bu1vt/TtpQWNT+PWjT9bh1y6rw+cex5hKQXLX43+uKpdpAmdfre6v2mR
         WrrjjAi4C83DWeIGYezsmNofS4KltrsaCgdkqNQCchLxcCbxxslmo1v+8YMSSj5H8wXD
         9lqIogxZrRFuLtDW2Nn/LfXX9oS6pgul6Hhon+6Ok4ZQ+GJsPJ8Y0ZzcCtJkw0O8TWy0
         P2ycUmuIIT4PKBItag7PSuzMiIAiHFtefp0lCHOuQNXyjj7KAg461XnqtG+4ChxQ1vJD
         bXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2aiCKLplfBwX38ykcuLOaza164bQFv98FeeJ7x8FKo=;
        b=2PTVRqeGCApgQIV5mUPtUex2HNK6TVc4stvu4w91W2LCmVAD8dg4H56lKNEksa72/D
         AapLxm2c2+QrdHSxynIXZF7DKSszlAJfRa5EIKMOYx18p9NWgMmi2Xfuy/j9L+4jntE2
         FHS7WtPCVyJtppll9WzEBS38kRu58cLeVgA+enDxIKkqzj4NPTtsxgALbStL2L24h7/v
         RzKzN8dgDS17igMiPPmmOSrI4cCVbpvVJeD82JNx24F0mjX4/YAkt+9Y4c6TdyTnbGqV
         6qYaG6UBXHfLeZtSreR0zlaBbikyuz49eS5cPky1Yl3ce6sg6tXANxDOIxtSCF1bpztu
         aI1A==
X-Gm-Message-State: AO0yUKX61Kv/Q7B5t7wFeHTTvPLmFHwgM6phFLFf4JGLk+WKdx65bJck
	nfLK6YHWORH9eVSwstrF8Fbi75toDwaMis0g
X-Google-Smtp-Source: AK7set8fAEK8Uz2xDND8RKaAbMEMsT8CBVBEB/JVTCIULoPRT91JYLEobcoPWf0bjmDyTEvfWixQTQ==
X-Received: by 2002:a05:600c:4f06:b0:3da:b40f:7a55 with SMTP id l6-20020a05600c4f0600b003dab40f7a55mr3958239wmq.6.1675414955338;
        Fri, 03 Feb 2023 01:02:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b003dc433bb5e1sm2331776wmo.9.2023.02.03.01.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:02:35 -0800 (PST)
Message-ID: <3c5bda9f-08b9-f2ba-6951-9fc614d4debc@linaro.org>
Date: Fri, 3 Feb 2023 10:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
 <20230203081913.81968-4-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203081913.81968-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_010239_103495_CF335544 
X-CRM114-Status: GOOD (  12.40  )
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

On 03/02/2023 09:19, William Qiu wrote:
> This adds the mmc node for the StarFive JH7110 SoC.

Do not use "This xxx". Use imperative mode.
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> Set mmco node to emmc and set mmc1 node to sd.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>


> +
>  &gmac0_rmii_refin {
>  	clock-frequency = <50000000>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 64d260ea1f29..ae1a664e7af5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -370,6 +370,11 @@ syscrg: clock-controller@13020000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		sysreg: syscon@13030000 {
> +			compatible = "starfive,sysreg", "syscon";

No:
1. Undocumented.
2. A bit too generic. You should have here SoC specific compatible as
well (either as second or third compatible, if all your SoCs share
register layout).

> +			reg = <0x0 0x13030000 0x0 0x1000>;
> +		};
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
