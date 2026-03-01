Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE574FD0040
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 00:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+lpz3HrG/R1UAzVgAg0tQfOcnnqkEofqLALCUqcFCg=; b=QcQMppfHBIUffkxjFcFR8ab10z
	1GcO8Nai4Rsi4JZPhkFUL0YKxfgIKpiaJxaMFHYcEzJEQUa6sk9sSZs/2rdIeP+WeB9rIRuXvVDnt
	QKbJjVg5C2AFRntfZ7Pd4pC9VvgPviWw+LeKyrUhUwrE0oZ8QfBj2XOIdpKjMX9LCivHw6VpXlsE2
	GCDq6lBlTHYeI73bbdPePrWJWcE/fGY6PCDG+cmeyYfrsMdwJ5fuNkggvYTZ3uDXPR4wJneLKcBkm
	pYQQ7qkkLQuiO3G9ZEcxF57pVBa42NhYsIRdwhL7kFbfnWy508n0TTHSi+53+HGxceH64Irr6d6es
	YSK6vW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUKa-0000000AOLL-3JXQ;
	Sun, 01 Mar 2026 00:06:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUKX-0000000AOKv-1ZcX
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 00:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CE13437DD;
	Sun,  1 Mar 2026 00:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00133C19421;
	Sun,  1 Mar 2026 00:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772323598;
	bh=KVZEqxhqfMk2K5SJptsD55r8uz/Z6dnQu8CTdmkZpyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecUmek2wGXSZYFlYs9O3cHJy0vUDKiOsT5g8g0309rpdp0wQUFDqxuor7AsHBl0xx
	 RgiWeCQ9ZBnTjaM1MFDtTM6ti1LD3AawiA7RtWdhA+031B33wG4NDQlU4xLqsh0Hg4
	 YXNhoKpk3keT4kpkXt6aIuaInvFGEIGQ/iZ8LcFCwyTFcZJLDlt2Jxtkl/f+UjeIS3
	 BNEQEAgEsON0gA9lI3MzekYyCkt/h1ISaHvfsfqdAMV8T3xHbmjKuX2qma3CM3N0DI
	 ZMW5ZtFKItTwBUj9fsErDy14sZ2Zb8TdcUr3/0/urZf07t60rR8D4lX6fClkG3j54K
	 4AzhOcdQfRcXA==
Date: Sun, 1 Mar 2026 00:06:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, richardcochran@gmail.com, abin.joseph@amd.com,
	robh@kernel.org, edumazet@google.com, netdev@vger.kernel.org,
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
	narmstrong@baylibre.com, pabeni@redhat.com,
	Ryan.Wanner@microchip.com
Subject: Re: [net-next,v2,2/8] net: macb: rename macb_default_usrio to
 at91_default_usrio as not all platforms have mii mode control in usrio
Message-ID: <20260228-shopping-april-a8c4d2481cbe@spud>
References: <20260226-enjoyer-shock-e17f9dc7cbdb@spud>
 <20260228232600.4187398-1-kuba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260228232600.4187398-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_160641_463114_F81AF7F1 
X-CRM114-Status: GOOD (  38.57  )
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
Content-Type: multipart/mixed; boundary="===============7232596332179121022=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7232596332179121022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZXbF+PkoVTFGVgRa"
Content-Disposition: inline


--ZXbF+PkoVTFGVgRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Sat, Feb 28, 2026 at 03:26:00PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>=20
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-loca=
l.html
> ---
> net: macb: rename macb_default_usrio to at91_default_usrio as not all
> platforms have mii mode control in usrio
>=20
> This patch renames macb_default_usrio to at91_default_usrio to better
> reflect that the usrio configuration is platform-specific, and
> introduces a new capability flag (MACB_CAPS_USRIO_HAS_MII) to gate MII
> mode configuration code for platforms that actually support it.
>=20
> > diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet=
/cadence/macb.h
> > --- a/drivers/net/ethernet/cadence/macb.h
> > +++ b/drivers/net/ethernet/cadence/macb.h
> > @@ -779,6 +779,7 @@ #define MACB_CAPS_DMA_64B			BIT(21)
> >  #define MACB_CAPS_DMA_PTP			BIT(22)
> >  #define MACB_CAPS_RSC				BIT(23)
> >  #define MACB_CAPS_NO_LSO			BIT(24)
> > +#define MACB_CAPS_USRIO_HAS_MII			BIT(25)
> >
> >  /* LSO settings */
> >  #define MACB_LSO_UFO_ENABLE			0x01
> > diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/eth=
ernet/cadence/macb_main.c
> > --- a/drivers/net/ethernet/cadence/macb_main.c
> > +++ b/drivers/net/ethernet/cadence/macb_main.c
> > @@ -4614,13 +4614,15 @@
> >
> >  	if (!(bp->caps & MACB_CAPS_USRIO_DISABLED)) {
> >  		val =3D 0;
> > -		if (phy_interface_mode_is_rgmii(bp->phy_interface))
> > -			val =3D bp->usrio->rgmii;
> > -		else if (bp->phy_interface =3D=3D PHY_INTERFACE_MODE_RMII &&
> > -			 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
> > -			val =3D bp->usrio->rmii;
> > -		else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
> > -			val =3D bp->usrio->mii;
> > +		if (bp->caps & MACB_CAPS_USRIO_HAS_MII) {
> > +			if (phy_interface_mode_is_rgmii(bp->phy_interface))
> > +				val =3D bp->usrio->rgmii;
> > +			else if (bp->phy_interface =3D=3D PHY_INTERFACE_MODE_RMII &&
> > +				 (bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
> > +				val =3D bp->usrio->rmii;
> > +			else if (!(bp->caps & MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII))
> > +				val =3D bp->usrio->mii;
> > +		}
> >
> >  		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
> >  			val |=3D bp->usrio->refclk;
>=20
> Can bp->usrio be NULL here? The new MACB_CAPS_USRIO_HAS_MII capability
> gates the MII-related dereferences of bp->usrio, but bp->usrio is also
> dereferenced when MACB_CAPS_USRIO_HAS_CLKEN is set.
>=20
> With the change to default_gem_config later in this patch:
>=20
> static const struct macb_config default_gem_config =3D {
> 	...
> 	.usrio =3D NULL,
> 	...
> };
>=20
> A device that matches the generic 'cdns,macb' compatible string (without
> specific .data) will get bp->usrio =3D NULL during probe. If the device
> tree then has 'cdns,refclk-ext', macb_configure_caps() adds
> MACB_CAPS_USRIO_HAS_CLKEN without checking if bp->usrio is valid:
>=20
> macb_configure_caps() {
> 	...
> 	if (of_property_read_bool(np, "cdns,refclk-ext"))
> 		bp->caps |=3D MACB_CAPS_USRIO_HAS_CLKEN;
> 	...
> }
>=20
> Then in macb_init(), the code would dereference bp->usrio->refclk with
> bp->usrio being NULL, causing a crash.
>=20
> The MACB_CAPS_USRIO_HAS_MII gate only protects the MII-related
> dereferences above, not the CLKEN dereference.

AI makes a good point here, but in one way this isn't even a problem
with the patchset, it's actually another example of the sort of thing
that I am trying to get rid of from the driver. As far as I can tell,
this was added very recently, for the emac on sama7g5. The sama7g5-emac
sets this cap in its match data, as do several other devices, so this
code that sets the cap based on the dt property isn't needed.

I would like to get rid of setting the cap based on the dt property,
because it is inherently tied to how at91 have their USRIO set up.
Other platforms that want to use this external refclk might use a
different mechanism for the selection, or only support an external
source. What USRIO does is very platform specific, so it should be
something that is opted in to explicitly. I didn't ask for the property
to be bound to only the at91 devices that use it when I reviewed the
binding, because I figured other platforms might be able to reuse the
property and that's also why I didn't ask for a microchip prefix on the
property. For the driver to reflect that general use, it shouldn't then
do at91-specific things when the property is present.

Ryan, how does this property actually work now, given your removal
of the cap from match data was reverted? I feel like it just doesn't do
what you want it to do anymore? Before the revert, having the property
meant that the value in sama7g5_usrio.refclk would be written to the
hardware and not having the property meant that the bit would remain
unset. You then had to revert to avoid breaking old devices, because
your property changed the default behaviour for the emac, so now having
the property means that the value in sama7g5_usrio.refclk is written to
the hardware, but that also happens without the property because the cap
is set in the match data.

Unless I am missing something, should we not actually revert
dce32ece3bb8f ("net: cadence: macb: Expose REFCLK as a device tree
property") and 1b7531c094c88 ("dt-bindings: net: cdns,macb: Add external
REFCLK property"), and instead add a property like
"microchip,refclk-internal", because that would actually let you
override the default behaviour of the driver?

Cheers,
Conor.

>=20
> > @@ -4638,13 +4640,6 @@
> >  	return 0;
> >  }
> >
> > -static const struct macb_usrio_config macb_default_usrio =3D {
> > -	.mii =3D MACB_BIT(MII),
> > -	.rmii =3D MACB_BIT(RMII),
> > -	.rgmii =3D GEM_BIT(RGMII),
> > -	.refclk =3D MACB_BIT(CLKEN),
> > -};
> > -
>=20
> [ ... ]
>=20
> > @@ -5219,6 +5214,13 @@ static int eyeq5_init(struct platform_device *pd=
ev)
> >  	return ret;
> >  }
> >
> > +static const struct macb_usrio_config at91_default_usrio =3D {
> > +	.mii =3D MACB_BIT(MII),
> > +	.rmii =3D MACB_BIT(RMII),
> > +	.rgmii =3D GEM_BIT(RGMII),
> > +	.refclk =3D MACB_BIT(CLKEN),
> > +};
> > +
>=20
> [ ... ]
>=20
> > @@ -5432,7 +5448,7 @@ MODULE_DEVICE_TABLE(of, macb_dt_ids);
> >  	.dma_burst_length =3D 16,
> >  	.clk_init =3D macb_clk_init,
> >  	.init =3D macb_init,
> > -	.usrio =3D &macb_default_usrio,
> > +	.usrio =3D NULL,
> >  	.jumbo_max_len =3D 10240,
> >  };
> >
> --=20
> pw-bot: cr

--ZXbF+PkoVTFGVgRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaODBgAKCRB4tDGHoIJi
0gs/APwMsvBtZc3nBNGbarB8g1f0V6tvmTnFVzuAqsfj8G7v+gD9FLULicP6knc0
4MRq+EqCQo1OMd2KHGif/BwNCkzv9QU=
=GwKV
-----END PGP SIGNATURE-----

--ZXbF+PkoVTFGVgRa--


--===============7232596332179121022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7232596332179121022==--

