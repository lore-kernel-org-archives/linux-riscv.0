Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C73CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdMTK07RP1tI+2eK1lTellC4SIMu5hCP+r+EpK/Zne0=; b=uZO5q6wSbGeFjpn8aXTFx3MAG5
	ikIkiVcLY+KfwWrx0TC+hh20tgyIszGgfckbLWgd3PMJe6paeGL5Xtja3gnFnzI5yE8cBhxajAI3Z
	FVjICDOd6YcyunK4+KyzVpXPSWNl73bzpz7wP80jOrf+6Fuek3CAR6xuaRtUfl5bIoKw59BfL2GnM
	hlvg4GSGxqH10cimzesw0mTrVYY72E1kfbhg0o3mokUwMe4HXCgL1XvJcuddDxo8Eq2NkrWX43MJN
	O1WmV5wo/A5zseAhl2r14qO6DrzzMnf5/mdBgXB4oV3hSazIYgAHh/kpg9EfSMI0z0tgENi05lkpK
	HGg1vqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuaY-0000000EcX9-2Osm;
	Mon, 20 Oct 2025 18:26:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuaW-0000000EcWm-0mNw
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB7BE45B4F;
	Mon, 20 Oct 2025 18:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79D7C113D0;
	Mon, 20 Oct 2025 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760984791;
	bh=UhEuqXmpACp9+BKJqoedP1MDXtc1UXLJvMj+JY5pTyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TWuJm3dMrAYII/skw3p/IlUTy7oPL9I0uiKPAhPQ2VzN0siguzaAr74GidlJjPVy+
	 Kyvu1GcQE+6dBcjjzPwT7S39Votqvpj0GgU9FmrtWZBLxvvS6KOg4JoxgsECu9bizU
	 HatC7VsRRuoQYspXdNEPNLSQI5eSzox/LRoPsQmXTWxkvbDJ0vtea7tkt5NNfLZlxl
	 uy1kOeee6cGXzEgBtD5CNjg1fNJ5S03kXkWO2TPbVFr//TGv0khXQFqWtu25O490PY
	 a+sPDmO7WXmP0eOVDO3bNEBzRsXyvWFdoiV6LLIXxhNgZcGC5Iixpp8T7jFXLObhhh
	 gbbbDBw82yoFA==
Date: Mon, 20 Oct 2025 19:26:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, han.xu@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
X-Cookie: I doubt, therefore I might be.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_112632_242940_22DEE7F9 
X-CRM114-Status: GOOD (  13.45  )
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
Content-Type: multipart/mixed; boundary="===============4426006858971298397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4426006858971298397==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1I0XRDn4R0XgPcRQ"
Content-Disposition: inline


--1I0XRDn4R0XgPcRQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
> On 10/20/25 12:39 PM, Conor Dooley wrote:

> > > +          - spacemit,k1-qspi

> > Are the newly added resets mandatory for the spacemit platform?

> This is interesting.  I never even tried it without specifying them.

> I just tried it, and at least on my system QSPI functioned without
> defining these resets.  I will ask SpacemiT about this.  If they are
> not needed I will omit the first patch (which added optional resets),
> and won't use them.

It might be safer to describe them, otherwise things are vulnerable to
issues like the bootloader not leaving things in a predictable state.

--1I0XRDn4R0XgPcRQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj2fsgACgkQJNaLcl1U
h9CK3wf9GM9lu076QzbbHfDafjhtsrnlltUssWfJoUgfejWm+v92kvQuJeSJHBDk
/JMRLFe5T3zA0orRcegrs3BleAWhIhn9HqanLLCg9l/4nVqimJD/UbDj8zyKrPxD
9uHpITAxRzkVNEO7LevpxKk0uXnBNweZ2uTjl+ZFJbR6ECOu1b6/4xifiJPX2MM6
QO4iDWxZKpfPO4YixpI8kbR3f0+Lf9MtkXciYEyT1gY41jUPzQWyprpp46RISYl1
UN0q3/gbogtU5ks2C9siT9SNZxTD/WQCMl9+nm6MkE579TyhPYAz9822qo8/cys1
H3EixL1NAJ5gK51lVXMyOwLDwPzbWA==
=j9iT
-----END PGP SIGNATURE-----

--1I0XRDn4R0XgPcRQ--


--===============4426006858971298397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4426006858971298397==--

