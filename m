Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6FAC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1SwdMi8kWKBIIixDHYF0vkcVPGBpE/nIu6udVpdMrQ=; b=QZ3gEmCU8IslBYDbQwUhDVp4Iw
	ml8vo4uURlWdyBjMAsL5lpAf47EGaSVGx2zJrD7ab2rFSBEsQlbt576QEUDT++pC+ECr5N0YXNuZp
	lTnFnqMnPNma7TgKXlwxuieiuDJAnElk77FYRzacUX0+zyNtbgLhztxUHaghdIc3lPiw5a689erjy
	QMz7VfcIFM+BBLDqehGx57A4eiC8h/SKubu3nSXQca/laj0oPDte1JIoTNIfKUNKAulz2rDI1X8xL
	ifsU95jIbkxr1b4UHVWdT2C6BQX/xEszyZkDMCymuhrw+RBVPFbPfeQ2hVrmNjE7U4R6W0CpUSYFS
	7oai7FQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrC-0000000EeWU-1Lwm;
	Wed, 13 Aug 2025 18:05:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEgY-0000000ETE8-0bN1
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 16:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51D1A601F4;
	Wed, 13 Aug 2025 16:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCF5C4CEEB;
	Wed, 13 Aug 2025 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755103843;
	bh=umOXwit7HPdgtpNai0nTQjZA862x6q+vZeNe21y//E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAQQX0URqXwNQMry05zSHW6LAkUTTNSUlrvfCeJ98mGbcu4GZkzhYusG0v2etKCgc
	 AIrwuYRIZFqvNcvox0TtSHjLpLRmkDs2v3i93PvANAV/ogqTH1n4TSzRqCjS5AO5iD
	 HlWA0DNVAZOL7Ofa3zOo4oopTU2aiPjInv4g/GganJoAkEK7x8hHGRTPAPkBzmyE0O
	 j6WsmfWJdooLSJog5OHRiCMvS6VuCmiHCI9S9PTfRCmDbFd3tN1NncN8TvXfmegBeN
	 g04t+AN0mVzmrF13Motl0xh07Qaw73sWpvJAatt8qAqw8SkQZmDIlzsU4y/3L8yIjc
	 JyfGB1BChaJpA==
Date: Wed, 13 Aug 2025 17:50:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, dlan@gentoo.org,
	lkundrak@v3.sk, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: 8250: move a constraint
Message-ID: <20250813-pelvis-undress-b2c4bbb1d814@spud>
References: <20250813032151.2330616-1-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250813032151.2330616-1-elder@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============2243885216092650259=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2243885216092650259==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+YlI8SXROeMd4hi"
Content-Disposition: inline


--4+YlI8SXROeMd4hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:21:50PM -0500, Alex Elder wrote:
> A block that required a "spacemit,k1-uart" compatible node to
> specify two clocks was placed in the wrong spot in the binding.
> Conor Dooley pointed out it belongs earlier in the file, as part
> of the initial "allOf".
>=20
> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional sec=
ond clock")
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250729-reshuffle-contented-e6def76=
b540b@spud/
> Signed-off-by: Alex Elder <elder@riscstar.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--4+YlI8SXROeMd4hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzCXQAKCRB4tDGHoIJi
0gThAQCi1iV3SuPkecqRkGn5+WZqYG7Ill9PuYyIpNgLbYrr1AEAimZbtkYt4pa7
wWhXwjIqcs6KjT9DuXWGWB+Bk8dgJg4=
=5zk2
-----END PGP SIGNATURE-----

--4+YlI8SXROeMd4hi--


--===============2243885216092650259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2243885216092650259==--

