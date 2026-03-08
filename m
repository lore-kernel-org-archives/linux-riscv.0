Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8317CEA853C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBAuKXIn/bw9F4LTRvD4uIvNgW1fYaC9MJNWgUBI0QI=; b=Je4gp7WC/uJ4/n
	siWwe2fBiwLXsSowYakmHL1QxI6Si3VSkXElayP6b7U6Gaq4Sd5vabic6lgxkl3NBJB3P5uUaLZoE
	zDXZ1Qg7mFpBiDQUZpEi2Es5Hj5uFNhcgMD28nO45zPeFkx+ZFAKLESpwCA2nvpPuTA/7pI+uGdzo
	5WufjjJX9Rw/NIj5C9Lmnu6vOlS8S9P74s8U6f/Ol8ev5lfNOj5oMNOteGJ7aD+mLEy9id6PTVLjP
	W5HOKiuKp5NrF4qg7sKpHifL8bWMcuoxNtjcV6uJAOYXvw7+k5pewXExPAKQNZZb80ESxWhDqKoN0
	TTVpKg1JF1lArwI/uogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzIPx-00000006EdB-2UP3;
	Sun, 08 Mar 2026 17:59:53 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzIPv-00000006Ecq-3jjA
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 17:59:53 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7986e0553b0so91266027b3.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Mar 2026 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772992790; x=1773597590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TV+fid+6EASBoKc0dODxReLnENoxtwD9DEo9QwziAPo=;
        b=RAsyomQxeB8qxyyWeJryJKmW8WDACnkJ2yyB2KPrIi28L5rqWX27RONX1Bounw822W
         gK0mKbWC75mETnDUVcNLMVZOQrOxURTz5VkGAzjcUzAcqJwCfQEgKulPjaCEhhF4vG7s
         GEX3N8TyKkh/O8qZo77Fa8/GnyKEKLaVx28t+emRUeNtmpxvmnA+JSVlZOuC7j/ndNIT
         tH/IpmIbNXKahTxwbO4meJUu0OHgGUXtKBxBsWjKH2qh94rORl6uxmCt37TLb1K8UB55
         6dwp1J7PqYa9cx3qBrjxedqZb4uugcSbLusVdJU+Y/lbGcnqnFGT2Q//CUKvn6f7XuDa
         JFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772992790; x=1773597590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV+fid+6EASBoKc0dODxReLnENoxtwD9DEo9QwziAPo=;
        b=YFoQfv9BYkRJO2Ebfb/GkbsYkEa/B48kFQNI39SkszPEPrOWSRlVULfOMYV0muLvhs
         5NvtmcpceEIQ2AX9JG4gByIsOgV2nZBFGSa9w6Lfei27qa8bPSCCUKg876uthdxnPLKQ
         OYM7BWqao4SWIqtLJGXDvO9SLx2OcNpXayy8YdgurBJBaD1XQ6PVMW41sYRtzu4dGTUw
         DqAZ1z5vgIvszbvXHmzqH97b1eGGm+TJLZ7MmENRnVdP3aC6svNk7tZwePFk2j+ovZiZ
         pOc/av1gTpz1Ziftill68E0IaeSwMSxFw3WsmHlHK6d7KYMhKehui20s1a/KKdY3k7JR
         Pg4g==
X-Forwarded-Encrypted: i=1; AJvYcCXTzHcNAvVjO7MnOWLeJFYFfrVXNlq+xreDeMt1XirSzP76wotc5LWguannT5FhsqvT4dbZwKc2FHBJ9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVdqGdw7ml7dJmLcX3pkRraDGcXRb2u8mgJ1996dg3Y8H2Gwy
	hPXZUJNA2HONCDeU/k4E6bnRJM+jgwTp2qn7lgptibJwM/yRufOFb5Rd5GEgPWNwKUI=
X-Gm-Gg: ATEYQzxFQdvlsI7nVPkhJ7Hxq3JUnIcOPYhLZoquxUN8+JKy0lc6a8eepLrfZYAS8Uv
	dggk5Ze6oQpmXBH+6zZlP10XQTHN3VNhrV16M6SseYqWrtk0SA9r0CYBVzGNWNnQzhltE1JXdY8
	4KCz2xkH7wDP6yKUGQb2EQeOni4iivWymeHdinH4JA8wzOLYBXvJxf4GVKwckRJpqSDkefFVtDh
	5UZj9req5MyJf0ZfgitFoU8GZmDiKpz19wU3hsQLxGvkFIny5FFim98dvVFT3XaC4jp9Welbf+F
	Zl0CU+jETCuD5sEm5/GUzMi10bjcxGJI/5nJfCx9awSp/fwOAmm0e+RZl1sGUxFFCaF0Fbgznji
	Zk1Bd7CChmmKe7Ty/CKhFeUESFJ6fSuzmjNNttU1gloX2wxaOgwmFo1F83pV7hmHMhGHWzinhZZ
	NNfkWXoaoEKgcVSz8rT5dNHmDie40+h1rJZ9kGfLUIb76brXnx5M0=
X-Received: by 2002:a05:690c:6b12:b0:797:ac4a:6ff8 with SMTP id 00721157ae682-798dd79737dmr77044737b3.61.1772992789901;
        Sun, 08 Mar 2026 10:59:49 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dec8b953sm34660587b3.6.2026.03.08.10.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 10:59:49 -0700 (PDT)
Message-ID: <610da0d3-1dc0-4f4f-afb4-869d3ed81321@sifive.com>
Date: Sun, 8 Mar 2026 12:59:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yixun Lan <dlan@gentoo.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org>
 <20260308-shadow-deps-v1-2-0ceb5c7c07eb@mailbox.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260308-shadow-deps-v1-2-0ceb5c7c07eb@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_105951_983441_D7D5205F 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Shuwei,

On 2026-03-07 11:17 PM, Shuwei Wu wrote:
> Add Operating Performance Points (OPP) tables and CPU clock properties
> for the two clusters in the SpacemiT K1 SoC.
> 
> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
> board to fully enable CPU DVFS.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 34 +++++++++-
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 86 +++++++++++++++++++++++++
>  2 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..b87bf9d51cb1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -86,6 +86,38 @@ &combo_phy {
>  	status = "okay";
>  };
>  
> +&cpu_0 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_1 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_2 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_3 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_4 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_5 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_6 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_7 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
>  &emmc {
>  	bus-width = <8>;
>  	mmc-hs400-1_8v;
> @@ -201,7 +233,7 @@ pmic@41 {
>  		dldoin2-supply = <&buck5>;
>  
>  		regulators {
> -			buck1 {
> +			buck1_3v45: buck1 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3450000>;
>  				regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..5c7bb5d85fc0 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,8 @@ cpu_0: cpu@0 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <0>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +86,8 @@ cpu_1: cpu@1 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <1>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -114,6 +118,8 @@ cpu_2: cpu@2 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <2>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -144,6 +150,8 @@ cpu_3: cpu@3 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <3>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -174,6 +182,8 @@ cpu_4: cpu@4 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <4>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -204,6 +214,8 @@ cpu_5: cpu@5 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <5>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -234,6 +246,8 @@ cpu_6: cpu@6 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <6>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -264,6 +278,8 @@ cpu_7: cpu@7 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <7>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -339,6 +355,76 @@ osc_32k: clock-32k {
>  		};
>  	};
>  
> +	cluster0_opp_table: opp-table-cluster0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +
> +	cluster1_opp_table: opp-table-cluster1 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000>;
> +			clock-latency-ns = <200000>;

What is the initial voltage set by firmware before Linux boots? If it is 1.05V,
this is fine, but if the default is 950mV, then you cannot enable the OPP table
in the SoC .dtsi file. Boards other than the BananaPi F3 are missing the
cpu-supply property, so they won't raise the CPU voltage before switching to the
higher frequency. The usual solution is to put the OPP table (or at least the
OPPs that require a higher voltage) in a separate .dtsi file, and only include
that file from boards that provide the cpu-supply.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
