Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C9EB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AL3kpaIbOS2oVbz2qBUdOKYkeGgKRVwx801cACuQFc=; b=ACjQBEWKjz+8JXdGscWbs+5Yvb
	iq6xXMz6MyNXvurfINcYJA7HVYamO4TOC0LIm0qycFBbeP8gYtALtZmIImZw58auHHdvEpXSG1Lz2
	RaFJZHSZlj8Z2/8IiL7Oe1oTQPtgyaFGwTnx5FTFzQebOWxHpXGUP4dX6vHVa2urUXTKKiRSAOZRJ
	lfXYw7xNtND9mzQsfNrLiiXw23p9Rzn23OHBHTBQ5tvor5b/CEhtse4sykuDl3O+J20le7eN/FGU8
	h8aMw79IHpTxwQ1OZ9uMtF7/jRb2yphz4YwjPPPmHspR/UPu7SaIX+PmYqSafAPGp8Q9XrLn2utyv
	B0h21w+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBgm5-00C9Tx-1p;
	Tue, 20 Jun 2023 19:12:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBgm3-00C9TX-0U
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:12:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A048961236;
	Tue, 20 Jun 2023 19:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD004C433C0;
	Tue, 20 Jun 2023 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687288338;
	bh=p33ijndQSVtv65AQdpZat7WhUOH6QV7DhiNvd7275KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCIOu4Avb+PtU3yJeQdrr/0sBgklzIZflCGJfh/gDvIJznjZwDuGtPcdg7p9hGxsm
	 yXWoLRVI5GJNmkDe9eKugxcvd6sm+l25zgVkUiCFUR7Pg1UBIDTKaGk1WZaEhorH4R
	 Ds7HK5tBsez7B7KmzyzBCEu9SEIbjWWGEZ9GWiqV1uULP4bmmz+Ei3czntKl4T/wg9
	 dqcsB6fV2sXIMHt9hyjZel3DMJyN48bC56BRdVJL8oHBTtx/FAl/b46+dOh2a9frm3
	 eEip7tjdISSaW7T3G943fXZApeNVSCJX2dVNYvUMThuQ6VprpTfy5wPfSLzzZ35BgD
	 0NXZeyHaeC63A==
Date: Tue, 20 Jun 2023 20:12:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, herbert@gondor.apana.org.au,
	davem@davemloft.net, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu,
	heiko.stuebner@vrull.eu
Subject: Re: [PATCH v5 1/4] RISC-V: add Zbc extension detection
Message-ID: <20230620-thorn-trowel-9a4a7c387efd@spud>
References: <20230612-unstable-tilt-1835f84363b1@spud>
 <mhng-919a6ed5-c8b0-4311-9a8f-8c204b81a8e0@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-919a6ed5-c8b0-4311-9a8f-8c204b81a8e0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_121219_236770_148B3E7E 
X-CRM114-Status: GOOD (  18.33  )
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
Content-Type: multipart/mixed; boundary="===============2616061562928046989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2616061562928046989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6YNTO7wDjk54mE4/"
Content-Disposition: inline


--6YNTO7wDjk54mE4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 12:09:28PM -0700, Palmer Dabbelt wrote:
> On Mon, 12 Jun 2023 14:31:14 PDT (-0700), Conor Dooley wrote:
> > Hey Heiko,
> >=20
> > On Mon, Jun 12, 2023 at 11:04:39PM +0200, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > >=20
> > > Add handling for Zbc extension.
> > >=20
> > > Zbc provides instruction for carry-less multiplication.
> > >=20
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > ---
> > >  arch/riscv/Kconfig             | 22 ++++++++++++++++++++++
> > >  arch/riscv/include/asm/hwcap.h |  1 +
> > >  arch/riscv/kernel/cpu.c        |  1 +
> > >  arch/riscv/kernel/cpufeature.c |  1 +
> > >  4 files changed, 25 insertions(+)
> >=20
> > Plumbing into the hwprobe stuff would be nice, but that's not a
> > requirement for getting stuff merged :)
>=20
> IIRC we talked about this on IRC, but IMO we shouldn't require something =
be
> user visible for it to be merged in the kernel.

Yup, I asked you before replying since I wasn't sure what the "rules"
were about hwprobe since it is so new.

--6YNTO7wDjk54mE4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJH6DQAKCRB4tDGHoIJi
0h0vAQCWQwf3bFexQuFDT5Cl8ZPPJPGLTj247/m2BBGvms994AEAnT5NIlru1zY9
cMEGtgKjm1d/nmRI+L78jlV7Wg0EoQI=
=Mb5h
-----END PGP SIGNATURE-----

--6YNTO7wDjk54mE4/--


--===============2616061562928046989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2616061562928046989==--

