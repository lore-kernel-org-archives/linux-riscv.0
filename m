Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9334A1125865
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMqQt58lc4lNb9OAEiTIg6gwEA0DAy186mgbQ4670qM=; b=yhGNMO/OAsAUHnW6qKYWH08pqb
	uFjsHrOJ/A9X+pgrsZSrWwT1C2t1EVMGCNy9+uY1Qad7J+S7P/Iz+o2lX+hIcyevatwqMGms816H1
	ZsPITRJr33IBTvzX8JCHzQqEZQBStPA0rPXMWWBVyrZ7shrZtGBsfTHkE8qpzWup/2eU5nMshf0Gh
	U2tJrNJlrALMFq7qxvci9udjPSEWYzYvtFoFyN31CwjLHWH8dr1t5zGIwzz2kQjuZyxwWRoElb43E
	2YNpRuP3elyyhknugWucRkUl/3ZKfzzbdcThYM3Pe3V4R9QlCVvbWQGJi6IMgO6WKZL/2fi4aGpO1
	VCpWV7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ODg-0000000CAHc-0C8t;
	Wed, 11 Mar 2026 18:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ODe-0000000CAHM-12ls
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 18:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A2556057A;
	Wed, 11 Mar 2026 18:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09ABC4CEF7;
	Wed, 11 Mar 2026 18:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773253421;
	bh=ocjt5vwimI3OcRNQ9GJF62QrRGoM9nphmFiMncx99d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jh0syDTuPGlCIJcW+M03biC9MD1BSrWIP3A2NTEUP1JrpKu0XGWIvH8BHRdDVrLYn
	 3H2pp19smANQGCSPcgA1+V6gOhXv5krWlLsv+qhHxaqH1A4sD7e4zyowAt0o5534el
	 NuqXR7txtu53ez9Cu5oPWoXaRoZP5LI6O6Ll47c1DjH1HkjdymQzGpT5Y36IClDnKa
	 z46tVvR9JXE6445EiXgQwHrITSwr95F8gdCYXu2ECyl00avt+ez7zJ3I2v81AGgLWH
	 G0sPyTeSzy3JScSirykSHS9TfGB0x2lCRL8lak2vEYkhrZs8a8MlFJ/cJtRalK0EHi
	 teSkdUvbeM6ow==
Date: Wed, 11 Mar 2026 18:23:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Abin Joseph <abin.joseph@amd.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com
Subject: Re: [PATCH net-next v3 03/10] dt-bindings: net: cdns,macb: replace
 cdns,refclk-ext with cdns,refclk-source
Message-ID: <20260311-scorebook-comfy-95dd9c18e713@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
 <20260310-sneak-handclap-c150d8f1236b@spud>
 <20260311-horned-dexterous-caribou-3a46fb@quoll>
 <20260311-rival-kerosene-81d12381d120@spud>
 <8f6eb4f0-50b7-4894-b990-98563f1e6b3b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <8f6eb4f0-50b7-4894-b990-98563f1e6b3b@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============3393363763013983784=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3393363763013983784==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YXCI42bSO6w3ujPD"
Content-Disposition: inline


--YXCI42bSO6w3ujPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 07:10:09PM +0100, Krzysztof Kozlowski wrote:
> On 11/03/2026 19:08, Conor Dooley wrote:
> > On Wed, Mar 11, 2026 at 08:00:54AM +0100, Krzysztof Kozlowski wrote:
> >> On Tue, Mar 10, 2026 at 05:17:10PM +0000, Conor Dooley wrote:
> >>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>
> >>> Ryan added cdns,refclk-ext with the intent of decoupling the source of
> >>> the reference clock on sama7g5 (and related platforms) from the
> >>> compatible. Unfortunately, the default for sama7g5-emac is an external
> >>> reference clock, so this property had no effect there, so that
> >>> compatibility with older devicetrees is preserved.
> >>> Replace cdns,refclk-ext with one that supports both default states and
> >>> therefore is usable for sama7g5-emac.
> >>>
> >>> For now, limit it to only the platforms that have USRIO controlled
> >>> reference clock selection, but this could be generalised in the futur=
e.
> >>>
> >>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>> ---
> >>>  .../devicetree/bindings/net/cdns,macb.yaml    | 39 ++++++++++++++++-=
--
> >>>  1 file changed, 34 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/D=
ocumentation/devicetree/bindings/net/cdns,macb.yaml
> >>> index cb14c35ba9969..a492357570edd 100644
> >>> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> >>> @@ -120,12 +120,14 @@ properties:
> >>>    power-domains:
> >>>      maxItems: 1
> >>> =20
> >>> -  cdns,refclk-ext:
> >>> -    type: boolean
> >>
> >> This is already an implemented ABI, so you cannot drop it even if some
> >> devices works fine on default. Instead please deprecate it and keep
> >> drivers backwards compatible for whoever is using it.
> >=20
> > The driver still will support it for those devices, but I don't see any
> > value in keeping the property about, even deprecated, when it doesn't
> > work properly. If you insist that it be kept and marked deprecated, it
>=20
> There cannot be an undocumented ABI, so if driver has it, it must stay
> in the bindings.

Right that's something I should have considered.
I'll keep it so.

> > needs conditional rules to only permit it on devices that it actually
> > does something. I'm surprised you even considered that I would drop
> > support for it from the driver!
>=20
> Commit msg suggested it is no-op, thus could be dropped without having
> impact?

Nah, it's not an NOP. Commit message maybe reads that way because I was
trying to avoid mentioning the driver implementation details. I think I
could do a better job talking about sama7g5-emac versus sama7g5-gem in
the commit message, which would show that the current property has a use
case, just not as broad as it was intended to be.

The existing property was added along with a driver change that modified
sama7g5-emac which had a default of external to default to internal instead,
and the property could be used to switch to external. sama7g5-gem had a
default of internal, so this change was done to make things uniform and
allow a single property to work for both devices.
That driver change was reverted to maintain backwards compatibility, so
the property became useless on sama7g5-emac, and there's currently no
way to make that device use an internal reference.

What I am doing here is probably what cdns,refclk-ext should have been
originally, but when the driver's defaults got reverted the whole series
probably should have been reverted so that Ryan could try again with a
new approach. Instead, the property went into a release but only works
on sama7g5-gem.


--YXCI42bSO6w3ujPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabGzJQAKCRB4tDGHoIJi
0vCKAQD8vsxMfMy5RvKzSgT1fRpIcjv03CKilR+jGFr3/HLlTgEA64rdr8VMBJs4
eFowRGumLH0nAesDGQeGPAGCeLfVvQg=
=Z2PE
-----END PGP SIGNATURE-----

--YXCI42bSO6w3ujPD--


--===============3393363763013983784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3393363763013983784==--

