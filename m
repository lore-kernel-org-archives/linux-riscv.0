Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E44C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZO9vWbnNu5ctTol+hoo64xGfms8QOpdb70tzBF2Ji1I=; b=GGGF3ObC1r6rudu4hr/rTkU+r/
	d+BIWfA1EWFF97WMiD3SH6iTFj4/OzFgiIojhQp58Ut8pXsgYVIdAzB89zXGE9X7Oiu6SpQB+f7Bc
	DtjWkyQmOtRfnFV50/qPPfKhdXJ1RlzmPJIBhK6YnVm1sBW8CcisoHGxYrP6EVxX3/WFbRsDTCqXr
	eEhjb1pVNbeiJJy3zMo8uS0hQwr7ueSECptxXsIlsavhi9GjyAIf/U5e0J4imCNFn3ZGvN8KKmF+J
	gO7B6C/aa7abYo6tUSLXZQ3lRELhP2F7/FxkuBJ8n80AP+Ss7tAFCxOaN5mScrhv+3X+5k1UlkMnc
	D+y1IHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqje-00Gxdv-28;
	Thu, 28 Dec 2023 13:47:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIqja-00GxdW-2R
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 13:47:40 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 50A573F2BF
	for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703771252;
	bh=ySvaj6mw0Qby67JSUQdDPGBIJqoPeBsqjt50PA+TTJE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=UBMQo3iDWyuHs5n0kxvvUwgFxnfW5SXM+UdQpPHHhvYWucDoVKVaSz4RsDadfwP9A
	 II/LJDf5lD2Z47HG8Yt+K0SOpBh4aIHPC5SPLZp6uA4IC3dGhwii8/fh3FXRaxq0Xh
	 xkEg+7UzF/dzX5HfTj1SjFiMRQ8ZJN3qZllPfKlCFvgFQG4xVtOuknYRr68wpdd3/y
	 6Qt5MxEAIA/11ObssiXMLXFB6du68NQqY8dWAdmpyyaHycH2UI+eDPiAxw4Gk9bfG/
	 ZsMZ0y4T0nXXBpR3ZHogqJPQvhcwD1b2G8AkJzmMAzu5FTe/PNaasl1He//g704UDj
	 jnEOE40CIPFMg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-427e5984880so29994111cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 05:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703771251; x=1704376051;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySvaj6mw0Qby67JSUQdDPGBIJqoPeBsqjt50PA+TTJE=;
        b=xII9FytgcRat1UcMu+8PxzIq1Gqtg8H8R3wOrZ0Nf7RDR8rN4c+awB1e5XiEgq2Nl/
         OMVmhtCoXy/T0fxIZOnAPyIPBhbCfGfifaAU4DSCQ3awWOeyF7SVneDAqe3lRLShskO9
         WS25j5s4qXGe3T1SWAPX74EeesUfO6ny73J5sDJtHBBwVEF0KXqQ5E821DcNqTxLvJrT
         ZIacatTJtXiNdl946JX/yPeHBiK35wZppn/LMyE+PgBPhlcoJJY7K8g7iTBj2RedMOhF
         GUuoBPyvMmMGTSBeBQIQK+ne9y8pGGpeo8kMfd+hLU5qsZGlwZNWdw5O4Xi2+UfA0+bj
         6Jpg==
X-Gm-Message-State: AOJu0YwYEdljclULDvYLoWp1kP+Lk1lRkfQ9mxj1+2DuGMX4CwJacfUF
	H8s8r/xL3gFhWGCy8eZkOfQvB4NAa4BTUrN3mTmluNQHqI/r8byfhA/1v8I4TT3bXwPVTvOf9dQ
	aQqoRVAsuQUlZg1/T+ERdQbPxbw5IW0vDuV3O1w1XQWiMTcWPmU31EUGWJesOOeCdi1Yo
X-Received: by 2002:ac8:5a11:0:b0:427:ea23:566c with SMTP id n17-20020ac85a11000000b00427ea23566cmr4660199qta.53.1703771251187;
        Thu, 28 Dec 2023 05:47:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyx3Mt96pBkakbFbQ2PVMaveEYVuVTpgO5Pwq713rUQYJch5rOcZ0S/een08xtTDThCB2/KT3WiTW/UmItfNI=
X-Received: by 2002:ac8:5a11:0:b0:427:ea23:566c with SMTP id
 n17-20020ac85a11000000b00427ea23566cmr4660186qta.53.1703771250835; Thu, 28
 Dec 2023 05:47:30 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Dec 2023 07:47:30 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <DM6PR20MB23167E08FCA546D6C1899CB1AB9EA@DM6PR20MB2316.namprd20.prod.outlook.com>
References: <DM6PR20MB23167E08FCA546D6C1899CB1AB9EA@DM6PR20MB2316.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Thu, 28 Dec 2023 07:47:30 -0600
Message-ID: <CAJM55Z9M=h95d_BJnwV=A6LVK_EtuavMwjPAsyvDtF4wL6vgtg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add timer dt node for CV1800
To: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_054739_147663_1FAD3AAB 
X-CRM114-Status: GOOD (  14.58  )
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

AnnanLiu wrote:
> Add the timer device tree node to CV1800 SoC.
> This patch depends on the clk driver and reset driver.
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR20MB4953.namprd20.prod.outlook.com/
> Reset driver link:
> https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/
>
> Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 72 +++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aec6401a467b..34a1647cc51b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -113,6 +113,78 @@ plic: interrupt-controller@70000000 {
>  			riscv,ndev = <101>;
>  		};
>
> +		timer0: timer@030a0000 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a0000 0x14>;
> +			interrupts = <79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER0>;
> +			status = "disabled";
> +		};

Why do all these timers need to be disabled? Usually peripherals like DMA and
internal temperature sensors etc. that don't need any support outside the chip
can just be left on.

> +
> +		timer1: timer@030a0014 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a0014 0x14>;
> +			interrupts = <80 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER1>;
> +			status = "disabled";
> +		};
> +
> +		timer2: timer@030a0028 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a0028 0x14>;
> +			interrupts = <81 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER2>;
> +			status = "disabled";
> +		};
> +
> +		timer3: timer@030a003c {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a003c 0x14>;
> +			interrupts = <82 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER3>;
> +			status = "disabled";
> +		};
> +
> +		timer4: timer@030a0050 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a0050 0x14>;
> +			interrupts = <83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER4>;
> +			status = "disabled";
> +		};
> +
> +		timer5: timer@30a0064 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a0064 0x14>;
> +			interrupts = <84 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER5>;
> +			status = "disabled";
> +		};
> +
> +		timer6: timer@030a0078 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a0078 0x14>;
> +			interrupts = <85 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER6>;
> +			status = "disabled";
> +		};
> +
> +		timer7: timer@030a008c {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0x030a008c 0x14>;
> +			interrupts = <86 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +			resets = <&rst RST_TIMER7>;
> +			status = "disabled";
> +		};
> +
>  		clint: timer@74000000 {
>  			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
>  			reg = <0x74000000 0x10000>;
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
