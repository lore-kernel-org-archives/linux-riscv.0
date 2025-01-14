Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DE4E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEndu8dqZEhQnwrmYBNA9WKSn+aJsV800eFaRuLL0xA=; b=F1a0lozwtqIwA7QaHAVlj+iY0S
	LevYddS+Ss/1CwkLzAUyU05zGt9KikHOmQrq8GFndiAoNSwjvYa6iZSlMtpqxvo9vjIiJ/2VS2tq7
	Q68ScD7v1WL49HyQS9H7bNp+IeVoZCK6vFWxnLelsRciBrCQtTZH7ZDRkyvq6NHYy3cjsXlgoBnoS
	+dcGMoNmn4+jAMcfaNw8cAOxkFbeE/w0uDfOBG2okuwQbCvRdv+MRqqtNraFgwZ4UPiMIyQ8YTzJH
	R+fmneo/aNyem7zP8ubcHZjJZZNAS6awYU9SR7vO6SjVUi+0kBnUIJbS9VFcZXJgD2Qzqb/RdGWbf
	yZlTp88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmPz-00000009VrH-28gQ;
	Tue, 14 Jan 2025 19:17:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlOO-00000009MxZ-2odz
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA948A41A7F;
	Tue, 14 Jan 2025 18:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D11C4CEDD;
	Tue, 14 Jan 2025 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878315;
	bh=uBXQnziVlP1k5rM6iYlEXPJKkpDHL/qERalon7FwP3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVlOusamDxJN1SL1np1WBka1FO/6+7a1yNS+IRB612TyiciAs8hCdLgeoIbL2gaEh
	 3l7s+Tw8ErDVfzgRFi0FKSPYzb91n1f+7cbewIIElE78Mz+BzIqc7dd7zJND70b8qY
	 23pjcaDkwQeZ7mnZtIWAn8BNoZOlPmfRnBUrJtHSdqPtxjm2hljWQ5NT1xcZnqr0iW
	 C7cGMBp9tyu4Q5cbnYaRFrJfvsOtmFTsbjjfKcd5iFDY9eKNJaCLp2/KgwPP+ChPnu
	 lhytmmtFC1xKr6NVGYJCgp6aFGAGbzpyqV6qmYV9Z1hZCBKrV1/jjw2UNIi/thjV5U
	 ctsJowCM3nmOw==
Date: Tue, 14 Jan 2025 18:11:51 +0000
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
Message-ID: <20250114-recollect-dictate-104e890d116e@spud>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
 <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_101156_841286_082EA248 
X-CRM114-Status: GOOD (  21.33  )
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
Content-Type: multipart/mixed; boundary="===============6389785354037248419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6389785354037248419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zkMmGR8EqwgS0H6h"
Content-Disposition: inline


--zkMmGR8EqwgS0H6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> > > StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP block
> > > that may exclusively use pciephy0 for USB3.0 connectivity. Add the
> > > register offsets for the driver to enable/disable USB3.0 on pciephy0.
> > >
> > > Signed-off-by: E Shattow <e@freeshell.de>
> > > ---
> > >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > index 0d8339357bad..75ff07303e8b 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
> > >  		pciephy0: phy@10210000 {
> > >  			compatible =3D "starfive,jh7110-pcie-phy";
> > >  			reg =3D <0x0 0x10210000 0x0 0x10000>;
> > > +			starfive,sys-syscon =3D <&sys_syscon 0x18>;
> > > +			starfive,stg-syscon =3D <&stg_syscon 0x148 0x1f4>;
> >=20
> > Why weren't these added in the first place? Minda, do you know?
> >=20
> The driver only require to set syscon register while the PHY attach to Ca=
dence USB.(star64 board case)
> The PHY default attach to PCIe0, VF2 board do not set any setting. So I d=
on't set it.

Does this mean that the change should be made in files where it will
only affect non-VF2 boards, or is it harmless if applied to the VF2
also?

--zkMmGR8EqwgS0H6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4ao5wAKCRB4tDGHoIJi
0nL0AP4tkI2HO0ATW7TcIVGIb2mlhpZ8ZVcIBo227WoH3KCBCgD/dQ/WePMc2ft+
/1Nb9a/IDtAAuVL3adir9sq1W8OnBQw=
=2Tua
-----END PGP SIGNATURE-----

--zkMmGR8EqwgS0H6h--


--===============6389785354037248419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6389785354037248419==--

