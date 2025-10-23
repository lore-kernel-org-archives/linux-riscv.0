Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D875CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgWZQ6bEf+U8wUJZ42uXy6Q1Ftdga5umVVheo3TjP3A=; b=TWU5faVq4txfLFvVJAjOSKSZD4
	QGUSa6LCeLCiDSy4Znk1DEj4lcXPXaVeoumNd64qi8rcNMtT8qQKWbDEbf7k7nbnucdMSVpetrjAC
	GbSO6iAicEQF/gQx6H0tQYj+nVFDbnyrsyxK4g0V76kBnXSDgQLK1ujCbUxx/ry1z9EqLL+i3kpnm
	ddgr3/4E9AV3PXtfQscKroP0madIbsxItbRBB1qJ4v6PTTCBgLkD63kP4mMSHUaiWLkZBamzDcFB3
	VxMZCAXzt+9kJgM67/8J7wtuNERch8iKMyRELYAASILoVDPVdJX2HzdxR4GOCnp11F3bkQJm6c2Kx
	F/KaWZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrMd-00000005edQ-44cU;
	Thu, 23 Oct 2025 09:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrMb-00000005ecR-3H2K
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 09:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 629DE452ED;
	Thu, 23 Oct 2025 09:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E09BC4CEE7;
	Thu, 23 Oct 2025 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761210725;
	bh=4fQns59QMA3pai7ttXXV7GO218fuxTEHJzSTkeLaOGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhXEyOTw+Nv0PVa1o3YFTeWUCdbHCgKh6zEBhmXkZKML+wiA+jidi6IpfvNu5N68g
	 TxHEYYUSNZnLmD2cj/nBirivk2DaLWkO6RSBh1vjJaRJdjvmqkQiCKPSqxuE4qt67j
	 Dapwxx1Xw3bePtz51R441Du2xHZMmOQ04QpMi9vrKJBA5m8BIbpwVFMGuCFM9AuI+4
	 rNedVDfDAWPLSXJS+V9rNuWuOHts8wsFtRVV43Ql08Quhg2X5YbkP/P4IIr0fOnyHo
	 ZGKbK6BQCiUulrW7bu+t8qttLuzzaX6ILOOTHJCy9oprUUo1ITCdrW71x9knp8XIn4
	 tW2MxbddPK5hA==
Date: Thu, 23 Oct 2025 10:12:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] soc: microchip: add mfd drivers for two syscon
 regions on PolarFire SoC
Message-ID: <20251023-lard-browbeat-daade890b4df@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-patient-matrimony-6162c8f92e2e@spud>
 <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_021205_855853_E25BAA3C 
X-CRM114-Status: GOOD (  10.44  )
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
Content-Type: multipart/mixed; boundary="===============2834964712447262869=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2834964712447262869==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KI7GN8NHbpEH6S+z"
Content-Disposition: inline


--KI7GN8NHbpEH6S+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 07:04:33AM +0300, Claudiu Beznea wrote:
> On 10/13/25 20:45, Conor Dooley wrote:

> > +}
> > +
> > +static const struct of_device_id mpfs_control_scb_of_match[] =3D {
> > +	{.compatible =3D "microchip,mpfs-control-scb", },
>=20
> This looks un-documented.

It is actually documented, this stuff all took so long to get done that
parts got applied piecemeal along the way, including any of the MFD
bits.

I'll fix these things up separately, cos I already applied the first two
patches here and just squash it in.

--KI7GN8NHbpEH6S+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPnxYAAKCRB4tDGHoIJi
0rJYAQCgpkpqZSL7x7t82+VYX7l3XaRLUIGDEYkTvHJp0wOEVAD/RFe9FOMiRRhm
r3FYvXwt1EoKcNCFEZiNkhB9BkaO5Ag=
=Eqsv
-----END PGP SIGNATURE-----

--KI7GN8NHbpEH6S+z--


--===============2834964712447262869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2834964712447262869==--

