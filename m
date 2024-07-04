Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C89C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HdFNsVzQfO3e2Rpg/dFgkhYJUQ7m+Xk91whoyReUfU=; b=M5Xw0o/UW7/s6j
	2eVcYR69ugnsltVibJzppNtx59bk2yAKQ4vFMz0jOlC4DIeQWjcOlF9WUA3MVfiyiXCnYuosLRP2m
	zEx7fp70tKkUWMxY8FiE1P+B8Oucycu+1CINExzTto92036KluvSdDvi4Q3kxeV1q8lFk0QvjYPuu
	/5Hx7Jm0oa7a8bnHnN98oVwYg75yootBOAuGohJSk4UBe+PEOl5QXZgf5eaH7M/GUJ5rQOShqTT/V
	VkBDE4UNfyK/jAxWGML+f8OXNHn0bqX1acls+N+k5WESWy6eF/3XOOJcycKrI+WOWtmcm1mRQJVAU
	hxTyMddZn1HLZ6ctGLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPB6O-0000000Bqcu-10BX;
	Thu, 04 Jul 2024 01:17:36 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPB6L-0000000BqcS-1etA
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 01:17:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so39423a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 18:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720055852; x=1720660652; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GchNVzqdAV7cGwozEZB1uJZyrUjxQFj7IMhO/rcOGNo=;
        b=KuVRitn7RTwmz3TV7N1S3PnVc5Mwg0XRz41upuaA8NQy8qDDzOjEym5klE+2HyOESh
         qXpBdOXgpH+Y1/NGxTXjOqjh7DVsKJyWtxiYVLRoOZAAzvkcqbaR1G8KklI27yYuDfyh
         Yy+AFcTSK86BqNJK0U+0ToVXTsBof/kOMOYu0UbW8Ep6Jt5SZE05s2+e3ast2HBbX/lt
         tY+M5iJ6NQez9DbBUNyoO44lqqYwzCNte2gHvSotvsiSPi/6EaT5SclnaAMdlexW64OR
         Wu+mTQkcrRmHwE/t+jDmMoZGcy1E0fvXIchYMNI0y62hsuAov6ykoYMjurNSP5uE9fBZ
         J5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720055852; x=1720660652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GchNVzqdAV7cGwozEZB1uJZyrUjxQFj7IMhO/rcOGNo=;
        b=A2ukU1ugwql/+i3ny4hJ/tlEWCTb3tPzmEyBGTZ7b4K8l6iaDItYA3dI6I32avX8Lk
         yvJQCGeEghb2iyfCKom6PJf9d2yOxpsUUotbX1S/oEe6DdovyKeSvxxrluyfdlukuK+h
         3/N9oDA+np9qHyP2sXRHepDaLTnBU5NJiqH8/NEU2ftpyGP+yViTcBVuTwfvU9Ai04cp
         /TuqS0C9tDQDa1zf/HTpqW0MC3xDxOtHOuIsrHAJEbDlw774jXnQ8beIsK9fOywvlH+o
         vsS54dH4Xjhl/kDWsbIGBcu3DR8DAY2FyVqWhfXTPws9nnqVYxrDOdS/VzuFrBWnYdE2
         vWRA==
X-Forwarded-Encrypted: i=1; AJvYcCWthaiDCzerLNrtu6vJFBYL+y/6HGCTSIifhB5xOVwW0kF7GL7vgZB3k3QFIOe3sWssM5Tqvgz2LqJT02Juo2u3HVEQkm9vOUR8jcyoUrf6
X-Gm-Message-State: AOJu0YxNmzEGTf2updrRuPqk2NMkZJ9gco7SGlnNoHtZNGurI2deJNZE
	ZIUVtt+LsIOXIjQ5v/I/fCQFviMyTYLrq6YOo51yGk0UTo9rA0FRmep0H4sNXa0=
X-Google-Smtp-Source: AGHT+IHflovwLox+gYizsFOo0FroOFPwG2pwz/xDQSoy/LpWJ0Zxv9lGfHmEtY3ULUx+cEJpcQZ4FQ==
X-Received: by 2002:a05:6a20:6a22:b0:1c0:bd6c:aabe with SMTP id adf61e73a8af0-1c0cc742239mr132519637.14.1720055851937;
        Wed, 03 Jul 2024 18:17:31 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a992c43sm180077a91.30.2024.07.03.18.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 18:17:31 -0700 (PDT)
Message-ID: <dd619ad4-86f4-4ddd-be16-fbbaa197d551@rivosinc.com>
Date: Wed, 3 Jul 2024 21:17:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] riscv: dts: add initial SpacemiT K1 SoC device
 tree
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>,
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
 Meng Zhang <zhangmeng.kevin@spacemit.com>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-8-12f73b47461e@gentoo.org>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240703-k1-01-basic-dt-v3-8-12f73b47461e@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_181733_486795_732F816F 
X-CRM114-Status: GOOD (  23.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/3/24 10:55, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
> 
> Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> 
> Key features:
> - 4 cores per cluster, 2 clusters on chip
> - UART IP is Intel XScale UART
> 
> Some key considerations:
> - ISA string is inferred from vendor documentation[2]
> - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
> - No coherent DMA on this board
>      Inferred by taking vendor ethernet and MMC drivers to the mainline
>      kernel. Without dma-noncoherent in soc node, the driver fails.
> - No cache nodes now
>      The parameters from vendor dts are likely to be wrong. It has 512
>      sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
>      When the size of the cache line is 64B, it is a directly mapped
>      cache rather than a set-associative cache, the latter is commonly
>      used. Thus, I didn't use the parameters from vendor dts.
> 
> Currently only support booting into console with only uart, other
> features will be added soon later.
> 
> Link: https://docs.banana-pi.org/en/BPI-F3/SpacemiT_K1_datasheet [1]
> Link: https://developer.spacemit.com/#/documentation?token=BWbGwbx7liGW21kq9lucSA6Vnpb [2]
> Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi [3]
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 376 +++++++++++++++++++++++++++++++++++
>   1 file changed, 376 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> new file mode 100644
> index 0000000000000..a076e35855a2e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> + */
> +
> +/dts-v1/;
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	model = "SpacemiT K1";
> +	compatible = "spacemit,k1";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart2;
> +		serial2 = &uart3;
> +		serial3 = &uart4;
> +		serial4 = &uart5;
> +		serial5 = &uart6;
> +		serial6 = &uart7;
> +		serial7 = &uart8;
> +		serial8 = &uart9;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <24000000>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu_0>;
> +				};
> +				core1 {
> +					cpu = <&cpu_1>;
> +				};
> +				core2 {
> +					cpu = <&cpu_2>;
> +				};
> +				core3 {
> +					cpu = <&cpu_3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu_4>;
> +				};
> +				core1 {
> +					cpu = <&cpu_5>;
> +				};
> +				core2 {
> +					cpu = <&cpu_6>;
> +				};
> +				core3 {
> +					cpu = <&cpu_7>;
> +				};
> +			};
> +		};
> +
> +		cpu_0: cpu@0 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;

Is there a reson not to add the I and D cache sizes.

			i-cache-block-size = <64>;
			i-cache-size = <32768>;
			i-cache-sets = <512>;
			d-cache-block-size = <64>;
			d-cache-size = <32768>;
			d-cache-sets = <512>;
			next-level-cache = <&cluster0_l2_cache>;
......

		cluster0_l2_cache: l2-cache0 {
			compatible = "cache";
			cache-block-size = <64>;
			cache-level = <2>;
			cache-size = <524288>;
			cache-sets = <1024>;
			cache-unified;
		};

> +			mmu-type = "riscv,sv39";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_1: cpu@1 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <1>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu1_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_2: cpu@2 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <2>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_3: cpu@3 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <3>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu3_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_4: cpu@4 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <4>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu4_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_5: cpu@5 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <5>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu5_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_6: cpu@6 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <6>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu6_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu_7: cpu@7 {
> +			compatible = "spacemit,x60", "riscv";
> +			device_type = "cpu";
> +			reg = <7>;
> +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu7_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&plic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		dma-noncoherent;
> +		ranges;
> +
> +		uart0: serial@d4017000 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017000 0x0 0x100>;
> +			interrupts = <42>;

			interrupt-parent = <&plic>;

Thanks,
Jesse Taube

> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@d4017100 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017100 0x0 0x100>;
> +			interrupts = <44>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@d4017200 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017200 0x0 0x100>;
> +			interrupts = <45>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@d4017300 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017300 0x0 0x100>;
> +			interrupts = <46>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@d4017400 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017400 0x0 0x100>;
> +			interrupts = <47>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@d4017500 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017500 0x0 0x100>;
> +			interrupts = <48>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart7: serial@d4017600 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017600 0x0 0x100>;
> +			interrupts = <49>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart8: serial@d4017700 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017700 0x0 0x100>;
> +			interrupts = <50>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart9: serial@d4017800 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017800 0x0 0x100>;
> +			interrupts = <51>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		plic: interrupt-controller@e0000000 {
> +			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
> +			reg = <0x0 0xe0000000 0x0 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
> +					      <&cpu3_intc 11>, <&cpu3_intc 9>,
> +					      <&cpu4_intc 11>, <&cpu4_intc 9>,
> +					      <&cpu5_intc 11>, <&cpu5_intc 9>,
> +					      <&cpu6_intc 11>, <&cpu6_intc 9>,
> +					      <&cpu7_intc 11>, <&cpu7_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +			riscv,ndev = <159>;
> +		};
> +
> +		clint: timer@e4000000 {
> +			compatible = "spacemit,k1-clint", "sifive,clint0";
> +			reg = <0x0 0xe4000000 0x0 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> +		};
> +	};
> +};
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
