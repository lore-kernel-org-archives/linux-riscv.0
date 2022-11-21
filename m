Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75574C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQ4rFxGl4GEyCaf/11uOKgK5ycQ815Vk50P0RHe8YmA=; b=cEFEHs1Ar5FO3U
	5wbUFl8HCKB7fKd6ukQkKsw/2cBTyzuWOfmViFfzlW/rduluLIjNkDwj+Oxc3Wmo8WGJIYdEbMhTo
	MOPSWFB2imYaUiUz5sj9ZWAz6Oj+VM0B6roRsqdF/zbdHF264Och3qMy2HLEXSzaBKRuCC08neOVH
	+0bu8NtF8l21Ud4RsifIuMiyIIyyxBcr4VIjpDhJ8Ec11S2wx4viFK2uF46Etj8Mx3QQ3t3yX6mgk
	JWbFvPq8vvj5NYloKmTMsdbKbLS6oeMK/UvRCF2O57Xn+OLJXBj/O4edHSRRnhJA+wtKuKH2V8EpC
	uLLM+GnZQfy79+Lx5uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2QY-00BSOX-8R; Mon, 21 Nov 2022 08:45:18 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2QV-00BSMZ-Sy
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:45:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id u2so13729035ljl.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mycMge6787I2pSG246uybE+7CW7nJVNvvmftra6HFuc=;
        b=EpCIUBS1xLeEDrqaJF+VCHWZRLmXU/nQF3q72N6xLlGNAOw9okfhX6AJTkUsmacS++
         8GHdCUDpo7gDtaNU4CRgy84ky9JKr11n9jsSQHU4nacXn750M5txZ77fCl0losTGiCF9
         AX7DlOE6fbMx/FYg02ASuqJ0m0TsVS3i5nIlDr+oaGBn1DnZFVtMRRgnpVR7co9sTdKW
         TeYd/uSlquRtpUN8ngminea2BQ4JuFGMun3RPjkuZxGkQ4/0nTZg6AkF7Y5N2v1f6Ys8
         dulwvixdg5kqlvvvqwoeTQOjGgMIGBitFv1LnjCEbM8b8yhSXwUlRvBrgkIo3GiQ39Jb
         8bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mycMge6787I2pSG246uybE+7CW7nJVNvvmftra6HFuc=;
        b=p115D6yAsf/OfcX2Xa9Rb/y8qPu/pRkyxP1QyyVbgZatY74dkRnX7CTluumF8gL3YX
         T2polMubuorCvQ1Td4tj4h/i04c0OuXGd31KlYhW7h0OFlWs9WpMf/FuSb0bUEVwbSSx
         bdGmVYGHlSo49ntEcMPZ9v9NwXni2p4+c+vtGzrVovVbGqOggaGsOrzI4UR0nhBfB03y
         pTILZVYCr+bJNCp2dsyizoYp/RJRkMI8TQr2MKBpwWwPtA1aR0zaAKYntNxgQuV5Ci6t
         8QhBoTs6DQ3Vls0kIcEFORoL2P1L50ZEB9U9l9qDRaRylmULd0IgMc4zU/EJXOHi6aVl
         5maw==
X-Gm-Message-State: ANoB5pk4RyWvgHV6Cw0Yw4nmgSnHxo3uf3dzlxY2+7jwv55FoiaXTteD
	Rqb3mcPiKFvhda+jnmjKVgfEFQ==
X-Google-Smtp-Source: AA0mqf7lf5Y283PltKwNYB6rVc/aL101oDcgs/xDNwunV6PjB/jvcixKvd81YQAo5e3xQh08QOAdWg==
X-Received: by 2002:a2e:b523:0:b0:277:31c3:ca17 with SMTP id z3-20020a2eb523000000b0027731c3ca17mr413372ljm.523.1669020313313;
        Mon, 21 Nov 2022 00:45:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b0049f54c5f2a4sm1922312lfc.229.2022.11.21.00.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:45:12 -0800 (PST)
Message-ID: <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
Date: Mon, 21 Nov 2022 09:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/14] dt-bindings: clock: Add StarFive JH7110 system
 and always-on clock definitions
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-8-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-8-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_004515_997212_A65C7B1C 
X-CRM114-Status: GOOD (  12.41  )
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

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add all clock outputs for the StarFive JH7110 system (SYS) and
> always-on (AON) clock generator.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                 |   5 +-
>  include/dt-bindings/clock/starfive-jh7110.h | 234 ++++++++++++++++++++
>  2 files changed, 237 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/starfive-jh7110.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6f1060e7964..e97dac9c0ee4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19598,12 +19598,13 @@ M:	Ion Badulescu <ionut@badula.org>
>  S:	Odd Fixes
>  F:	drivers/net/ethernet/adaptec/starfire*
>  
> -STARFIVE JH7100 CLOCK DRIVERS
> +STARFIVE CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Hal Feng <hal.feng@starfivetech.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
>  F:	drivers/clk/starfive/
> -F:	include/dt-bindings/clock/starfive-jh7100*.h
> +F:	include/dt-bindings/clock/starfive*
>  
>  STARFIVE JH7100 PINCTRL DRIVER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/include/dt-bindings/clock/starfive-jh7110.h b/include/dt-bindings/clock/starfive-jh7110.h

Filename based / the same as compatible (or bindings filename).


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
