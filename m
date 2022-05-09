Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB19CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnoBr43bNNK8bFjP8z9+ZwiYqZh49CRYd2k1+UKxgvw=; b=0QPEpZqy6P3J3w
	ncWB8FiPqQx41GzvuKekzhk/CfvEj6r0wTHVGIE1dMRW1t/Yd5Z8VPnL3gmwjSSJ4UASYenNuQSH0
	SLYMYBuY/N62CmntXsmma9KC78fzHcrg2IQeCG+9aPdgp72TLL30qsB/bnezKrfVf5nA2AZjfRV8y
	9bwH2E/zwakqsRrz5Al2CIZ/vM5hBkAmuYQ/fvO+ilbfljKLhyEDlV0cC7aCr01zrVz8TCBz7KE3G
	DjOEhpF9U3uWI3KAzWBa7lOANmAeo3sQ4+3H0qMBmMKJzjuVn9k/BkrA2RMpa6X4R46+rIJcTIo9C
	yoy3XsQzQZOtB40AdO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no37A-00EVOH-LE; Mon, 09 May 2022 13:07:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no375-00EVMg-1u
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 13:07:51 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1no36j-0006No-PZ; Mon, 09 May 2022 15:07:25 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 mail@conchuod.ie, Conor.Dooley@microchip.com
Cc: Cyril.Jean@microchip.com, Daire.McNamara@microchip.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, palmer@rivosinc.com,
 arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 8/8] riscv: dts: microchip: add the sundance polarberry
Date: Mon, 09 May 2022 15:07:24 +0200
Message-ID: <3665104.kQq0lBPeGt@diego>
In-Reply-To: <5de89e89-c30d-d9fc-4ef7-f4c0327a28e8@microchip.com>
References: <20220504203051.1210355-1-mail@conchuod.ie>
 <8060906.T7Z3S40VBb@diego>
 <5de89e89-c30d-d9fc-4ef7-f4c0327a28e8@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_060747_123518_4AC299FB 
X-CRM114-Status: GOOD (  34.28  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 9. Mai 2022, 13:24:12 CEST schrieb Conor.Dooley@microchip.com:
> On 09/05/2022 12:10, Heiko St=FCbner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am Mittwoch, 4. Mai 2022, 22:30:52 CEST schrieb Conor Dooley:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add a minimal device tree for the PolarFire SoC based Sundance
> >> PolarBerry.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>   arch/riscv/boot/dts/microchip/Makefile        |  1 +
> >>   .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 +++
> >>   .../boot/dts/microchip/mpfs-polarberry.dts    | 97 +++++++++++++++++=
++
> >>   3 files changed, 114 insertions(+)
> >>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fab=
ric.dtsi
> >>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> >>
> >> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/=
dts/microchip/Makefile
> >> index af3a5059b350..39aae7b04f1c 100644
> >> --- a/arch/riscv/boot/dts/microchip/Makefile
> >> +++ b/arch/riscv/boot/dts/microchip/Makefile
> >> @@ -1,3 +1,4 @@
> >>   # SPDX-License-Identifier: GPL-2.0
> >>   dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) +=3D mpfs-icicle-kit.dtb
> >> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) +=3D mpfs-polarberry.dtb
> >>   obj-$(CONFIG_BUILTIN_DTB) +=3D $(addsuffix .o, $(dtb-y))
> >> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi=
 b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
> >> new file mode 100644
> >> index 000000000000..49380c428ec9
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
> >> @@ -0,0 +1,16 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/* Copyright (c) 2020-2022 Microchip Technology Inc */
> >> +
> >> +/ {
> >> +     fabric_clk3: fabric-clk3 {
> >> +             compatible =3D "fixed-clock";
> >> +             #clock-cells =3D <0>;
> >> +             clock-frequency =3D <62500000>;
> >> +     };
> >> +
> >> +     fabric_clk1: fabric-clk1 {
> >> +             compatible =3D "fixed-clock";
> >> +             #clock-cells =3D <0>;
> >> +             clock-frequency =3D <125000000>;
> >> +     };
> >> +};
> >> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/=
riscv/boot/dts/microchip/mpfs-polarberry.dts
> >> new file mode 100644
> >> index 000000000000..1cad5b0d42e1
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> >> @@ -0,0 +1,97 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/* Copyright (c) 2020-2022 Microchip Technology Inc */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "mpfs.dtsi"
> >> +#include "mpfs-polarberry-fabric.dtsi"
> >> +
> >> +/* Clock frequency (in Hz) of the rtcclk */
> >> +#define MTIMER_FREQ  1000000
> >> +
> >> +/ {
> >> +     model =3D "Sundance PolarBerry";
> >> +     compatible =3D "sundance,polarberry", "microchip,mpfs";
> >> +
> >> +     aliases {
> >> +             ethernet0 =3D &mac1;
> >> +             serial0 =3D &mmuart0;
> >> +     };
> >> +
> >> +     chosen {
> >> +             stdout-path =3D "serial0:115200n8";
> >> +     };
> >> +
> >> +     cpus {
> >> +             timebase-frequency =3D <MTIMER_FREQ>;
> >> +     };
> >> +
> >> +     ddrc_cache_lo: memory@80000000 {
> >> +             device_type =3D "memory";
> >> +             reg =3D <0x0 0x80000000 0x0 0x2e000000>;
> >> +     };
> >> +
> >> +     ddrc_cache_hi: memory@1000000000 {
> >> +             device_type =3D "memory";
> >> +             reg =3D <0x10 0x00000000 0x0 0xC0000000>;
> >> +     };
> >> +};
> >> +
> >> +/*
> >> + * phy0 is connected to mac0, but the port itself is on the (optional=
) carrier
> >> + * board.
> >> + */
> >> +&mac0 {
> >> +     status =3D "disabled";
> >> +     phy-mode =3D "sgmii";
> >> +     phy-handle =3D <&phy0>;
> > =

> > nit: it makes it was easier recognizing the status if it's in the
> > same place all the time (for example as the last property)
> > like in &mmc below.
> > =

> > Though that may just be my preference ;-) .
> > The other option would be to adhere to stricter sorting
> > because right now status is neither in one place nor sorted.
> =

> My I had it in my head (and correct me if I am wrong please), that it is
> okay to sort the phys after the status. It doesn't matter either way to
> me, but there are plenty of dts that do it this way.
> =

> I don't care either way, so I am happy to change if those are bad examples
> to follow!

I guess which order to follow really is more a matter of taste and I
don't think there is a definitive rulebook on what belongs where ;-) .

Though from past experience I do know that it makes reading devicetrees
easier when you know which property to expect in which place - especially
when their number increases and right now you have status above here,
and below everything else in the mmc node for example.

In the end Palmer might not care that much about tiny odering
differences, but I do think following one scheme is definitively an
advantage over mixing different ones.


Heiko


> >> +};
> >> +
> >> +&mac1 {
> >> +     status =3D "okay";
> >> +     phy-mode =3D "sgmii";
> >> +     phy-handle =3D <&phy1>;
> > =

> > nit (1): same as above
> > nit (2): blank line between properties and subnodes makes
> >    everything more readable.
> =

> Aye, not wrong. I'll fix this regardless of what happens with
> the status ordering.
> Thanks,
> Conor.
> =

> > =

> >> +     phy1: ethernet-phy@5 {
> >> +             reg =3D <5>;
> >> +             ti,fifo-depth =3D <0x01>;
> >> +     };
> > =

> > nit: blank line?
> > =

> > Otherwise:
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > =

> >> +     phy0: ethernet-phy@4 {
> >> +             reg =3D <4>;
> >> +             ti,fifo-depth =3D <0x01>;
> >> +     };
> >> +};
> >> +
> >> +&mbox {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&mmc {
> >> +     bus-width =3D <4>;
> >> +     disable-wp;
> >> +     cap-sd-highspeed;
> >> +     cap-mmc-highspeed;
> >> +     card-detect-delay =3D <200>;
> >> +     mmc-ddr-1_8v;
> >> +     mmc-hs200-1_8v;
> >> +     sd-uhs-sdr12;
> >> +     sd-uhs-sdr25;
> >> +     sd-uhs-sdr50;
> >> +     sd-uhs-sdr104;
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&mmuart0 {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&refclk {
> >> +     clock-frequency =3D <125000000>;
> >> +};
> >> +
> >> +&rtc {
> >> +     status =3D "okay";
> >> +};
> >> +
> >> +&syscontroller {
> >> +     status =3D "okay";
> >> +};
> >>
> > =

> > =

> > =

> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
