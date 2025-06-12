Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D10C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5FbsI7w3cgcHSbRdKzhbyLNC2JWioCb/eiS1yvOAeE=; b=CC+/7nNpRltQTtVPFneSjhacow
	4AwukEcEnPwHLCj/djjMqtgckbkCFCQLvgCr4gtAyXCkl1eKlKsEiZQGInhTOrVV3a/Dk6VjuVbUY
	O4BGnJUwMxGsWKKKOQRYOa4m16xcjJ62U2nac5/dCbv5EKjmyVoNs3iebVB0VCA2WY7btexSx3Eih
	i7zdsRdK/f8cdtkr92U3l/v68y0yg6vp9jdX0rJy/ro/WlPmJMuqeZnxJBPMvrDL4admwLeLwsgf6
	rkGZCKeDi4z+reG4QAfi0gaVefyudwXA0BCDdDAzJyotw92oZxrUfrJuLPPgpiJ/737i8ycChopnb
	mFOJJu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPns3-0000000ELSm-3jH5;
	Thu, 12 Jun 2025 19:45:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkKD-0000000Dsjy-3r2B
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 15:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45DD7A4E1A0;
	Thu, 12 Jun 2025 15:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F4CC4CEEA;
	Thu, 12 Jun 2025 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743924;
	bh=Y7GeWw59ZemDS0hMwBwc5tqTiUWXS+EZSuykH0gjoBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/szzcdj2ikGb9JZYEidUMorZoo+YqXPebhsKAzhYjNKTpdFLhEFc7GhN6XhZzmtE
	 PZQuwdtU0UOdAVlOnBb8JhEUcebhhEtxT9/I3Xo0Qh9hvXKSfSvupfHg5Vs02N9O8K
	 3PUoy4Rsivldeu1N9upVgUQnliFkVxEhyhKUYPc/JiHG2LAdTuBxZIdHQOTIDGDt2k
	 6b0EHu32mbkDTZ9sqMWs2bzZbyiq+V3r7SkvPmjvSczPzfDXjSVhD07sEjoWcMvGTk
	 PUtyLLfL+5qHpKNgbiu8egMl0gAr4ozXsmGlrI0z4bj2M0OxrxLOW6WSX2sgDzboA/
	 IfPlZZfMHxz4Q==
Date: Thu, 12 Jun 2025 16:58:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <20250612-specks-banter-adac9a126ec4@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
 <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
MIME-Version: 1.0
In-Reply-To: <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085846_019611_53075E2F 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: multipart/mixed; boundary="===============0934842389960862509=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0934842389960862509==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L5iTnG89HErv1R46"
Content-Disposition: inline


--L5iTnG89HErv1R46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:30:17AM +0800, Inochi Amaoto wrote:
> On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > > Add top syscon device bindings related DTS change for CV1800.
> > >=20
> > > The patch required the following 3 patch series.
> > > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gma=
il.com
> > > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gma=
il.com
> > > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gma=
il.com
> >=20
> > What is RFC about this?
>=20
> I use RFC to ignore the patch check, as the dependency are not merged.
> This series itself require the binding from link 2 3, which provdes
> binding of the USB2 phy and DMA multiplexer.

In the future, please provide a reason for things being RFC in the cover
letter or patches themselves.=20

--L5iTnG89HErv1R46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr5LwAKCRB4tDGHoIJi
0mGpAQDnw09DkwnV3+Zok+5PspuZAWYTNAerifzajZnqmaoz7AD/b884Kd2PmZjN
NnGFIdPRk6I8/JOMNJOqYsUCSqSRTwY=
=8+LR
-----END PGP SIGNATURE-----

--L5iTnG89HErv1R46--


--===============0934842389960862509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0934842389960862509==--

