Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6D7C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHZMHQ/OUGbBqRLVF7f+Vj10giTwz/gcWuBt9ln4vFc=; b=1zWRSApwtgX9cb
	uqAOIfoNGpWgL47y8zL8rrSCcEe3mZy4ZlKkBrtP7eZMd2Ysz74L4iyx6uMPx+F343S5vkxtkaTTg
	FEP6qPWPsT05LZdnBfaYTPJ5FouatJ7mCTzLkDFeoJ5iMFj/ZqzSv5kFUMJ/zRiW40qln1QFQx3/U
	U4vRqf7SlPRvlYE0eiLIIq4Y9AqAVaGqCBB6JxUtFI+b+IqigPoHgTaCDep8ty96PyNufzrjcLppL
	g8UkwkmaL4NGQ4C/jcQtz3km6dNXVIEbhwXQyaLzxI1mumbJ+Qmwg6R9hZ2BWETURBqiLHzKbZ3lU
	BiafeT/83PdJwFSmUPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6v85-00000004qNN-3LiY;
	Mon, 21 Apr 2025 17:40:25 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6v82-00000004qLh-4038
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 17:40:24 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso31060536d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745257219; x=1745862019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kIVu58H//mZx9i9dCRDIy5r3dYFEIXqq3Oo6gJVw3Q=;
        b=XMCuvrNBrN0VRh2UbKM9JmiExkNjBVAG/Vin8kczb/WDY06lNl+Bzmvq/APgbZcU6P
         t3culjQofi80q0OBA28kv/JdEpNn4/mjAsdt/i9hhGHQI7ys4D1fazA4/DyVtvWm1zzy
         2pjx5PTKDSjDKkBsbhgwKTTM59zOJsUR9RLJ5vWBLj5c/WzVmKznV//EA61VuH0EB2zu
         Nc1p2YKA0V5/mjt5VNs7qE5ypc4wHpPLVWoHIlfXf64OPTM2xwnf0IEGaFTuAZ64Ts9r
         H0JhgaTVQUZ0nZxh5hprrjm8ivTo5dELPVWjXzicZRTxsR8bY3YDr0M/fNmcVxAEDj/E
         j62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257219; x=1745862019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kIVu58H//mZx9i9dCRDIy5r3dYFEIXqq3Oo6gJVw3Q=;
        b=jl0KTLJ30yyp15VAZM2pGvA+JSxZsT+Blzw64Tik/a6RuUNldgRWPDhU9xfxQMKSc4
         0UIWEdVg3QG3dwV3wL74BxZu3gm2SW/j/Eh7CXFrbkOBpZrYbEhLc3lehpi0fytsSlT5
         ul5W91mcUgWerL9RwwxRmnfCV8vIMP/F2lOMZ2ARq3yIp7eIvKiz7Ny2ZqdPge/L7662
         IP5P3TdqGim7VWTJaa2MVYigNCzpIqJVWsGRNj5BKuqK96Gv7si6G29GsRUJoq/r6S+O
         5a4otlVqklW11JvYJ3KCT7lpFIuP4BZMbxhAP3u67zF65SvSNPDIalKYl/yN2gCLPAoH
         1PaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5M5N6n7YofISNxqUbzlGmNTayHfyaIo/HBDVIdPsBCwKi3QwD0mryflboHALKSKOymJpPwQo5eiuFuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjLcBG+m9YebWd/xKspOLb5DT7DOCFdh682V4eidbg1mam/Hdm
	ETNAM/hYG4LUEVOM6usmZ7cEXMfcPkMou7y17xbQDJapU/ELWMTfzvV/Y5sun6s=
X-Gm-Gg: ASbGncswV1Zko6Qn5RzJVRO+nGMFqbYoNhd9P7IYqy3gThT/55nmDcYa15a4CyURtBQ
	6rqV96x7lU5DF21tHl9vBfhx+oHPxhVLxL6+7HeRtK54YtK854MCCXo0R0rk6DyhdmaGs8D5coy
	1MMaWH+US9Eangj0wYlGiKynTnQ/4O72VD+UhZ0SUzI9olLC85FMatMWMsuioX/evWZtWuVcV84
	8FFVOa6K7yctLDzCEDDsRR8w48wgIzrc4BmU90ED7zQr4f2bpz/5PBoV56893FT7zrlkiFihERB
	e49nOUqYgVK97pHXe9OLkJusUDDgz3KQJdP4edjP+cElbLHyga3LFiILwgKzSYqcnlNc8LhrBYe
	dwJTP+TAmYH6s9is=
X-Google-Smtp-Source: AGHT+IF+vsdmKg2vXpeajIoJuLo47wQiw/dv7wnI49ZF4AY0SLVO/f7XcVPIz2huHaNJ7F/AqME9ng==
X-Received: by 2002:a05:6214:500f:b0:6eb:2f7a:45b0 with SMTP id 6a1803df08f44-6f2c46baaaamr274256056d6.38.1745257218647;
        Mon, 21 Apr 2025 10:40:18 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af120esm46284596d6.1.2025.04.21.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:40:18 -0700 (PDT)
Message-ID: <2d086fee-47d5-4be2-8b86-bf1cac6af803@riscstar.com>
Date: Mon, 21 Apr 2025 12:40:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Acquire clocks for UART
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_104022_998741_2CD2DE9B 
X-CRM114-Status: GOOD (  13.83  )
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

On 4/18/25 10:32 PM, Yixun Lan wrote:
> The K1 SoC features two clocks for UART controller,
> Acquire them explicitly in the driver.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I had an almost identical patch queued up to do this.

I think I'd mention explicitly in this description that you
are removing the clock-frequency property from all these nodes
(it is required to do this, otherwise the clock properties are
ignored by of_platform_serial_setup() in "8250_of.c").

Two more requests below.  Otherwise this looks good.

If you address all three of my comments, feel free to add:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 36 +++++++++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 153fd1160182b42fe1a2f7f042c9c1da90f63b0c..415e1c3e1c78db987cbb65759adc26e98aaa24d3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -360,8 +360,10 @@ syscon_apbc: system-control@d4015000 {
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART0>,
> +				 <&syscon_apbc CLK_UART0_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <42>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -370,8 +372,10 @@ uart0: serial@d4017000 {
>   		uart2: serial@d4017100 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017100 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART2>,
> +				 <&syscon_apbc CLK_UART2_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <44>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -380,8 +384,10 @@ uart2: serial@d4017100 {
>   		uart3: serial@d4017200 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017200 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART3>,
> +				 <&syscon_apbc CLK_UART3_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <45>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -390,8 +396,10 @@ uart3: serial@d4017200 {
>   		uart4: serial@d4017300 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017300 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART4>,
> +				 <&syscon_apbc CLK_UART4_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <46>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -400,8 +408,10 @@ uart4: serial@d4017300 {
>   		uart5: serial@d4017400 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017400 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART5>,
> +				 <&syscon_apbc CLK_UART5_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <47>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -410,8 +420,10 @@ uart5: serial@d4017400 {
>   		uart6: serial@d4017500 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017500 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART6>,
> +				 <&syscon_apbc CLK_UART6_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <48>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -420,8 +432,10 @@ uart6: serial@d4017500 {
>   		uart7: serial@d4017600 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017600 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART7>,
> +				 <&syscon_apbc CLK_UART7_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <49>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -431,7 +445,9 @@ uart8: serial@d4017700 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017700 0x0 0x100>;
>   			interrupts = <50>;
> -			clock-frequency = <14857000>;
> +			clocks = <&syscon_apbc CLK_UART8>,
> +				 <&syscon_apbc CLK_UART8_BUS>;
> +			clock-names = "core", "bus";

Please insert the clocks and clock-names properties *above* the
interrupts property, as you did for all of the above.

>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -441,7 +457,9 @@ uart9: serial@d4017800 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017800 0x0 0x100>;
>   			interrupts = <51>;
> -			clock-frequency = <14857000>;
> +			clocks = <&syscon_apbc CLK_UART9>,
> +				 <&syscon_apbc CLK_UART9_BUS>;
> +			clock-names = "core", "bus";

Same comment here.

					-Alex

>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
