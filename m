Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E11CD343F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 02:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0Anx6L3gz/9ChNRRBdAPyJrzYKZJ5KIREewHhPHR7s=; b=ixrrehSfGvmmuo
	ej+tlDSj3QAEjNdDBQrWGeKRIMhW4HeKzYrQAWZnNdlhsEc8DNosRvpuudDwEOOsHpJsLQ/D3A4uz
	EUPVYxLfcga0BccGkZFklR1Vvammy0nJGIqcVaMngkaNASdpF8TeIZrnupL+COfR54Onv+n06DG/H
	EH3ECYY/DypWBUiR27yYEcayUgPRNeoIApsRkujll5ddrlziWftBQ/EwzKYKkxSy9/gTu9JzzKagU
	zOha3GtXWoWuK2LIR5u7WqVe0eaBZlAqBtAekqg9Q55ObmpQ6OcslVXrjn8yRMvjI97FSn1LRBHX/
	T4F2IDw7NxeQiE+Ag+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAPA-0000000HV3d-0RNd;
	Tue, 19 May 2026 02:42:00 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAP7-0000000HV2z-0hLf
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 02:41:58 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gKJpl2Z2Vz9v86;
	Tue, 19 May 2026 04:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779158512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDcRH1NI5ohQC+8+KyXW8eoTp/NLzHa6GAXlQDvIRGo=;
	b=Zk5jYLgezbUaeotn+EN1Af21OuqAYuWUYfpzSTIhirx7abiMuM8yP5JWHDwnqCpzVyCnFv
	8Gig1TpFtxTNadWAdpvDlvuAVb62sSD0ZJK1jAMZKcMe7SUGGjYF+PFZRmZNA6lbAn/2Hb
	aHo3Qa4MbnyczPDG4FMGDCScl/LAET0BKyhEQ6dJn/ASJCxI61KnVtTZurAMgKDAbE1szw
	+MlE1M5B2xODK5690RFdle8g6oVXGNCzUl3rBj+eskBvGAi9rLw1dHhWhfSDxEQch1mZT5
	rv2HNctFuKV3Mc7mLiytV682F7+m42xwVbbFqI/Qzh2OF7gkAoUfecX3d/EN+A==
Mime-Version: 1.0
Date: Tue, 19 May 2026 10:41:27 +0800
Message-Id: <DIMB1PN1XURX.2SKN1XCULACU7@mailbox.org>
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Vincent
 Legoll" <legoll@online.fr>, "Gong Shuai" <gsh517025@gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Add thermal sensor for K1
 SoC
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
 <20260427-k1-thermal-v5-3-df39187480ed@mailbox.org>
 <20260519002602-GKE3679294@kernel.org>
In-Reply-To: <20260519002602-GKE3679294@kernel.org>
X-MBO-RS-META: a8gyojcb1u79paamze3ow1xuowf3feiy
X-MBO-RS-ID: c3256d9df03ab1dced4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_194157_504590_F1E820E4 
X-CRM114-Status: GOOD (  16.19  )
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

On Tue May 19, 2026 at 8:26 AM CST, Yixun Lan wrote:
> Hi Shuwei,
>
> On 15:15 Mon 27 Apr     , Shuwei Wu wrote:
>> Include the Thermal Sensor node in the SpacemiT K1 dtsi
>> with definitions for registers, clocks, and interrupts.
>> Additionally, configure thermal zones for the soc, package, gpu, and
>> clusters to enable temperature monitoring via the thermal framework.
>> 
>> Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
>> Tested-by: Gong Shuai <gsh517025@gmail.com>
>> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
>> 
>> ---
>> Changes in v2:
>> - Update compatible to "spacemit,k1-tsensor"
>> ---
>>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 529ec68e9c23..e9952204224e 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -339,6 +339,96 @@ osc_32k: clock-32k {
>>  		};
>>  	};
>>  
>> +	thermal-zones {
>> +		soc-thermal {
>> +			polling-delay-passive = <0>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&thermal 0>;
>> +
>> +			trips {
>> +				soc-crit {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		package-thermal {
>> +			polling-delay-passive = <0>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&thermal 1>;
>> +
>> +			trips {
>> +				package-crit {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		gpu-thermal {
>> +			polling-delay-passive = <100>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&thermal 2>;
>> +
>> +			trips {
>> +				gpu-alert {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				gpu-crit {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		cluster0-thermal {
>> +			polling-delay-passive = <100>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&thermal 3>;
>> +
>> +			trips {
>> +				cluster0-alert {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				cluster0-crit {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +
>> +		cluster1-thermal {
>> +			polling-delay-passive = <100>;
>> +			polling-delay = <0>;
>> +			thermal-sensors = <&thermal 4>;
>> +
>> +			trips {
>> +				cluster1-alert {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				cluster1-crit {
>> +					temperature = <115000>;
>> +					hysteresis = <0>;
>> +					type = "critical";
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>>  	soc {
>>  		compatible = "simple-bus";
>>  		interrupt-parent = <&plic>;
>> @@ -494,6 +584,17 @@ syscon_apbc: system-controller@d4015000 {
>>  			#reset-cells = <1>;
>>  		};
>>  
>> +		thermal: thermal@d4018000 {
>> +			compatible = "spacemit,k1-tsensor";
>> +			reg = <0x0 0xd4018000 0x0 0x100>;
>> +			clocks = <&syscon_apbc CLK_TSEN>,
>> +				 <&syscon_apbc CLK_TSEN_BUS>;
>> +			clock-names = "core", "bus";
>> +			interrupts = <61>;
>> +			resets = <&syscon_apbc RESET_TSEN>;
>> +			#thermal-sensor-cells = <1>;
>> +		};
> Ok, so if I understand correctly the thermal is a SoC feature, so with
> above it will be enabled by default for all boards, but for the convention
> we usually disable it in dtsi file, and enable it at board dts level
>
> Please convince me doing above is better? as I'm not sure if there is
> cases that user want it disabled (but could possible)..

I had two reasons for keeping the thermal node enabled in k1.dtsi,
rather than requiring each board to opt in:

1. Other SoCs follow the same pattern: the RISC-V JH7110 and Allwinner D1s
both define their thermal sensor nodes and thermal-zones in the SoC dtsi
without status = "disabled".

2. Thermal protection is safety-critical, and the silicon trip points
don't vary between boards. Leaving it disabled by default risks boards
booting without thermal shutdown.

-- 
Best regards,
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
