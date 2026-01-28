Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F29BD46BE1
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D12nLDJgMZ7ZY28cJZ11gjtrx4F9+WtZUIXE7+FGvxU=; b=XfHjN2IATPlKRzxv4wEAT3r2hl
	mvgjM8VVzzWFtHvAQd7IH6IcGia1fhQBDUWMndNQgrSSeJ5xw/cphmRsLlCFLFesP7S+UZqgYMV2W
	O0eyUujRHAHGBXaD0aI5LtEya0oc7qkc7U3wrI8yTO2npdhEtsMz3x8DnQC4uV/bObe263uBcxTn7
	KRseeC0Vg4wO3hmGfBoB8IzMkq9NoDKwxNxAhG6qnjlrjn5WRI/rBaupmLbEG9EQbxpWEF6ZtXADT
	iJmZAlWi24X2Iyt2lM8CbQnzL6SvNKfSeXxDsNEYSmaTd+AndAANNtOemm6uxffQRE6MHzevK40QC
	J2bhktVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9PU-0000000GV0G-0c2Y;
	Wed, 28 Jan 2026 17:32:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9PS-0000000GUzd-0iGJ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 17:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BBD360007;
	Wed, 28 Jan 2026 17:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA12C4CEF1;
	Wed, 28 Jan 2026 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769621572;
	bh=hI6NqofsXTOOPFq8DfXONvDZU0fg8MOdgkvelsOyIzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK56Y3Gx9Z3haf1058CMfTCwwZaPvIYCdL7tJI6/+9YpDKuZk9rj4/AXXcvH2/KLA
	 FAkq7nFqBDb2Lku2oDKC6wfRFt5p09yUBZZndYjU89xQm4SMo8+bJ8PHsk4p3cTK3o
	 5tlT7wGuY89NwE97zRCcysHg015ofI3FEPx+yO7jrWpL70ZOl8Su7pfPEUeAC5Blnd
	 VJvf7sw3vJbS5bAKJjrN1DbC7rD23FeXOF2DgVaEDUskZ2CVOrbRJV9rf/Ffex6om+
	 Bz7Zd+OWbWx2NENRvZjc7AkT6q4m7kGGnKPEDo1W70jiAFoceDBlIq+PtPBFAC+tQd
	 4yJowBm1u2l+A==
Date: Wed, 28 Jan 2026 17:32:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260128-nappy-repaint-e464d9964134@spud>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud>
 <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud>
 <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7586381829426023327=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7586381829426023327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VaO9E9H1PZRTiJNg"
Content-Disposition: inline


--VaO9E9H1PZRTiJNg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 09:42:42AM -0600, Anirudh Srinivasan wrote:
> Hi Conor,
>=20
> On Wed, Jan 28, 2026 at 9:02=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jan 27, 2026 at 05:39:33PM -0600, Anirudh Srinivasan wrote:
> > > Hi Conor,
> > >
> > > On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrote:
> > > > > Document bindings for Tenstorrent Atlantis PRCM that manages cloc=
ks
> > > > > and resets. This block is instantiated 4 times in the SoC.
> > > > > This commit documents the clocks from the RCPU PRCM block.
> > > > >
> > > > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.co=
m>
> > > > > ---
> > > > This is pretty suspect sounding, if the PLLs for !rcpu are controll=
ed in
> > > > the rcpu register region, why is it not a clock parent for the !rcpu
> > > > prcms?
> > >
> > > I saw another clock driver doing it in the manner I did [1], and
> >
> > The example is using it just to check lock status, which I think is
> > different than what you've got here? What you wrote implies that the
> > whole configuration for these PLLs is in that register region.
>=20
> Yes, it seems like that example actually needs one regmap for
> configuring and another for checking lock status of the PLL, but in
> our case only one is enough.
>=20
> > > thought that it would make writing the bindings and the clock driver
> > > simpler. Each prcm node would have a single input clock (otherwise
> > > there would be a differing number of input clocks for each prcm node).
> > >
> > > What would you suggest that I do?
> >
> > I suggest that you model the clock tree correctly in devicetree, even if
> > that makes things more complicated. One prcm node having more input
> > clocks isn't something to be afraid of, it should be pretty
> > straightforward to handle in both devicetree and driver, and is not any
> > more complicated than having to deal with the syscon phandle that you
> > use at the moment.
>=20
> Understood.
>=20
> >
> > btw, where is the code for the !rcpu clock controllers? AFAICT, this
> > series only has the rcpu portion and I can't find the code that actually
> > uses the phandle. Why is the patch documenting stuff that has no user?
>=20
> I haven't been able to completely test the clock driver for the other
> subsystems yet, so that hasn't been posted yet. One of the comments on
> the previous versions of this series was to document the complete
> bindings, so I've tried to document all the 4 PRCMs.

Right. Looking at the mail from Krzysztof, I suspect he meant to
completely document and explain the rcpu prcm, not all of the prcms (he
couldn't really know they existed, based on your v1, right?).
I'd suggest you drop the !rcpu stuff for now, and submit it when you
have the driver for them ready to go. That's typically what's done to
avoid introducing bindings that need to be changed once the driver
actually turns up, since as you say you've not actually tested the
driver for those prcms.

>=20
> >
> > > This would also avoid having the clock tree in the driver contain
> > > multiple entries for some of the PLLs (one in the rcpu subsystem where
> > > it is defined and another where the same clock is referred with {
> > > .index =3D 0 }) which could become confusing.
> >
> > I don't really understand what you mean by this. Can you elaborate?
> > If you mean that multiple clocks produced by the prcm would all use
> > index =3D 0 as their parent, that does not sound abnormal to me. Without
> > being able to see the !rcpu driver implementations, I can't even make
> > guesses as to what the clock tree looks like.
>=20
> In the clock driver, you'd end up having something like this
>=20
> static const struct clk_parent_data osc_24m_clk[] =3D {
>         { .index =3D 0 },
>  };
> .
> .
> static const struct clk_parent_data pcie_pll[] =3D {
>         { .index =3D 0 },
> };
>=20
> Both point to index 0, but one is for the rcpu prcm and another is for
> the pcie prcm. To me, this felt like it might confuse someone looking
> at the driver. But it doesn't affect functionality in any manner.

If you think it is going to be confusing, then move the bits common to
!rcpu and rcpu prcms to a file, with the unique bits in dedicated files
perhaps? It seems like they'd be fairly different even with your current
scheme and keeping them apart would aid readability of the driver in
either case?
You can do this extraction as part of adding the !rcpu code, that
doesn't need to be done for the rcpu stuff since the concept of "common"
wouldn't exist in upstream until the !rcpu stuff arrives.

Cheers,
Conor.

--VaO9E9H1PZRTiJNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpIPgAKCRB4tDGHoIJi
0tmCAQCMz9cz9NcVHW/eTtgHv1aT9fv3jwGM8BPCavOxD+K7rQD/RF1rQxdGKrMA
K3cTriOhZZtOkI7Vs6o/fkQVuU4cGA0=
=4sdL
-----END PGP SIGNATURE-----

--VaO9E9H1PZRTiJNg--


--===============7586381829426023327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7586381829426023327==--

