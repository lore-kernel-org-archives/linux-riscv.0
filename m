Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3100FCCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ix3h5Mw64UXDHWni9h1BxsoJ/zZn2Cu7H+YN367XyHw=; b=wu4oxTbgPged/ImG8QzITflwz+
	J6OFLJzfGnVcxBseVtpB4XpmJzUS+fGh+nmkvwsSl5hG4zhiiOSe3Tr5IQYqRPRzVwl+DBDChkJcY
	lmvuF6W+JvDhAwYMwUPQP3WaVKnFBZH3D+GO66Hao3RqS3G5fvoIYbYduV6arEPbAdVp6DGfvZUWL
	y3WVzdMQPiiUJ7fCfOAC4aztbZfLKUCoSLnAtS/LKc1OsJtlVbq5xCoKeMX0/H7Je60ZeUR3agMC1
	9YWO1O0hgdTOogcxsxGCE+MQr21oeIsmVFN9kvSp0h/nM0701+YbdMKvFFp3g7488pqjw9YbtSv3f
	JXEgrNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBy2-00000008wS3-1LzP;
	Wed, 12 Nov 2025 14:37:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBy1-00000008wRr-2X08
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 14:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A7F260213;
	Wed, 12 Nov 2025 14:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0CBC4CEF7;
	Wed, 12 Nov 2025 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762958220;
	bh=kW69Kf9o5S8zAmla0BViTMcfmqbpqmg9hgv823cP6d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5Pc9sz3+/yovtxkLBKtBDwrYtuE5AOaF2kG5baEnDmGz+l1LUY3Folwf7QfBUXlL
	 2KTV8NPWmhhuGqOkSWcCKgV9Tlgfue44+27qLy+XgKwFGvk1FXBbeMpVWQ7vhbEmlX
	 UX8XgQfo3HqBViE6wQ4eBOsE2pH96zzUDG6eKGXvcm8KlZ67Ja//yPYLFR5nT/xE6m
	 Qx162FvNapub7pi0XPPg5URXNtkDBCDMxUZFyi/8r7Y0pwZOUqLjVXZgDhSuCsJnLI
	 C8sTZimywC032zzr+3DI7V1c46eiGPr55Wk3wqY8SvR24bMZkmZFC1WwvTon89HcIi
	 nKrHUvtzBEbFw==
Date: Wed, 12 Nov 2025 14:36:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Message-ID: <20251112-abroad-taps-a207a5850301@spud>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3683357925188933157=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3683357925188933157==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yw7K4rG5QeI0qQ6x"
Content-Disposition: inline


--yw7K4rG5QeI0qQ6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 05:54:09AM -0800, Emil Renner Berthing wrote:
> Quoting Hal Feng (2025-11-07 10:55:22)
> > VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
> > SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.
> >
> > Board features:
> > - JH7110S SoC
> > - 4/8 GiB LPDDR4 DRAM
> > - AXP15060 PMIC
> > - 40 pin GPIO header
> > - 1x USB 3.0 host port
> > - 3x USB 2.0 host port
> > - 1x M.2 M-Key (size: 2242)
> > - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> > - 1x QSPI Flash
> > - 1x I2C EEPROM
> > - 1x 1Gbps Ethernet port
> > - SDIO-based Wi-Fi & UART-based Bluetooth
> > - 1x HDMI port
> > - 1x 2-lane DSI
> > - 1x 2-lane CSI
> >
> > VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lit=
e/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
> > VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionF=
ive2Lite/VisionFive2LiteQSG/index.html
> > More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite=
=2Ehtml
>=20
>=20
> Hi Hal,
>=20
> Currently the JH7110 device trees are layed out like this, with a nice
> separation between the SoC description and board descriptions:
>=20
> jh7110.dtsi               # JH7110 SoC description
> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
>    |  |- <VF2 boards>     # Final VF2 board descriptions
>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
>    |  |- <Mars CM boards> # Final Mars CM board descriptions
>    |- <other boards>      # Other JH7110 board descriptions
>=20
> With this series it moves to
>=20
> jh711x.dtsi

Now that you notice it, why does this have an x to begin with, when both
users have jh7110 in them? Wouldn't to just be jh7110.dtsi for both?

> |- jh711x-common.dtsi
>    |- jh7110-common.dtsi
>    |  |- <jh7110 boards>
>    |- jh7110s-common.dtsi
>       |- <jh7110s boards>

--yw7K4rG5QeI0qQ6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRSbhQAKCRB4tDGHoIJi
0uCyAQD6iyco1k52HApf+TuleXVFcj9M+okHsL5PCeHgiR1lrgD+Kf0oe/4gPuR8
huqT5G5w/WaU0u5fU/kL21v/JrdjuwA=
=DBaw
-----END PGP SIGNATURE-----

--yw7K4rG5QeI0qQ6x--


--===============3683357925188933157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3683357925188933157==--

