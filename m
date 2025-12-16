Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F1D5E370
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feWPZP1DopbRQxM0Poowi8Xe/Zz9fWCNGisAVognoxs=; b=I/iEQ3hjlLutcF
	utwXQJjxmEzj80ktxrwJfjWK4IVaYHYlPotNisE48b2SJNbn6cVgge4hUg37R/UbmbpfRxCuZ+vIR
	oxYZvHemE3Sl9Q1aLYBmWgnt/n6HM1b2Hhmk1tMMzCjQgzxB3FDENWufCudrzWOle8FnS6EzcclIG
	q16Fb7SZYb6ciqpLCcRE2wgvVfscs+J5Velr+HdFun4H3bzb/NNNItlkrDXlWKi2CVyLzMivgovJc
	vFmzeaau3KFCB7g6qQMjkUW3uGOmt9w826Inub3sTtaz2ax9xatnGq1Kzw7+4y3XtK7Ux8jIC6OFT
	8eJCXF7Rj4BZDiR4J4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW7R-00000005LZE-1HOf;
	Tue, 16 Dec 2025 14:33:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVW7N-00000005LYf-0W5x
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 14:33:40 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 905583F5B6
	for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765895613;
	bh=9ouNQ2G+BbmqznnUeDUFFC3dk1Z2drfKLGm7ohEM5u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kgTTFIhuR/Znn8WpH4EU4siI1iD0tDHemwOpGuc/yC96Al+9ZN6yN1ejIkdThN4rZ
	 1Tpc0ousCioQvjjaqCijxSg+XYITKJBSmz7lj86iyJPtx8wSMwPo1o9G36qRBA5XvJ
	 KhtUC7ZeYtpjXvkpl6SpnyVEHOaaedsxA/qBLJB5PWvauGmvt3W7jY1XBgbSVnjy1V
	 x2FGrFOA+ZkGzNdWp/EIbGFCQg+zkWAVWBEzNNl2e/e7cg79NIQIY96o5bIilpGMbS
	 DCyf7PquGh7syzWkib6rG4aFuNjL/GCgtS87Ii5KtJo44mjZHUgNONhZNimUyWZ/NY
	 pnPOKklJ4iJNKDQW5dofABENaO2xyHTVIoSqKXcCTikFzx7HiOzlh+MvBdPNWFP7rb
	 1bB2uOOLr3PxDT4G+3fs7GfoCsg5NdHPNCxlhMtmNF46hcLE4+tLhLkceHzohDIwuA
	 cyS0yIoUWm2gcF81uDZhCpkS9m9WaAIv0DWyY+vwXJL0sobYgoDpzQ80F5GQLUooG0
	 pGy+EBZiRINK59g0hUYyywYlggG7/nVYx80YxyF0/Mky9mHaVSgSGdlgqzW0kii66p
	 /wJBcNIs9HHF3VV6yxBMwQcrcBOLMwWMm3mAmXfgERxNz9Q0z5jIv7GX6BqWMGGEus
	 4359VUcgIux3OvNXqoZ8jSeM=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b73720562ceso446350766b.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 06:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895613; x=1766500413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ouNQ2G+BbmqznnUeDUFFC3dk1Z2drfKLGm7ohEM5u0=;
        b=eKTVolN41MzEgWxN8wLIKM4sCx9w4GHwRVdNDIw4BZdOAChy/JhF/x5MgNvVH0hXwj
         atUWhYqw1eZ44OlQ/o1NYUfub+ssevGRywQHmdLXczEyWdkDh6bd6+sKdjLcxDsLb5q7
         t29P5WG2wrQATNFLg/PQMTneynta9PT1fB61p2jmdzBTAfNyHzvZ4Sp2mYnyMu4+/MAw
         5kWDKyZF43wy/EXQ8E1eOMu2zxDkM5uqlkMU7ipuSeZWDz8ir9U/v8EMXelIeWHqVFEj
         zUvDIU8o153gHjpLc2fcFyPAFW8gs8V4wsyV44afp4O+F9hYerIarMT5Pui2munVhIP4
         R/6A==
X-Forwarded-Encrypted: i=1; AJvYcCXuei+OZkto+AIhmQFpb9mm4dJZ2SNql/onwv/RJZmxegX1fnxgMPSb1SZ7XvoBe3OTLpEugINyAtGBIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhRNdPH4b6r7fo1N4EPHQBTIAIyq//F8dkfwPE9oGZN4pjSdYO
	SoDNZeoGDQus+8HrfM+QOGT8cTACAD85orrFTEVC/CggVWFgXeSfelmgw2nfKGHsjgZJLTN40R5
	cXu857EiDzsmGNuaw272hdcMEFo5xdXSumtICCdkA09sR1kVw7DOe/5StcdYooEr8NOsktm49ul
	lAc8J1URsPTg==
X-Gm-Gg: AY/fxX62JpzPUxaPF+wiCylHo3QDYS4Rd3RdrZY+TjtzijtOl8Wod9sC3Yz4tXItQ64
	9xRQE46UcQKNioSj4I/9+Lz/aTeF4jr7MEcimsC63hkw6Z6Mv1NYC6yRx8lDnmQJHnEm6S4j56F
	24OSC8MbIdkfM74HiRW+4GoU9ck8q5Xif/FdIzwQLySQl2aZ/g10SIoqpUB3dONgB9Mn+73mNPr
	03jw6eOTClxWyrTZGhe3TtbNvc5FrfzsIdU19IjTDIj7g4gwJ7LWba2RFT0Ka+AAHyjI2pvlRCx
	xl46rLHBfWdeXcNLaHSpc2LK1I9z3uHlvPDqg9r/1tZxmiTCHrET2brUoSkVLKqg6MG4Dzzx3tK
	dzUtIqqY8c7OV0ap1QzkDYOD5w7+8VyypVDMdmxthvgo7DS5g+gmgFsGeAv5hf+KnK57Jw2wkWw
	Esjc+Wapg=
X-Received: by 2002:a17:907:96a6:b0:b7c:fe7c:e380 with SMTP id a640c23a62f3a-b7d236f7860mr1528082166b.13.1765895613044;
        Tue, 16 Dec 2025 06:33:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHFzNsGwKARkXS4ZtDItuBhnrQn1fUzZeAB6AToGes9YgJGJs29bqvEiQXmenKj6k0dHe4vw==
X-Received: by 2002:a17:907:96a6:b0:b7c:fe7c:e380 with SMTP id a640c23a62f3a-b7d236f7860mr1528076966b.13.1765895612514;
        Tue, 16 Dec 2025 06:33:32 -0800 (PST)
Received: from [192.168.103.125] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ff725efd8sm171981166b.27.2025.12.16.06.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:33:32 -0800 (PST)
Message-ID: <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
Date: Tue, 16 Dec 2025 15:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_063338_416730_70F1ADAF 
X-CRM114-Status: GOOD (  16.73  )
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

On 12/16/25 14:32, Guodong Xu wrote:
> K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
> K3 SoC.
> 
> This minimal device tree enables booting into a serial console with UART
> output.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>   arch/riscv/boot/dts/spacemit/Makefile        |  1 +
>   arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>   dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>   dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>   dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..0f9d04dd352f5331e82599285113b86af5b09ebe
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
> + */
> +
> +#include "k3.dtsi"
> +
> +/ {
> +	model = "SpacemiT K3 Pico-ITX";
> +	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	memory@100200000 {
> +		device_type = "memory";
> +		reg = <0x1 0x00200000 0x3 0xffe00000>;

Shouldn't the reserved memory be described as no-map /reserved-memory 
nodes instead?

I would assume that 0x1,0000,0000 is the location of OpenSBI.
What is at 0x3,ffe0,0000?

Best regards

Heinrich

> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
