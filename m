Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AFDCD343F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 00:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bg3lqdui9X+PoDbo6ZifWRnW3XpeBoR+tqQBcxTzz3Q=; b=GG6AQMpVJXNJYk
	nvgBtTGbiApj/m6LYIRww+G2ahxFtL1F1EkamLS7H7W/F2idBwXT7XC7H3s4VexHobi/S+svXM/ja
	YTmBMSnzfzhdS+y23uEmfK1c67+9/uXdzWpggW1k5k1n6QTKpB2v+1HlPCVWFzg2XHFmb3bXJNBG5
	gA28MBa3K1qKOcdqZcdQ5PVGOcA49Zsgef8EdDVD7WX7hFnqUoXmm0NKx8dmuL5bvMIfYJ4Zo/ky1
	Zf7yJRf1Cohfh/G5S7rJ9IZy0IskFyiNnRWWyME0yzG34U4ejW2vFHTv5PWB5VOReILZO1A9i+omO
	vGigRz5MFD+n/jtYeVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8Hh-0000000HGOk-1ljy;
	Tue, 19 May 2026 00:26:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8He-0000000HGOD-2K0I
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 00:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A492D404B4;
	Tue, 19 May 2026 00:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085B1C2BCB7;
	Tue, 19 May 2026 00:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779150365;
	bh=QeaGqPkY880B2H1MX0s9tMMl2MY+G0asnmaMXnfPQKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwZ8fvVasjSWjmQ9trLx+1Kc5gEYizGmn7lCRAJ3ZRxP/pfxgUZa8rtV775wtpx1m
	 tHaCds2m0Ako3CCgo6X+fRnql+QzxoUyW0MtsgvkaS1gy8reTi4JdInP7CR653uzFQ
	 hsL/qKmtQJiZXXeOlgcagWqdykLArZ7cGBJN+V4zu9nQtQCXJct8HWpXRjNtUrbTCm
	 1DSH9odRjxb7u25+z0qxBLXe52VOvrs3HEQ0IdMPBPkfcjV0QpjZSk4BzSP6GNuWF4
	 z/KHfDMxjtzx1sNIIgCysBM15xtbWB8NRdHe4hVYsxac1n75G3/oPv436VI9tHGVm8
	 sEuhyBWIdDL/w==
Date: Tue, 19 May 2026 00:26:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Add thermal sensor for K1
 SoC
Message-ID: <20260519002602-GKE3679294@kernel.org>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
 <20260427-k1-thermal-v5-3-df39187480ed@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260427-k1-thermal-v5-3-df39187480ed@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_172606_636410_D497FF30 
X-CRM114-Status: GOOD (  17.36  )
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

On 15:15 Mon 27 Apr     , Shuwei Wu wrote:
> Include the Thermal Sensor node in the SpacemiT K1 dtsi
> with definitions for registers, clocks, and interrupts.
> Additionally, configure thermal zones for the soc, package, gpu, and
> clusters to enable temperature monitoring via the thermal framework.
> 
> Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
> Tested-by: Gong Shuai <gsh517025@gmail.com>
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> 
> ---
> Changes in v2:
> - Update compatible to "spacemit,k1-tsensor"
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..e9952204224e 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -339,6 +339,96 @@ osc_32k: clock-32k {
>  		};
>  	};
>  
> +	thermal-zones {
> +		soc-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 0>;
> +
> +			trips {
> +				soc-crit {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		package-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 1>;
> +
> +			trips {
> +				package-crit {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpu-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 2>;
> +
> +			trips {
> +				gpu-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu-crit {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cluster0-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 3>;
> +
> +			trips {
> +				cluster0-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cluster0-crit {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cluster1-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 4>;
> +
> +			trips {
> +				cluster1-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cluster1-crit {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -494,6 +584,17 @@ syscon_apbc: system-controller@d4015000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		thermal: thermal@d4018000 {
> +			compatible = "spacemit,k1-tsensor";
> +			reg = <0x0 0xd4018000 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_TSEN>,
> +				 <&syscon_apbc CLK_TSEN_BUS>;
> +			clock-names = "core", "bus";
> +			interrupts = <61>;
> +			resets = <&syscon_apbc RESET_TSEN>;
> +			#thermal-sensor-cells = <1>;
> +		};
Ok, so if I understand correctly the thermal is a SoC feature, so with
above it will be enabled by default for all boards, but for the convention
we usually disable it in dtsi file, and enable it at board dts level

Please convince me doing above is better? as I'm not sure if there is
cases that user want it disabled (but could possible)..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
