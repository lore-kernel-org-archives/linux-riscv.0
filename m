Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E266DC7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqNrc2zVMBQilHjmeOLU6J/VBRiQZq0cl6bR2xjSdnc=; b=BUuMCQM/lm7hHq
	/aXA8s6YY+X/9E6eIaXWxXx2FwgkYP4pjYla7reixWQGHxTvriIa7lPlI5CMWzSwLaq9u+5MAzkHW
	reRzxUsIA9+jLn278QT9BmIcz3W3WpzNsligu4yjOlmswYsqCRWz/1p9XB+annSnBke83ftT+7fH0
	IiLho9k6eXoe+YYIMI2xFdhE3ftmrrGswmCLd7fneLiFUWUetoqZTWcRiddxzEaplo9+c/1cXPUoO
	rKGOOuvvNHVS12nEgInIpKpt6NUM9ZCR3AM4q5bhX/y2OqL0kBi4kBiiqSzxfZdJJks6kK1nQcIxl
	xY+vKAURpX+hqb9K042w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Lz-008JLO-0g;
	Thu, 11 May 2023 09:12:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Lw-008JJC-0J
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:12:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50db7ec8188so4939361a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 02:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683796363; x=1686388363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDUjdj+Iypx9FcQl5FOdB2kP0msJAjTr8nwomYPJ6mY=;
        b=BRhcP4U4WOW6kWSSy8MgyGHENqZQjiqUwKTdvHBaPtcKf4daG31Fd2+X6lHGAZlbuu
         avIkAnYmDWuCHHJj7GdMBn+i+d12/mAW4QP09B2J226LyqAJ4/6STn632gSF807Q1F5R
         QCxrcrlFB5tylXAcVb7Ir1H/9Zsb4Q7ASSq+XUApbLpSeNXAg0AFwtYXmu+BNqGJ4r1C
         rqNr2ldTHfsQzPGihA6x9kbXULyEwE7+sxQrVRbxufd0msQv/uyF22WV8yUf1Ggva7Uu
         uLc5jMv1WK5pSNerA5gRQq620AqoEw7GAptzNfqRXA5xPMx+KiavJ7oxi13UPZo4MXN5
         B7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683796363; x=1686388363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDUjdj+Iypx9FcQl5FOdB2kP0msJAjTr8nwomYPJ6mY=;
        b=Tlbk3B0m07ElqYQRGx88d7EhAUiWO1Zh45R2/s9qIBqLRgibsBbwSNuNWJOzly/NVn
         bsEfbH1FMmJJclboPZkHrblt3siOxgRKomdZ30dDG/yOCRcXv0S5LeJpLUGi4gt+BUnI
         VMMUMLh6k++ruEYCap7VVEtBrxzW18WsF7zCLENJ5qBnll8oppt3eIZTc0D0W+8JvKij
         Y95TGeneQmoZPTRfCame/6S8lVxhlwg0Ca+1CyfDisA40VMzJpfh3IRVdl9E01CeNFV0
         v1eSsG2BK/Xozy6shv2fIC+WJiQDmbITkH9hpz7fNh27fS3JM2ua0rrrFrx51x/JHqJA
         zokA==
X-Gm-Message-State: AC+VfDyDP1O8VaiKR1vYrYFhVQyLp+nZkIenwesOOc/XUrhRDAZMOzL7
	9dSra4GM2e+P9qOH3VgihS1Y6Q==
X-Google-Smtp-Source: ACHHUZ4DOKhebB1vHG765Jc1wnpOXsgULcjllpOZUSAXOrc+LK+vlzdVvo6IB+8wnKK4Bm3FthvJmw==
X-Received: by 2002:aa7:d705:0:b0:50d:8c5b:86b with SMTP id t5-20020aa7d705000000b0050d8c5b086bmr15489089edq.21.1683796363264;
        Thu, 11 May 2023 02:12:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b0050c0b9d31a7sm2786457edx.22.2023.05.11.02.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:12:42 -0700 (PDT)
Message-ID: <11ba5878-da04-d4fc-8e22-a20e5986d2ee@linaro.org>
Date: Thu, 11 May 2023 11:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] riscv: dts: thead: add sipeed Lichee Pi 4A board
 device tree
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>,
 Wei Fu <wefu@redhat.com>
References: <20230510204456.57202-1-frank.li@vivo.com>
 <20230510204456.57202-3-frank.li@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510204456.57202-3-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_021248_135607_93482E4D 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/05/2023 22:44, Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's light(a.k.a TH1520) SoC. Add
> minimal device tree files for the core module and the development
> board.
> 
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -cleanup `light`
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/thead/Makefile            |  2 +
>  .../dts/thead/th1520-lichee-module-4a.dtsi    | 39 +++++++++++++++++++
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 33 ++++++++++++++++
>  4 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/thead/Makefile
>  create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
>  create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index f0d9f89054f8..1e884868ccba 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -2,6 +2,7 @@
>  subdir-y += allwinner
>  subdir-y += sifive
>  subdir-y += starfive
> +subdir-y += thead
>  subdir-y += canaan
>  subdir-y += microchip
>  subdir-y += renesas
> diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
> new file mode 100644
> index 000000000000..e311fc9a5939
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> new file mode 100644
> index 000000000000..bc5f8677d546
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Yangtao Li <frank.li@vivo.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "th1520.dtsi"
> +
> +/ {
> +	model = "Sipeed Lichee Module 4A";
> +	compatible = "sipeed,lichee-module-4a", "thead,th1520";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x2 0x00000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <24000000>;
> +};
> +
> +&osc_32k {
> +	clock-frequency = <32768>;
> +};
> +
> +&apb_clk {
> +	clock-frequency = <62500000>;
> +};
> +
> +&uart_sclk {
> +	clock-frequency = <100000000>;
> +};
> +
> +&dmac0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> new file mode 100644
> index 000000000000..86d677175feb
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include "th1520-lichee-module-4a.dtsi"
> +
> +/ {
> +	model = "Sipeed Lichee Pi 4A";
> +	compatible = "sipeed,lichee-pi-4a", "sipeed,lichee-module-4a", "thead,th1520";

Missing bindings.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
