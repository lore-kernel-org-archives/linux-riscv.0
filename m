Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8EDCD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 05:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/K2Xsx7yNufi9scFnf9kvQj7CF8znDfCvUYgAmBrUMQ=; b=E5+R8/Ktimv8Qc
	psViHCRrcSCnWrKgyQDeYpf2i93HrtURQzUS6rSLsd8NxYp0qYHAQGbYtId6/pD5XIicZ1Y6ESke5
	HOHmZiLz0qzVzVJEcU+07lbg1Mc/8K05OiYsoCnQtCKulHeRx7uvQ0odptwhVA4tkZAm35T+3brQ8
	o373hnlSoU6g2o0iiGhA8ci5zA7Kgi/r1Qve1jGZabd50C+e44OmgYwDruML+rntEIyjnJs/vqE9F
	k9TV2ZKkbysnrjHpKgSlff5X4CGKjB683XASW/73SVHlZd4qtgmR3Fjt6sBgAizxp9UvnBvK9Ne5S
	XIqargcPHUg/ysuf/YpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPD9u-00000000DOP-3CUr;
	Tue, 19 May 2026 05:38:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPD9t-00000000DNk-3sg6
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 05:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 056AB60052;
	Tue, 19 May 2026 05:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298C7C2BCB3;
	Tue, 19 May 2026 05:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779169104;
	bh=Psc9YO6boKUU786uu3Ie0bpQH19f4iilC5X7LSyJNtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVzASog7bBmivdNYQ7uhlJ7jFrpnEwd3nOg+U2fW1H9vtyIC+dJ2j52XQ7HSntd3t
	 kr3ZF17XW+EznhglwB4/qEyka5HM1BDR6uGjRAZ7Mwc9YZ8wKXnigQspT9R40/8a2z
	 OS9pj8w1+KTzqhudtyIAHAxXB4v9viig/WM2qo5m4OfKkSrt4k+kxCwfwUDeMySbPb
	 6hCgadagksm0P1a88T7sKSkio1kO5xIx95RzfhQptdm6UV28wY6J8UrW9VKTLK191E
	 Sr9Ri3Wr62G6cxwITsCgehADflooe4x2OhTwbDqmaagsGI7yHeM0Vh7FrmBrntWQ/Y
	 mSYGEA/YZouRw==
Date: Tue, 19 May 2026 05:38:21 +0000
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
Message-ID: <20260519053821-GKF3679294@kernel.org>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
 <20260427-k1-thermal-v5-3-df39187480ed@mailbox.org>
 <20260519002602-GKE3679294@kernel.org>
 <DIMB1PN1XURX.2SKN1XCULACU7@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DIMB1PN1XURX.2SKN1XCULACU7@mailbox.org>
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

On 10:41 Tue 19 May     , Shuwei Wu wrote:
> Hi Yixun,
> 
> On Tue May 19, 2026 at 8:26 AM CST, Yixun Lan wrote:
> > Hi Shuwei,
> >
> > On 15:15 Mon 27 Apr     , Shuwei Wu wrote:
> >> Include the Thermal Sensor node in the SpacemiT K1 dtsi
> >> with definitions for registers, clocks, and interrupts.
> >> Additionally, configure thermal zones for the soc, package, gpu, and
> >> clusters to enable temperature monitoring via the thermal framework.
> >> 
> >> Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
> >> Tested-by: Gong Shuai <gsh517025@gmail.com>
> >> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> >> 
> >> ---
> >> Changes in v2:
> >> - Update compatible to "spacemit,k1-tsensor"
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 101 insertions(+)
> >> 
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> index 529ec68e9c23..e9952204224e 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> >> @@ -339,6 +339,96 @@ osc_32k: clock-32k {
> >>  		};
> >>  	};
> >>  
> >> +	thermal-zones {
> >> +		soc-thermal {
> >> +			polling-delay-passive = <0>;
> >> +			polling-delay = <0>;
> >> +			thermal-sensors = <&thermal 0>;
> >> +
> >> +			trips {
> >> +				soc-crit {
> >> +					temperature = <115000>;
> >> +					hysteresis = <0>;
> >> +					type = "critical";
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		package-thermal {
> >> +			polling-delay-passive = <0>;
> >> +			polling-delay = <0>;
> >> +			thermal-sensors = <&thermal 1>;
> >> +
> >> +			trips {
> >> +				package-crit {
> >> +					temperature = <115000>;
> >> +					hysteresis = <0>;
> >> +					type = "critical";
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		gpu-thermal {
> >> +			polling-delay-passive = <100>;
> >> +			polling-delay = <0>;
> >> +			thermal-sensors = <&thermal 2>;
> >> +
> >> +			trips {
> >> +				gpu-alert {
> >> +					temperature = <85000>;
> >> +					hysteresis = <2000>;
> >> +					type = "passive";
> >> +				};
> >> +
> >> +				gpu-crit {
> >> +					temperature = <115000>;
> >> +					hysteresis = <0>;
> >> +					type = "critical";
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		cluster0-thermal {
> >> +			polling-delay-passive = <100>;
> >> +			polling-delay = <0>;
> >> +			thermal-sensors = <&thermal 3>;
> >> +
> >> +			trips {
> >> +				cluster0-alert {
> >> +					temperature = <85000>;
> >> +					hysteresis = <2000>;
> >> +					type = "passive";
> >> +				};
> >> +
> >> +				cluster0-crit {
> >> +					temperature = <115000>;
> >> +					hysteresis = <0>;
> >> +					type = "critical";
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		cluster1-thermal {
> >> +			polling-delay-passive = <100>;
> >> +			polling-delay = <0>;
> >> +			thermal-sensors = <&thermal 4>;
> >> +
> >> +			trips {
> >> +				cluster1-alert {
> >> +					temperature = <85000>;
> >> +					hysteresis = <2000>;
> >> +					type = "passive";
> >> +				};
> >> +
> >> +				cluster1-crit {
> >> +					temperature = <115000>;
> >> +					hysteresis = <0>;
> >> +					type = "critical";
> >> +				};
> >> +			};
> >> +		};
> >> +	};
> >> +
> >>  	soc {
> >>  		compatible = "simple-bus";
> >>  		interrupt-parent = <&plic>;
> >> @@ -494,6 +584,17 @@ syscon_apbc: system-controller@d4015000 {
> >>  			#reset-cells = <1>;
> >>  		};
> >>  
> >> +		thermal: thermal@d4018000 {
> >> +			compatible = "spacemit,k1-tsensor";
> >> +			reg = <0x0 0xd4018000 0x0 0x100>;
> >> +			clocks = <&syscon_apbc CLK_TSEN>,
> >> +				 <&syscon_apbc CLK_TSEN_BUS>;
> >> +			clock-names = "core", "bus";
> >> +			interrupts = <61>;
> >> +			resets = <&syscon_apbc RESET_TSEN>;
> >> +			#thermal-sensor-cells = <1>;
> >> +		};
> > Ok, so if I understand correctly the thermal is a SoC feature, so with
> > above it will be enabled by default for all boards, but for the convention
> > we usually disable it in dtsi file, and enable it at board dts level
> >
> > Please convince me doing above is better? as I'm not sure if there is
> > cases that user want it disabled (but could possible)..
> 
> I had two reasons for keeping the thermal node enabled in k1.dtsi,
> rather than requiring each board to opt in:
> 
> 1. Other SoCs follow the same pattern: the RISC-V JH7110 and Allwinner D1s
> both define their thermal sensor nodes and thermal-zones in the SoC dtsi
> without status = "disabled".
> 
> 2. Thermal protection is safety-critical, and the silicon trip points
> don't vary between boards. Leaving it disabled by default risks boards
> booting without thermal shutdown.
> 
Ok, sounds good to me, I will queue it unless objection from others

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
