Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E69D3F07A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avIodkzqfv/Bb4KQTBoa9K+1qLt2yg/Y/0LckkNLfKk=; b=iqYS9QrXK2Qy9ZrWdpjU7HmuD3
	Gqwl9HUrY3al6ut1LMh09WQd5uSiaWnY9XPzlQlrVHDhyYPPjRPbUN9DkGsljh6OT3PxsjHKBpLjX
	i++AfrCOLXJPCkEZqtZIJyQ7Z4YV1poNsOLJElYhTfIjiOH5BEMF+PhklN4+6qD7onqbc9L11A+I7
	22LyLHxRtmxT+jUOKUWlwMHkz/Hwlyn4OqSyWr1MCPoa4WpzGGEBn3tlxS7cIECvBSoga1tIPG+/o
	je3y1H4rRvWej8BKCHiXFmBgMk2T+ML0CrbFqHdA6HeiOGcTKZxRwLJJ7KmT+sffEUC4EU1AhJ+Kr
	maQddTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl747-0000000GEWE-0gUn;
	Wed, 28 Jan 2026 15:02:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl746-0000000GEVo-2Uto
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:02:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EC9E600AD;
	Wed, 28 Jan 2026 15:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34C3C4CEF1;
	Wed, 28 Jan 2026 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612561;
	bh=OzclO5ndo/wL4JKiiZcq354jGTZGzW1qFKtfJyb0gAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOkEASV7ibh5p2CTehKsxUlE7iWPQh6t3N9IIV18m943CgEZsfVqkIH1Qcs/o130f
	 PvPAbMt0XeeM53VxPKmbpTTB7hPkatQ+GB71XvKQ47Eq/eXlt04RQ6TARr+i7Y2/Hd
	 +XgQKms/Sa75wU//zIu4QRijBigKycVuT6LoKjYbgA8UaKqMaK63ufodBzRPZtRCKs
	 GsGst1ucHn8JkHkdzc6Rci3Vz+YkCNlSpenNyXVPAkAq3eSeoUTvjDTqWDSHXeRVYv
	 mkV+DkqZujyVS1VFXeeJ1mkq7tJze8T3tSBxr3EcoT9k9F1wCwafKTsLzCYpPFR/1i
	 vs2fdXqG7tO6w==
Date: Wed, 28 Jan 2026 15:02:35 +0000
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
Message-ID: <20260128-duckling-confess-88e64fabe752@spud>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud>
 <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1079703725375096120=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1079703725375096120==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="br2m+ehppYMnSZbO"
Content-Disposition: inline


--br2m+ehppYMnSZbO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 05:39:33PM -0600, Anirudh Srinivasan wrote:
> Hi Conor,
>=20
> On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrote:
> > > Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> > > and resets. This block is instantiated 4 times in the SoC.
> > > This commit documents the clocks from the RCPU PRCM block.
> > >
> > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > > ---
> > >  .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 +++++++++++=
+++++
> > >  MAINTAINERS                                        |   2 +
> > >  .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++=
++++++++++
> > >  3 files changed, 187 insertions(+)
> > >
> > > +
> > > +  tenstorrent,prcm-rcpu:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Phandle reference to RCPU prcm, needed by other 3 prcms (PCIe,=
 MM, HSIO)
> > > +      as the control registers for the PLLs that drive these subsyst=
ems are in
> > > +      RCPU prcm's range
> >
> > This is pretty suspect sounding, if the PLLs for !rcpu are controlled in
> > the rcpu register region, why is it not a clock parent for the !rcpu
> > prcms?
>=20
> I saw another clock driver doing it in the manner I did [1], and

The example is using it just to check lock status, which I think is
different than what you've got here? What you wrote implies that the
whole configuration for these PLLs is in that register region.

> thought that it would make writing the bindings and the clock driver
> simpler. Each prcm node would have a single input clock (otherwise
> there would be a differing number of input clocks for each prcm node).
>=20
> What would you suggest that I do?

I suggest that you model the clock tree correctly in devicetree, even if
that makes things more complicated. One prcm node having more input
clocks isn't something to be afraid of, it should be pretty
straightforward to handle in both devicetree and driver, and is not any
more complicated than having to deal with the syscon phandle that you
use at the moment.

btw, where is the code for the !rcpu clock controllers? AFAICT, this
series only has the rcpu portion and I can't find the code that actually
uses the phandle. Why is the patch documenting stuff that has no user?

> This would also avoid having the clock tree in the driver contain
> multiple entries for some of the PLLs (one in the rcpu subsystem where
> it is defined and another where the same clock is referred with {
> .index =3D 0 }) which could become confusing.

I don't really understand what you mean by this. Can you elaborate?
If you mean that multiple clocks produced by the prcm would all use
index =3D 0 as their parent, that does not sound abnormal to me. Without
being able to see the !rcpu driver implementations, I can't even make
guesses as to what the clock tree looks like.


--br2m+ehppYMnSZbO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXolCwAKCRB4tDGHoIJi
0rw0AQCdOeRioPlgzz56UBWH3uR/Xsa7xMRZG6htp+xFGP3KfQD9HiJzVLnZWBa6
2Q+cUcXOAJr0fH9Po/fYWMqWfseCbgA=
=QOLe
-----END PGP SIGNATURE-----

--br2m+ehppYMnSZbO--


--===============1079703725375096120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1079703725375096120==--

