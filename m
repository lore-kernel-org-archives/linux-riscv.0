Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BA3C07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlAZcCy6Te8s2KWhAeRvMbg/lMa9NB3nJSm5RIKlZuk=; b=AyhVqj5w144SM1JSVELS/bSjB0
	/R+mFF40nA0bi6qSwe7ZSxIKuZO0pGt6WQ0LjCwo3XyddH3hGkylfUj1H8XLL81z7sJaphEhd3UPL
	nn5+zR23iIeagnn2Yh+hXkBi3KBEErDZROz2jxIs0e8tBOBCXSsVTt/WL0DUu2qecq9Q6O2MDh/j4
	1dQXn726QiVrnIlhHcvnt9X6vUImgVQHYGeB+smVgCn5CGpx+0czJ7pNvlFrkwxQVqji9hf72p1go
	EBXKW/bHP75gaF8HmNBn/2j7hIBYGvVPCLTbiodmKD4lk6xkysze1sRZf0u0MkNWM16/VVNFY2xrX
	SS8JaWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hmJ-00B4KO-1P;
	Thu, 30 Nov 2023 14:12:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hmG-00B4Jr-32
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 14:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 637C5B8433C;
	Thu, 30 Nov 2023 14:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9BAC433C9;
	Thu, 30 Nov 2023 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353546;
	bh=gnUxeKkoID9HtlwW7Bg+QT2RRbfa1Ffvooe93e+UvN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ms/Q+xg49iz1B7x1hT2OXYdQMt1Occ5j/fGR3h2INhjZM8Q9ba6+E7lU9G0JngoE+
	 0WYiedeYXw08nLTHotnSZsv0QgTUtiT/YunvuIT2Ge55jBH6rK4bwYDMjrWoQ9nTGr
	 tniF7KSlDuYQoCTiPMaq/lO+3F5e6FAQd2vrULac5jL5KS40TIwal0NBk+ARa5Ef3f
	 +OOvkYIRGkzJ3GQdZUgPXLECq4m/WRbMcf98pPkQ7xXhxe96FGpfkllAN+5LHtFM/O
	 9Y1L3nAXfx9vRHvVtaicUNvsXloaotFqOK2g6X6a3GFKGhFoCDRkJN54SRx3e/1n+R
	 rhIh8cqjZ00rQ==
Date: Thu, 30 Nov 2023 14:12:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v1 0/8] Add JH7100 errata and update device tree
Message-ID: <20231130-skating-shindig-af43058fc8ff@spud>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_061229_121207_912F67D8 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2258725792308187657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2258725792308187657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DIxgQWGILN1gqhN/"
Content-Disposition: inline


--DIxgQWGILN1gqhN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 12:27:38AM +0100, Emil Renner Berthing wrote:
> Now that the driver for the SiFive cache controller supports manual
> flushing as non-standard cache operations[1] we can add an errata option
> for the StarFive JH7100 SoC and update the device tree with the cache
> controller, dedicated DMA pool and add MMC nodes for the SD-card and
> wifi.
>=20
> This series needs the following commit in [1] to work properly:
>=20
> 0d5701dc9cd6 ("soc: sifive: ccache: Add StarFive JH7100 support")
>=20
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/=
?h=3Driscv-soc-for-next

This stuff all seems fine to me. I'd like Palmer to take the first
patch, or I suppose I could take it alongside the cache driver changes
with an Ack.

Cheers,
Conor.

--DIxgQWGILN1gqhN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWiYRgAKCRB4tDGHoIJi
0j8DAQDhNWz+Dtv1MXNYLXnGGEpGqioe4VQcppSkxqT4jBRYyAEAzIavc2EF5QSx
Bp/TCSMaIs3yVz+KCTjKK4eFvPO8igA=
=0AEX
-----END PGP SIGNATURE-----

--DIxgQWGILN1gqhN/--


--===============2258725792308187657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2258725792308187657==--

