Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E13AC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfLmTt0Z8EdDgq+YMpei0G41Psa+3re5TzS7P8MAmJY=; b=hYhPTKFWMnJEk1
	bTHan0z6LYMKvGYDSQShLMiTx0hDr8LoipOUYwSPXDF0uW0Hvp3z8AV1C7WRGttGuYwvLNX6vKwWD
	V5O9imlp8nfJt2QLQwyVuCkF5dvAy+uijxueZSwxH1A/m0zh/mxDVRmIXCqsqN4iD7uHOqWSStC4j
	2cGcRluc/Pm9wOeiGD565Ep32OWLX1ERWsljMsPR2TaQZ9q5bg7jHMRNpLylA0IyS1uu2hcAyxAfN
	fcTMd/rmpcieqcKzLzjXohBNl9+QLF5SpqxOyhBeBgUXhiEIwLFlaoJe/vWl+2KEDnhi9sWTGfi1d
	81vHW4KrOIYtZOTyzJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvx2o-0004Uj-03;
	Mon, 08 May 2023 09:20:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvx2l-0004U0-15
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 09:20:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so46911100a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683537628; x=1686129628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeBATTzfWyLrpcItusTVCNqa+kfOywO5ocE6C3AQQ2E=;
        b=GN+DEIdV7HuTj0bxVx7KUkbK0IaihVZfL08tquk8YbKaIdKAsz29zBA1VAwauSiN2r
         vn8/r+I2K5U9xkE9zLDSy1WKAmRQGmn296BBDcempXE8iDDMI8X561i8X9NsqyOb5uUR
         NyS0LA0EBhQFetr35Vk8dM/DVHMPH+w6i3mQP5GqTv8UP0rMOTCEiL6NzJNMxCfYrdaj
         aAm3EXMZLaHeKYRRmnRJ1Ponfwa8Cg7CYSBcOqxnm58bLzSSlJT/U8cqg9BZhtjBfSKF
         J/dMfmSdHiHtBDi41DroTLFRBD+2qUaSchw0obBBNqFS1YXpbymNQ61nvhpt5nqRNups
         tzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683537628; x=1686129628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeBATTzfWyLrpcItusTVCNqa+kfOywO5ocE6C3AQQ2E=;
        b=Mo+ZCjkG2HYxWFxVjfueYatuR0RAfYc7n3QhONiU9GllBP2MMCpOjUa5nLWEY0cL0G
         8aLnPnJdjlGlgv98ss11JdvbfY+h7qSmxAYKIXgq6V/iwbTvG1cDVfc8u4MI2YvhHTSw
         /RALPrnnvpNwemeuVIXzpx++StxaUnb0AP3fhlVMRkUi3BHM09KeHwGzE+7EmPAILkbL
         Xl5fd5Wy3Qe6HETFsiSUuM3fq0muoPRM4mIDCpYY/lMB11wftyJ9SmcrvmTi+s/BT4EA
         /jVCZ2mikU375yyRsxAO7WshGphKpQ0ug8kJUYYwBZ2W0eLUdlor0PHwRP6zSWlfZyVI
         A0vQ==
X-Gm-Message-State: AC+VfDy6BQlW21y9Fpp4Qj4aoE0n/uD9GqIt2n4NHjjTOp6n4l7P/JZU
	GESOO62TmJ6ymqLWkvEivsx0xHsGEWmDm4MES0xvnA==
X-Google-Smtp-Source: ACHHUZ6wbdJtCQPbrDPnwiy9G4STmjghvquLlxAjBypDDS0ZeNRPmXyhnYCc3Q1beffyrQAlptusXg==
X-Received: by 2002:a17:907:6d22:b0:965:d7c7:24db with SMTP id sa34-20020a1709076d2200b00965d7c724dbmr8532589ejc.32.1683537628292;
        Mon, 08 May 2023 02:20:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id nc21-20020a1709071c1500b009693ea7db1esm249529ejc.11.2023.05.08.02.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:20:27 -0700 (PDT)
Message-ID: <d67ae7ff-d877-bd71-1483-f9dfa94c11fe@linaro.org>
Date: Mon, 8 May 2023 11:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-4-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507182304.2934-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_022031_396051_B0241387 
X-CRM114-Status: GOOD (  16.30  )
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

On 07/05/2023 20:23, Jisheng Zhang wrote:
> Add initial device tree for the light(a.k.a TH1520) RISC-V SoC by
> T-HEAD.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/thead/light.dtsi | 454 +++++++++++++++++++++++++++
>  1 file changed, 454 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/thead/light.dtsi
> 
> diff --git a/arch/riscv/boot/dts/thead/light.dtsi b/arch/riscv/boot/dts/thead/light.dtsi
> new file mode 100644
> index 000000000000..cdf6d8b04d22
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/light.dtsi
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/ {
> +	compatible = "thead,light";

Undocumented compatible.

Please run scripts/checkpatch.pl and fix reported warnings.

> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <3000000>;
> +
> +		c910_0: cpu@0 {
> +			compatible = "thead,c910", "riscv";

Probably the same.

(...)

> +	soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&plic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		reset: reset-sample {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "thead,reset-sample";

Undocumented compatible.

Please run scripts/checkpatch.pl and fix reported warnings.

> +			entry-reg = <0xff 0xff019050>;
> +			entry-cnt = <4>;
> +			control-reg = <0xff 0xff015004>;
> +			control-val = <0x1c>;
> +			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
> +		};
> +
> +		plic: interrupt-controller@ffd8000000 {
> +			compatible = "thead,c910-plic";
> +			reg = <0xff 0xd8000000 0x0 0x01000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
> +					      <&cpu3_intc 11>, <&cpu3_intc 9>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			riscv,ndev = <240>;
> +		};
> +
> +		clint: timer@ffdc000000 {
> +			compatible = "thead,c900-clint";


Undocumented compatible.

Please run scripts/checkpatch.pl and fix reported warnings.

> +			reg = <0xff 0xdc000000 0x0 0x00010000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>;
> +		};
> +
> +		uart0: serial@ffe7014000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7014000 0x0 0x4000>;
> +			interrupts = <36>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@ffe7f00000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7f00000 0x0 0x4000>;
> +			interrupts = <37>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@ffe7f04000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xe7f04000 0x0 0x4000>;
> +			interrupts = <39>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		gpio2: gpio@ffe7f34000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xe7f34000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portc: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <58>;
> +			};
> +		};
> +
> +		gpio3: gpio@ffe7f38000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xe7f38000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portd: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <59>;
> +			};
> +		};
> +
> +		gpio0: gpio@ffec005000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xec005000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			porta: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <56>;
> +			};
> +		};
> +
> +		gpio1: gpio@ffec006000 {
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0xff 0xec006000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			portb: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				ngpios = <32>;
> +				reg = <0>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <57>;
> +			};
> +		};
> +
> +		uart2: serial@ffec010000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0xff 0xec010000 0x0 0x4000>;
> +			interrupts = <38>;
> +			clocks = <&uart_sclk>;
> +			clock-names = "baudclk";
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		dmac0: dmac@ffefc00000 {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
