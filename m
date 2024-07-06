Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572A7C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXD6m1JA2RChbOA4gmqUr1IzJJoWksNj44upSGHABEY=; b=dNwpi4DBM5L+WA
	RuQey9IDyr3CqiwahqtwVCaMJ+bF9ZjAPFNH5d7c7w9avl10iUp+/mb4WSeFjK69TmAjhaOL2+Acw
	XVBr9QmPk6HZz1sycOKxB0huqU1vOwPN8tpl16n8yWVXHrQmIsULpoSpNI8hplJODr4EnjC78RMvM
	K2fsHhD/W2WGFqF7glo9VWvOjpLwIpkj6qzum5700w52OyQXB1ujAQB7gn+NqUwCYwsZ7JKv+Laqv
	4nBjMhJLZzZjzMRlpwX8LcydYP6XP6ojDBBA3caig6dVV7Y97ZI386BUknWggVS30LIR65WUBPm7X
	7me0Ig+x5K8z0HnrAj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPx09-0000000HI0u-47OS;
	Sat, 06 Jul 2024 04:26:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPx07-0000000HI0W-0Run
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 04:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17082CE1B10;
	Sat,  6 Jul 2024 04:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9C9C2BD10;
	Sat,  6 Jul 2024 04:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720239973;
	bh=f0ndvVbMP0LaBSaQ3ruLNCD8tYgVYd2BI+1Id+KaYLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtVNHpI2baRakXQxPSwidR3TIIHKkrv9pb7FmavBT1d88S0aBiITsM2bHpOoiDDKc
	 2/iTCEtCO9e6vkIiN/c3Zuc0hyl/+0/aMoj9OUpkHrTmAzG3SArZiY8FJ1S2KlQZ5N
	 cJmNhHx4Bv2OjbAtucx131qJJlfP0tzT3FvbxkSGgE2dI1RmwpXSf+USl4Jj4PlBB5
	 d5Vtfi1dJFsO5gNKEegnPqnKG5dLti6Y3g+caNjFFbYv/gk46CTpy5QW6WEUh7JzQ5
	 TyxSRDF2hqoItIsFOxdLK0jYQ/6AbG92hfA/o74yCtid0izWFQJlFXsYkBUdC4tSIG
	 mq88O1+OHPiRg==
Date: Sat, 6 Jul 2024 12:12:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>
Subject: Re: [PATCH v3 08/11] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <ZojEEAdUwxPJwqIS@xhacker>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-8-12f73b47461e@gentoo.org>
 <Zoanxksn0nio4MPg@xhacker>
 <20240705063839.GA3042186@ofsar>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705063839.GA3042186@ofsar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_212619_558254_2A048DE6 
X-CRM114-Status: GOOD (  35.12  )
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

On Fri, Jul 05, 2024 at 06:38:39AM +0000, Yixun Lan wrote:
> 
> On 21:46 Thu 04 Jul     , Jisheng Zhang wrote:
> > On Wed, Jul 03, 2024 at 02:55:11PM +0000, Yixun Lan wrote:
> > > From: Yangyu Chen <cyy@cyyself.name>
> > > 
> > > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> > > 
> > > Key features:
> > > - 4 cores per cluster, 2 clusters on chip
> > > - UART IP is Intel XScale UART
> > > 
> > > Some key considerations:
> > > - ISA string is inferred from vendor documentation[2]
> > > - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
> > > - No coherent DMA on this board
> > >     Inferred by taking vendor ethernet and MMC drivers to the mainline
> > >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > > - No cache nodes now
> > >     The parameters from vendor dts are likely to be wrong. It has 512
> > >     sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
> > >     When the size of the cache line is 64B, it is a directly mapped
> > >     cache rather than a set-associative cache, the latter is commonly
> > >     used. Thus, I didn't use the parameters from vendor dts.
> > > 
> > > Currently only support booting into console with only uart, other
> > > features will be added soon later.
> > > 
> > > Link: https://docs.banana-pi.org/en/BPI-F3/SpacemiT_K1_datasheet [1]
> > > Link: https://developer.spacemit.com/#/documentation?token=BWbGwbx7liGW21kq9lucSA6Vnpb [2]
> > > Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi [3]
> > > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi | 376 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 376 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > new file mode 100644
> > > index 0000000000000..a076e35855a2e
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > @@ -0,0 +1,376 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/ {
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +	model = "SpacemiT K1";
> > > +	compatible = "spacemit,k1";
> > > +
> > > +	aliases {
> > > +		serial0 = &uart0;
> > > +		serial1 = &uart2;
> > > +		serial2 = &uart3;
> > > +		serial3 = &uart4;
> > > +		serial4 = &uart5;
> > > +		serial5 = &uart6;
> > > +		serial6 = &uart7;
> > > +		serial7 = &uart8;
> > > +		serial8 = &uart9;
> > > +	};
> > > +
> > > +	cpus {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +		timebase-frequency = <24000000>;
> > > +
> > > +		cpu-map {
> > > +			cluster0 {
> > > +				core0 {
> > > +					cpu = <&cpu_0>;
> > > +				};
> > > +				core1 {
> > > +					cpu = <&cpu_1>;
> > > +				};
> > > +				core2 {
> > > +					cpu = <&cpu_2>;
> > > +				};
> > > +				core3 {
> > > +					cpu = <&cpu_3>;
> > > +				};
> > > +			};
> > > +
> > > +			cluster1 {
> > > +				core0 {
> > > +					cpu = <&cpu_4>;
> > > +				};
> > > +				core1 {
> > > +					cpu = <&cpu_5>;
> > > +				};
> > > +				core2 {
> > > +					cpu = <&cpu_6>;
> > > +				};
> > > +				core3 {
> > > +					cpu = <&cpu_7>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		cpu_0: cpu@0 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <0>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu0_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_1: cpu@1 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <1>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu1_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_2: cpu@2 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <2>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu2_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_3: cpu@3 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <3>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu3_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_4: cpu@4 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <4>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu4_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_5: cpu@5 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <5>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu5_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_6: cpu@6 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <6>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu6_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu_7: cpu@7 {
> > > +			compatible = "spacemit,x60", "riscv";
> > > +			device_type = "cpu";
> > > +			reg = <7>;
> > > +			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > > +			riscv,isa-base = "rv64i";
> > > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
> > > +					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
> > > +					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
> > > +					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
> > > +					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
> > > +			riscv,cbom-block-size = <64>;
> > > +			riscv,cbop-block-size = <64>;
> > > +			riscv,cboz-block-size = <64>;
> > > +			mmu-type = "riscv,sv39";
> > > +
> > > +			cpu7_intc: interrupt-controller {
> > > +				compatible = "riscv,cpu-intc";
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <1>;
> > > +			};
> > > +		};
> > > +
> > > +	};
> > > +
> > > +	soc {
> > > +		compatible = "simple-bus";
> > > +		interrupt-parent = <&plic>;
> > > +		#address-cells = <2>;
> > > +		#size-cells = <2>;
> > > +		dma-noncoherent;
> > > +		ranges;
> > > +
> > > +		uart0: serial@d4017000 {
> > > +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> > 
> > no, this is not a correct hw modeling. The doc on spacemit says
> > all the uart support 64 bytes FIFO, declaring xscale only makes
> > use of 32 bytes FIFO.
> yes, I also noticed it's 64 bytes FIFO
> 
> > 
> > IIRC, 8250_pxa is a xscale uart with 64 bytes FIFO, so this should be
> > "mrvl,pxa-uart" or "mrvl,mmp-uart"
> 
> 
> for mrvl,pxa-uart, I think you imply to use drivers/tty/serial/8250/8250_pxa.c,
> which turn out doesn't work on k1 SoC, for the record, we need to adjust

Really? I just tried "mrvl,pxa-uart" with rc6, it works perfectly, and the FIFO
in the driver logic is 64bytes now. Am I misssing something or you never tried it?

>  drivers/tty/serial/8250/Kconfig to enable the driver for ARCH_SPACEMIT,
>  and change uart compatible to "spacemit,k1-uart", "mrvl,pxa-uart"
> 
> for mrvl,mmp-uart, I see two choices, one using 8250_pxa.c which has same result
> as mrvl,pxa-uart, another choice would using the driver of 8250_of.c 
> and it work as same as "intel,xscale-uart", I don't see any difference..
> 
> P.S: there is possibly a side problem that "mrvl,mmp-uart" from 8250_of.c doesn't 
> really compatile with "mrvl,mmp-uart" from 8250_pxa.c, but I think it's another story

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
