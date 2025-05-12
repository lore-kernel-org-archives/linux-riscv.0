Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4780DC3ABCD
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OM4DgBpObMUrjnuuYU7ir9/s5Tdr5HCKjzTdxTzRaw=; b=akE8egisP36x8SUtm2iY62Frlj
	jJtLXK9h1ikVKg+SpoeCRWCmsVXbjqApovDa/DZYHB8xelrEg2VmloFvZu1Ha+0mgAqna8yfy7FCY
	lFYtCBEEHWCcgvwIURkAMkFpiPdhM4ab5x4BPOF1TO2OD3unTdNZGSrhtQ11d96nMKXtOgq+OhGmN
	gSCB+FHCYjQ/q+RnZ5woJJvUImYrfclkPNdMWjiAnoYaXt/F7w+ZMBhTnhDMtZ9gckmQ5m+yxXehj
	I2RbEgG77G0ptzA7M0SYtFgxG83aQED9Ko3+ifpHfN0l0rtQ8IlezISrYUDHKknVN8m1w5VvnrpbZ
	KaSRXjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERDg-00000009Eov-14kN;
	Mon, 12 May 2025 11:21:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQth-00000009Bno-06hK
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 11:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DBE0A4CA76;
	Mon, 12 May 2025 11:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD321C4CEE7;
	Mon, 12 May 2025 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747047635;
	bh=3CUeLBiq43ESS07ytjkjdkGSrLDtW10YLcITOlNk0Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0BaDP0x3WYI5lv7vmNU8AMs6gtkYE2dUP0ykAHciRG9tYSCsCICTSaYaxeO8xytD
	 wujdXaZOCugbAv+NZ7Pc5vRAou8ssrkOHgDPAVf52G0d2RXxR5H1AgjMZ0iefRz/38
	 LpRCf3Ap2ijHsvu35NFPnf/w8b0aQMLRA1kJlPr9uYgEUbn6IE68VJWSiomXOKjypS
	 FsQXGs551zVyQwg+XBgvt1fJjyXg0tkj9PszzDYtvjuzC7FswuFsLvksk5IJFXH24D
	 d0M3mec49KJdrJ03MYJYPsmfmhPBXUVeMfp0Vz8ACRQpMizJ7hYeZi54QIMrpKRRzU
	 WpRYVY9KnLSng==
Date: Mon, 12 May 2025 12:00:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Hu <nick.hu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
Message-ID: <20250512-popcorn-clustered-7ab2c57c7f39@spud>
References: <20250509021605.26764-1-nick.hu@sifive.com>
 <20250509-small-graceful-limpet-d0ea41@kuoka>
 <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
 <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
MIME-Version: 1.0
In-Reply-To: <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_040037_124752_E99765C1 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: multipart/mixed; boundary="===============2231008694158113121=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2231008694158113121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rEAzhEWO5LPl9b4j"
Content-Disposition: inline


--rEAzhEWO5LPl9b4j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:39:37PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2025 05:20, Nick Hu wrote:
> > On Fri, May 9, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
> >>
> >> On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> >>> SiFive Domain Management controller includes the following components
> >>> - SiFive Tile Management Controller
> >>> - SiFive Cluster Management Controller
> >>> - SiFive Core Complex Management Controller
> >>>
> >>> These controllers control the clock and power domain of the
> >>> corresponding domain.
> >>>
> >>> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> >>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> >>> ---
> >>>  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++=
++
> >>
> >> Where is a patch with the driver (user of the binding)?
> >>
> > We are hoping the driver can be submitted at a later stage.
> > The driver that handles the MMIO is implemented in OpenSBI and depends
> > on some prerequisite patches [1], so it will follow afterward.
>=20
> This patch alone makes little sense and brings little benefit. Post this
> with user.

Unless the justification is that they're submitting a driver to OpenSBI
that uses this binding, but in that case link it in the commit message
and explain.

--rEAzhEWO5LPl9b4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCHUzwAKCRB4tDGHoIJi
0scJAQDCCNZPASUEEC0yp7XmtvMCNjrvSTAqlpkpw56Mt5WVggD/f3/eerb2ZMfz
pnUobj4FK/24InsyO75VNNGPP8KTHgU=
=Z7nY
-----END PGP SIGNATURE-----

--rEAzhEWO5LPl9b4j--


--===============2231008694158113121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2231008694158113121==--

