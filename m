Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B2BC36010
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XW7N2Rm5LhZFgDI09H7B3ZWE7dIYDBA5+uA0rzVaO1I=; b=XVh3fvrscPTWDC
	bQplKBk6lYhkZjdSJsT3C3ktsF0zlWdlxaHU2tDMyGGDbkaWX5qr5vf9Wfa/z/gvmGVCceu+35FrA
	bpFCSNUdV1jSC0vZbttAAjK5eSl8u7EXSdJ2zMddX9GiqWPUQdJjhQqT2tbt/5K97/XwJqyMJw3tQ
	nmHSUZdTPzxN+ycpgXv8BUOo3vF+WFogYIrbUa4i303QD7j1MEzI0Yb8l1OX44KiuO1nFFPVBmRcE
	5FpGVhNWP5NKcDSJYVOwsfgOUXg8A3GNY2mEKu9Qpe5sAFtr/nb+QDEz5Q5AoKHPx9GLbAJKTgqf5
	3r+HaU0OJTFrcsPjRTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ElN-00000005Flp-0Dcf;
	Tue, 08 Apr 2025 19:37:37 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ElL-00000005Fjg-1Yls
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 19:37:36 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d46aaf36a2so45142895ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141054; x=1744745854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ob4oUqAxpn+J+G+4QGZ2IAdpzs1pkYoXWSPEpJ9MtRw=;
        b=e73GpWsuZsiAQwBt/LKOdnLUW/7V6txCX6V+UxsTWmz5knZWg9l3+2Z0u+K5my1VsF
         8HeF/voIGD/h4+YlufDomqsMefVONsJ70VQroJk/mmtP3Ce0BkVuzwKFowrIx5NOU5+E
         HvP+dVomoPPDzqUAaDcgsf2i9LQ73rnzlu/YZ9h4pjxL7LoDr58aZNWSiSAB3osZ+/I3
         FVT6TnGyg9WNHy/8F7KHbFiWnQSMIHJjKXbxO0csCyU74xbqfqICLyhfOfUg/9c8r3v6
         UATbqkcisGZgfMHvAff0bt+hcf0p2lCb2zLEqdFhSNzgeVmQ0SHa/kPKN5DeIZMMPPBG
         WuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141054; x=1744745854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob4oUqAxpn+J+G+4QGZ2IAdpzs1pkYoXWSPEpJ9MtRw=;
        b=ihsKKziuhaUpOpRA7nVRcaJEvr8/bnYkinkYmVVoc9i/BJYfuI36Pox5Ds3dC2BOWU
         7Wbs4OS4J3mxutz/JTchB2YpJIcnXqygTqUFCL0SQ2N5WrK9L0FcZf42Sq5DARkwxljA
         ARVUINzDRO7ybbAH8aCSibahoET5tx8y7b7IaE8ksTswUSfvfA0nIEjR+67Lfhif29Jx
         s/O65QdOiB+xq/kOmS9hWVmMZRpsuVCxqGXwdeUrSyXTGJ9bVS1bL652s7987ybGioBh
         s6EfjLZCHRqM4ytCw3orP0jb6n/CQoxx8nyFLzqGnzK/NbDGwKbsWTSzYXDyuwtgMZqx
         /NcA==
X-Gm-Message-State: AOJu0Yyapcf8FRHmGzQeayUgc6LOmxpZhsokq+nByTCAk0tMj9wBJoq5
	Dn7URHX1ChOZQh/hQVc7qPnhSwC5Ab/BAi6u4X9RSoT5FwBHBJs+aHXxYTrbLCKKH7Vq43r1ROD
	nIedFUA==
X-Gm-Gg: ASbGncvBoaNHYHa5kf4CGTmksTE5CSCCnbpPre1NzkpGd6RVPj1TQ5vNKOmyO75z4zn
	3MU0LUde3ty+CDmjOK8d6tM2qSCPQSpG8Ro8vaTvOPrxWG/PeRDLbDvYPKBsEWfcl3U6+uADs/r
	ZWAcjImxodxUCNJLQT79nhNV2y1TDn5Avg2ki22ywcCVvupmSZV9zVxa7mbzNs491XrpTXvUuD/
	456WWsjN4n7vO00YGL3Ff2Mf9B1izBTv0OogtMZyRf4XiNMVXGXECJbqY/0O8RFCJEjxJmFro4V
	J9I67VSlAJ33pJeE+2vYSTRRdr4d2kQOecrarT1AH4ixp4WwVGfjv28l0hEUms8sH+nHYgfwNUS
	S7dWVuI6yo0PSctfz2t8=
X-Google-Smtp-Source: AGHT+IE7j1OBiF96wzmsrWHFXnRl197F3CnscJiSLVvRNPdCYjy+kg0LczV2LeKhYQRulMXH9GWIZw==
X-Received: by 2002:a05:6e02:144b:b0:3d4:3ef4:d4d9 with SMTP id e9e14a558f8ab-3d77c2b260bmr1879095ab.14.1744141054359;
        Tue, 08 Apr 2025 12:37:34 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703c0665esm5904485ab.50.2025.04.08.12.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:34 -0700 (PDT)
Message-ID: <c7bb5f17-1d64-449b-ba33-4de63efa4286@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-6-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-6-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_123735_415215_20BB3D29 
X-CRM114-Status: GOOD (  14.41  )
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

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Other than the suggestion that you rename the "spacemit,mpmu"
property (mentioned in patch 3), this looks good to me.

Whether you change that or not:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..584f0dbc60f5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>    * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>    */
>   
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
>   /dts-v1/;
>   / {
>   	#address-cells = <2>;
> @@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
>   		};
>   	};
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
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		interrupt-parent = <&plic>;
> @@ -314,6 +346,17 @@ soc {
>   		dma-noncoherent;
>   		ranges;
>   
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>   			reg = <0x0 0xd401e000 0x0 0x400>;
>   		};
>   
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		plic: interrupt-controller@e0000000 {
>   			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xe0000000 0x0 0x4000000>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
