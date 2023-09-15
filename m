Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A70CEE642E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/j7P+koDHTe74dxEGA+uAGJVJ2MEEDDZVwbrwi41s64=; b=BCDENzcMUVx5UR
	J2l//s5p+t7N8pNNywi7v3DDj2/NLddO+O1G3yBbMkvxjAO1gnjcI7XYYlBqu0uLlzadasskauyC7
	WR6IvWBp/dowpED6r3C/GMuun9n3swclcyzuz3/YDtWbR4Jg8kalLvE2PoysMrPYmD3j7TyxV5F+z
	q0Uhy1tnJEYhTlay9BhXy8n00wWnNGCpYJ0Yzjk7t4hR5QBfzAXlodBeosViRWnL+Tlwuat72AmPi
	hlSGoMFkS5A+n28HmA5s4U+Jtg1zoJ4l2De+oojPKxOXpP04h7AfA4OWsgOcwIhzPNt/RL8PpvQ9R
	lyodOcVl83R9Fz3oSKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Ly-00A3v1-3C;
	Fri, 15 Sep 2023 07:35:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Lw-00A3tk-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:35:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31c93d2a24fso1642068f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694763297; x=1695368097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOhwwySDKn21smjpOk6dEq+GSuFI63bl1UFYi1EKI04=;
        b=MKZnvOmaPSZ0UlTtPo1WJu4TQHyd1nZNBv3+cD5cxa5Bq3Y3vaPSYxWjxqIDVsm1pu
         enU3A1r+PKx1ACjykKmAIjTkQ9Ghoai7uqwYc3Zxa7ZV87s0MJNMlO3w9GqgadQHkRFu
         TEA7zF1BTFB3pdQcJHFQmGrh8u/VkJQPtcPn6qg4e6Nhc5PrgVojJKtgrCT5ZM+IzFa+
         8b38Wmc2k8+Th1MVEqgkef+NRIweN9NMU9KKOdmXRfLZ8XXGql1VQJACo+FSmtLiaHMX
         WcIQ9M7E8tYUZKYVTpgIGKjftJSyeaEN1Yg6hbWBZroyco3XFX6HXnJzEhpcWA1dQNat
         jvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763297; x=1695368097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOhwwySDKn21smjpOk6dEq+GSuFI63bl1UFYi1EKI04=;
        b=vPFykZD+x2cguPe+iWxd+LbEibJPJRQWtz5Zur63eVBbfX71nMEeNIqSPcX0vcabHN
         7uyn5SLDhUD81yet6CvevDRSuZGKWwRapoipIHmZvBy3e9x1d8OPe5tS0Q/VuEL0Dmju
         4DfJRryOKhVJR7xwH3To+KladX8ovE2dZBxWMtjEp94GepUfz3JoD+NMfEDivsdGbcWy
         UeBXKOJPPEuJ1INbKnu6rKZXPhs+WlmpVNwgT26ubKyisIW1eeYScSvkhIztcyjEwuLt
         AetOv1W/2IBrR6F21c9rusCimkjrA7TSrxNg3bzqvqcRv/C7gpJbD0oy69BSkSc1lVBC
         Lo+w==
X-Gm-Message-State: AOJu0Yyc8b+bxRPzdGKLSfEHcnIvunyWSgEhuoHI+ynZNTqzQz+L7N6M
	kyhFUxvmHrhCTRgNB2StK/o7Cw==
X-Google-Smtp-Source: AGHT+IExuGBnRGeiPUMGNEcpJuC9JYDa0ARcsc3STMPxBsCsHrtn9sUbxB+m5v9Cwhl0shqQDvwc+g==
X-Received: by 2002:adf:eec5:0:b0:31f:9860:2325 with SMTP id a5-20020adfeec5000000b0031f98602325mr610529wrp.67.1694763297409;
        Fri, 15 Sep 2023 00:34:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d6ac8000000b0031416362e23sm3731001wrw.3.2023.09.15.00.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:34:56 -0700 (PDT)
Message-ID: <fa554890-7315-97cb-a9d3-d0acf18d0ff2@linaro.org>
Date: Fri, 15 Sep 2023 09:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 08/12] riscv: dts: sophgo: add Milk-V Pioneer board device
 tree
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>,
 Inochi Amaoto <inochiama@outlook.com>
References: <20230915072451.118209-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072451.118209-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_003500_175524_F491BF99 
X-CRM114-Status: GOOD (  19.01  )
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

On 15/09/2023 09:24, Wang Chen wrote:
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON
> SG2042 in a standard mATX form factor. It is a good
> choice for RISC-V developers and hardware pioneers to
> experience the cutting edge technology of RISC-V.
> 
> Currently only support booting into console with only uart
> enabled, other features will be added soon later.
> 
> [1]: https://milkv.io/pioneer
> 
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/Makefile                     |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile              |  3 +++
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts     | 16 ++++++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index f60a280abb15..94788486f13e 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -6,5 +6,6 @@ subdir-y += renesas
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-y += thead
> +subdir-y += sophgo
>  
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> new file mode 100644
> index 000000000000..5a471b19df22
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
> +
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> new file mode 100644
> index 000000000000..4f480ff88fbd
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +#include "sg2042.dtsi"
> +
> +/ {
> +	model = "Milk-V Pioneer";
> +	compatible = "milkv,pioneer", "sophgo,sg2042";
> +
> +	info {

Drop, there is no such node. Otherwise, please point me where are the
bindings for it?

Anyway your submissions is incomplete. Your DTS should enable some
peripherals, like serials etc.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
