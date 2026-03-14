Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EEC107BCEF
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 01:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFYbte41BwPC6xV56576TdNxiOVI4I2rLK4uwSUe3gs=; b=0iHQwVZJrdgfS+
	5pdIzbSB6/0Y4yDii7F0BiKVcpjWBLnoMzatUaNQBoK4iNqmbaPNvyXLiuzijQsKPHwmGpLyQI2bg
	PeUrkp4ZqTUcQcd2yAr62E1F0Biz2jCmW+S7fW+Su5XTXzHV6X1RPT3VQfY8ZbLmYJS+IInD0Bm3E
	lVIzZjhcaD2YN8TsUiOkQPVcTDdQhRvYuYup6TnUJd8lh6AMbYbfn+m/1pVDoEa+1iQ0TXI83MU3N
	HhKRh9yxKnN0CTdN0+0iL0IF2yfHFte8kYZKapQjyEbHNwSpaR1cmRZIHfUXs7U1hKvDXd1xc9GLf
	C9aVTp7C6gPXuSKW3/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1E3B-00000001Ovf-3uUh;
	Sat, 14 Mar 2026 01:44:21 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1E39-00000001OvK-0tGT
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 01:44:20 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-78fc4425b6bso29042767b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 18:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773452657; x=1774057457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+0PW7TLqltEBmQy5cqK8weQnye0SYryGMpoq56/3fY=;
        b=Q4m8MGvtudK09VdOYNK7rLYHOodC/GgnulW9TMPNa8bnkaY/YSX/Y9WPgtGY3Z4hrd
         SQhi13b4thnfrEjJuAoiW1NXS2+0Pf4mYTsnW7tcmsAmZ0B88iBnIRp1OL2I1k8Hsi+S
         AOpOm9kyySCO6THqhnZsYb02O8KjtWgO0edcHEh0+seJZ6x2YOSIV6ac1v3SQWgqBA3z
         oDTQFwOmTzveDFJ5NRY7GvFbv3kj8fh1xmNkUvOgm4hlPt/v4LGWdVD0b7z+v/pMYZvu
         hw/8038polYcQRQ/9rAgT79/HIDZNZUialWo2BMcJb/LEL92CnBqIZoYYMoRo5GfuH8K
         zSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773452657; x=1774057457;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+0PW7TLqltEBmQy5cqK8weQnye0SYryGMpoq56/3fY=;
        b=IMCiDYkksYxheSvfHkCjVZtsCjOZe3MKQluZjLcPlbnXde3z351nc+SpwWxvG2V2Re
         QTq5LrjLPUhTBloS1BuCb1sB3KRP5chZhMEtxZtKh5UUrkXSqvteS8cEEmv1b+CuTtzI
         sEJJesXA3aFDJgWC4uY69fYlGLau/U1QMw/J3yqNqz5+itPZsyWTc7KqvUIja+pwGHcm
         IdaZTif4vktXiZCPfHX6iUCqfpQli/aSKYrawtru1zQeKy7gwbJFyhVzmpMrwnGRrm5Z
         jDgN1Ywz4BPHYl2NcpVgUlWvfYlBws0Nx3cHb8YJRmck1kNGevOO2KI3tMYAxh8BfNw0
         TyDg==
X-Forwarded-Encrypted: i=1; AJvYcCXuiTcQhfQOcjzDosgooxx/u2lInZg9Y2kuNtORpp+wprRDCKQ4miE5I9j8P0Jz2LJBgv0DjjOmZNy3qQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwolImJesRRK9n29egd+RClgdd5CccuAceYKx7HY3G36WDRIeBj
	N4FAya3um16cf6VnCdeFi1qRKH5W/5sB+zIo8MzjLxgJdiTzA4+Gw58S108CgqoHsQ0=
X-Gm-Gg: ATEYQzyOsBFVzFTvwkA50Qw3d1/e6JI3WUMLcZahbQshrQTJ4sWQ/kFLOBWDVlIQnke
	H4G7Sg9qmyPsry6dSPdqvRLpaUL2Q7UoaMiyWutEuGvasskl02crELv8o6/IbvGNg7ZV56u0IQz
	PWNFGWhUADkHJcDWJ/ejbjF8KUFaK1xgs9c3/bY/PCnRybiSUciPVkKllRwEuE1JDvEIZfHyPWK
	8ovt/lRqIr7A8Sz02petgeFoKJunI3nS6EvlhnwFjbmls390/QY5xETulHgIfH7/FR6Sqs8QEUY
	AbpPZywBvp1N55f2S0nfHdiAseHqOp/ggF79M9Y/Lxryy+bpiafn9wSzujTlVyZFwujSse97f0P
	e2IOsxXCtNNS9HWkV/BD8LjjYFxbiPlr33WOOWdauw2mthaXLqkqGuq3p97p2C9i0nPMGC1AZh7
	vslknzFdi9S5MCebwalIr7/QUBEIcECjQm6K80L7dp
X-Received: by 2002:a05:690c:112:b0:798:67be:f903 with SMTP id 00721157ae682-79a1c17ba6emr59139737b3.39.1773452657155;
        Fri, 13 Mar 2026 18:44:17 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7991ad51ee0sm50488877b3.8.2026.03.13.18.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 18:44:16 -0700 (PDT)
Message-ID: <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
Date: Fri, 13 Mar 2026 20:44:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: add clock tree
To: Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
 <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_184419_301213_4DF92B3E 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Yixun,

On 2026-03-04 1:36 AM, Yixun Lan wrote:
> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> blocks which are APBC, APMU, DCIU, MPUM.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index b69cf81b5d55..e3d7f3102fd5 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
>   */
>  
> +#include <dt-bindings/clock/spacemit,k3-clocks.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  /dts-v1/;
> @@ -398,6 +399,36 @@ core3 {
>  		};
>  	};
>  
> +	clocks {
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1000000>;
> +			clock-output-names = "vctcxo_1m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_24m: clock-24m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "vctcxo_24m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_3m: clock-3m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <3000000>;
> +			clock-output-names = "vctcxo_3m";
> +			#clock-cells = <0>;
> +		};
> +
> +		osc_32k: clock-32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			clock-output-names = "osc_32k";
> +			#clock-cells = <0>;
> +		};

Are these clocks provided by SoC or by the board? Usually there's a crystal
external to the SoC that provides the root of the clock tree. If these clocks
are provided by the board, they (or at least the clock-frequency property)
should be in the board DT, not the SoC dtsi.

Also, the /clocks node is out of order.

Regards,
Samuel

> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&saplic>;
> @@ -406,6 +437,15 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_apbc: system-controller@d4015000 {
> +			compatible = "spacemit,k3-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@d4017000 {
>  			compatible = "spacemit,k3-uart", "intel,xscale-uart";
>  			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -506,6 +546,41 @@ uart10: serial@d401f000 {
>  			status = "disabled";
>  		};
>  
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k3-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x10000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: clock-controller@d4090000 {
> +			compatible = "spacemit,k3-pll";
> +			reg = <0x0 0xd4090000 0x0 0x10000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-controller@d4282800 {
> +			compatible = "spacemit,k3-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		syscon_dciu: system-controller@d8440000 {
> +			compatible = "spacemit,k3-syscon-dciu";
> +			reg = <0x0 0xd8440000 0x0 0xc000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		simsic: interrupt-controller@e0400000 {
>  			compatible = "spacemit,k3-imsics", "riscv,imsics";
>  			reg = <0x0 0xe0400000 0x0 0x200000>;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
