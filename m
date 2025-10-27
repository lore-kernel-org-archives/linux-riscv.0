Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C206CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZ8weXi0553RHe2SoP9U557BxYC4OKkAymyN1zqtkZE=; b=U5DfPT2M1DbRFfwKP9rcBC6yxP
	GW6/NnUo+P0vpj1MF0c9mW7NWvhqX7gHBd/IF7iHyi850CkM3nuYqDMW7nqlP+xxVuRPgMwb70PDY
	gecUH2KqStl8Ijlv3hGZN7VKGJlLWE5RI5U06JO+nm2PyvWmofUyxFLzOWblewggFc4P7NetU89Hk
	sk8/JOm3nJbsadOXBCGMkkFABj/LdDeC4bTcKnu28tedmSYSiG3+2Dc7GuIgMVrlySbNicRr/5eWT
	PGv5+2JA2yukV+Xkw/s5Alqsyl1zORTH9HSZPsR2QvsVBAlWp+4lWstVt5Wo8Q7s1KycjpAkM8Xsz
	dcAfP7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOOx-0000000E9W7-0qmL;
	Mon, 27 Oct 2025 14:40:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOOu-0000000E9Vi-2WB2
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 14:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3889D44593;
	Mon, 27 Oct 2025 14:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566BEC4CEF1;
	Mon, 27 Oct 2025 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761576048;
	bh=JvAfMBBkyVWcNMHDXRKVwxzm6paC2VoX7J/SV8+itDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8pM6eAdfQ7Affh+16V4Uo0SMsX1kkLfgxRRwwGy7USvUc5RCIyHAYNAw5gz/XBmd
	 HPi+bL6eED+ACWkzb6qWaBjhdYk9bSlTByK/UunFkuyU3jYipBrGZZBsbMZanbkLBF
	 Jx2z9Lsh2Rwo9m41wPErHLzV4Y9j3lx3P4VjECE75XBgGdrBVLy7JlEM+RCgL9jhiI
	 gK1YqgzaVhZPe26Wjy5URc9b7Bp73QQ+1MDQAWIDJbH6XyIlJHsyPZVuICpwgWT4nW
	 NN6J1DQpufra1soiEOk/NAdNW36yjod74pERM2JOn8vA5YZA6ubwpPf3wc5V41CuC/
	 XGfSSlw8QZskA==
Date: Mon, 27 Oct 2025 14:40:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] spi: support the SpacemiT K1 SPI controller
Message-ID: <e4dd3db6-d554-4fd3-a674-60f2ff6e5475@sirena.org.uk>
References: <20251027125504.297033-1-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251027125504.297033-1-elder@riscstar.com>
X-Cookie: How do I get HOME?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_074048_663053_1691DF69 
X-CRM114-Status: GOOD (  10.40  )
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
Content-Type: multipart/mixed; boundary="===============4376238672127343526=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4376238672127343526==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CFGmoVkBdJi44PFO"
Content-Disposition: inline


--CFGmoVkBdJi44PFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 07:55:00AM -0500, Alex Elder wrote:

> Between version 5 and version 6:
>   - Rebase only
>=20
> Here is version 5 of this series:
>   https://lore.kernel.org/lkml/20251013123309.2252042-1-elder@riscstar.co=
m/
>=20
> Between version 4 and version 5:
>   - Added Yixun's Reviewed-by tag on patch 3
>=20

Please stop doing all these resends, this is just making things noisy
and pushing you further down the review queue.  You should not resend to
collect tags, and you should leave a reasonable time for review.

--CFGmoVkBdJi44PFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/hGkACgkQJNaLcl1U
h9AvUgf+IWfOtlEyWJeQvX09oJOdwtThlYWV06oiVLGS+QFAQAIUAvUnNHQ0sqTH
pQMdxUhxO6HQRPwhyPD5f5D0jXiUS667iwaG7DBJ4OhxjxOkG1OY/xASk3cKuqgm
TKb/+5KBAqA/xfFdtNI1VuXGygqBDiiV/i6sjgv84H49ANNpni4fDENl1bvJ2GWM
ruZc0BoOgJ+ZLOW9nBQKBPbYArEc78hre6N+sOSFFFAIvZAd6plescE/JjwJCXZU
oh4+GzqvMFeRFS90Gh81C93o8RjPzBVaEdGOkWn2j1l/570wI3XcuxD0zSO+gF9Q
Gby20wQHnuD0zDNrRXcNtzN0oOrjOA==
=VZJx
-----END PGP SIGNATURE-----

--CFGmoVkBdJi44PFO--


--===============4376238672127343526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4376238672127343526==--

