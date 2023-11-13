Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C186C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1oKUrj51UqzwHaK5hiwtFlZ2naSO9zopYnKm+PEmOc=; b=EyPBhOeDJdanZb
	Au56iSgwLpyO+cIBg0WQIhs5CO0kAlW22Q2HB+KSBDboqz+XPuHJf85x3NYNzZKaxQrlVR7Xzoyjh
	kMnLwXjaEFQ9M0mDjc1D4chToRxTbO9N1Aua5H/3coN7i5i/wr2OKidAS1M2Q7Eiz/EovqGfH6XU4
	qlDu5UUT/Q53SQLD5tNItUGrmEhdPQW/VCahTcP76Kgo8j4x+0Yy5VpmTxAzz9KGZfp6v0uHPsh6z
	sPHso4R/OlyrE4txCJKN/S5aQRGBl5oyP/Hhava0gwwwcJe0FpAGPHFucyus5qR3Ao+46fAT85L3g
	mkGcRYlwPHyrlIvtuDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2M6q-00D1Fc-1t;
	Mon, 13 Nov 2023 01:51:28 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2M6m-00D1Eh-1H
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:51:26 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-778a20df8c3so269310685a.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 17:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699840282; x=1700445082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R378FExkHzP2VzkDzW+qUJ+cmJ8zn3bLFBB62/9VsOI=;
        b=PbJFDOmXLXJZ84I2i69/mA3cSGYiswZ/n2OvGKe58iX4shq848/Wwwi0wXtRqC5H9N
         QZNgqSngRBm79xeU6tITCU+lORwGGpF3kKynTyprSDNTqZqaze6yu9xFCm6oQp+ioww/
         LJqOxWfU9ihupoC0zZGVHwd0I53szAfLiljJH3qiRIzriC4UA+h20VTN3wiZJ0h28tVW
         0fCaFlZ4fWJagtWgizXfLw5H/w353ivq+oen8TpLKxsmvfgG61jIjMoD5sBskuf3xKi3
         jUg8/Zka0kREAD0xmHGbx7DuZnn0UPcfphoWELkcqauxDhH//R4x5WErX55A2eJAl5d/
         wm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699840282; x=1700445082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R378FExkHzP2VzkDzW+qUJ+cmJ8zn3bLFBB62/9VsOI=;
        b=wjj+cWolQ7K/5Nj7eFxlunOb2hvLQjFdwIskLB9n8zgZxRdw2AD/bsMmWD+Cy2dtoV
         iJT10nCrTebZZD1F52I7NxJNKT2rDjaNpUI9IwJxbPww/AjptOqMhKLpIQ6gXdp7Tu/z
         xCdo2CkitcPN0PFWBMIPXyffsk6+qlZqxmQAXum+wdn0Y/iM+0QEA4QJa2C/7AqOGL7V
         n5S5jIoFcljASWp3ANUKQjPWq5Tcb6DRC/iaONVQNTT2D8/GwrbamIsXBxcp03pEgZ7X
         Q3OFKcFLOC5Shu/7c8siCs+bGhBEcayyMUXy4i71u9xtUOJeccm5Sk4WgqLb8wRQ4ggA
         w1qQ==
X-Gm-Message-State: AOJu0YwJ+Ojfx2K7CWN3JC3oxWtYSBgUGqj4pJ4MP1IHTBtNNNgmY35k
	IbSOIYJt7P6IxPVhjdaz639Q+w==
X-Google-Smtp-Source: AGHT+IEpsIM39+Xr+deRLACCKfM/ZtDIBoL1z9PFUA6Uub4QcFPMTkbCpis5giJAUWzMah7AijAvFg==
X-Received: by 2002:a05:620a:d93:b0:774:131c:854d with SMTP id q19-20020a05620a0d9300b00774131c854dmr6521604qkl.72.1699840282224;
        Sun, 12 Nov 2023 17:51:22 -0800 (PST)
Received: from [192.168.142.156] ([50.235.11.61])
        by smtp.gmail.com with ESMTPSA id o17-20020a05620a131100b007659935ce64sm1507945qkj.71.2023.11.12.17.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 17:51:21 -0800 (PST)
Message-ID: <58a99001-8260-4970-9fc7-25fe81e557a5@sifive.com>
Date: Sun, 12 Nov 2023 20:51:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231113005702.2467-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_175124_503986_EE22B8CA 
X-CRM114-Status: GOOD (  17.71  )
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

On 2023-11-12 6:57 PM, Jisheng Zhang wrote:
> Add the reset device tree node to cv1800b SoC reusing the
          ^^^^^
          I assume you mean pinctrl here?

> pinctrl-single driver.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> new file mode 100644
> index 000000000000..ed78b6fb3142
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h

A couple of questions: Should this go in include/dt-bindings? And is it worth
including macros for the actual function mappings, like in the vendor source[1]?

[1]:
https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/drivers/pinctrl/cvitek/cv180x_pinlist_swconfig.h

> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This header provides constants for pinctrl bindings for Sophgo CV* SoC.
> + *
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> +#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> +
> +#define MUX_M0		0
> +#define MUX_M1		1
> +#define MUX_M2		2
> +#define MUX_M3		3
> +#define MUX_M4		4
> +#define MUX_M5		5
> +#define MUX_M6		6
> +#define MUX_M7		7
> +
> +#endif
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index e04df04a91c0..7a44d8e8672b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
>  
> +#include "cv-pinctrl.h"
> +
>  / {
>  	compatible = "sophgo,cv1800b";
>  	#address-cells = <1>;
> @@ -55,6 +57,14 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		pinctrl0: pinctrl@3001000 {
> +			compatible = "pinctrl-single";
> +			reg = <0x3001000 0x130>;
> +			#pinctrl-cells = <1>;
> +			pinctrl-single,register-width = <32>;
> +			pinctrl-single,function-mask = <0x00000007>;
> +		};

From the vendor driver[2], it looks like this peripheral block only handles
pinmuxing, so indeed this looks like a good use of pinctrl-single.

[2]:
https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/drivers/pinctrl/cvitek/pinctrl-cv180x.h

> +
>  		rst: reset-controller@3003000 {
>  			compatible = "sophgo,cv1800b-reset";
>  			reg = <0x03003000 0x1000>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
