Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07767C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKg3MEFooHLtrWWM6FkRUt7MzaDWUWpx+27nc4klU9I=; b=HKKlbfh3vNwj3U
	D3NG5TBUu24bl/X6+JiBFWa5H/9At4AAdGWl1mMMy3eWy8ugqi9dC3bLmodE9Rf3b74YgvBqU8Sn/
	lB/ZV8dazA+bwK6ugazancDTxo4LU3iOBUjRPCLopNqhnfy0vHpSEeLcpFHjTbyVtZsa36kPilOC7
	biuzcjDZj2F6Bl09WCM9ruDtBqJr+uj4hj2YnKZFAkwOndzaGFALJ7US7xH/Z2MaeyeUn+rY/3d+Y
	EZ25Axbmjf55n8AmU08V5tJcPJc4crPoQEgdNhiECybCBcQqhFFBP6GdPk4I1996+YcDOvLoFxuw9
	K4rNcoNneSlyyq8SXxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N4l-00GSvP-DK; Wed, 30 Nov 2022 13:24:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N1v-00GRhF-R5
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 13:21:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id c1so26900182lfi.7
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 05:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EX67p13z8d9r6utOQ3HspL4ZQU3w0yz+MFaOvH14Afg=;
        b=HbKbsmDaHQCbziDgajKR80oOYPdVMbLximh6GWVUvz9kqlJroCPovLR5nuOjq9/uep
         asR8yhq+pOBgRnaYu8Wr4kGSbOInPEYT/bbLLi1cB1nVZdlYzrlolleMsVY4so9dqY+d
         /02g1se7UbNg75PTLaDlhbPCKMtYwsnhXotrZxfehQ1WUakUR+LFiQcYNzKtrXxPh4kA
         +ojt+Nx4Vr6KMaNw1zjihVUH8pe5FDP+fbDVWjj7BAv/dcfHMQG0XSWjMXVv5Vfxtu/f
         MG0PntjAYJvFBVFZk8LneLNgpLQUzYxCdIgD4KuigtuYdSSrIPRUqOy0eWNVXVGqt+/7
         +b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EX67p13z8d9r6utOQ3HspL4ZQU3w0yz+MFaOvH14Afg=;
        b=rr2hRXo8QR7LnRcb+lZvIcsQO+hYrdwVhZZibiKlmOuYDWRg776GhHG5KTA7IOhih4
         QY/Y1QbA0unHNWfjkHYDsobUqw2VSSIPj//W+M7CtvX+piU7KEUDKuKdWVih7PPsCuae
         +213j+IX/pwYoSoI6+aw/e2c1HMyFbbfzEXUoHz2UwDYmENwmSkBuVtiW5pqkox/Vo8r
         U17FLFq9RsU/rNFj7MiSw+5kPXKOMGoPWzksrck9aEhWrIYVCwdK0AI8xe5NHnwEcQj7
         0Yk5KbszdhB+20ZUd3qzr5PryX/dcrDWcZfWvPxCbGV9B6BVm1AFgIH2dkIm9MSVtuIP
         VuBw==
X-Gm-Message-State: ANoB5pllnHNFy4LM6+xOTZw7+kV2RmgalUnqfWvvB1E+mRYwtl7ZGbMq
	eJ3bnMPBV09UmgirrUbZYE5BAA==
X-Google-Smtp-Source: AA0mqf52Qf97WPzBKIa/waiBz5xTnEwwOQKDvYKrFoZ8Q2Q4fftU8TGRyTNB6VsgW04a9KygsWryTg==
X-Received: by 2002:a05:6512:32cf:b0:4af:e82f:6013 with SMTP id f15-20020a05651232cf00b004afe82f6013mr17826256lfg.36.1669814497889;
        Wed, 30 Nov 2022 05:21:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b8-20020a05651c032800b002770e6c620bsm125999ljp.106.2022.11.30.05.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:21:37 -0800 (PST)
Message-ID: <6de013d9-f2ab-a2d8-1022-2474c037c737@linaro.org>
Date: Wed, 30 Nov 2022 14:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Content-Language: en-US
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_052139_934835_0293684B 
X-CRM114-Status: GOOD (  13.23  )
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

On 30/11/2022 06:52, Jia Jie Ho wrote:
> Adding StarFive crypto IP and DMA controller node
> to VisionFive 2 SoC.
> 
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-v2.dts         |  8 +++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 36 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> index 450e920236a5..da2aa4d597f3 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> @@ -115,3 +115,11 @@ &tdm_ext {
>  &mclk_ext {
>  	clock-frequency = <49152000>;
>  };
> +
> +&sec_dma {
> +	status = "okay";
> +};
> +
> +&crypto {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4ac159d79d66..745a5650882c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -455,5 +455,41 @@ uart5: serial@12020000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		sec_dma: sec_dma@16008000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

No underscores in node names.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
