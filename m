Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270A2CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeSABKsBWIeewvmpOu1Idtvn+nnV9FyVR3Rn4kA3Vkk=; b=gV9JrHoiEdLS7ezRduv7DkylgI
	E9qtQQnyQGfCC8Ynk7yA5QZq3MtEt2LIBS2LNWXp47l7TjRO088/a6+ZUMfdHONMIiN8o8C/CnMIG
	g2znBmhBZrewcfbCI6xw3Y6Dp2coZ799II0/cS2SmDuuI2BCfiesnkeuBFmzoDNcLxa48nVAwCVC2
	c+NoBtmaO2OB3YqikmAxvZnaQB+5t2UrxmfSM+t/VTUaYDVGilraO1QgyuquEV4BnhxfMOXBASAcq
	1FYmYmuvHeNR34tmrem3DAfMWfVPZPdpr2iJ+xE88q2fbkShVeBat/ZqpuZHqhAcsv0enN9V7do89
	J8iOu6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EFA-00000008hvq-0R3H;
	Fri, 10 Oct 2025 14:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EF8-00000008hvk-3vZh
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 14:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B83B6020F;
	Fri, 10 Oct 2025 14:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39795C4CEF9;
	Fri, 10 Oct 2025 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760107034;
	bh=s/1cm3JtYs5oFJ7ybMcIXXvPPIeswgT6HbhP7HdsLJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzpCnfxA91/9uTAy29Ij61WOSsOPL5h11bGJehLK9LoDegETCJQ8aTA5SIaE8fRzq
	 wQjBlh1I4Npgxym4g7S39hi1vVvu2q4QPH+mqWjqgpPQUO9wjSseZSXLvRtXeaG3Un
	 Gp2wzVarGSYj/aPHsiXa4PuT5/pF9fVscqazK2UK7m5yHpiwo85WqsXOoNM/X+0neH
	 9n6oklNfOegosMo+DNDofPenM6dNfl/bEjpn6pRRKXTOavydJKmZYnYea8NAqvsYti
	 1vX6JNb6vXlZYRYbtUDHH4t3otZ4gIgbnAj1ykrWZ+aDlAbYi2JrKk94xYRQWrhEeq
	 +29IiRA8Dyruw==
Date: Fri, 10 Oct 2025 15:37:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
Message-ID: <20251010-confider-raven-0ad7a810e5de@spud>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
 <59657BBB86F7B678+aOilnA5Z-QL7xF9O@kernel.org>
MIME-Version: 1.0
In-Reply-To: <59657BBB86F7B678+aOilnA5Z-QL7xF9O@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============3349929766419812191=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3349929766419812191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tSrRefdJZc0Wu8hp"
Content-Disposition: inline


--tSrRefdJZc0Wu8hp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 02:20:12PM +0800, Troy Mitchell wrote:
> On Fri, Oct 10, 2025 at 02:13:31PM +0800, Vivian Wang wrote:
> >=20
> > On 10/10/25 09:56, Troy Mitchell wrote:
> > > MusePi Pro features a single RGMII Ethernet port with
> > > PHY reset controlled by GPIO.
> > >
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 ++++++++++++++++=
+++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/ri=
scv/boot/dts/spacemit/k1-musepi-pro.dts
> > > index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e=
467677290bdaeffc845 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > > @@ -47,6 +47,29 @@ &pdma {
> > >  	status =3D "okay";
> > >  };
> > > =20
> > > +&eth0 {
> >=20
> > For node orders in board DTS for SpacemiT devices, usually we follow
> > node name order because there's no unit address to go off of here, so
> > for what we have here it should be emmc, eth0, pdma, uart.
> >=20
> > See e.g. arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts and previous
> > discussion [1].
> Thanks for you point out!
>=20
> >=20
> > Also, personally I think it would be fine to just add the whole
> > k1-musepi-pro.dts in the same patch instead of splitting it up like
> > this. I feel it would be easier to manage this way. For previous devices
> > these nodes have been added piecemeal mostly because the drivers were
> > being developed in parallel, but if you're going to base this on
> > v6.18-rc1 there shouldn't be dependency problems.
> >=20
> > Maybe Yixun can chime in about this as well.
> We have talked here [1]
>=20
> Personally, I think splitting them makes the commit history clearer.
> I'm happy to merge them if others also think it's more appropriate.

tbh, I don't think it makes much sense to add it piecemeal, you'd then
end up potentially with dozens of commits for new platforms later in the
life of the SoC.
When you're adding new boards, add them in as complete as possible a
state from the beginning.

--tSrRefdJZc0Wu8hp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOkaFAAKCRB4tDGHoIJi
0mnmAPoDrRy1juQYH/xYfmDSBCYLSewyZWxEtBQHGn6txXcfdgEAsgoGn6FXGi20
NYtBXo7ojNi8Sje/vnE6muxgoX7MOA4=
=oUEM
-----END PGP SIGNATURE-----

--tSrRefdJZc0Wu8hp--


--===============3349929766419812191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3349929766419812191==--

