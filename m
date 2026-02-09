Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A8EE7E0D0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AhiZ/ID7URWsEofSgDW7DafwKtxFOmtbmpMI907qrk=; b=310YpVhzsttNdOMVFtwN1weND0
	NPr1l9zmjDEMGyZjXnX5pL6BJwwDw5e/k6Pa+vWRgkuTEVSE0cbkR755pwPMKHtbXLYpfjhmRErX6
	KxL+9fix/EOn24DhYK8XvtZyeFp8I9hvoN+Sdg4U2829PWyYVa/jPkdbY2sWkZ0Iz8C7vNbJfyc+s
	ECz5PtK7rjNcyD5SDWUTrcxUuQ/COqe5ZwggI8inNW+AumyLogykezOrotaCVjBd68uMvhVm4SjO3
	LrvB/OqdiHs3OzBPYlTsjYUXoBTR7gA0YMtFpMMtjfgH5thFObYGIy2h7YzFrR2t60VVlwK6S8cd+
	6SrOXzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWP4-0000000Ft1c-22CJ;
	Mon, 09 Feb 2026 18:54:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWP1-0000000Ft0z-31wF
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 18:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A9EE433AD;
	Mon,  9 Feb 2026 18:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B4FC116C6;
	Mon,  9 Feb 2026 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770663270;
	bh=MrBkziRbJS86DaZ8nygHl1jop5eq6BoFgyTkgCQFQmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJHMt6Zb425EX9+bYEdJ3EqK9m0W+BlyWN8BlOvSZ+ZkFePXMRN5npOu37rS1/RNy
	 l6v5HDFdW7SLKDnkRe5yS1+pPP1hFdjGYc/ytJ9gVYktuV7qBwfLwCs8aM7W6PWpTW
	 yQMzqsoCtgCgjCNeBIfdRMLsZAucORkbdZK/3MYN2r3XKixU35xng7uczAgBP7aEDG
	 ezBAQV8tZgs7508Y0NEEL5VGel/BR2hw+fh3I60aGNZyb1x0OkVON3lB34mxZlbqry
	 IDVocZ4fD7EGHe8UyNpKrx/rzD9X+xMyHLC9E6LeQq4YgrGCVPRtnMd6+pFWK3QpMa
	 mgGNQtZpt5zww==
Date: Mon, 9 Feb 2026 18:54:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <20260209-earwig-many-2473358f8a12@spud>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
 <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
 <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
 <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org>
 <20260207-stifle-chowtime-8502c0a57f70@spud>
 <6ebcb1a9-78ca-4734-8723-758f79e6819e@kernel.org>
 <CAEev2e9ukBSgWc5WT1xcv+G1ZzOWAnuwp9kaJcKKe6mbtOtoFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e9ukBSgWc5WT1xcv+G1ZzOWAnuwp9kaJcKKe6mbtOtoFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_105431_819078_ADB3EDF8 
X-CRM114-Status: GOOD (  23.01  )
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
Content-Type: multipart/mixed; boundary="===============7854235986258203951=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7854235986258203951==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SmoKN4vvk0qrDnrH"
Content-Disposition: inline


--SmoKN4vvk0qrDnrH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 08, 2026 at 03:39:39PM -0600, Anirudh Srinivasan wrote:
> On Sat, Feb 7, 2026 at 12:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 07/02/2026 15:54, Conor Dooley wrote:
> > >>>>> suggests picking a more generic name in this case, so isn't
> > >>>>> "tenstorrent,atlantis-prcm" okay for that?
> > >>>>
> > >>>> No, because I don't want to keep guessing this. The docs clearly a=
sk you
> > >>>> to post complete bindings, which now became less-complete, but fin=
e.
> > >
> > > I don't think it actually is "less complete" without the other
> > > compatibles. The non-rcpu prcms function differently to the rcpu prcm
> > > (they seem to be consumers of clocks that the rcpu produces) and are =
not
> > > supported by the drivers in this series. They're different devices an=
d I
> > > think should only be documented when support for them comes along. v4
> > > had problems that were caused by trying to document them without
> > > actually having driver support figured out.
> >
> > It's fine without them, but then let's just name the file after that
> > only sole compatible.
>=20
> Okay, thank you for clarifying this. I will just add one compatible
> and name the bindings file based on that one.
>=20
> In the future when I add the remaining compatibles (and driver for
> them), should I add them to this same bindings file? Can I rename the
> file to have a more generic name then? Is renaming bindings files
> okay? Or is this something to worry about for later?

Nah, in the future it just keeps the name of one compatible.

--SmoKN4vvk0qrDnrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYotXAAKCRB4tDGHoIJi
0hUgAQDcQXJYtdev+whzngD+fgOFupT4Psq4f2Ns6wDCt7RGZwD9HtlTjdOfvZWj
zrlmoCXKeFszKL3hYQQqsIJ0dDz7uwU=
=4rH5
-----END PGP SIGNATURE-----

--SmoKN4vvk0qrDnrH--


--===============7854235986258203951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7854235986258203951==--

