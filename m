Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48ACEE0AE7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKCWnPFP7cp6vzbb94YMsdVNZM5W2couODzfaimIGdY=; b=SoFpt+yFwQGm52m4mbWWB1kpyh
	2J/dkGDVNSDyw+krpPXS1M6Asvjod+IcxU66Kf7PFEivRSgs3vgcMf6WZJsJrVzkONInzI089VdLa
	4XLd9tfZLHqOD92TskvnYwU2ST/w7FQphYA0hBT5cc/jVN82g/a06a11KBClpURBTifUTs7N5skFe
	7XLr+mAZDdj2E0dED2v+nZzcqQq1P2EBJHw83YDXrpbF4ZQsmRBbbLYSNyxjN4wpgI1mfa31fmc0t
	Amfplbg4+BKHYxX0w2FbraDVwrjzMvNw+tiOwXZmGP6WkgKP6gAV0FJYlcKcpS6Tu3ptZF1jwy6Op
	nY2Tx05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojhP-0000000CYKp-1xiN;
	Sat, 07 Feb 2026 14:54:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojhN-0000000CYKg-3vqm
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 14:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 963406001D;
	Sat,  7 Feb 2026 14:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F089C116D0;
	Sat,  7 Feb 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770476052;
	bh=RFfl8gMPLYha6nVERWdbRdNuFFRlEftacWu5PZE7Ow8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRz3imbZXKljLoQRsrMI27f58kgGqZL1LQJPSlufrNrPQ4P2RzA8kyNUvO2x9HDxi
	 3+/b6z0VZfax178pfmVPw7ntVnURDncjdDQCAiuk0h4MIcBMUDkYpZ2iXYy8ccUCl0
	 v6ZZuOT0L3pIZhhWlFL7f6Zm9SK3Wc6MOFa9axJddTlTAplxCzqb1SCt9QhU/ZGeO6
	 jfyrJeKTD2TmzsYQKwBA9K8fapmSBtWQ4xWfMb3jFhamMqhTEoWS0OUVFzsTuTe5u2
	 1VH3S3vEYB3X40RKJakVlzznap6UGViXPZWHiKqNza69C66WNAdZu1TsyiBMBD1+NH
	 27V+760s/EJiQ==
Date: Sat, 7 Feb 2026 14:54:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
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
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260207-stifle-chowtime-8502c0a57f70@spud>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
 <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
 <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
 <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============7244119806376852218=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7244119806376852218==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHVaJZpxu2xKHNVj"
Content-Disposition: inline


--jHVaJZpxu2xKHNVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 07, 2026 at 10:37:02AM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2026 05:18, Anirudh Srinivasan wrote:
> >>
> >>> this version and I have mentioned this in the changelog in the cover
> >>> letter) named "tenstorrent,atlantis-prcm-xyz". The bindings document
> >>
> >> Where did you mention it? I went TWICE through it.
> >=20
> > Conor and I were discussing these in a previous series and were
> > referring to them as rcpu prcm and !rcpu prcms. I use these terms to
> > refer to it in "Changes in v4".
>=20
> There is no way I could have guessed it. If you remove a compatible you
> say "removed compatible" not "removed !rcpu".
>=20
> >=20
> >>
> >>> suggests picking a more generic name in this case, so isn't
> >>> "tenstorrent,atlantis-prcm" okay for that?
> >>
> >> No, because I don't want to keep guessing this. The docs clearly ask y=
ou
> >> to post complete bindings, which now became less-complete, but fine.

I don't think it actually is "less complete" without the other
compatibles. The non-rcpu prcms function differently to the rcpu prcm
(they seem to be consumers of clocks that the rcpu produces) and are not
supported by the drivers in this series. They're different devices and I
think should only be documented when support for them comes along. v4
had problems that were caused by trying to document them without
actually having driver support figured out.

> >> Then the next rule asks you to use compatible as filename. You cannot
> >> keep skipping the rules.
> >=20
> > I will add all the compatibles back, so there will be 4 of them named
> > "tenstorrent,atlantis-prcm-xyz". In that case is it appropriate for
> > the filename to be "tenstorrent,atlantis-prcm.yaml"?
>=20
> Yes


--jHVaJZpxu2xKHNVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYdSCgAKCRB4tDGHoIJi
0uoHAQCaCjMG/cpV7RHWl20TNwzsA3A4KKkeZmrUhJiHt4QHMQEAx/dKSWtHh9np
+LtAoExBU4w5bFzgofZEw3ZwR36quQY=
=qWUU
-----END PGP SIGNATURE-----

--jHVaJZpxu2xKHNVj--


--===============7244119806376852218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7244119806376852218==--

