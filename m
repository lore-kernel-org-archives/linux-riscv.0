Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA11FC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEzM8d17jQfb7nnmj/AzXaa7h+X3Qzif2BCuur32UjY=; b=JhOniNlMx5izv+uAkxWSS3lg0n
	LFIJwU68mHA6jrrd/qhOgj4eF9zCH2oqoWjEhAQinF7YZsE3HgdG3nXi3KqCuNPghXqP9ld5T0czm
	45PLiz63GkKKUQd/35xuZAEswq/nBTm7P2XZrMVo3tu7ImIupi2v8Rd04r5mEym2XmlOutErqngas
	yTm+0PWYovcBzRTz7ZvcpFfiMdNrZzRnq7oLssyHJCAUlpmQna+RJ69iK/bKFK4XWU7f6rv7QWRic
	NaRdunQfGbBCRxu38WF0ycnT+wryQXQqR04TsrEYrYfxuksgkg9sOMGIECqZ8A5QnBRTW51qq8Zip
	GuxzjSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmh5z-004GZ5-0h;
	Wed, 12 Apr 2023 20:29:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmh5w-004GYF-1A
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 20:29:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6928638F0;
	Wed, 12 Apr 2023 20:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E2FC433D2;
	Wed, 12 Apr 2023 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681331369;
	bh=SMFTrtm8F56BYtO7WRy9KbxTslw280tD5lb7SokAxHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7KJP/r/6+Bc/+yOJfGLfQZa2f0ZTkVQEelMhSCMZbgcGYrJ68ShWlVt0/o0vqX/a
	 33WHUt0pT2PIO6ip/s/dNX1NgQWScquNHAZAkx9vYtwIgVNTw4htluZONiua5uptlL
	 I1MN+zgDA6WJ6j8asLMWRVV3GYYVLvxqoQATRpYTdvor43lFvy4X7Xzwao6ZZ94tAr
	 mZus7L1DbdPJHK9JFo6QTvDYao+1LGiHzv+sPyIoOtlIeklCmHVa+gi/XfGiXVud5W
	 VubXYiZ+o2RVLRZwT3Qc2MluUk4nfkm6wNGcqSHwY/GxjfbBwAJmT4vzXXWzl8y0nT
	 oeoIxs6CDn5cw==
Date: Wed, 12 Apr 2023 21:29:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 6/7] riscv: errata: Hookup the Andes AX45MP
 non-coherent handling
Message-ID: <20230412-undamaged-tinkling-f09480a79a3f@spud>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412110900.69738-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230412110900.69738-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_132932_443750_4E2A6F17 
X-CRM114-Status: GOOD (  10.73  )
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
Content-Type: multipart/mixed; boundary="===============6148913224167325534=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6148913224167325534==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CsvZMM4EQwWB31I3"
Content-Disposition: inline


--CsvZMM4EQwWB31I3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 12:08:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hookup the Andes AX45MP non-coherent handling by updating the
> ALT_CMO_OP() macro which will be used by dma-noncoherent.c for
> non-coherent platforms.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--CsvZMM4EQwWB31I3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDcUogAKCRB4tDGHoIJi
0lKwAQC9uoLrdeMxDWMXGtkSEJctgAv/TAAU1M4M8iQMfnze6wD+Ij9zAaoQkdio
DeUOQEeiUfKrN0A/v3ag6RtQXTCzWAo=
=ua6z
-----END PGP SIGNATURE-----

--CsvZMM4EQwWB31I3--


--===============6148913224167325534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6148913224167325534==--

