Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9DEF47CD0
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 21:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdHLm3HHIy1u5bSm+gwWV+UV15XzMmIR4ZowmMoBzMA=; b=pXXibhIuozggHMFbhMoGl1cM2v
	eOFotoKc8e2NAqawFZcVPOf9CQNQyNeH0uCqst6f8OGvdzbbspWnFaZqGlJWSg7HiByHQgTAn04Ss
	69nx+EXVbvRsBfX4aTJCK0/gKhqV26b1QyP4DmuiCDb0a/tj5bzVI+QGv6CZPNrVI5k/pVJN3ZeVx
	aNGWiW7fVhO9DAzTULH1qldC5f1bQlXBJm/TBhBM63H4EFVyoI3Pa+fKm6mqB2EwiMz8g8b1o9qip
	YpBzXf6Kc4NjGiD9rFdgcnlS03pKv1H/vtffIOuE+n02Mns4CWMoBVzHhr2d5SAKsP8AfNfL2i1K6
	9cpY06pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrw-00000002Ygh-0VJv;
	Thu, 05 Mar 2026 21:04:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFru-00000002Yfd-1eUU
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 21:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 950AB444A7;
	Thu,  5 Mar 2026 21:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD05C116C6;
	Thu,  5 Mar 2026 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772744665;
	bh=zazYrHvSYXwWZwTBCtNqw2NlYT9eCTVzZJ22WXvKDCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGKoGMdgvYrKL4azyYnKY5NxH9P4S6CjcZ/QDnmfafybQheYx2fgHJA5uqLHK9YLK
	 xDwoVDcBNO5n1mKPL8KdwtBHouaOg3Esaz9q6LaPuBuk+4MnBpAacbd8dmC1OEoWa6
	 NCpNzHdWqcC3SHEzEh8IgpfSoz7I9HW4+V2pwz4tcYc9XhRKoh64GpTFIMW2HP8ao2
	 qluUm7/Ppcaj23bW2B24+7eu1NzXxUTG0q+zAJuya7iNzflmo/Evqu/x54n2DiUzNf
	 5Ks/WzuSn9ulmMKWipomicKAXA9crK3HDDOe2ASq8486keMR9ceW3m915jaDfrEkj0
	 FtjWbkNhCoXMA==
Date: Thu, 5 Mar 2026 21:04:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Ryan Wanner <ryan.wanner@microchip.com>
Cc: Jakub Kicinski <kuba@kernel.org>, andrew+netdev@lunn.ch,
	richardcochran@gmail.com, abin.joseph@amd.com, robh@kernel.org,
	edumazet@google.com, netdev@vger.kernel.org,
	theo.lebrun@bootlin.com, pjw@kernel.org,
	Valentina.FernandezAlanis@microchip.com, krzk+dt@kernel.org,
	sean.anderson@linux.dev, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, alex@ghiti.fr,
	devicetree@vger.kernel.org, palmer@dabbelt.com,
	nicolas.ferre@microchip.com, vineeth.karumanchi@amd.com,
	claudiu.beznea@tuxon.dev, samuel.holland@sifive.com,
	daire.mcnamara@microchip.com, conor+dt@kernel.org,
	dave.stevenson@raspberrypi.com, linux-riscv@lists.infradead.org,
	davem@davemloft.net, conor.dooley@microchip.com,
	narmstrong@baylibre.com, pabeni@redhat.com
Subject: Re: [net-next,v2,2/8] net: macb: rename macb_default_usrio to
 at91_default_usrio as not all platforms have mii mode control in usrio
Message-ID: <20260305-chatting-immersion-1995ed2ddef5@spud>
References: <20260226-enjoyer-shock-e17f9dc7cbdb@spud>
 <20260228232600.4187398-1-kuba@kernel.org>
 <20260228-shopping-april-a8c4d2481cbe@spud>
 <a1e36563-0e74-48b2-ae02-813cb28fc931@microchip.com>
 <20260303-stardust-shaky-c8a757ec149d@spud>
 <1d35173d-b364-4c4a-a083-388d3bd27ce5@microchip.com>
 <20260303-speech-reversing-b3fdf4817798@spud>
 <cb782e55-29f9-46c5-8213-397202b326ec@microchip.com>
 <20260304-stardust-blade-c9ed766b041a@spud>
MIME-Version: 1.0
In-Reply-To: <20260304-stardust-blade-c9ed766b041a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130426_480447_F06334CA 
X-CRM114-Status: GOOD (  34.17  )
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
Content-Type: multipart/mixed; boundary="===============8750268556409485420=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8750268556409485420==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ze45Z7enXNcfXoL5"
Content-Disposition: inline


--ze45Z7enXNcfXoL5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 06:52:58PM +0000, Conor Dooley wrote:
> On Wed, Mar 04, 2026 at 09:13:39AM -0700, Ryan Wanner wrote:
> > > No, I don't think this is what I am suggesting. I am suggesting adding
> > > USRIO_HAS_CLKEN to the gem configs, and then modifying the usrio stru=
ct
> > > to have a member called something like "refclk_default_enable" and se=
tting
> > > it to true for emacs and false for gems. Then in init code somewhere,=
 we
> > > would do:
> > >=20
> > > 	if (property_present(refclk-source))
> > > 		if (property_read_string(refclk-source) =3D=3D "external"
> > > 			refclk_enable =3D true
> > > 		else
> > > 			refclk_enable =3D false
> > > 	else if (property_present(refclk-ext))
> > > 		refclk_enable =3D true
> > > 	else
> > > 		refclk_enable =3D usrio.refclk_default_enable
> > >=20
> > > Then later on in init, when configuring the caps, we would do:
> > >=20
> > > 	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
> > >=20
> > > 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
> > > 			val |=3D refclk_enable;
> > >=20
> > > 		macb_or_gem_writel(bp, USRIO, val);
> > > 	}
> > >=20
> > > Or maybe we just roll all that up together inside the !USRIO_DISABLED
> > > code.=20
> > >=20
> > > The code currently in macb_configure_caps() about refclks would be
> > > deleted.
> > >=20
> > > This would produce one property that works for both emacs and gems, n=
ot
> > > change any defaults for existing devices and retain support for whate=
ver
> > > devicetrees made it into the wild with your property.
> > >=20
> > > Does that make sense?
> >=20
> > If we are set to have an external and internal clock dt property than I
> > think we should just keep those if statements inside the !USRIO_DISABLED
> > code block just to keep it more organized and clean and keeping the
> > current HAS_CLKEN if statement be the fallback default case to set the
> > register bit value. Some thing like this:
> >=20
> > if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
> > 		if (property_present(refclk-source)) {
> > 			if (property_read_string =3D=3D "external")
> > 				val |=3D true;
> > 			else
> > 				val |=3D false;
> > 		}
> > 		else if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
> > 			val |=3D bp->usrio->refclk;
> >=20
> > 		macb_or_gem_writel(bp, USRIO, val);
> > }
> >=20
> > Would this be a good middle ground?
>=20
> I explicitly would like to make HAS_CLKEN represent the USRIO having the
> bit, and not ascribe behaviour to it, so that it is actually a
> capability. This is why I want to make the default a member of the usrio
> struct in match data.
> Also, the bit position depends on the usrio struct, which we both
> omitted from our pseudo code, which means that even knowing how to
> modify val depends on having HAS_CLKEN/usrio.refclk being set, so your
> fallback doesn't sit right with me - I am trying to avoid things writing
> to USRIO without specifically being told what it is writing to is valid.

Ryan and I have discussed this a bit more, and it seems like the
USRIO_HAS_CLKEN capability flag is also being used to represent two
different "features" entirely (turning on a xceiver clock and choosing
the refclk source), depending on which device the driver has been bound
to. The next version of this series will also split this into two
different capability flags, so that each actually does what it says on
the tin.

--ze45Z7enXNcfXoL5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaanv0QAKCRB4tDGHoIJi
0oz1APwMZmmb5uy3DhSTBfBlnKJpHeM0ls3Jfzyp65FAfq/XjQD+JmWDSVx6mbpG
EgKcXYMJlYa29W0FoQxDe2MkGzB5Qw0=
=hH75
-----END PGP SIGNATURE-----

--ze45Z7enXNcfXoL5--


--===============8750268556409485420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8750268556409485420==--

