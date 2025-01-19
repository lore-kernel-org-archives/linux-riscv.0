Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8722C02187
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jan 2025 22:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuMo16yzqTZMip9kgpMJ8xgTfMUT6yiKFBqv39kJ7f4=; b=hrCPqjWRB/fsRU
	8BB7Ri2kHfMKvxYl7qTQ2eSYg8XfKpYeNFuEhSxin0t4UBoW30HXQaZpJBFRojlsONPWc0upynvdo
	KjKjuGR5xAt5gWNJTU3l1mw3n79M5m73H6GYfb0syRNF77Y03gMPTHu0URz+Wk7Al4XUEafbIJeqS
	IhwRrtJFtUqICneMQ9Z3U/tL1Ug0Eese+PfCa2BhSe0K+YOu9vcLV0tFrwnk6iEBBoYSlBf48nVEc
	OKHJ0T7TN6oCB/IUM/5gR0D/aY580l6+2WxBE9lHTtCpUlLRlFhSiWhiC6U/JzP06qpsN3ev7ybq4
	wFrvTzkjG+s1JJVPyw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZdlu-00000004OLB-1Rer;
	Sun, 19 Jan 2025 22:27:58 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZdlr-00000004OKn-2fbk;
	Sun, 19 Jan 2025 22:27:56 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7b6f19a6c04so340560685a.0;
        Sun, 19 Jan 2025 14:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737325674; x=1737930474; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1NEaOvJP6ktRyon1qt65VnsfcXxR9/jvk2LgosJ8u8=;
        b=LdeXpAaPUA8i6SPyy/3fSQSdovSzybU/nfSaXUWbqFlyVq+D5h3fA/0stdUOW1xaFR
         sWyV/OII6RqQJbAwCeTkT1wwIpakvDJtRS+oIrakJprv/m4ZXYXfTX+PSCOEcQHNu27V
         cD2Kmjz+6ix3xEzn3ha64SDgIa+U6XRDg05hStv1zloxkKm5iXUDDqn6kLREd8AFhoBI
         NV1jHndeCoxk7fjJ7yKwWFiokF6N3LIV2RvBLGCjR4cBYPjhyxTUN13a8fn7xlz7UMaj
         X13w1kBDutvGY16pmN7mBkbReujqPFkaCdTt/+VFq1oC9INcJdZeAJpE70sTGpHeLU9e
         zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737325674; x=1737930474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1NEaOvJP6ktRyon1qt65VnsfcXxR9/jvk2LgosJ8u8=;
        b=lIm13+7Oy8ekyVcCJmPSpY7LQ5jilLsAptTVlszs3c5WhThg6D0vGcUdt8RkFdyZhw
         1+kkC+4Z1DpWDF7toqG8Hb40avrSgo3I4uSm/uZp8d+177Z0bvLtUy8i7Wp0SKfRlJTB
         dXWjR9j9VdEcIObMX6ubiWU8V9oSGfRGVFQhPbiY63nAST+RIh3rhhQMWWWmL113D2T5
         7Z7hG2ZQ/WTudidVtK8WJHkS+VXe3WAPkvncYnAK5Zsm52Nyw23pEw5MlbiK4qAPMQb/
         wCfGX0PWXwfCVbp2HpGoQ052fcUcmKQzqo5lAQwKp+/DdcTAkh9GTVY8rDhK7uYV2EGZ
         lBxg==
X-Forwarded-Encrypted: i=1; AJvYcCVeMfegqRhXKNxiGhr9Q+jZbxf8ihj1vSSmTCZGOs8VavP7DHjN3gFGQAl/HiVU7B6yV4bWadF6Rvg8U9Y=@lists.infradead.org, AJvYcCXutUcSEBP2W86Ho4YAEvjPk5sOfNv73cIxz0Sv7dzv/iUQkjjUGjIHvhcO88je1BmKrCWO0zKNnh9pLHd5VDNs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtc0ShJzXVeLv4dedTdXFJmp3oD959FUQcB7eGSK6q0T1MziKr
	X7ffPWGYUUIDbHLoGn3be5kD74+xK19SOAh7GsnIIw9kpL3DOzmB
X-Gm-Gg: ASbGncuNP9mKvXx+ekbcSoxg38+zaxMVnVlnFufgwqSipglfO9yxYeNhFzQg2n177rr
	Jp9sxX+4da2w6wdu+xadRXOfr4gdlJ3P5QkxWLLPpPc2zP7gWP/UqreGIsEf2+wqbbX9AZoFnfD
	FjxS53WBHPWmVrAvlEJWR8BrGI2h3gjCbJGKCwRnX0W01+PpNNeKgKmXB9/webjZmKGntAbulqT
	ftv/1Qnxx4FBCchUmkrP9CHprPlVBpFopROPbNqrEf/OQ==
X-Google-Smtp-Source: AGHT+IEvXRhN3YOjdvwsWeaMRKtp+AaGrFt8Vm/FPxPy/a3iJh+S2H70++OJxxsiqffQ3B4rmvMnqw==
X-Received: by 2002:a05:620a:44d5:b0:7b6:d1f6:3dc with SMTP id af79cd13be357-7be6321bf8cmr1874388785a.18.1737325673880;
        Sun, 19 Jan 2025 14:27:53 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7be61487360sm369189485a.57.2025.01.19.14.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:27:53 -0800 (PST)
Date: Mon, 20 Jan 2025 06:27:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <3iz53irwp7u3cvxf53j3ibcqbyojodnbxq7kgr4v6rvj3rx7ng@v3lolzcxh5ev>
References: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_142755_718945_EA7ED252 
X-CRM114-Status: GOOD (  31.63  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jan 12, 2025 at 01:55:05AM +0100, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> =

> ---
> Dear ARM, RISCV, DT maintainers, I'd like to ask your opinion on the
> below patch, which I plan as a base for ARM64 BSP for dual-arch (RISCV or
> ARM64) Cvitek SoC SG2000. The main motivation for ARM64 support is the
> ARCH support in the upstream gcc, which is not that mature for RISCV.
> =

> I believe it's the first time we already have quite some base in the
> tree for a SoC, so it would be advantageous to re-use it and not
> duplicate the same SoC structures in two places, especially having
> in mind that Cvitek/Sophgo are still working on upstreaming and by
> far not all HW blocks are populated in the SoC DTs. They focus primarely
> on RISCV, so ARM64 would be dragging behind in this case if it would be
> forked.
> =

> On the other hand, including SoC dtsi from RISCV into ARM64 poses
> some technical challenges by itself, obviously CPU cores have to be
> deleted, same is true for interrupt controller. And the interrupt
> numbers are of course difference for ARM GIC, so they have to be
> overwritten.
> =

> Alternatively I can split existing .dtsi included below into their
> RISCV-specific and generic parts, so that both ARM64 and RISCV would
> include generic part and their corresponding ARCH-specific parts
> bringing CPU cores + interrupt controller + IRQ numbers for each and
> every device separately.
> =

> The below example isactually booting (being included into board-level
> DT), so it's a real example I'd be ready to submit if there will be
> no objections of the cross-ARCH include approach in general.
> =

> What are your thoughts?
> =

> =A0arch/arm64/boot/dts/sophgo/sg2000.dtsi | 164 +++++++++++++++++++++++++
> =A01 file changed, 164 insertions(+)
> =A0create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> =

> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts=
/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..96afd342bde5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "../../../../riscv/boot/dts/sophgo/cv18xx.dtsi"
> +#include "../../../../riscv/boot/dts/sophgo/cv181x.dtsi"
> +

> +/delete-node/ &cpu0;
> +/delete-node/ &plic;
> +/delete-node/ &clint;

You can split the riscv specific device into a separate file
so you not need to set delete-node.

> +
> +/ {
> +	compatible =3D "sophgo,sg2000";
> +	interrupt-parent =3D <&gic>;
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x20000000>;	/* 512MiB */
> +	};
> +
> +	pmu {
> +		compatible =3D "arm,cortex-a53-pmu";
> +		interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +			=A0=A0=A0=A0 <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LO=
W)>,
> +			=A0=A0=A0=A0 <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW=
)>,
> +			=A0=A0=A0=A0 <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW=
)>,
> +			=A0=A0=A0=A0 <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW=
)>;
> +		always-on;
> +		clock-frequency =3D <25000000>;
> +	};
> +
> +	gic: interrupt-controller@1f01000 {
> +		compatible =3D "arm,cortex-a15-gic";
> +		interrupt-controller;
> +		#interrupt-cells =3D <3>;
> +		reg =3D <0x01f01000 0x1000>,
> +		=A0=A0=A0=A0=A0 <0x01f02000 0x2000>;
> +	};
> +
> +	soc {
> +		/delete-property/ interrupt-parent;
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible =3D "sophgo,sg2000-pinctrl";
> +			reg =3D <0x03001000 0x1000>,
> +			=A0=A0=A0=A0=A0 <0x05027000 0x1000>;
> +			reg-names =3D "sys", "rtc";
> +		};
> +	};
> +};
> +
> +&cpus {
> +	cpu0: cpu@0 {
> +		compatible =3D "arm,cortex-a53";
> +		device_type =3D "cpu";
> +		reg =3D <0>;
> +		enable-method =3D "psci";
> +		next-level-cache =3D <&l2>;
> +	};
> +
> +	l2: l2-cache {
> +		compatible =3D "cache";
> +	};
> +};
> +
> +&clk {
> +	compatible =3D "sophgo,sg2000-clk";
> +};
> +
> +&saradc {
> +	interrupts =3D <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
> +};
> +
> +&dmac {
> +	interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi0 {
> +	interrupts =3D <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi1 {
> +	interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi2 {
> +	interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&spi3 {
> +	interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart0 {
> +	interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart1 {
> +	interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart2 {
> +	interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart3 {
> +	interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&uart4 {
> +	interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&porta {
> +	interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&portb {
> +	interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&portc {
> +	interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&portd {
> +	interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c0 {
> +	interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c1 {
> +	interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c2 {
> +	interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c3 {
> +	interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c4 {
> +	interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&emmc {
> +	interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&sdhci0 {
> +	interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&sdhci1 {
> +	interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +};
> =

> -- =

> Alexander Sverdlin.
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
