Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC9AD277D8
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJa9dFKnnw5kKo4WNahrK5y6xoFU/8xS73Jy6MUKw88=; b=l+onr4i42H6cDX
	fHB9Vw2B+0/R4mQLlKgv7T8xbZf+Xjrba7ss+9gpOZuBk3xcX15ImZ+WREvytLBF8vNvhPiZnTgSC
	fx545sfK/5oJV/9I0d2S1q7SZbbouCWJc0jrcfN529/OfQ0YiMFLxwcqgtsUbqXAFpn5bOQt660Re
	lBf9cSlkuhW1ujy7wBDUZKy+jcot6Fu7+qdfuKcjxsrgeTBnqTBjvPOIuJ9/4C+dy9eiQe9sCW4bh
	QVcjoIS2XSZFn8Knht5u+fCu+6JTux+F3452f5VQPPORNy7JWLFd7+FGwSPhNW3xOiD1p0hot4VlQ
	Aa4MKjDaOJ0aZ9CUvsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVlf-00000003Nia-45oH;
	Sat, 10 Jan 2026 10:00:23 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVle-00000003Ni8-1AWb
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 10:00:23 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2b05fe2bf14so7092589eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Jan 2026 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768039219; x=1768644019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0uei3FW57pxuQOaQrtXu7AmqZ3ReivJbfwZYctpgUc=;
        b=OPrG4ggTTPciRnJYkjgQlfpPDDXIilJzawRX9xzM4hx7dv9yFkljOno6DlxRbVhi8p
         4hsy6uGDqumgPoOm5nWVVib4DOvzhU9aG+w3cgBzy3rwKoR/RuW8J1RTaxPaSRWOS17C
         epVrDf07s+T+TMBjlm4KvBxChXqpeYXrRdhcS+qN6/sjBMo+t8no6fi/1B1vVFmXe3Hq
         QRoqsK5hYJqGd73sK9CYJ5IQwrSJt2j8RgimbRd0hI7bhWOlvOky0wwVhBYfHK07pM96
         L4gJ/Yn8xTBa/1oWL2q3K4iF7wwxv1Q36bkqZFkpJ9S+xqBqe0c9wBZ5HuXh/4uJL/ff
         Oarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768039219; x=1768644019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0uei3FW57pxuQOaQrtXu7AmqZ3ReivJbfwZYctpgUc=;
        b=dNW5aykdJL8TcuwuIRKkDEoT5uM/5g1p9fiQ3TAbAdE2t6oF3B+K52oHu4E66pJUc6
         kIcuuvzcdkGkYfWpJZSRxEYj4UdKvtR4W0/IxbFF0cZ/noVqCM40SXgladveSY1ZzxRc
         uK917YaqWlOvm5RjwWBCMr9MhgH/ojAKpAssjkc/0XoTxHyC1uAYo9cjFmKGJVdiiDzb
         AYT3H4YWyU+maah3bGeX0RiWBMg4v7jPTCGlNCIXi5qfrDpmU9Yu6Mo/hJm3p9mqiErV
         M407rfPz9ftj/C8Xwihicu0Q1Fxn7BMXzKATS6WMdzZxm2tgEEHa1d8/WqejedcuWB8j
         IYDw==
X-Forwarded-Encrypted: i=1; AJvYcCX0zED1t2wo13cYI4c0UAOpdmB5VQRgc/08rvhkwrPYsM23WQDcwxEKyPKGCDbAZbIUi+b8cjN+1pTCjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCbMtibNY2ltObPt4IQ0/go2Ov1wNPrmK3GJwN8zMxx6hbB9Gb
	Rb5gVJkjMGJEwCAflEUXTLT2Gi2Ps5xSf2y6mwUkfmxdOJfECPlW5P6o
X-Gm-Gg: AY/fxX6tzPfnBoOmVC/HoPEiTlXHlWxBUwLE/C16wjV45SunIRxl4401eP8xqzPrOyw
	u97umydFfkm5EhWM6nRmLUu34Tri+ccuQ+o90Awja8hRNfI5pc4yNm5W57fVxN6LJ01sI9c18p9
	3CCa9aM9SDvADucaQt6trOXiq2hcBnf+FGryD6DxTBB0Ap60SRUpOFwGMJTxA1VTCZKV1ZiPKoW
	0q6OBSg1sEjjGfICrBZRpUJ8hWcxtQXZ601Tzbf0bBuQ8pOfBiSZ0j+zrp8mcAWKOPJf1wv2SkR
	kv3A6IdCGCy0HhL4g0kZM9hV3yeIQx9o/IJ1ejYaNV4Km9YWG1rvzl80jr3oqGIdl6LK7AQRU5N
	mr/d1MLx9W8H8iqPnvpthR+J1zzzsI9mbXtc4u8LunocXoQEwTUiWz6gYumdzSxRN2xctmTGdat
	KadHaet2DoKaFvxaraQzW2
X-Google-Smtp-Source: AGHT+IHkeKwXJmX2hAKm71gZdj66a0g5GsX46UDnqnvKvqji/PdSQqaaXliGLbIBUh0iYzUGrxethg==
X-Received: by 2002:a05:7300:559b:b0:2b0:5c2f:6bf8 with SMTP id 5a478bee46e88-2b17d2baba5mr8163996eec.23.1768039218641;
        Sat, 10 Jan 2026 02:00:18 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a6386sm12668198eec.14.2026.01.10.02.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 02:00:18 -0800 (PST)
Date: Sat, 10 Jan 2026 18:00:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree
 of SpacemiT K3 SoC
Message-ID: <aWIi9LFdqSF3c-FP@inochi.infowork>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_020022_351583_DB8193A8 
X-CRM114-Status: GOOD (  18.64  )
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

On Sat, Jan 10, 2026 at 01:18:22PM +0800, Guodong Xu wrote:
> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> Add nodes of uarts, timer and interrupt-controllers.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v4: Fix missing blank space after commas in compatible string.
>     Add m-mode imsic and aplic node.
>     Reorder properties in simsic, saplic, mimsic, and maplic nodes
>      to match DTS coding style.
> v3: Remove "supm" from the riscv,isa-extensions list.
> v2: Remove aliases from k3.dtsi, they should be in board DTS.
>     Updated riscv,isa-extensions with new extensions from the extensions.yaml.
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 590 +++++++++++++++++++++++++++++++++++
>  1 file changed, 590 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> new file mode 100644
> index 000000000000..a815f85cf5a6
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -0,0 +1,590 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
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

I think this should be riscv,sv48? IIRC K3 supports it.

Regards,
Inochi

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
> +			status = "disabled";
> +		};
> +
> +		maplic: interrupt-controller@f1800000 {
> +			compatible = "spacemit,k3-aplic", "riscv,aplic";
> +			reg = <0x0 0xf1800000 0x0 0x4000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			msi-parent = <&mimsic>;
> +			riscv,children = <&saplic>;
> +			riscv,delegate = <&saplic 1 512>;
> +			riscv,num-sources = <512>;
> +
> +			status = "disabled";
> +		};
> +	};
> +};
> 
> -- 
> 2.43.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
