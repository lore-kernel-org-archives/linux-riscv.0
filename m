Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478E5CA5FE8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 23:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+tgXHgJNg9n8ihXZuovC2pWs9UAS4iEMK1Bko1B+r0=; b=y4gTk/cp2FFPje
	6xhFEqMNrtsACWY5KlP0i4Nfb6bHRlNWcU9eEqbejImmBZR8mUn4Sy2ZKTW960hDlenZRhGHIldkj
	kr1NAyu2StJ/ZFJH05r8y0siS7RTQaxj+OcOaKDhmzZgJCXGPWeCwzQmDJEsQhgmh6H7Git50zOrL
	SEy8Yb7Zvyb2duFyOpEGy2Vq8rcuN+d8w1cfiEAdUzM2Q6CV/Z6hBKf4Wn/0CrtmEnGxmtSP4OuwY
	sK89y9M3Aa0JQxXY05LeNV3xx9k6M3WeVMFgUpa+VqXblVSWgW2Ho2pvEyKf2M1DYegZj5iF9QQ73
	gCdUdp4FYiHi79mNyuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhFvr-0000000GEJW-29CL;
	Sat, 17 Jan 2026 23:42:15 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhFvn-0000000GEI4-1qWX
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 23:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768693280; x=1769298080; i=xypron.glpk@gmx.de;
	bh=eXOXInv4qdJmse3yxXLP+HxmiAl+2bXbDCwPkw39ido=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BPmcWVzBYTV86NUaooI9ljtECHsvguohCMw4nnWvEaTN9Ihi8H727G2QRUZnn2Ce
	 AdYLCAnQt7F8Ug/sfXvmJ+OIIk5xsVvNXtEX95bzTm3ebdEb6M14edTUMa0mhk6V4
	 KhEDYk+V+0fcv4U6xMjdhrv62a3q2/vDcTDDSUafkRk+dS3NFuVu8zmJGvBTbfhgA
	 dZZZc4m1paSV/M+hvdHgiFuSAHmijsVk5VRpsytP+Fx6MQVhhbuttZ/kqAFHf9kA+
	 HUyLNqWxov7t6MsmgnyTkpGwTZYClUIDtG4X4MUdB2OZv7CjiY1s9ye+N5IXGQgfK
	 tFzW1EMfZHwlRM4erQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.154] ([5.147.80.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1wCkyo17Ao-00j7py; Sun, 18
 Jan 2026 00:41:20 +0100
Message-ID: <c0395221-4248-4eb7-949e-ac86c40ec99b@gmx.de>
Date: Sun, 18 Jan 2026 00:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] riscv: dts: spacemit: add initial support for K3
 SoC
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
 <20260115-k3-basic-dt-v5-6-6990ac9f4308@riscstar.com>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20260115-k3-basic-dt-v5-6-6990ac9f4308@riscstar.com>
X-Provags-ID: V03:K1:SwF8Fi4ChUhyYUmyHsVwHJy+HVtfcK6DjL9Y6TFAu1O5TlaLLJU
 N79bmxXMN/AQ+eXEa9+5JUJ1T3I+gywNCPWIpk8ZASBQlawEA2jfUMF/M32xG9nWKW+DqDf
 FR25EM4YEilUMSc5zjbYOy3eqGmiPYdzxp3vpPT1TxupBc/wkTDHhtXepCs8myaGwYJLS3e
 /SJpEJZRTxpHLVu4bPOyA==
UI-OutboundReport: notjunk:1;M01:P0:6bwkcpZBU2I=;UBUp59P1x1n0hXUKV6x5Ro0xV9W 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 03p4QiH5m0QF5i6RhhvL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_154212_012428_26190DCD 
X-CRM114-Status: GOOD (  15.27  )
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

On 1/15/26 07:51, Guodong Xu wrote:
> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> Add nodes of uarts, timer and interrupt-controllers. Also add M-mode
> APLIC (maplic) and IMSIC (mimsic) nodes to represent the hardware
> topology and ready for potential firmware usage.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v5: Update the copyright year to 2026.
>      Set M-mode maplic and mimsic status to "reserved".
>      Update the commit message per Yixun's suggestion.
>      In maplic node, use riscv,delegation to match kernel binding. OpenSBI
>       accepts both delegate and delegation, but the binding documents only
>       riscv,delegation.
> v4: Fix missing blank space after commas in compatible string.
>      Add m-mode imsic and aplic node.
>      Reorder properties in simsic, saplic, mimsic, and maplic nodes
>       to match DTS coding style.
> v3: Remove "supm" from the riscv,isa-extensions list.
> v2: Remove aliases from k3.dtsi, they should be in board DTS.
>      Updated riscv,isa-extensions with new extensions from the extensions.yaml.
> ---
>   arch/riscv/boot/dts/spacemit/k3.dtsi | 590 +++++++++++++++++++++++++++++++++++
>   1 file changed, 590 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> new file mode 100644
> index 000000000000..53425badfea9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -0,0 +1,590 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/dts-v1/;
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	model = "SpacemiT K3";
> +	compatible = "spacemit,k3";
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <24000000>;
> +
> +		cpu_0: cpu@0 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_1: cpu@1 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <1>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu1_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_2: cpu@2 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <2>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_3: cpu@3 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <3>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache0>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu3_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_4: cpu@4 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <4>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu4_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_5: cpu@5 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <5>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";

Should zvl256b be added to the X100 description to indicate the vector 
length?

Best regards

Heinrich


> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu5_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_6: cpu@6 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <6>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu6_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		cpu_7: cpu@7 {
> +			compatible = "spacemit,x100", "riscv";
> +			device_type = "cpu";
> +			reg = <7>;
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
> +					       "sha", "shcounterenw", "shgatpa", "shtvala",
> +					       "shvsatpa", "shvstvala", "shvstvecd", "smaia",
> +					       "smstateen", "ssaia", "ssccptr", "sscofpmf",
> +					       "sscounterenw", "ssnpm", "ssstateen", "sstc",
> +					       "sstvala", "sstvecd", "ssu64xl", "svade",
> +					       "svinval", "svnapot", "svpbmt", "za64rs",
> +					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
> +					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
> +					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
> +					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
> +					       "zicond", "zicsr", "zifencei", "zihintntl",
> +					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
> +					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
> +					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
> +					       "zvkned", "zvkng", "zvknha", "zvknhb", "zvks",
> +					       "zvksc", "zvksed", "zvksg", "zvksh", "zvkt";
> +			riscv,cbom-block-size = <64>;
> +			riscv,cbop-block-size = <64>;
> +			riscv,cboz-block-size = <64>;
> +			i-cache-block-size = <64>;
> +			i-cache-size = <65536>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <65536>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_cache1>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu7_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		l2_cache0: cache-controller-0 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-size = <4194304>;
> +			cache-sets = <4096>;
> +			cache-unified;
> +		};
> +
> +		l2_cache1: cache-controller-1 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-size = <4194304>;
> +			cache-sets = <4096>;
> +			cache-unified;
> +		};
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
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&saplic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		dma-noncoherent;
> +		ranges;
> +
> +		uart0: serial@d4017000 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017000 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@d4017100 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017100 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@d4017200 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017200 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@d4017300 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017300 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@d4017400 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017400 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@d4017500 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017500 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart7: serial@d4017600 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017600 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart8: serial@d4017700 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017700 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart9: serial@d4017800 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd4017800 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		uart10: serial@d401f000 {
> +			compatible = "spacemit,k3-uart", "intel,xscale-uart";
> +			reg = <0x0 0xd401f000 0x0 0x100>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clock-frequency = <14700000>;
> +			interrupts = <281 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status = "disabled";
> +		};
> +
> +		simsic: interrupt-controller@e0400000 {
> +			compatible = "spacemit,k3-imsics", "riscv,imsics";
> +			reg = <0x0 0xe0400000 0x0 0x200000>;
> +			#interrupt-cells = <0>;
> +			#msi-cells = <0>;
> +			interrupt-controller;
> +			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 9>, <&cpu3_intc 9>,
> +					      <&cpu4_intc 9>, <&cpu5_intc 9>,
> +					      <&cpu6_intc 9>, <&cpu7_intc 9>;
> +			msi-controller;
> +			riscv,guest-index-bits = <6>;
> +			riscv,hart-index-bits = <4>;
> +			riscv,num-guest-ids = <511>;
> +			riscv,num-ids = <511>;
> +		};
> +
> +		saplic: interrupt-controller@e0804000 {
> +			compatible = "spacemit,k3-aplic", "riscv,aplic";
> +			reg = <0x0 0xe0804000 0x0 0x4000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			msi-parent = <&simsic>;
> +			riscv,num-sources = <512>;
> +		};
> +
> +		clint: timer@e081c000 {
> +			compatible = "spacemit,k3-clint", "sifive,clint0";
> +			reg = <0x0 0xe081c000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> +		};
> +
> +		mimsic: interrupt-controller@f1000000 {
> +			compatible = "spacemit,k3-imsics", "riscv,imsics";
> +			reg = <0x0 0xf1000000 0x0 0x10000>;
> +			#interrupt-cells = <0>;
> +			#msi-cells = <0>;
> +			interrupt-controller;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
> +					      <&cpu2_intc 11>, <&cpu3_intc 11>,
> +					      <&cpu4_intc 11>, <&cpu5_intc 11>,
> +					      <&cpu6_intc 11>, <&cpu7_intc 11>;
> +			msi-controller;
> +			riscv,guest-index-bits = <6>;
> +			riscv,hart-index-bits = <4>;
> +			riscv,num-guest-ids = <511>;
> +			riscv,num-ids = <511>;
> +
> +			status = "reserved";
> +		};
> +
> +		maplic: interrupt-controller@f1800000 {
> +			compatible = "spacemit,k3-aplic", "riscv,aplic";
> +			reg = <0x0 0xf1800000 0x0 0x4000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			msi-parent = <&mimsic>;
> +			riscv,children = <&saplic>;
> +			riscv,delegation = <&saplic 1 512>;
> +			riscv,num-sources = <512>;
> +
> +			status = "reserved";
> +		};
> +	};
> +};
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
