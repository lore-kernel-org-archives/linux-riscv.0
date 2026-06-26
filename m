Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8400ACD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBcpSXvZCSRLLMbQMMVZ3mr53On3ZYqvhDEInFJyxf4=; b=Us1GNBtQaET3EX
	t5bnDlVXUkjrD6g22Xy9I/NXCpMa0QiNr4gHqWQUN81zY+97LfDQPuwZZ5uQS7f8S9IYmgJki9m2y
	0YlQ4UsGsPag5OltQB5uM8lj6tB9T5sLkpaUqiVJHFaV3Sy6QIW0zRgWW9ymcRQDmINAxRTMPDIUB
	yzfPbAiKuzBNdn6XEDHJIVHElZ/92Nrv2K4fGjit2H98mfcF//lZrds+7ukyZuBukOt6z+bcHpGum
	m3ic/x1kiHiWzuDywz+Lt7MJcz8ObXKnFYu+WDxk6lAGoVjui/36cygdHZCMXLxgeIJ0TUmGiYSO9
	G4kv1SkHXbgIVsyeb2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3vg-0000000B73O-2tFy;
	Fri, 26 Jun 2026 10:37:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3va-0000000B724-1FCv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 10:36:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-46caaa805b2so483265f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782470212; x=1783075012; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+LOxUqboNwspW3Z1iwsJeIpREU5uApJLby1JgVSadY=;
        b=nt3RUiFrCP35IZomRO0J6/1WfPzwkG4ksH/wl5r7ev7LVtyPiGjZG5kPvN6ovOlxdG
         f5AjI6HgaAk2A6mJ3Y+b/zf2u0G1MLY8qVVIagx5Q2HuBbOMJzfOvtMePLjSBCrSjMun
         06Uc0Uq1rbSZUxjlwKX8riaUzl23DQz7mQIRt2592ayBdzWUln2a+Z4QiNGa5Xyc4adU
         kqtu9Ls/gma9pnm298tv7R5pRRPSIjpMq3ip8NQWoef9TGnbfaiDM9Px2x0+GpmcPtTc
         d/invfQhHsgDLI+0l6pUwe/vMeoT2TiVyWAguUEJt5d8f4UUGC0MeAGjWZ8eOykoEF5h
         jY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470212; x=1783075012;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+LOxUqboNwspW3Z1iwsJeIpREU5uApJLby1JgVSadY=;
        b=ncz8VbQDYA51e6bCUw1f4fXxhMg/npSuC7tjBkI8D1W0ycKY26+BFn7bFZiDfUVfXR
         lHerRfx0ixVYBCkOlbb2p2uE4gkuy2hQ408i3WELj80P69y/GjoZ2hX7wSkwbEQNF+nB
         Ij00kmnIFH+3A1n62vMy6qhR8cFboTzNVWg7KMk2pieV/9PNayU7k859lgQVrIMCMlk+
         J6gEgUIdcgugrvmH18zIsx1pxMcqy7DTglaaVvIwoSbb5E9aNiQVgHIJwNqZWjLcCKM2
         cL8el2fxaRXUGQXFUdwq5UUWmSYEUE8vtD8QazF05HkXMfTGjKNEs2nCsiicuLPa2ARF
         qOYg==
X-Forwarded-Encrypted: i=1; AHgh+RphjwygxOkUlDSa4xTa4kMSETbfJqY+HqaPoXeDSz1jGVCjcqFHOPYjJgs+L9A/Jxu2lUXs1YgFskPFVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjAOsffp1oU0vIhjQWyIC0d9Jrn7h4/bhAq3l+VPFhZSxhpFpS
	YrbaEZ27Dy/e6jR90/wHqZGCZ1Y0sjsT1lcTzTYafF05WC2EvgBKrD81
X-Gm-Gg: AfdE7cn9mhpUt6M1PqCqCb7eWDoKmElHX4nxiWuB07Ev5hoWrydA7hE94EAEj5CW6hO
	9rxAxFHMRXStD7L46WG14X7tfWDo5pbFSoOi9b6n1rPDvAuW+Z9sr47FxH3uZDXX3nnJw5UKP8Y
	2lu/3z7HgZ7W+PzTv+F6/25gqAKGfcZDppPXeS+VG8DA4NcV/+RMrB412B9lMvhMa2xc/fvRkqk
	05q+29DbfLkgAR5DVhsKnbkHv/FZEIhq8MTEp5fveYo7De74FQaBRvp9Weh8n9/6pfXo5s+FTyS
	OGgaaTh1sfSoZH3gh1WTFn8LrLvm0w+WT1dIGnkYtyKztLupptQQaNzngFmq0BZeMrZmFeXLXCK
	t+oXm4LhE8e8XApn2PWIFSuH20mb12tE//qzvdaGELq7HXf69XXpxQ9ZhpUAUnTOJ69H/Dmrk3P
	0WYANYJTE78Eykooe1Ve6mDg0b/aKmD5NnWfVs/8g+KiB8+TQjg2iuouU=
X-Received: by 2002:a5d:6f11:0:b0:46e:341b:45dd with SMTP id ffacd0b85a97d-46e341b47c7mr8297132f8f.26.1782470211515;
        Fri, 26 Jun 2026 03:36:51 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-137-217.net-htp.de. [89.182.137.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46dd5f9da4fsm15043736f8f.23.2026.06.26.03.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:36:50 -0700 (PDT)
Message-ID: <2a69d701-741b-4d65-bdbe-226610bf53b5@gmail.com>
Date: Fri, 26 Jun 2026 12:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
 <20260626-shadow-deps-v4-2-bba9831f2f1d@mailbox.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260626-shadow-deps-v4-2-bba9831f2f1d@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_033654_402822_9177E2A3 
X-CRM114-Status: GOOD (  20.63  )
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

On 26.06.26 10:10 AM, Shuwei Wu wrote:
> Add CPU clock properties and OPP tables for the two CPU clusters in the
> SpacemiT K1 SoC. The OPP entries use voltage ranges because the CPU
> supply is shared by both clusters.
> 
> Enable CPU DVFS on Banana Pi BPI-F3 by including the OPP tables and
> wiring the CPU nodes to the CPU regulator supply.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

With the musepi-pro dts enablement patch [0] on top, this is
Tested-by: Andre Heider <a.heider@gmail.com> # k1-musepi-pro

Works as advertised, I get two policies, matching the clusters:
$ cat /sys/devices/system/cpu/cpufreq/policy0/related_cpus
0 1 2 3
$ cat /sys/devices/system/cpu/cpufreq/policy4/related_cpus
4 5 6 7

Some time after boot:
$ cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state
614400 31124
819000 185
1000000 158
1228800 341
1600000 1148
$ cat /sys/devices/system/cpu/cpufreq/policy4/stats/time_in_state
614400 29232
819000 198
1000000 212
1228800 443
1600000 3428

Creating one single-threaded load increases max freq time_in_state in one policy (4 here):
$ yes > /dev/null &
(...after some time)
$ cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state
614400 45244
819000 187
1000000 169
1228800 345
1600000 1148
$ cat /sys/devices/system/cpu/cpufreq/policy4/stats/time_in_state
614400 38794
819000 201
1000000 226
1228800 450
1600000 7580

Creating load for all 8 cores in both:
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &

$ cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state
614400 51371
819000 190
1000000 171
1228800 352
1600000 4391
$ cat /sys/devices/system/cpu/cpufreq/policy4/stats/time_in_state
614400 44121
819000 203
1000000 244
1228800 452
1600000 11812

Thanks!
Andre

[0] https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/

> ---
> Changes in v4:
> - Use separate OPP tables for the two CPU clock clusters
> - Use voltage ranges for the shared CPU supply
> 
> Changes in v3:
> - Use one shared CPU OPP table for all CPUs
> 
> Changes in v2:
> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> ---
> ---
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>   arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>   3 files changed, 147 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..487179f7b9b9 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "k1.dtsi"
> +#include "k1-opp.dtsi"
>   #include "k1-pinctrl.dtsi"
>   
>   / {
> @@ -86,6 +87,38 @@ &combo_phy {
>   	status = "okay";
>   };
>   
> +&cpu_0 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_1 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_2 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_3 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_4 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_5 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_6 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_7 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
>   &emmc {
>   	bus-width = <8>;
>   	mmc-hs400-1_8v;
> @@ -201,7 +234,7 @@ pmic@41 {
>   		dldoin2-supply = <&buck5>;
>   
>   		regulators {
> -			buck1 {
> +			buck1_0v9: buck1 {
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <3450000>;
>   				regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> new file mode 100644
> index 000000000000..4cebfcd87485
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/ {
> +	cluster0_opp_table: opp-table-cluster0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000 1050000 1050000>;
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
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000 1050000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +};
> +
> +&cpu_0 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_1 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_2 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_3 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_4 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_5 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_6 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_7 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..bdd109b81730 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,7 @@ cpu_0: cpu@0 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <0>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +85,7 @@ cpu_1: cpu@1 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <1>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -114,6 +116,7 @@ cpu_2: cpu@2 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <2>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -144,6 +147,7 @@ cpu_3: cpu@3 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <3>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -174,6 +178,7 @@ cpu_4: cpu@4 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <4>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -204,6 +209,7 @@ cpu_5: cpu@5 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <5>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -234,6 +240,7 @@ cpu_6: cpu@6 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <6>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -264,6 +271,7 @@ cpu_7: cpu@7 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <7>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
