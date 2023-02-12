Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A63C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVuYy6pLxH6jj6FfMYcGu2rllaj13U0tfzoHcUPCxZU=; b=I9pFhocjNQBkyCLj20nMqW4ziY
	8Igqq3JuAQeAvSS6naiTS+gy4xEJwh3FgFahQfzsqiePBzpJUqOlKU6KWXBg4M9KmC/dvcW/XyshD
	clvw28MpUIKxNERu1eZNL2YIm/mfFiVfw/JsDb5Yo96hA7aMa2YAZ9qVYLh4L9eNKlF3WzRH78urp
	BPhMGNHbZJf1bPts7Xsl/raY/IDXyL3x2PKihHdjyPBHIo7HJgdZX5tWdXp7l+bObprSCub4W+Rpz
	5b65kAwUob6ToIvtgSsTgOX7670DmaUrsNS7ZrCbe82JPjBfxG+B9cMNbGF0zCgSwpUOtAHqWhjAR
	k0g8Qu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFnw-00Bvdu-PP; Sun, 12 Feb 2023 17:06:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFnt-00Bvd8-HV; Sun, 12 Feb 2023 17:06:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0DAEB80D30;
	Sun, 12 Feb 2023 17:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD2DC433D2;
	Sun, 12 Feb 2023 17:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676221574;
	bh=xp+pefU+YHy43K0Cj/XKFLXgNVyRDAe45y8OPXjYd98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0QrHsaoukwZplXnOXNUul981zsJ5R9VZid8ANCLlsXoEt2GZ4UA7+X4gFPFhOzkD
	 hxURisohnPmmTxRednradbcOxxqYYfhSdejp06G+6U3UHASgRDAMVbjdkCqIhDvaef
	 dptZCfppcYzMVv6nXLRj3soqyH3CAB+WFqbr1pDvyQLrKlsxxngkfHyXYnqyVNA8Y7
	 ILGEfLPaBvPLQNyK/nXlVaiLmhbCeIZ1bkD6dBfv683pu3K/igqXwkA/FAd6Qf4JHT
	 tD2F4bkQh8MwXcRbQyheXMYguE9yU/sFUyCgCTi8igc9yfKcvJ9jFeiAr3HudyEycd
	 IITgQL3rFCPvw==
Date: Sun, 12 Feb 2023 17:06:09 +0000
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
Message-ID: <Y+kcgcncQO/2DNLo@spud>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net>
 <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud>
MIME-Version: 1.0
In-Reply-To: <Y+kU9nDBTttZRLLq@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_090617_759732_C5AF86B4 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Type: multipart/mixed; boundary="===============8243276845486846647=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8243276845486846647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h6c3DYobJqr9hTJK"
Content-Disposition: inline


--h6c3DYobJqr9hTJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:

So as not to lead anyone up the garden path, let me correct myself:

> Hmm, so this appears to be us attempting to patch in alternatives where
> none actually exists - seemingly F & D.

And of course that's not true, riscv_has_extension_likely() now uses
alternatives as of:
bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")

=46rom a quick look, it just happens that the only users are F & D.


--h6c3DYobJqr9hTJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+kcgAAKCRB4tDGHoIJi
0haHAP47irJdLd+BYtO2693Gm0LwdwLkixyoiVtbaWgoOWK1kAEAr5pMmLqKw2+T
l5ybCzYN+j3mUvmfex8RQuDNBnBj3gY=
=SyUl
-----END PGP SIGNATURE-----

--h6c3DYobJqr9hTJK--


--===============8243276845486846647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8243276845486846647==--

