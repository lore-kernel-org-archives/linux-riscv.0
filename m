Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CA8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 02:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voIpvSrKbSTdRS2JzPiHrNzsczOy2BRzy9McW/6sPlU=; b=h9QwB6t3fJZgBz
	mjJWdi85lR2G6sm9E2qtHpZa2DqpN5tT4+oH8k7J51WinG3hQiTeWCAE2ZFQrWTbUvCpvtWeEN05v
	Ntx1t5jJiDUqBYlfLKM7m8IL48KrxCgsXZAWwdIp3qmEG/lqk+kFhV3rOBpM/ohjGqvd4yKqkzXYf
	sW5LfPoxVxk+6n6fza8zHLuxPKjJWP8TWR8nVHIDBzp2G7cMJbRSzhpmWYgRQF9uGPaQrjcLYgePd
	7PGUmuh+YFARSLeIEvlRMe7kwwNGYPM5DKRGyc7+LumrCkjPgQ4XyGUQzcW/Z0oBzfNp1QzYrAfuM
	Zlk2Px4XF/LD7x+bRiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2MK0-00D2RG-0H;
	Mon, 13 Nov 2023 02:05:04 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2MJx-00D2QQ-1G
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 02:05:02 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-77bb668d941so249366285a.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 18:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699841099; x=1700445899; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJWo13UKNLMDttCk33gveAPxz0D02eQXsHeSZKSi3hY=;
        b=Tilk45ta725Qrd61Ey8ten8g1mpiYlgtTIe1Ls4KJAr1VWoQmCiiiSGdnUDcLdaYXf
         Kyq87VlpDIM7pzxjORaNTH26uDbtQbU6ksG4nzIsAcRITYxH4hfuyy+u5QieIB1aBSeI
         a/6FD0r147IsCTg7fWgab7rxIdjaUUgC6YS3Jxf3ooJfqtElRmE8pdIJtYRozHDM717z
         xLhu844b5NcNCIev0R6EsxLpzl0ICT2kNS/nsWa71LTi62pildDpgKSU/QrbPI9NljA3
         dLhWNBgAoamA9J4WnQmvDxYJwCkI0Cl43ZiWNq03CYrrxyYUjvKjahqvNb3C3pF+PtuS
         c9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699841099; x=1700445899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJWo13UKNLMDttCk33gveAPxz0D02eQXsHeSZKSi3hY=;
        b=Iq1FE/cYtNFCNVvliioWAkeRV6LUQLVi4P2oVLDBsErbTJdYnDkQ4BYTsNctUCwkDH
         7dbV5HCKBsAemVOVwVCb4W5y2nGHYoQPUTfKaR2wWvnl3BUeu8/Vihae4yX4uU08YaWl
         QukTYeMtsS76Epa8yM4q5t2vc973GLTa68ARhxXrkT4j7nUW9uhyL3IYBpd+8paS+rjC
         H/xX5kQXf2Z1XSmzRqVAWVi9WK2cyvvRl6zF5K36TRqPhmtNHui64gwk7sMPZ0OyA8db
         quSnnwDQebdLRlh5tNe/zVO7ZZMlmc6Ej14oYQlE78MYetMl5hR1TQjp27nQ1YeobYvY
         W3fQ==
X-Gm-Message-State: AOJu0YwBL5CASHtaXZizeiRVSOY+EKHnJ4oL/3RXrUE0Bw4zSN/89HD0
	p6FSFIuDfVBeceNVIKR1UIPNDw==
X-Google-Smtp-Source: AGHT+IEPHxntb1pvsllyCXGWFQ2YICunJIfNoVA7c0uv4cM3EuMU8D3byNxr+RwsNPBD0UMdKzLS/g==
X-Received: by 2002:a05:620a:3192:b0:77a:1cc0:6e41 with SMTP id bi18-20020a05620a319200b0077a1cc06e41mr7361386qkb.33.1699841099543;
        Sun, 12 Nov 2023 18:04:59 -0800 (PST)
Received: from [192.168.142.156] ([50.235.11.61])
        by smtp.gmail.com with ESMTPSA id bl6-20020a05620a1a8600b00774376e6475sm1530427qkb.6.2023.11.12.18.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 18:04:59 -0800 (PST)
Message-ID: <95c20c6c-66cd-4f87-920b-5da766317e19@sifive.com>
Date: Sun, 12 Nov 2023 21:04:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset phandle to all uart
 nodes
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-5-jszhang@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231113005503.2423-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_180501_453205_752ACB9B 
X-CRM114-Status: GOOD (  15.33  )
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

Hi Jisheng,

On 2023-11-12 6:55 PM, Jisheng Zhang wrote:
> Although, the resets are deasserted by default. Add them for
> completeness.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index 4032419486be..e04df04a91c0 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/reset/sophgo,cv1800b-reset.h>
>  
>  / {
>  	compatible = "sophgo,cv1800b";
> @@ -65,6 +66,7 @@ uart0: serial@4140000 {
>  			reg = <0x04140000 0x100>;
>  			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&osc>;
> +			resets = <&rst RST_UART0>;

Since it's not obvious: this breaks devicetree forward compatibility. An
existing kernel will fail the devm_reset_control_get_optional_exclusive() in
8250_dw.c because it has no driver for the reset controller.

This may not be a concern yet, since the devicetree is still "in development".
But it is something to keep in mind for the future. To avoid this sort of
problem, it's best to fully model the clocks/resets/other dependencies as early
as possible, and not rely on the firmware setting anything up.

Regards,
Samuel

>  			reg-shift = <2>;
>  			reg-io-width = <4>;
>  			status = "disabled";
> @@ -75,6 +77,7 @@ uart1: serial@4150000 {
>  			reg = <0x04150000 0x100>;
>  			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&osc>;
> +			resets = <&rst RST_UART1>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
>  			status = "disabled";
> @@ -85,6 +88,7 @@ uart2: serial@4160000 {
>  			reg = <0x04160000 0x100>;
>  			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&osc>;
> +			resets = <&rst RST_UART2>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
>  			status = "disabled";
> @@ -95,6 +99,7 @@ uart3: serial@4170000 {
>  			reg = <0x04170000 0x100>;
>  			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&osc>;
> +			resets = <&rst RST_UART3>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
>  			status = "disabled";
> @@ -105,6 +110,7 @@ uart4: serial@41c0000 {
>  			reg = <0x041c0000 0x100>;
>  			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&osc>;
> +			resets = <&rst RST_UART4>;
>  			reg-shift = <2>;
>  			reg-io-width = <4>;
>  			status = "disabled";


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
