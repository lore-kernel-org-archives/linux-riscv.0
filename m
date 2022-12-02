Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E293BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrI+Rt3Ouu5aMaAsNQAhOXb7LGvHjmts8/5OLVwXWAc=; b=2Sqt+wXSLamr8r
	1fbedNuzdJceVxntlMibgVxH4IhFCnTmUAUVpEce9XmiD4ZAj/KX42Qr/yxyhOAFcG3KzQQancDqR
	+SJepYEk/avumFbL3yCrAVhuR9hSrzRt4+/DBB6Zlnwb0m6GJP8t/dMTm7VbqzOAYwI5fuxmpFaWb
	PKWVBEk+QMpzSPZ02EUlw106rgCG704Gfxotl11S0kfgoifTmJ6L5cG2Lg9g2v3oxNAYxJ93bptfO
	BopscZyJRtu7U7X7d4tjqEoHxoTICoiF5VIxOH4z6Dx0pR8CyYgHmCN8D2bnfMIzMM21pk0p2L8eZ
	gZ/OEh3b9yJFpH9qZKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13aT-00Fhwb-2M; Fri, 02 Dec 2022 10:48:09 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13aQ-00FhuJ-93
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 10:48:07 +0000
Received: by mail-lj1-x22e.google.com with SMTP id bn5so4990714ljb.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 02:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rtYcu6/3CQ2S7j8h20Y4A6KAn9ZcSJMr/CDNrzIstnQ=;
        b=Hk/Li4JaaBWRgFd1nMX7JJDu1fjwBX3sjpsJWIwGzephlDPZiA0DG3oR/1IBdlJBHc
         3AxVGQowYtusxWTTcYll8wjfvwMUH+Pisxon83SbDwMiR1j0832B0FuJdXxqwKp8ls7M
         cfjBZqWHag+V8EfW4d9kx9ISJkAmvjVyyfZm3aUl6uCUSn/tHCBnXPCUTv7GhIo6+iWh
         5D//Aw/6VB1mJLZcF1CJrdCa1Dk0L1Ag1msAFjRoWBlbe1izqBRxWvgF4bcS/aAhEj6a
         LVUh65SvjG4TxbSxxKaibmPilM/mfxDn+3KjIbDBxVAubnNkqurweUq80+qLwe4CEMU2
         foWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtYcu6/3CQ2S7j8h20Y4A6KAn9ZcSJMr/CDNrzIstnQ=;
        b=TLh+5jVZ2frogjyh/tDsorN1lyNg/kCxwQJGE3T/4+awHoDPAYVA1nC0cvZZbzsFv3
         U6xdJSsrecO//raevaLgd1DAhLgg9h6nX02RGiiqcBKTbr+HwZe1TTeTK0P8msuc9wjk
         OfJHqKDQaO6VTI8YtV7KaglIhpP/bZ05WWyE8o7U8FxH2bkl/h7yqkLsdicf6eJ8qVc1
         trI1QMJDHBGuR8dE89KY4dK81HgVO+8gk73OGmumVabvSYD6sU31XJJlKYSXhfSHyMRq
         Ndp5cJqOAGCzhIFvGFW3mKrkhGfWdxTM/2ld6pFmjTuuTv+ow9IoktQbmIOSVj+h1JYj
         DD3g==
X-Gm-Message-State: ANoB5plPFEwpbkn+54DEYVglv7o2THK/RNALL8S6YIc4VKAyE71Bq2f8
	NLCMDjD0cWIvpamCj1rZI5kJRQ==
X-Google-Smtp-Source: AA0mqf5kICRVgIlw6pQmSQRYTPuyrEjRpC1cLcHLMJHCp2kVwoaY5Hrz+SdFZjavsjSxLsCYIrXicg==
X-Received: by 2002:a2e:be07:0:b0:26c:6dce:ce59 with SMTP id z7-20020a2ebe07000000b0026c6dcece59mr17660429ljq.130.1669978083449;
        Fri, 02 Dec 2022 02:48:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b26-20020a2e895a000000b00279e0b8bae7sm92593ljk.65.2022.12.02.02.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:48:03 -0800 (PST)
Message-ID: <66e66749-cc0f-f147-2648-03b52f95cca5@linaro.org>
Date: Fri, 2 Dec 2022 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add watchdog node
Content-Language: en-US
To: "xingu.wu" <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-4-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202093943.149674-4-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024806_357726_5ADD5AFB 
X-CRM114-Status: GOOD (  13.67  )
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

On 02/12/2022 10:39, xingu.wu wrote:
> From: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> This adds the watchdog node for the Starfive JH7110 SoC.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..22f5a37d691e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -433,5 +433,19 @@ uart5: serial@12020000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		wdog: watchdog@13070000 {
> +			compatible = "starfive,jh7110-wdt";
> +			reg = <0x0 0x13070000 0x0 0x10000>;
> +			interrupts = <68>;
> +			clocks = <&syscrg JH7110_SYSCLK_WDT_CORE>,
> +				 <&syscrg JH7110_SYSCLK_WDT_APB>;
> +			clock-names = "core_clk", "apb_clk";
> +			resets = <&syscrg JH7110_SYSRST_WDT_APB>,
> +				 <&syscrg JH7110_SYSRST_WDT_CORE>;
> +			reset-names = "rst_apb", "rst_core";
> +			timeout-sec = <15>;
> +			status = "okay";

Why? okay is by default

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
