Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6B8C02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPX1CDEfojZoYrVFKK+cwf1T5qw63ARLxn+VxhBFhlU=; b=k0UBTBxGM2MMp1GRmixI7Qfy+X
	scNRm6qOXXy6bAXsOU2mseh2nQv4m3utYhCrylPrRuQDKXdYGh55KPopWWVLk8C9hPRjszYOiQGfr
	+Ph/FDLVBY7NvNTsWamEr7QS32ri3lxuHUYbDZgaczK1ggsB6AlGdIGTdA7bcpmQZK0IUUhHeGfn2
	+bca6kWwWpwotXpuuqZXLWpiIKa/z1jW3uAbCVEN4VXB58gseMxZpOayI9pyv9oK4C1Dc0m/QGOqX
	S540rFHgK8Anyc4iNxq7hXYa+RPjm02FcoPGy3zdkiLgFoemVv0XcIqYdpIPfepG03wOdcV/DfMlF
	+KkkondA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqPi-00000000zX1-1tv7;
	Fri, 17 Jan 2025 17:45:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqPg-00000000zWe-0THz
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 17:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6282DA432E0;
	Fri, 17 Jan 2025 17:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C845EC4CEE0;
	Fri, 17 Jan 2025 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737135942;
	bh=Mz5NCKx70+uO6/QkNUUZWJUoT4Xs/ZpF384Fs+9kMc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHH+oAAaTF/Diy9dsMYQdLKx/ZTGfWvGyE/W/OBJO18kmpAPjpMwFYP98B8kwPR7H
	 jnSNm+JgTk/Bll5mHA1C3uQ2hrND4Sq52l1jdTWh9OvXiXvHRiXClLxM56y0PbO/+q
	 cT4I0UPLcOJL5W9wI3qz8OX2RNODzSW/AtdbFVrbMyZVvkIrDnSMj7kN3AY6+FceoC
	 CJYRnv1Iyia8mx3Wy2Z5LLL0Tep0fUanyoI5jKWDzlb4ekQUiY7N4wjy3IcPJMoS1/
	 dJ9VZgt3p5xOGvdWb2pc2TieH5dWt37XeeX/uGvUvXlDDeKjFnvblbWKPQixCdKsge
	 iJa1erdF8uv8g==
Date: Fri, 17 Jan 2025 17:45:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Message-ID: <20250117-crabmeat-bondless-dfafc3947ad5@spud>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
 <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20250114-recollect-dictate-104e890d116e@spud>
 <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_094544_284144_20497945 
X-CRM114-Status: GOOD (  25.97  )
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
Content-Type: multipart/mixed; boundary="===============0286382749357016407=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0286382749357016407==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nZO9jY1X/rK0Hnfa"
Content-Disposition: inline


--nZO9jY1X/rK0Hnfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 10:58:39AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
> > >
> > >
> > > >
> > > > On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> > > > > StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP
> > > > > block that may exclusively use pciephy0 for USB3.0 connectivity.
> > > > > Add the register offsets for the driver to enable/disable USB3.0 =
on
> > pciephy0.
> > > > >
> > > > > Signed-off-by: E Shattow <e@freeshell.de>
> > > > > ---
> > > > >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > > index 0d8339357bad..75ff07303e8b 100644
> > > > > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > > @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
> > > > >  		pciephy0: phy@10210000 {
> > > > >  			compatible =3D "starfive,jh7110-pcie-phy";
> > > > >  			reg =3D <0x0 0x10210000 0x0 0x10000>;
> > > > > +			starfive,sys-syscon =3D <&sys_syscon 0x18>;
> > > > > +			starfive,stg-syscon =3D <&stg_syscon 0x148 0x1f4>;
> > > >
> > > > Why weren't these added in the first place? Minda, do you know?
> > > >
> > > The driver only require to set syscon register while the PHY attach to
> > > Cadence USB.(star64 board case) The PHY default attach to PCIe0, VF2 =
board
> > do not set any setting. So I don't set it.
> >=20
> > Does this mean that the change should be made in files where it will on=
ly affect
> > non-VF2 boards, or is it harmless if applied to the VF2 also?
> Harmless. The PCIe PHY driver still set the PCIe mode syscon setting.

Okay, I'll pick this up after the merge window, pending an Ack from
Emil.

--nZO9jY1X/rK0Hnfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4qXQgAKCRB4tDGHoIJi
0p1QAQDOc97ffM1e/1fJGMOaVC6IUDODv/yYpVo8VpnvC6oErgD/bXYe8nGxPBSh
OIyx9QhyHlbMqS85fozWlzYbKuBm4wM=
=QiEe
-----END PGP SIGNATURE-----

--nZO9jY1X/rK0Hnfa--


--===============0286382749357016407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0286382749357016407==--

