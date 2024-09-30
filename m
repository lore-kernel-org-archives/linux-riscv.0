Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EC4CE834A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPdS/k/bH8PLljAvKKLLCEgaBzSXkL7Gz1is1fE4uR8=; b=xd2YrIdEDMrAF6nEpzKmHfBqxR
	Gy6eeBALV6XmwSNN2JpF6zurNmye8fGJ20zx23pnk9skfIisqvNGLhx7ozuOixUyiIzxrBbqQ9Nh0
	cLcC2q2bisWiW0/3rBidxDNnepjvU2kqnzJvViTd8Va6x70ucoHQX1v0QwDxZxDVPGRhZTuBu5bmC
	awjCxBkoGjS+iEUhXAgBVCczyMp9mlzwKD6ue8Ma7MhxTf93JbWTrUcU8QcrfuxTrPaGU7tIenamx
	+ZcsRIawDImkQ5jDzDHURFVnvupXXXCcCIeGOZXNFwMjYfx53T5CKRKFNSS+NL6g0O2cJNHEXg3tk
	TWsn7ciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAW-0000000HTC4-2gjq;
	Mon, 30 Sep 2024 14:14:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGsH-0000000HPNE-0PpX
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:55:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D5E75C24D5;
	Mon, 30 Sep 2024 13:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B61C4CECE;
	Mon, 30 Sep 2024 13:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704540;
	bh=ptvZUoo0MgvQ1nTdeXK5Y63HZLuZe59ZXon7TP2l7Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E12aNqjcGXGEqGtu70phFW23PXMtikHIp/VbHVu6wHFiiEbXVgs9SyWa2getrm9km
	 uFbsr2lHuatpMybul5LblXdlPW+eN1NYvAt+Ab3jHKByzaRa2SjChPJ/Ux+e1+CgI0
	 1Rm4TVZIX1Uc721vnfNs/UqI3PVavTgLrtTd9GVO7E/62jvAjng0MJK7TAh8kxhmLV
	 pxplUZgozK7A4J3KBXQZEccM6iu1ULZfrTOEzmWHNH1ED8FiO3puc2ZllIlutiD+ga
	 e4upgx13tvcPFTOEED8fBdeK4t73UBSzh08o5gowuusDm73irlPFu55VP3hlwwNTPy
	 c5aJaNcdtKYVQ==
Date: Mon, 30 Sep 2024 14:55:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: pierre-henry.moussay@microchip.com, Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 04/20] dt-bindings: spi: add PIC64GX SPI/QSPI
 compatibility to MPFS SPI/QSPI bindings
Message-ID: <20240930-safeguard-shiftless-c10dc8fbd99b@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
 <1f54805f-f06d-4732-a124-270a36dbff4f@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <1f54805f-f06d-4732-a124-270a36dbff4f@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065541_238761_83EF7931 
X-CRM114-Status: GOOD (  17.56  )
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
Content-Type: multipart/mixed; boundary="===============4245707226624186812=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4245707226624186812==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6OmhXQ4y09svNlZJ"
Content-Disposition: inline


--6OmhXQ4y09svNlZJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 02:52:42PM +0100, Mark Brown wrote:
> On Mon, Sep 30, 2024 at 10:54:33AM +0100, pierre-henry.moussay@microchip.=
com wrote:
> > From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> >=20
> > PIC64GX SPI/QSPI are compatible with MPFS SPI/QSPI, just use
> > fallback mechanism
>=20
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

FWIW, you should be okay to take this, there's nothing that depends on
this patch other than dts files and nothing that this patch depends on
in turn.

--6OmhXQ4y09svNlZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqt1wAKCRB4tDGHoIJi
0kscAQCZswxskpBaL15Yd5hzVUiS9tA3udzdql+Afls0sLewlwEApcpfrwV2F7tu
PyJvxazlLMCl2+a+nJ1o1mnanRGHmgA=
=/i8D
-----END PGP SIGNATURE-----

--6OmhXQ4y09svNlZJ--


--===============4245707226624186812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4245707226624186812==--

