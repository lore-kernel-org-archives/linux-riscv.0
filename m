Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F99FFA1FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrz8ZEygKM/LOHKZQORWSVVtRGlYMrqtN9VfX/KJoI4=; b=Pt+rV1tV45Rag0eoHDOr06tn8K
	TUtA2cPANVbnYrvBOI2rQls+q3FXwcQzUxW8z4GGIvD1LW4hy8mdkJ+9tAKqIwl8G0mhuQ0jfM8Y9
	Op/xZv/p9oubLTWtVyGhSCRTfcRQ6G/qOfqJ4znEYQgKsU0NxtoT7wKWvfZaUwVWBIdq8i9qHKjI3
	hlvmLk+gHgh6NhtIxICYytV58b2SrXHPYPwab9H24n/6vTLnhQBMBwtk3/1sCXSLfpHXmoCUe6Gi6
	HcMbpl4AMoMtrmqHQPZZliUG+2w5dHU3nfVCG28d02y/svKfrTO+REyqJGKf+ZXzFi/H6keRNeVs1
	kbEm1EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaC1-0000000ATiI-0wyj;
	Wed, 22 Apr 2026 16:12:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaBt-0000000ATga-0llw
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 16:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9849432E9;
	Wed, 22 Apr 2026 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04545C19425;
	Wed, 22 Apr 2026 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776874360;
	bh=I4v1mxCRxuY9peEu8fTfKrXZSA0Vc+jvyVH85GUdMa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWAvy/nn5QZhZmCrSDiN1EIhuFbaDGGWLi0RwtvoxWRoFd/VfKKhZ0pp9rt/M0wAh
	 ErIoYqjegHXpgg0y+w5dMY7n2dED7Q9TLGX/3RfkFq6U/HIR0yl471rIwfk7ODO7Mo
	 jcKf8e7NQ0dhNeagP758lxGi7ADJxy5AVynoFhtvWvOakj07T6lifdbH9rW/LvRWlN
	 rinzWgRvdEw8uWsJvydj70GUSdw2Hj63LIZJQrzrvUg6Py86sxqueS0oTd/E9q0rLB
	 zMv9wSbNBz8ENafiCZqAI3TwPT+7lDzGhdW0CmZsk92x2XTOZuUvitJzilnWlMZi3m
	 ytReU96Ouh6zw==
Date: Wed, 22 Apr 2026 17:12:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] microchip core-qspi gpio-cs fixes + cleanup
Message-ID: <20260422-refocus-massive-c3eea64ee60c@spud>
References: <20260422-foe-strength-a5d8ad650ef4@spud>
 <8cb49ccb-5a12-4770-9c91-982d78b5f962@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <8cb49ccb-5a12-4770-9c91-982d78b5f962@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_091241_332982_CD0234D5 
X-CRM114-Status: GOOD (  19.59  )
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
Content-Type: multipart/mixed; boundary="===============6052758155940155822=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6052758155940155822==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b3mXLTcArltJS4g8"
Content-Disposition: inline


--b3mXLTcArltJS4g8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 04:25:43PM +0100, Mark Brown wrote:
> On Wed, Apr 22, 2026 at 04:15:41PM +0100, Conor Dooley wrote:
>=20
> > Got a couple of patches here, the first two deal with an issue that a
> > customer reported where using a mixed configuration of the built-in chip
> > select and a gpio lead to data corruption. Turned out, the built-in chip
> > select always gets activated at the moment even if a gpio-cs is being
> > used. With that fixed, I noticed that any read with multiple data lines
> > was not working properly, so patch two changes how the driver deals with
> > emulating mem-ops. The remaining patches are things I consider fixes but
> > not meaningful enough to get a Fixes tag. LMK if you want em split out
> > to be put on for-next rather than for-current.
>=20
> I don't know what for-current is but they certainly don't apply against
> for-7.1 which is the only active branch given that v7.0 released (and he
> same content as for-linus and for-next as a result).

Ah I forgot about that widespread devm_ removal series.

> It would be
> convenient to split the fixes and cleanups, unless there's actul
> dependencies.

Sure. I'll rebase, split and resend. There shouldn't be any meaningful
dependencies.

--b3mXLTcArltJS4g8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaejzdAAKCRB4tDGHoIJi
0iOnAP4ghNY31x2PcHvukxiOG0UNXW2dN8JYTVfDX4urqheYeQD7B+Cq9/MbM5ku
Ft5i3AHUtT1qIWSYcLWZZB/knaUvswA=
=z+I5
-----END PGP SIGNATURE-----

--b3mXLTcArltJS4g8--


--===============6052758155940155822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6052758155940155822==--

