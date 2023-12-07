Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE345C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP6dsgvJx9dxT8w5m1ae1ZHzAt99ibl66aOaf3SKRcQ=; b=au8Fgx6wkiKNrD
	mvNnIdza9yMqJuL5fkwavopoY04FVffyoGl+5hjL7r+lHgtOLVcOI6OKr1B+/gWzjJyYvIqhQztft
	iZmi5ePU+B0T/b8lvQ51DUIT9PPhwkBbCwVUAT9f9lLzHS685DXIO+t9pV8foXJNQyu6fOurXCW0Q
	mSL5Gcx3k1C0x6RoWnySFucwYecbNZfJGA6cn4Vcr3Zkun3mSGRBtBMle7VEYZ7lbSddKWgG8uedd
	i/1QQIs+WzM984kC0d/8jFengjEHf7/CzgXVBa1DNk+NHBMz5ETN7ULMyzbqKS56rLT12FHjhlNs4
	p0p1yTPOephfmEi6JifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXo-00CKlA-1e;
	Thu, 07 Dec 2023 09:19:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAXm-00CKjZ-0h
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 09:19:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so674003f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701940775; x=1702545575; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HbswpXQEP/8n6n7jLHJeLCNuluUVepzaRbqJwb/Uos=;
        b=zGlsXGob/gSC1q5KwYot4hu5EBausJpHA6PHsrqBIZKdnBavA9wwo+BddHPjgbHCNN
         kYiCMYy1Qh91yB0bAIUlUm0r+eXTJIylS8Sifl1uT0K7iZLpSXpR40ch2OS6lKHMZTji
         21OVBbUyFKKxEgO7aKTjHPMGz1g6dYF4BUvoSCbRzeo/gCLWhhedAUeba9pC39gPE2Nv
         G89jETgwhQbkb+IWFqFGIpeMu2AaVfR1m6JuSgfUIIYIBWVuJyMRKob0yMx63TPspLww
         QnrXfRwNAZD0ze+34UF9meJoXceMgmpF8Vf7AV+vQaTyDi0M7kx8mrYGEu0eDrycPIzr
         75Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940775; x=1702545575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HbswpXQEP/8n6n7jLHJeLCNuluUVepzaRbqJwb/Uos=;
        b=ETAcTeWk4ftKxTo8qqBGnuLtu9oHKlsmCjdlbwqrai56mMTk0MKSUieyTtVAiR0ZXl
         YwjAXrP+VQRV5PiAhIK+OF2qdDWGN3CcQwYNRrKNfKYlod64S+crqcPgfrHoKUuM8Gka
         yNWwSg7rt4V1UZa/7tRiDcDZJOV5TjUCjhZh7agqrwTBntJ4GVcJhl40IHBpEyummt3V
         UcI0wwIQol91HmpDCh/pqb9WqfWWo+uumv1HjmXWWy4DMLSObNRw57noZtavlXIYHBy/
         jnKkvW3HqSWo7j0eY3GO90Pl9r2QP1Kt0M2yr3jZTHW+5Cva5cJLY4l1TB3lvsfrlRch
         iF/w==
X-Gm-Message-State: AOJu0Yxd+y1AVokP5SvGAx/+iCrXaa9Mo1M7JIgMJBYym/q/GPHU12Ox
	FnXDx7llEXSTwT5YGqFHbhtP1Q==
X-Google-Smtp-Source: AGHT+IHYrRQTyeFedSQMtZ/uum6P2j0It3axj30FAfmcehgOARITxQj+12XLfNOEVIYE1XY1RfDzyg==
X-Received: by 2002:a5d:4f8a:0:b0:332:e2bc:e809 with SMTP id d10-20020a5d4f8a000000b00332e2bce809mr1310030wru.67.1701940775169;
        Thu, 07 Dec 2023 01:19:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id d14-20020adff2ce000000b0033349de2622sm903603wrp.94.2023.12.07.01.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 01:19:34 -0800 (PST)
Message-ID: <f9db367c-a96b-4789-9884-f2062499765a@linaro.org>
Date: Thu, 7 Dec 2023 10:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add clock generator for Sophgo
 CV1800 series SoC
Content-Language: en-US
To: Inochi Amaoto <inochiama@outlook.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 qiujingbao.dlmu@gmail.com, dlan@gentoo.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB495376DBED8EE897FE11A2B7BB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495373158F3B690EF3BF2901BB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <IA1PR20MB495373158F3B690EF3BF2901BB8BA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_011942_261524_9CE6589D 
X-CRM114-Status: GOOD (  12.36  )
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

On 07/12/2023 09:37, Inochi Amaoto wrote:
> Add clock generator node for CV1800B and CV1812H.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/main/hardware/CV1800B/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 4 ++++
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 4 ++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 6 ++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index 165e9e320a8c..baf641829e72 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -16,3 +16,7 @@ &plic {
>  &clint {
>  	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
>  };
> +
> +&clk {
> +	compatible = "sophgo,cv1800-clk";
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 9a375935b00c..83243c918204 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -21,3 +21,7 @@ &plic {
>  &clint {
>  	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
>  };
> +
> +&clk {
> +	compatible = "sophgo,cv1810-clk";
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 2d6f4a4b1e58..6ea1b2784db9 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -53,6 +53,12 @@ soc {
>  		dma-noncoherent;
>  		ranges;
> 
> +		clk: clock-controller@3002000 {
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;

I don't find such layout readable and maintainable. I did some parts
like this long, long time ago for one of my SoCs (Exynos54xx), but I
find it over time unmaintainable approach. I strongly suggest to have
compatible and other properties in one place, so cv1800 and cv1812, even
if it duplicates the code.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
