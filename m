Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F43BF459F3
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK/xw0dbskKjJOMf5KCNhmHCyDiNsqokUQEih8N7r2s=; b=zVJkdFTuc65IhFu2auiBbvgCXY
	t68dQRMj/pAhIUaCoSgxX2SC50KaLRhi9WAGVeG7aG8XCUxZ3Vuvq+R6NO8Bv8t84GbPL9P+OUjuN
	PR4icBqPvyOUJCdxeekY6V1Rp5wbbkDd9sluhCqUtEkwdaMmb+JEb3M6fiGNMTBRilvFq0X3S8mO3
	/y/ZnWxhv06I+25u/Dn9j2EupNqAbVTHcb4B9LRSGUwRX0x1QAT9nSbt6jqJ5/ok0Gmv2xIZ6jvKC
	9p9xNUghReC1/TzbowigU5ZZ3i2NcTWXLLV3CXZFovcLmVc6lLgWGPT7vUlL22tNBlFm7sb3ascbh
	FRWrbbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBE2L-0000000CTu1-2DHj;
	Fri, 10 Apr 2026 15:44:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBE2I-0000000CTtb-0gOj
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 15:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C0CF40789;
	Fri, 10 Apr 2026 15:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BDBC19421;
	Fri, 10 Apr 2026 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775835883;
	bh=fNv4Ok1u3X6cxegGSB+eEUrRYhC1cDsemDV+eTZXlCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Byix/Nb1mnTkXu8LwlES2uQ3Xnyu2b01ANSjWdMtdMaD/Jnf8SmR+Xglj8/1ZIdYh
	 G7UHFtXaTrvr9sIhkruy6col1UvQkmAHPGnFSEEXpFZtN/jvWByAyWEQzTa1nVzWQh
	 qDXbfbO4drXZoB5cBlROFZxxFjOQ7XKiicF2CG0+AULvJy9fPJMSKWGpB76DmKnEwi
	 rY/XtnZoIoUzur92NoKQrQiNfW4OAggDVjCSltLU3dHhxh49R9ZfbzFQkSX8/2D8sr
	 oh2sAssUNm0IhQN9PzGe+u0HhFDQfIxtj8zwsiFSXizpWXSHrgjYoMhxIcGXP4OAhS
	 DVwolmm6TzJSQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 420CF1AC58B8; Fri, 10 Apr 2026 16:44:40 +0100 (BST)
Date: Fri, 10 Apr 2026 16:44:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <adka6GqvRSrZAY9V@sirena.co.uk>
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
 <20260410-spi-spacemit-k1-v8-1-53ebb48a4146@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260410-spi-spacemit-k1-v8-1-53ebb48a4146@riscstar.com>
X-Cookie: You will be divorced within a year.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_084446_260466_4A4A9BA1 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: multipart/mixed; boundary="===============5810445761907392195=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5810445761907392195==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bB/Q26L4bd+03tnk"
Content-Disposition: inline


--bB/Q26L4bd+03tnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 11:04:20PM -0400, Guodong Xu wrote:
> From: Alex Elder <elder@riscstar.com>
>=20
> Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--bB/Q26L4bd+03tnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnZGucACgkQJNaLcl1U
h9D2iwf9Eize17JsXARuOZG6T3Rlw+XdompD+YXGF+QHaEZ9P0b3i5Mb5byebIMV
ptjEEal3lvrL22QcaweS5m0NRMVzYWh3H5gBTJjYsXilcyVB4OkFX3d5Hg9cbzk4
+MT3UcRYMoflWtWxPsaUoRGUn3SZEfoEh8EQXzW9WFe6xZT0jfXATeOa/uw0ijgs
dpUKQBH9jeFUWO9hKsDOlvancLKwRdywKfbEiJkSxkwrxbIMmv7KF4ZLe9WPM//X
g7eVD6XMxctW+dc6XjTcF8MgUs3Wvj9QW1hy7RnKHMNgUWgBQdlSRf8AV0zwd+Ov
p1lDtibQGNmKoDK+m2g3zZhU7XDe5g==
=Gjsv
-----END PGP SIGNATURE-----

--bB/Q26L4bd+03tnk--


--===============5810445761907392195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5810445761907392195==--

