Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D15C3DA7D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRCPUSaanLYHycWclh1Xv3q1yFSGnR/xX2asnhUN6pE=; b=h++YYodRMrtVMaFBBYpSw+sLGk
	R0lC/w45rdXobG6+89TEBz2ogGO/fXu4WXMxtUr1BdtiJssujO1KXQdKu8Z9I3Pqb2YAwBqP+PlXS
	shoJUUMOkaq0YypnObh+A56HO/yMydIXxlldsAaCXSOxPpEaGljVR7u70z55VMeyptB9070L8ePjc
	5RJWIAC/BZtZTWSiXxGbGrjagqu3QaAhPtjSpq2nLhvcgEdnoc1P6w+xGv2nH9oRx496d7i/mRcJC
	5IpnNhoMQDBpHmy3eVrQ6AKprVz3rxqUgo4V1B0Wvef/kocysFxJw3QYMWL7TbvKSPcIY81rmxhz8
	NZhvlDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCrE3-005n2m-BA; Wed, 04 Jan 2023 00:01:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCrCh-005mbb-AT
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 00:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB8F961545;
	Wed,  4 Jan 2023 00:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF428C433EF;
	Wed,  4 Jan 2023 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672790415;
	bh=kRvbS3cuvwwy8p+1jfM2zIAm2rNRABRRzIyjQ0Xw94o=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=FFkmkbGd2YVuC6LUU/XCH5Eg/v+yjP5mrqvzcPc9ktwNJcwFZYtkL9IKc9aJBQVBp
	 V3CnHwCqs3BfQ3yQUyTh8VQ8hUU5SXoSppMYvI+AOfl2m8eUHo6FIBo5ev8dTyJMwG
	 jiWeMClCdZSBvr39f1C3FSRgv0TlXKmPf1Wur+0MF92zTWriU91ohZl3fpk8P/wxN6
	 irUx4Af3/0OhE+VPOUBz8s6P398R1zq4P/Iv3qSvNAsm1OYd5uu4gmv3t6u3aj4Vih
	 dVLZNkhQd9FVRksND1iBUAVMBfDASvPGXu3tNTIgmfHe6gF82ve4KPjCSLq15qwN/R
	 oWC5GrZM9T68w==
Date: Wed, 4 Jan 2023 00:00:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	guoren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>, soc@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: Re: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache
 flushing capability
Message-ID: <Y7TBh+CJdZPJ6Xzl@spud>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
 <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_160023_519055_2F1DE15F 
X-CRM114-Status: GOOD (  26.03  )
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
Content-Type: multipart/mixed; boundary="===============1014048079392470965=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1014048079392470965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x1YI5fGYrTiyVsSO"
Content-Disposition: inline


--x1YI5fGYrTiyVsSO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2023 at 10:28:19PM +0100, Arnd Bergmann wrote:
> On Tue, Jan 3, 2023, at 22:04, Conor Dooley wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> >
> > SiFive L2 cache controller can flush L2 cache. Expose this capability v=
ia
> > driver.
> >
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > [Conor: rebase on top of move to cache subsystem]
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > This commit needs more work, and a way to enable it from errata. I've
> > not gone and done this as PolarFire SoC has archid etc all set to zero.
> > So we need to go figure out a workaround for this, before adding in
> > errata enabling code for this. I've included it here as a second user of
> > the cache management stuff, since what's currently upstream for the
> > ccache driver does not do any cache management.
> > ---
> >  drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
>=20
> My feeling here is that the cacheflush code is unrelated to the
> EDAC code and it should just be a separate file. From what I can
> tell, all of the existing contents of this file can simply
> get merged into drivers/edac/sifive_edac.c, with the newly
> added code becoming a standalone driver.

Sure? I'd like to do that independently of whatever is done for the
ax45mp CMOs though, don't think it's worth holding up that platform's
support on me splitting this out.

Thanks,
Conor.

--x1YI5fGYrTiyVsSO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7TBhwAKCRB4tDGHoIJi
0vuCAQClGWVo09UkqNWJ5OE0ee0EFSykISV6rWDcai5thHn+pwEA+PvXNcso8uwj
DytqBBVgtS36QZsCZa35rlcD95gxggk=
=cOUb
-----END PGP SIGNATURE-----

--x1YI5fGYrTiyVsSO--


--===============1014048079392470965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1014048079392470965==--

