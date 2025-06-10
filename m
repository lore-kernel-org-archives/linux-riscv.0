Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB3C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 01:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebRtn7kGL7v4M9b+R6X57Kdjj0iCDKQP3fDKMwAdv6U=; b=SksONufdKypWYM
	RCmGnn9HdBaSJr+hiwB7BpVhQ5W0GzLGQh7zzlYajWV0qQvny9Mhiw8RG5c6gEF3m7JDI4YShpymg
	sGqcwbU+2qUim2FsDWmmB2d+wUGAeEWWOohlm+uqpzF5McN3nUcOtVMJAQTy4iuGFQDpHyT8H0rAT
	i7vab/oHauliTN8tWWwltSf3G+mHpRkmzfCes49iS9I99TNIl6fwAI4ZX1GOggGNLYZWclnrlo2EV
	pPQ7EXI8njPHClO1H0MVlhsrlpb+WnWaCiK0Oz8Cryog+VdfHa7k6wr7Z+aRRtpiymgPc0C8/TRm2
	5axyyiAJN+aHcoISB51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoGy-00000005b6h-3vhK;
	Tue, 10 Jun 2025 01:59:32 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoGv-00000005b6F-3Au4;
	Tue, 10 Jun 2025 01:59:30 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6facc3b9559so69714066d6.0;
        Mon, 09 Jun 2025 18:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520766; x=1750125566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/HbnauDYf6ui324V2v/SCWpldAIlHfJUA8RdUYkcDM=;
        b=PCcCkDkfoHqV/LfeHnaYmjb6YVUZywm9mR2c/ovhrqKeeoC8Mo+NIO7ICya37dkUIw
         8yA3ISCpORizy2lb29hiCWURVsTVCNEaZLnVf7cz3fNZUtuvLnDnaoZlAT5h8p8lMhpN
         AgbvbMB3sCUMzoQagXJeIn6R//XIyFKbjplJ27Gz9Fv8Cy4rzCf0aNyE8Bd98s2XP9OX
         fiVl//uzCPD86MDYgXuHUB9PTvH7FSLlnuyrhb0wJpo/CydrC55CLMpDvdXKPseTw6LG
         ZWujUDqJiRO7ES5Nk0CMJFOCbqy9k8cn92WmXBJg3zt7c1BtoXPsq7nMYVyv9Wf2WCpR
         flCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520766; x=1750125566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/HbnauDYf6ui324V2v/SCWpldAIlHfJUA8RdUYkcDM=;
        b=YMEG7iCm/5iqk6voGxEMmG5GzeEDgKyPa7DV5llJ9T/o+LLj9fkPtulSIGIyQ5JnQY
         uWxLVu6Eo12y6HG+4qAPGrLZ4LA5tisBF0koQPOgjMJodRN7iENhJPf8jyKRLM9Csmr+
         fnIyDBRHAAqUglUATI4RQbuuDDx8JsUHXq7UrY7kmCGtisJ0nCRt/iFDVG6ZFdzm0InR
         qcbj83rqUlrC2LOvxZvhJZNjMO1OWlogRSkho9mG58My2S/90ZVwHExN5iPCXFE0M7ap
         j7QIdxtPSccd+ThrSh8z9a6UnPaGsIjC5ebVkw5yZSj+Vifp5FsVpRyZ00ptW/h99fpx
         U68w==
X-Forwarded-Encrypted: i=1; AJvYcCUXxhYbOY+tPcJ45gWHKBv9zgDd0t7JSzNTfi226s3ZDZNajqD+hFxULuGKK6tIHftQmnjqL/4eWXMF0NE=@lists.infradead.org, AJvYcCV7a6UBTi59hsvWuyE1kNy0BueamA9AjvnC18HBsAodfrimBwZwlqJXe2aE10kGCimupGTqLK/6rBBzVRt0MxiS@lists.infradead.org
X-Gm-Message-State: AOJu0YwsGVT/15jYwJZu7wPKjKQUf441XO4uFCkHgxyv54zWqGa6MPEz
	QV+znDOJ45Jzwp7b6z9dGJ1yP+Xb6cof347Jj/JYTKVzyt9QzjHBvGZT
X-Gm-Gg: ASbGnct6uibu+uWAkAVJSPXSBHhkKtPfCdF6QFOBWwMDtPGoQYuvsb2U/y0W4NKXvvX
	5lfs8cCCSjoV87WwcbwJ70KETirB8l4j2oytJsD+lx07GnfRSnUFK1ZqrhBYT/JDs8Y0G/OOpv4
	8VL4dhqzqoSvVuXnZ2lKda4XlHcH8tBmHJ86ittvQd1w2wluxpoUkSJfSGYAIlYkfSFXwCEaDs+
	T2tt02VHl5AKV8IkGu09XhCoyNuTMBtYjfNMc9Bo2IchUTrXsIcSx6IJfjAO5Kw2u7kIhzSshQb
	GEbyCFQ0qh2uzWBFRtIoCKSiX31xxUERzCt/9w==
X-Google-Smtp-Source: AGHT+IHvYMWWyIw93LIzw1NNnddQhHK80Bpi1zW5dbuBE6Bl2s14aPbKsVPoJsZlb4z8YnHtVCaIoA==
X-Received: by 2002:a05:6214:c8b:b0:6fa:fd8b:54de with SMTP id 6a1803df08f44-6fb08fcc705mr227117416d6.30.1749520766486;
        Mon, 09 Jun 2025 18:59:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25170613csm624044685a.6.2025.06.09.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:59:26 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:58:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, soc@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/6] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <g3wzmewsjrbeteumfv3ibqwj62cwm45whledqez4issjkmqao3@oymrmm57c7bx>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
 <20250609234125.722923-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250609234125.722923-3-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_185929_916767_889E8385 
X-CRM114-Status: GOOD (  17.01  )
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

On Tue, Jun 10, 2025 at 01:41:13AM +0200, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi | 91 ++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..5e69ccfbab56
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <riscv/sophgo/cv180x.dtsi>
> +#include <riscv/sophgo/cv181x.dtsi>
> +
> +/ {
> +	compatible = "sophgo,sg2000";
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0>;
> +			enable-method = "psci";
> +			i-cache-size = <32768>;
> +			d-cache-size = <32768>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x20000>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;	/* 512MiB */
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +		cpu_on = <0xc4000003>;
> +		cpu_off = <0x84000002>;
> +	};
> +
> +	soc {
> +		gic: interrupt-controller@1f01000 {
> +			compatible = "arm,cortex-a15-gic";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x01f01000 0x1000>,
> +			      <0x01f02000 0x2000>;
> +		};
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible = "sophgo,sg2000-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +
> +		clk: clock-controller@3002000 {
> +			compatible = "sophgo,sg2000-clk";
> +			reg = <0x03002000 0x1000>;
> +			clocks = <&osc>;
> +			#clock-cells = <1>;
> +		};
> +

> +		rst: reset-controller@3003000 {
> +			compatible = "sophgo,sg2000-reset";
> +			reg = <0x03003000 0x28>;
> +			#reset-cells = <1>;
> +		};

Remove this and use common cv1800b-reset.

> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +		always-on;
> +		clock-frequency = <25000000>;
> +	};
> +};
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
