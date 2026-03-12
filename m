Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1888FFED2FF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmGdqbUP3DOE1OfvS1EXdKc9peg1m64hok+tLh2Tr/Q=; b=kcpfJwc49yfGpeBqG2Cz/RJ2pv
	x0TtmNXuP9JvtMJLMbAuTXByUgSaDAh2dOO81PnVsh9l3H0OtQYz9MD6vPe667f243DUfhXExdrir
	4tla+tY6W4ZvtxXz3DsKIRtKBiqZirq/Ku3O/FketTi0G/u8e3CUlNxM3jPas5rQHCPSchd9HuOcb
	LAKvIPbwa7nya4BU9k5ssgnNAEf4FhKMHQXhCx4WyJjagJLxIoWAryyMejyimEVYdDc+LVbGePPbc
	YAW3aIMMgtal6jeNDv+BOSZMXMTyZDP5lQzGoBNQumO1eFrXIcGyS9SkOT1X5pJEMIU4F1FvwVf6x
	6sJ3hDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dBZ-0000000Drfk-0kLd;
	Thu, 12 Mar 2026 10:22:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dBY-0000000Drfe-1KFN
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BF9160137;
	Thu, 12 Mar 2026 10:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7284FC4CEF7;
	Thu, 12 Mar 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773310950;
	bh=h9YSKRTZGF583NYryI301XnKTB+VY4d9eZcYTI6L0mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXvpD/36HWhV2uAFhkuL3LSram9ibN5VHQQFuIdI0m0rBaKsbneKQQcixQFgFyeGR
	 /ixKek6TghhDHQfK1toi4U8zUwd32mB7zh/FHRYI1qQH97AYgi8dp7q9I0Ty60SCFg
	 3pNGR20ixSJXmwSHC2wJL5Tap4s2uyDb5volkxAW4Y5YIVGt7z9TpYTLzrcJsZPtaz
	 jMJ/vdTC6kywXsyEGKMaAG6eBv+VJb0d9QbN1Unf7PnIdaW7cVQplCNrF/6D9aWKPk
	 Mszd/NZFisaur0v2WahAMwj1i6F8YXDCYY3mQJoqe0jWA730ku49FHPd6mqo5J+1I3
	 VZpuTIcy+ZBkA==
Date: Thu, 12 Mar 2026 10:22:23 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>, Ryan.Wanner@microchip.com,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH net-next v3 00/10] macb usrio/tsu patches
Message-ID: <20260312-fool-obsessed-3ba0a7c7cc37@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
 <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6842189307456065309=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6842189307456065309==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wg429xnLYxmYuNFe"
Content-Disposition: inline


--wg429xnLYxmYuNFe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:09:24AM +0100, Th=E9o Lebrun wrote:
> Hello Conor,
>=20
> On Tue Mar 10, 2026 at 6:17 PM CET, Conor Dooley wrote:
> > At the very least, it'd be good of the soc vendor folks could check
> > their platforms and see if their usrio stuff actually lines up with what
> > the driver currently calls "macb_default_usrio". Ours didn't and it was
> > a nasty surprise.
> >
> > Theo, you added eyeq5 recently. Does it genuinely have the same usrio
> > bits as the at91 devices?
>=20
> Sorry I missed your direct mention. After checking (because I completely
> ignored this part of the code before), the User I/O feature is disabled
> on EyeQ5 & EyeQ6H. It can be seen from DCFG1 BIT(9). It was invisible
> because the USRIO register turns read-only when User I/O is disabled.

Ye, my assumption was that on your platform and sifive it's not enabled
but didn't have the behaviour of np4 where accesses don't complete.

>=20
> 1. So I thought about adding runtime detection.
>=20
> 2. But then having eyeq5_config->usrio made no sense so I dropped it.
>=20
> 3. And then I thought that a config having usrio being NULL should
>    imply MACB_CAPS_USRIO_DISABLED to ensure we don't NULL dereference
>    the bp->usrio pointer.
>=20
> #1 is useless for EyeQ combined with #2 and #3, but it should be useful
> for the many compatibles that inherited the wrong default value of
> at91_default_usrio.

Yeah, that's a good shout. I never checked to see if this had a control.

> I am sending those three patches as a reply, feel free to pick them up
> if you consider them useful. They apply on top of your series and have
> been tested on EyeQ5.

Ye, I think they're a good idea. Thanks for sending em :)

--wg429xnLYxmYuNFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabKT3gAKCRB4tDGHoIJi
0thYAQDSnsVDrIoSK3oA+E80W/ccq+tdstmAM6a0wgF6piT8EgD/Vd4hV89FYGSa
JwJLyF8ZdrUYu6DQijMfSnjdpP6jcQA=
=ZCzG
-----END PGP SIGNATURE-----

--wg429xnLYxmYuNFe--


--===============6842189307456065309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6842189307456065309==--

