Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C9AC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR3DqxqrwqgB1Pg2FMuUH4ewvfHCQ40vThBgroU9/IU=; b=LwzFyqpNTHGRI6
	vSnh2pzBLQnV4Qg/hhDlmEpnw/OBO9Om1VSMxoHDBoRmonpLrR4Dl3YsB9O8COBsS9ZU6IoKQLr3q
	SmfjnAa3Lmm6s5UriaW9sKoyozTnWTUh7yIdxNMBP4cDsj6RXPohjUAg4nWD2p1mhFXwgHRE0ENiE
	2ZPT6xQ1juy+tvcRXJuFveCfJdmEARyjiXwyrbGlhPvupn8GEfQaWT6A8fHehp3FVnUVyWCrNFeD0
	P1otBoHqkwiSaTojD6WqatrmktL6Ins4LhFNWcdRtWQPORSTpsM6tXx4Bod6aWI8yfPOsd80SnFiu
	MkfgriZ3yv2WTawtUxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fjW-003XQa-2I;
	Sun, 21 May 2023 09:52:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fjT-003XPz-1l
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:52:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8F1260C61;
	Sun, 21 May 2023 09:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3937C433D2;
	Sun, 21 May 2023 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684662726;
	bh=sF3fGO7U/xMB1sIbnknNsRZycdV/4okIPZSR/hPio8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bK1LHT/YeUymJe+bmviXtp5mkVbBYHgww5sdBnnL4Aq3MazisAdOr9Eoh9KjEMT46
	 82WZxC27NLxnfDCkF9uoXRKThZaEhEGRvOijdZfL3Dg9LC1nfZK4cFX/gkotJdEUqF
	 BMzsUHQEJzUnp2QhLRs4Ze0sRtWnRRogDb91smVpGALFwHdfzyNnP2k8Fn8So76cOl
	 q+EWVBh/+JWPenfQAEbGuV8TdVl/u62JI0TJ+OdcfqdjeEVk36Elutf1GOsSV6uA4c
	 Sq+ugXJhR8kJJ/yqcmmmsut0OYwKWo1L0eBpsipjXsXR7qLebKKv0sCH4uncaIZc0G
	 IGU00kotUCwRw==
Date: Sun, 21 May 2023 17:40:53 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v4 08/10] riscv: dts: bouffalolab: add Sipeed M1s SoM and
 Dock devicetree
Message-ID: <ZGnnJXWxSv2/p87Y@xhacker>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-9-jszhang@kernel.org>
 <dfa99943-3bca-ec6d-7152-fc6465181a08@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dfa99943-3bca-ec6d-7152-fc6465181a08@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_025207_672021_BAAEB861 
X-CRM114-Status: GOOD (  24.37  )
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

On Thu, May 18, 2023 at 10:55:21PM -0500, Samuel Holland wrote:
> Hi Jisheng,
> 
> On 5/18/23 10:22, Jisheng Zhang wrote:
> > Sipeed manufactures a M1s system-on-module and dock board, add basic
> > support for them.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                  |  1 +
> >  arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
> >  .../dts/bouffalolab/bl808-sipeed-m1s-dock.dts | 25 +++++++++++++++++++
> >  .../dts/bouffalolab/bl808-sipeed-m1s.dtsi     | 21 ++++++++++++++++
> >  4 files changed, 49 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
> >  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> >  create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > 
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index f0d9f89054f8..133e6c38c9b0 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  subdir-y += allwinner
> > +subdir-y += bouffalolab
> >  subdir-y += sifive
> >  subdir-y += starfive
> >  subdir-y += canaan
> > diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> > new file mode 100644
> > index 000000000000..5419964e892d
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > new file mode 100644
> > index 000000000000..aa6cf909cd4d
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "bl808-sipeed-m1s.dtsi"
> > +
> > +/ {
> > +	model = "Sipeed M1s Dock";
> > +	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bouffalolab,bl808";
> > +
> > +	aliases {
> > +		serial3 = &uart3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial3:2000000n8";
> > +	};
> > +};
> > +
> > +&uart3 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > new file mode 100644
> > index 000000000000..5026de768534
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "bl808.dtsi"
> > +
> > +/ {
> > +	compatible = "sipeed,m1s", "bouffalolab,bl808";
> > +
> > +	memory@50000000 {
> > +		device_type = "memory";
> > +		reg = <0x50000000 0x04000000>;
> > +	};
> 
> Especially since the SoC contains three heterogeneous CPUs, the firmware
> may want to divide the PSRAM among them, so I do not think it is a good
> idea to define this statically. (Or would all of the DTs contain this
do you want the bootloader/firmware e.g uboot to add the memory node
dynamically?

But to be honest, nowdays most SoCs contain some heterogeneous CPUs, and
in real products some of those CPUs need to use DDR memory.
FWICT, their dtbs(in arch/arm64/boot/dts/...) still define the memory
statically. I believe this is acchieved by dynamically update the memory
node of DT. This solution doesn't make obvious difference with the uboot
adding memory node solution.

> same node, and then use reserved-memory nodes to cover the other CPUs'
> allocations?)
> 
> Regards,
> Samuel
> 
> > +};
> > +
> > +&xtal {
> > +	clock-frequency = <40000000>;
> > +};
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
