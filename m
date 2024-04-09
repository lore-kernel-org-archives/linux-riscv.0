Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B2ECD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB3ZUfRt/ufVIm3+QXfcRJEtwDoSCw4NQSo5gaY71hI=; b=HUVryX5bt6r+LiOAUTM3qg5jmg
	9UHfaenl/4vGc2zTk5X5zCkyAm1+8LRkznTkrmd7Lnq5/+LkU9OoK2q9pUxU0g7f4ro/BZaNNgIQD
	WnEreo/xlEgxzHrJrkhXMGUD8okMN3F8mYxBHUjvV6t8U3XgDrSOS2Ou4fDL2lJ527RGHoVKTfD50
	iQk/P9EE2BJIqDfss11d3TjkLHhELAdCJ2UiBhkSMcab3Bb0ETCn+Dc+xHhyAd60i3BWz3fHBhrm4
	pGmJcbe4b1RzRDfOE/wm71al3Wni+e8ST/Qyj6yIRgSk6MUNfp1lqO6PQFFwcSEe/42ES83heyjV+
	qPFPT4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAM9-00000001st6-3BjU;
	Tue, 09 Apr 2024 12:13:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAM6-00000001ssZ-2Em0
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 12:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E3A8615D3;
	Tue,  9 Apr 2024 12:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873BBC433C7;
	Tue,  9 Apr 2024 12:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712664817;
	bh=Bn2d67M9B+2xeCfZnams3peFE9ObQAOACMbR2Qme3us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfWIgrm9GkrO20P2GPcz8gLnutCwdqiOD7KhP/75f6ZXZdPdV3csBdMv5QQ7gEtUV
	 8zd1sPalZHLyxqZJodRfkqkcm6HTbONvxVoEW8ni0vbwL3tH5WNS5fFY+VJDEbIDzm
	 gnZMIqo/3gzCVaj4gHQ2NPKdhNGEQuysBcQpkntrrzK/e9VpxZbmI8KjDNrfAFz6Qy
	 NEw+3L+dZ7qgo/nEu7t3eV9+5jSUV0lScgww1+XT4VCl8T1zaxP8MYaR3hpmg3IwV0
	 nni2pLn7wFziLrMyC4I/NnJpLiOn2lPWT/XisRV3mjfYqT2wFYQuIpmxaW78lflTM5
	 g8PvhYG6lZ5Yw==
Date: Tue, 9 Apr 2024 13:13:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: michael.opdenacker@bootlin.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
Message-ID: <20240409-prevent-deepness-2d22bf009b16@spud>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_051338_645217_06AB6D7D 
X-CRM114-Status: GOOD (  16.32  )
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
Content-Type: multipart/mixed; boundary="===============3494382818629792601=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3494382818629792601==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9NJ+1qh0mf0Ujp8a"
Content-Disposition: inline


--9NJ+1qh0mf0Ujp8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2024 at 03:17:35PM +0800, Inochi Amaoto wrote:
> On Tue, Apr 09, 2024 at 08:45:04AM +0200, michael.opdenacker@bootlin.com =
wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > This adds initial support for the Milk-V Duo S board
> > (https://milkv.io/duo-s), enabling the serial port and
> > read-only SD card support, allowing to boot Linux to the
> > command line.
> >=20
>=20
> Hi Michael,
>=20
> I think your patch losts the board binding and have wrong compatiable.=20
> Also, the SD can have rw support with proper property. See link [1]=20
> (need 'disable-wp').

[1] doesn't go anywhere useful.

> I suggest you resubmitting this patch after applying clk patchs.=20
> This could reduce some unnecessary change. For now, you can just=20
> use the dts for huashan-pi (with changed memory size).

Why would using patched huashan-pi dts be more suitable than carrying
a local patch for duo-s devicetree? What am I missing?

Cheers,
Conor.

>=20
> [1]: https://lore.kernel.org/linux-riscv/IA1PR20MB4953B158F6F575840F3D426=
7BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com/

--9NJ+1qh0mf0Ujp8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhUw7AAKCRB4tDGHoIJi
0hxeAP9Gq5pqIE8VbwzobCLZkAoeBFVSPzoXf7wBfFedcwFlTgEA3f5KH2ThJh6z
E/9yUOzC5dwl7/X9hqNhekc6IjRtSgo=
=DmrY
-----END PGP SIGNATURE-----

--9NJ+1qh0mf0Ujp8a--


--===============3494382818629792601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3494382818629792601==--

