Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA6BC35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9V3F42PgixF/qEu0jK6vtQ5n6RJzEM/40lKgwyRCGbE=; b=p7DdDE8FJJY8hqi/3qwxjqYF2+
	7AngHnU2r2/GwgsfhwvUKW9oJE3KgyANzVAxrjRzSv4HskIn8foGzo73L1Aq1+ec1QkI4Sj1EgB9P
	RahBkrXLqIx8jjQJeeihm+C6zhL+IxsIttKgaBLIYsHc3BtpS1r3Q+R2/LRfEsDtMJ8WKDN4htL0I
	mKfhHTvRDYuXR/7s4jC8v/iYYKGAZL0R1ULu1ETgN7Lym/44FcvwER8/3GTSoz9Sn975GJGh+Fapv
	QnGyxAL9ITS9iV+IfwUoSc1IVEM5/4vTnMu3LlS34tTiYz7gm40xGAKL1ri5gIhqngE5V7/PUR4MZ
	b5zxVKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5et-00000006FeB-3ebi;
	Tue, 25 Mar 2025 14:53:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4RT-0000000630O-2O40
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 13:35:45 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9E8563F66D
	for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742909738;
	bh=0hMG7fY7rFtgJ4XIZJtNcD145PRrc9hGfSpOL/Mrrv8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=feFUV3khMc7knPyx4bb4MoaGULDp/Ufhx6msEs0lYS3GzQ/rPKlC95tVly643HDZH
	 2/2esD968L6dkKa8n5k23HVcS3ZjhEgLXtT1dlC2C48CV9r1rD2G0LRX0FGwYAcBa+
	 x/tAsysth/wrm6da0pjtaRxLC2ZNcGRDwIO2OqcXPgts7OSHpD0cK4ByVrWA55rkpT
	 23+ZDmlN1JNkbB/dqj6rTNhMi/91lgiyWuopRlTfr9/QG9ju+U4b5R7n1gS8/D57te
	 jsk7djRSYEe+nmNvMyiK3wxmSASmJI1kXvJqfxPTFk7d5yAg45zNbkPyoxtYPbCyoS
	 feQ4mY/l+XuUw==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3fdf9b1f191so6093482b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 06:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742909737; x=1743514537;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hMG7fY7rFtgJ4XIZJtNcD145PRrc9hGfSpOL/Mrrv8=;
        b=OtR03EAa7VB8eYBfjpzFMU+b4k0MhJJAF9FC35sr5uYChBxnlXyhioEB7dxe1CBNB7
         jxDON3vTVOEBLdgpoGd3f97VVox0T9dUie4I8fQjRoNbNTC2AHrIO81WaV7lTqR/w1r2
         ICOFJiPWJ+q5FUeQeMEJaQj6Uujz957dpJYlsnqjsTfLA0jvDSQVYRYp1dZchEfAEZfk
         diUpmXfgWNO7lyU8KmvHL/HmZpwgv9XJ3QoHEMdc5sQDX3w0VI7AyYmBDVHbhaZFoQrH
         fTYnFSPjEmHyX1RgugbMqfmwQT46pAqGjx68kL79S9VsEqPnYVOdsG9KDgdE6RFagxf+
         lYCw==
X-Forwarded-Encrypted: i=1; AJvYcCVljkdaptC+TLJmCXkvDpbpilYiuU8HLPKdatIL1aW+vdcIuRRLIvk7V3raQ7KAVrqkdb4tEEqzlsJ0gA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCUyyXQwdrogx8UK0TQBqGy1BEZuwHybmrMZl7/8XSOI/rqkh5
	Q3AnLSCecGbGsxh0GQw85dHrH3F0WXma8VtelANs9nOwWp0lEVVCnmm6G10dqIR/JnynYFqQ6LI
	zzXOD4j5U7USa23W8QL9ewm4+JEI8I21EMtmyHP6BH6hHLN3GX+7GM8wCBrSqSojIvu09gqC0RB
	PzMw2quz63fAi82mSo0ixa/RdCNL3UQ/6s0SBdTl3nOYULPneH5e7qupST
X-Gm-Gg: ASbGncuie8KZkbblvpcjHQM3Q26/dcFE/lOLlyidNb0kHysAHG+DYXsdacOStzKQFAL
	UPU8BncF6UE8ohxXPI13LOD0c4WLnTAmVT4JZY0JMeErV8k/fS9Ws7eeBBaq1/QwavRac9F9Q
X-Received: by 2002:a05:6808:23d0:b0:3fa:7909:2719 with SMTP id 5614622812f47-3febf74c308mr10195979b6e.19.1742909737168;
        Tue, 25 Mar 2025 06:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG+uwqksdhqc+U6GeLb0QCuQCixgYLcnD8bEk2R8UprbuPvn+1N9a0NF5Elvug2PTpZ30S9vMWikfZKkzJmos=
X-Received: by 2002:a05:6808:23d0:b0:3fa:7909:2719 with SMTP id
 5614622812f47-3febf74c308mr10195950b6e.19.1742909736731; Tue, 25 Mar 2025
 06:35:36 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Mar 2025 06:35:36 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Mar 2025 06:35:36 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com> <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
Mime-Version: 1.0
Date: Tue, 25 Mar 2025 06:35:36 -0700
X-Gm-Features: AQ5f1JrnR4gv-Y9IjY4QatijgkS1nbXpY-9W_yhvfwMRvgDU4HuRbOyvuw98aoo
Message-ID: <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin <linmin@eswincomputing.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen <cyy@cyyself.name>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Kanak Shilledar <kanakshilledar@gmail.com>, 
	Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_063544_118379_D5C56597 
X-CRM114-Status: GOOD (  17.48  )
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

Pinkesh Vaghela wrote:
> From: Min Lin <linmin@eswincomputing.com>
>
> Add initial support for EIC7700 SoC that uses a SiFive Quad-Core
> P550 CPU cluster.
>
> This file is expected to grow as more device drivers are added to the
> kernel.
>
> Signed-off-by: Min Lin <linmin@eswincomputing.com>
> Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Co-developed-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  MAINTAINERS                            |   1 +
>  arch/riscv/boot/dts/eswin/eic7700.dtsi | 344 +++++++++++++++++++++++++
>  2 files changed, 345 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc3c9191b00f..2c29023c6725 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8578,6 +8578,7 @@ M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
>  M:	Pritesh Patel <pritesh.patel@einfochips.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/riscv/eswin.yaml
> +F:	arch/riscv/boot/dts/eswin/
>
>  ET131X NETWORK DRIVER
>  M:	Mark Einon <mark.einon@gmail.com>
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> new file mode 100644
> index 000000000000..9cef940f07e4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2024 Beijing ESWIN Computing Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <1000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "sifive,p550", "riscv";
> +			device_type = "cpu";
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <32>;
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <32>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2_cache_0>;
> +			reg = <0x0>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> +					       "zba", "zbb", "zicsr", "zifencei";
> +			tlb-split;
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible = "sifive,p550", "riscv";
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <32>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <32>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2_cache_1>;
> +			reg = <0x1>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> +					       "zba", "zbb", "zicsr", "zifencei";
> +			tlb-split;
> +
> +			cpu1_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu2: cpu@2 {
> +			compatible = "sifive,p550", "riscv";
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <32>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <32>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2_cache_2>;
> +			reg = <0x2>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> +					       "zba", "zbb", "zicsr", "zifencei";
> +			tlb-split;
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu3: cpu@3 {
> +			compatible = "sifive,p550", "riscv";
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <32>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <128>;
> +			i-cache-size = <32768>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <32>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2_cache_3>;
> +			reg = <0x3>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> +					       "zba", "zbb", "zicsr", "zifencei";
> +			tlb-split;
> +
> +			cpu3_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		l2_cache_0: l2-cache0 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <512>;
> +			cache-size = <262144>;
> +			cache-unified;
> +			next-level-cache = <&ccache>;
> +		};
> +
> +		l2_cache_1: l2-cache1 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <512>;
> +			cache-size = <262144>;
> +			cache-unified;
> +			next-level-cache = <&ccache>;
> +		};
> +
> +		l2_cache_2: l2-cache2 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <512>;
> +			cache-size = <262144>;
> +			cache-unified;
> +			next-level-cache = <&ccache>;
> +		};
> +
> +		l2_cache_3: l2-cache3 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <512>;
> +			cache-size = <262144>;
> +			cache-unified;
> +			next-level-cache = <&ccache>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "riscv,pmu";
> +		riscv,event-to-mhpmcounters =
> +				<0x00001 0x00001 0x00000001>,
> +				<0x00002 0x00002 0x00000004>,
> +				<0x00004 0x00006 0x00000078>,
> +				<0x10009 0x10009 0x00000078>,
> +				<0x10019 0x10019 0x00000078>,
> +				<0x10021 0x10021 0x00000078>;
> +		riscv,event-to-mhpmevent =
> +				<0x00004 0x00000000 0x00000202>,
> +				<0x00005 0x00000000 0x00004000>,
> +				<0x00006 0x00000000 0x00002001>,
> +				<0x10009 0x00000000 0x00000102>,
> +				<0x10019 0x00000000 0x00001002>,
> +				<0x10021 0x00000000 0x00000802>;
> +		riscv,raw-event-to-mhpmcounters =
> +				<0x00000000 0x00000000 0xffffffff 0xfc0000ff 0x00000078>,
> +				<0x00000000 0x00000001 0xffffffff 0xfffe07ff 0x00000078>,
> +				<0x00000000 0x00000002 0xffffffff 0xfffe00ff 0x00000078>,
> +				<0x00000000 0x00000003 0xfffffffc 0x000000ff 0x00000078>,
> +				<0x00000000 0x00000004 0xffffffc0 0x000000ff 0x00000078>,
> +				<0x00000000 0x00000005 0xffffffff 0xfffffdff 0x00000078>,
> +				<0x00000000 0x00000006 0xfffffe00 0x110204ff 0x00000078>,
> +				<0x00000000 0x00000007 0xffffffff 0xf00000ff 0x00000078>,
> +				<0x00000000 0x00000008 0xfffffe04 0x000000ff 0x00000078>,
> +				<0x00000000 0x00000009 0xffffffff 0xffffc0ff 0x00000078>,
> +				<0x00000000 0x0000000a 0xffffffff 0xf00000ff 0x00000078>,
> +				<0x00000000 0x0000000b 0xffffffff 0xfffffcff 0x00000078>,
> +				<0x00000000 0x0000000c 0xfffffff0 0x000000ff 0x00000078>,
> +				<0x00000000 0x0000000d 0xffffffff 0x800000ff 0x00000078>,
> +				<0x00000000 0x0000000e 0xffffffff 0xf80000ff 0x00000078>,
> +				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		interrupt-parent = <&plic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;

Hi Pinkesh,

Thank your for the patches!

Should this not be marked dma-noncoherent to avoid having to mark each
peripheral as such?

> +
> +		clint: timer@2000000 {
> +			compatible = "eswin,eic7700-clint", "sifive,clint0";
> +			reg = <0x0 0x02000000 0x0 0x10000>;
> +			interrupts-extended =
> +				<&cpu0_intc 3>, <&cpu0_intc 7>,
> +				<&cpu1_intc 3>, <&cpu1_intc 7>,
> +				<&cpu2_intc 3>, <&cpu2_intc 7>,
> +				<&cpu3_intc 3>, <&cpu3_intc 7>;
> +		};
> +
> +		ccache: cache-controller@2010000 {
> +			compatible = "eswin,eic7700-l3-cache", "sifive,ccache0", "cache";
> +			reg = <0x0 0x2010000 0x0 0x4000>;
> +			interrupts = <1>, <3>, <4>, <2>;
> +			cache-block-size = <64>;
> +			cache-level = <3>;
> +			cache-sets = <4096>;
> +			cache-size = <4194304>;
> +			cache-unified;
> +		};
> +
> +		plic: interrupt-controller@c000000 {
> +			compatible = "eswin,eic7700-plic", "sifive,plic-1.0.0";
> +			reg = <0x0 0xc000000 0x0 0x4000000>;
> +			interrupt-controller;
> +			interrupts-extended =
> +				<&cpu0_intc 11>, <&cpu0_intc 9>,
> +				<&cpu1_intc 11>, <&cpu1_intc 9>,
> +				<&cpu2_intc 11>, <&cpu2_intc 9>,
> +				<&cpu3_intc 11>, <&cpu3_intc 9>;
> +			riscv,ndev = <520>;
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		uart0: serial@50900000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x50900000 0x0 0x10000>;
> +			interrupts = <100>;
> +			clock-frequency = <200000000>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@50910000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x50910000 0x0 0x10000>;
> +			interrupts = <101>;
> +			clock-frequency = <200000000>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@50920000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x50920000 0x0 0x10000>;
> +			interrupts = <102>;
> +			clock-frequency = <200000000>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@50930000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x50930000 0x0 0x10000>;
> +			interrupts = <103>;
> +			clock-frequency = <200000000>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@50940000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x50940000 0x0 0x10000>;
> +			interrupts = <104>;
> +			clock-frequency = <200000000>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			status = "disabled";
> +		};
> +
> +		gpio@51600000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x0 0x51600000 0x0 0x80>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porta: gpio-port@0 {

Maybe these labels could be something like gpioA, gpioB, etc. to not be
confused with an HDMI port fx.

> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts =
> +					<303>, <304>, <305>, <306>, <307>, <308>, <309>,
> +					<310>, <311>, <312>, <313>, <314>, <315>, <316>,
> +					<317>, <318>, <319>, <320>, <321>, <322>, <323>,
> +					<324>, <325>, <326>, <327>, <328>, <329>, <330>,
> +					<331>, <332>, <333>, <334>;
> +				gpio-controller;
> +				ngpios = <32>;
> +				#gpio-cells = <2>;
> +			};
> +
> +			portb: gpio-port@1 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <1>;
> +				gpio-controller;
> +				ngpios = <32>;
> +				#gpio-cells = <2>;
> +			};
> +
> +			portc: gpio-port@2 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <2>;
> +				gpio-controller;
> +				ngpios = <32>;
> +				#gpio-cells = <2>;
> +			};
> +
> +			portd: gpio-port@3 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				reg = <3>;
> +				gpio-controller;
> +				ngpios = <16>;
> +				#gpio-cells = <2>;
> +			};
> +		};
> +	};
> +};
> --
> 2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
