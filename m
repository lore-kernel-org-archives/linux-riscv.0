Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CE5EA854A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 02:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Njc0m1p6SJ2+nqanPTd5W6QisMcD4CIdIqgijNCSA8=; b=4gpDCv4Ut3u7g/
	QkcuNadWCG9slpNfGbu4Keigt2dsOMV4sW9nYorRrEnzxmNd2iCp8A1pqSZ/kVtplQHmjnWuu/HqK
	JMYi+YHeZQmU/J58jkSa3X+qnU0cVx3x7cReBixXsiV5mROF86n/ghV+gqKq2L9v6QaUIO/lI4cM9
	Tkvnudpqj50z1s9aXj2suom3qIRDRM1fK8OyYufuSw1q6/1TSe+HELcOGPEwklL7+84D2ZA6334kR
	E8L2vg8IfnODDGS7Q5adGNpXr+MsAJt7Y067K9FP0qzLmxgVeUmwFfJirAYin+n+hHhWjEbIu2Edo
	Agc693FKl8m4+1fyn1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQdN-00000006Yqg-1d1O;
	Mon, 09 Mar 2026 02:46:17 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQdK-00000006YqL-0mw5
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 02:46:15 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fThGT6SsVz9tYN;
	Mon,  9 Mar 2026 03:46:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773024370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1BjM0rf2n3gTAxYcEyrznxi8WA9wRDhAUvOuuf5WIM=;
	b=EXmgdsAajz8XB2ziZCvpNjOlSNjG0zxQUN48lyeA/eoR6QGJzpXx5qV5AL2SN7wolcquBj
	3kPK1BCdzmDv8ANZ7JKlG9ZIgK9A7env/8uoGypAiNN2RpSDjHfDxH4liEDKmc4I9L6jfm
	H8DNsIe2knW8NQzbG/rogB43MCvGYj7pEbM/jo+D0rpJR5F0ix/vkxNwy/18xyIksRTVc/
	r0R+FhwpIdBQOrFZqbrAB33cS7nnwcRw3tC33ZPJYSDUqH1T0aD0PjT5pas60TLxN6NSmD
	2GmEX+fOUnyyYDcl8eDYJ/C9aik+tk/K5G+rXKRC41OUhvJCMsQfs/bm6qKBow==
Mime-Version: 1.0
Date: Mon, 09 Mar 2026 10:45:49 +0800
Message-Id: <DGXWODJ8CGUN.KZFJ9JDJMEM3@mailbox.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Yixun Lan" <dlan@gentoo.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Samuel Holland" <samuel.holland@sifive.com>
References: <20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org>
 <20260308-shadow-deps-v1-2-0ceb5c7c07eb@mailbox.org>
 <610da0d3-1dc0-4f4f-afb4-869d3ed81321@sifive.com>
In-Reply-To: <610da0d3-1dc0-4f4f-afb4-869d3ed81321@sifive.com>
X-MBO-RS-ID: 4718965d707e9392835
X-MBO-RS-META: w3n6rf7qzhqwy6xkdx5zhxepjgn57kz8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_194614_582656_81D16964 
X-CRM114-Status: GOOD (  18.46  )
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

Hi Samuel,

On Mon Mar 9, 2026 at 1:59 AM CST, Samuel Holland wrote:
> Hi Shuwei,
>
> On 2026-03-07 11:17 PM, Shuwei Wu wrote:
>> Add Operating Performance Points (OPP) tables and CPU clock properties
>> for the two clusters in the SpacemiT K1 SoC.
>> 
>> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
>> board to fully enable CPU DVFS.
>> 
>> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 34 +++++++++-
>>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 86 +++++++++++++++++++++++++
>>  2 files changed, 119 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 444c3b1e6f44..b87bf9d51cb1 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -86,6 +86,38 @@ &combo_phy {
>>  	status = "okay";
>>  };
>>  
>> +&cpu_0 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_1 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_2 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_3 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_4 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_5 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_6 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>> +&cpu_7 {
>> +	cpu-supply = <&buck1_3v45>;
>> +};
>> +
>>  &emmc {
>>  	bus-width = <8>;
>>  	mmc-hs400-1_8v;
>> @@ -201,7 +233,7 @@ pmic@41 {
>>  		dldoin2-supply = <&buck5>;
>>  
>>  		regulators {
>> -			buck1 {
>> +			buck1_3v45: buck1 {
>>  				regulator-min-microvolt = <500000>;
>>  				regulator-max-microvolt = <3450000>;
>>  				regulator-ramp-delay = <5000>;
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 529ec68e9c23..5c7bb5d85fc0 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -54,6 +54,8 @@ cpu_0: cpu@0 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <0>;
>> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>> +			operating-points-v2 = <&cluster0_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -84,6 +86,8 @@ cpu_1: cpu@1 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <1>;
>> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>> +			operating-points-v2 = <&cluster0_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -114,6 +118,8 @@ cpu_2: cpu@2 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <2>;
>> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>> +			operating-points-v2 = <&cluster0_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -144,6 +150,8 @@ cpu_3: cpu@3 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <3>;
>> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>> +			operating-points-v2 = <&cluster0_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -174,6 +182,8 @@ cpu_4: cpu@4 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <4>;
>> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>> +			operating-points-v2 = <&cluster1_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -204,6 +214,8 @@ cpu_5: cpu@5 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <5>;
>> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>> +			operating-points-v2 = <&cluster1_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -234,6 +246,8 @@ cpu_6: cpu@6 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <6>;
>> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>> +			operating-points-v2 = <&cluster1_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -264,6 +278,8 @@ cpu_7: cpu@7 {
>>  			compatible = "spacemit,x60", "riscv";
>>  			device_type = "cpu";
>>  			reg = <7>;
>> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>> +			operating-points-v2 = <&cluster1_opp_table>;
>>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>>  			riscv,isa-base = "rv64i";
>>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
>> @@ -339,6 +355,76 @@ osc_32k: clock-32k {
>>  		};
>>  	};
>>  
>> +	cluster0_opp_table: opp-table-cluster0 {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		opp-614400000 {
>> +			opp-hz = /bits/ 64 <614400000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-819000000 {
>> +			opp-hz = /bits/ 64 <819000000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-1000000000 {
>> +			opp-hz = /bits/ 64 <1000000000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-1228800000 {
>> +			opp-hz = /bits/ 64 <1228800000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-1600000000 {
>> +			opp-hz = /bits/ 64 <1600000000>;
>> +			opp-microvolt = <1050000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +	};
>> +
>> +	cluster1_opp_table: opp-table-cluster1 {
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		opp-614400000 {
>> +			opp-hz = /bits/ 64 <614400000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-819000000 {
>> +			opp-hz = /bits/ 64 <819000000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-1000000000 {
>> +			opp-hz = /bits/ 64 <1000000000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-1228800000 {
>> +			opp-hz = /bits/ 64 <1228800000>;
>> +			opp-microvolt = <950000>;
>> +			clock-latency-ns = <200000>;
>> +		};
>> +
>> +		opp-1600000000 {
>> +			opp-hz = /bits/ 64 <1600000000>;
>> +			opp-microvolt = <1050000>;
>> +			clock-latency-ns = <200000>;
>
> What is the initial voltage set by firmware before Linux boots? If it is 1.05V,
> this is fine, but if the default is 950mV, then you cannot enable the OPP table
> in the SoC .dtsi file. Boards other than the BananaPi F3 are missing the
> cpu-supply property, so they won't raise the CPU voltage before switching to the
> higher frequency. The usual solution is to put the OPP table (or at least the
> OPPs that require a higher voltage) in a separate .dtsi file, and only include
> that file from boards that provide the cpu-supply.
>
> Regards,
> Samuel

Thanks for the suggestion!
I confirmed the firmware sets the initial voltage to 1.05V at the default boot
frequency before any scaling occurs:

~ # cat /sys/class/regulator/regulator.4/name
buck1
~ # cat /sys/class/regulator/regulator.4/microvolts
1050000

But I agree that moving the OPP tables to a separate .dtsi is a much safer
and more robust approach for boards without cpu-supply.
I will implement this in v2.

Best regards,
-- 
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
