Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F35CD8CAA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 11:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLLqDjmPadPkutpVJ3GWRSpxOU9Qs/fl5yBwTLLMZUk=; b=HGZXTR5opXxZIbA6vsTjsSOMsA
	Z0imvnG5bXlXGvm9AoTG+x27CgqitRzBBBRUnRZXciG+0dN9XQ6TuxrfW/ZpxRJPjeTVwOFmXQSLQ
	OPZ51xVKasWykhIqNWDTJylkJO4iIiN9N0doUPWNVfK9Pwmi3hM8QRJK6bYQjgnfvf76aJhmaNAEN
	6R4NJw5jWMKOi99NZKBNmDhxjJpQSIOskaTCqM8RKvJOawUXQ1GhPfPld8N4BjMe9E40ZOZpzekOP
	Fb2tFS8DEyibOQSZpiMmjYq6r5DNROlOvxM8QC9SMgwwik5DFGAizz/RL3L6PnkUjURzyrtgoF9b0
	gLkpZzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuTv-00000005Qne-0idc;
	Tue, 09 Jun 2026 11:18:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuTt-00000005QnT-40k1
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 11:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24A67601D6;
	Tue,  9 Jun 2026 11:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A1D1F00893;
	Tue,  9 Jun 2026 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003932;
	bh=TFFIXcnQZZx62aSyIM+X6wDjPZycN0CvCtma+zign5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KCusuz/HGquGDhveLDguINQ5iAuKTnSPBrxt2are7fq7HQveCWyO8klgItVYc3V87
	 zZ2mSe4KmaXmGuA0LXstS4n3WoUQEuFquzkQRoU2a7KHrlff4pdxZtUpic6M+Wggu1
	 0S71hq+Ib3jI8HWkb44fgxuYA1iTnMmJzxYQFNWM+vRfZSbEjLjh1s6No5HhW7kA4/
	 LNZmI77qa0W+42xBaxjxTwwd40mUCD2Frc+E0afmXANst+UzvyuFapbQi+6PsT/Yvy
	 Mc1lJ16dwVCiYZ/IaAy56vvBORjN8RtjWC+zKHhctK9tE64SxW/JJRlCL1i/xc8c7w
	 aIXnv3xt7/kgg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F30B81AC56AD; Tue, 09 Jun 2026 12:18:50 +0100 (BST)
Date: Tue, 9 Jun 2026 12:18:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org
Subject: Re: Add fustini riscv-config to linux-next
Message-ID: <aif2mpLE3n6lJwLa@sirena.co.uk>
References: <aie/DAyvda4bcdLm@x1>
MIME-Version: 1.0
In-Reply-To: <aie/DAyvda4bcdLm@x1>
X-Cookie: Leave no stone unturned.
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
Content-Type: multipart/mixed; boundary="===============7952479621873518203=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7952479621873518203==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tp7hiC/TaeW4+oTL"
Content-Disposition: inline


--Tp7hiC/TaeW4+oTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 12:21:48AM -0700, Drew Fustini wrote:

> Please add these to linux-next:
>=20
> riscv-config https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linu=
x.git#riscv-config-for-next
> riscv-config-fixes https://git.kernel.org/pub/scm/linux/kernel/git/fustin=
i/linux.git#riscv-config-fixes

These should be added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--Tp7hiC/TaeW4+oTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmon9poACgkQJNaLcl1U
h9CRoAf/b7tvISSqsdsBz79Iwhxzjn+zFEnsjXDRjfMnct5ead6s7W+KHHmtT9N7
eEsnNOsGZZKa6K3B28gQNu+3rXC5jQZSvZqnCRuHmkMxkRy7CE3aPoXoImLAI0J5
YSiSziauZI1uJVe05HQZMR+VcdR1NHb6G3A6Ka5ZmXl+FsmB1BkToh/Nj+vUyE+F
mCiqhXIK0a8UjABMyRIQ88ISceMyXwyBzjJ/xAt4FXhrgSQaiUSqqGMw4Eq3VXsa
rjELB3qgiYsl/bzihGu2g8FyMEb/oGYEDVrUT6H+pxrwUwLJVDu/Z8RS6XnxVsS4
5LypB0Zj8jkqFk9XQ/CLrh8ef2gPQQ==
=bszZ
-----END PGP SIGNATURE-----

--Tp7hiC/TaeW4+oTL--


--===============7952479621873518203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7952479621873518203==--

