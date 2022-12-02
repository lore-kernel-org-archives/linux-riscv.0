Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43283C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi40db6vMmdQGXBLA3zY4Q9jr8vr0fisF2a4bYZhcTo=; b=0qnUM/RRfn/zA+Rbni+M0OOSW8
	viARpxCYZMxuLRE07OS4MG21smjXNPif9OWXnlsPAGdoe78hzYU8w2KQXFnSZxUPbBTzfdoqWyM89
	+ucLAgiwH5ul2bazFV1y7avg5BKU8fjwx/kPIiWAglWBGvjKwgOrtTIJtKrQgYkNlGuvuF/ZCC9+y
	nSJMDFDVDVw2sC6G5sRpVD2Hns2oXFU2SI9ZKQ0xz4Z7pbdnnL2F3R993hPxU7flmpyQ5IYnLdc49
	YhMB2+S0Nvux6vRLSz1tuZWD/gcTL5JbOk6KfFVZfFyasnXtPfjaIVjP2pVDnSDbuiNhrT6uFB9ic
	+SpadKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14Mb-00G2qD-W9; Fri, 02 Dec 2022 11:37:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14MY-00G2oW-Tq
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 11:37:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D5C1B82142;
	Fri,  2 Dec 2022 11:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7995EC433D6;
	Fri,  2 Dec 2022 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669981067;
	bh=YewXzhIS8GyLTLE7PPwddgjQzKBIgxmttnLpVTqiblg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm++C5xa4tPbx5jWoaJN6Z8Gn8yBsULaVlvS9EenvDLj3tBu1qotBlqgpFc1GbYle
	 8p1RuOv+rUsLEpqOeE3OWHEA+9HqG4WI1jl7i8K5FTv0ljpjFH1un8Y2ZxIVxawpsy
	 oQaESvOXmVR3Vasytk9X1A0sZuejOt2fwx1nW6E/4yng19flUEsE5TCJQMkhvYxcAZ
	 TPVy7LvI/8NIHoZ7OrlSuFZXx5UCQpEgTAMj+xow5Kf42PHu6w0eC5rKA7WFI70dYR
	 ArknVmEAjSyjamVj8pp1S04Sn7EvIOrbrBircUFpB18pmVtSadfEfGGsYGtTZG3TRO
	 pxhBKT4qH59CQ==
Date: Fri, 2 Dec 2022 11:37:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, ajones@ventanamicro.com,
	aou@eecs.berkeley.edu, corbet@lwn.net, guoren@kernel.org,
	heiko@sntech.de, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation: riscv: add a section about ISA
 string ordering in /proc/cpuinfo
Message-ID: <Y4njhrGft++1rVRj@spud>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-4-conor@kernel.org>
 <Y4gZ/KZz9rdYj/0r@debian.me>
 <Y4hjIWHTuYcf90ja@wendy>
 <66b3fd78-31bc-c435-ccc8-c8682b3cacee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <66b3fd78-31bc-c435-ccc8-c8682b3cacee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_033751_285879_E265053F 
X-CRM114-Status: GOOD (  24.69  )
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
Content-Type: multipart/mixed; boundary="===============2233784000508795524=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2233784000508795524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q5Y2pBB/5VxqMAhM"
Content-Disposition: inline


--Q5Y2pBB/5VxqMAhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 09:14:08AM +0700, Bagas Sanjaya wrote:
> On 12/1/22 15:17, Conor Dooley wrote:
> > On Thu, Dec 01, 2022 at 10:05:32AM +0700, Bagas Sanjaya wrote:
> >> On Wed, Nov 30, 2022 at 11:41:26PM +0000, Conor Dooley wrote:
> >>> +#. Single-letter extensions come first, in "canonical order", so
> >>> +   "IMAFDQLCBKJTPVH".
> >>
> >> "..., that is ... ."
> >=20
> > Hmm, that reads strangely to me. s/that/which/.
> >=20
>=20
> OK.
>=20
> >>
> >>> +#. The first letter following the 'Z' conventionally indicates the m=
ost
> >>> +   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> >>> +   If multiple 'Z' extensions are named, they should be ordered firs=
t by
> >>> +   category, then alphabetically within a category.
> >>> +
> >>
> >> Did you mean "most closely related alphabetical extension category in
> >> canonical order"?
> >=20
> > I am not 100% sure what you are suggesting a replacement of here. I
> > think I may reword this as:
> >   For additional standard extensions, the first letter following the 'Z'
> >   conventionally indicates the most closely related alphabetical
> >   extension category. If multiple 'Z' extensions are named, they will
> >   be ordered first by category, in canonical order as listed above, then
> >   alphabetically within a category.
> >=20
>=20
> That LGTM.
>=20
> >>> +An example string following the order is:
> >>> +   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> >>> +
> >> =20
> >> IMO literal code block should be better fit for the example above,
> >> rather than definition list:
> >=20
> > Uh, sure? I'm not sure what impact that has on the output, but I can
> > switch to a pre-formatted block.
> >=20
>=20
> Something like ``foo``?

Not posting a v2 for another few days, but this is what I currently
have:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/tree/Docume=
ntation/riscv/uabi.rst?h=3Driscv-uabi_docs


--Q5Y2pBB/5VxqMAhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4njhgAKCRB4tDGHoIJi
0nG3AQDN11twX+XbGwoN9/XYbdJzgY33yW3WXUGANYI/mtCVIwEA91AUTZo73nDi
o+yCNCSVVUcFUSw6gPxGDo39EVTHCwQ=
=8KH2
-----END PGP SIGNATURE-----

--Q5Y2pBB/5VxqMAhM--


--===============2233784000508795524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2233784000508795524==--

