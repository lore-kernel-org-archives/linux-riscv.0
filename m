Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D96C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ebsx7kCfi3RfJIj93SnF4AVtA9PoiECEjXVdzILlCc=; b=aFBp3c8TgX8nIEwg3RwZSskPUN
	csrcRteQyv7A4b1KeOUqLXxs5uDZXVJHlPsAThuy8altfVJJtnZoIlE0MLns6k3/KBUoT/MVnqFlM
	iZ6IyxJYyd19oWUBZqSokBc3xrUOKdWFdgVRUJDFAFUIB9FT2G5I/BrpT1Wm2pceKKozSHGSi5xUf
	EKjTvwTrXmRFGndjfExk8TYC2ACMISoZqqJ+TfWIiPyeuDzP1H9qRNnVH/Qcufpvc1sIWxg6iF/uL
	Z3/ihjsZUhSfoSmujUwS2GRSAnbQoVuTPf8lPop816e4P3iz/yQuUF3KQTMgdCmCFPSN1DFyERNdX
	NTVt9H5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcGt-0000000FyRw-1wHM;
	Tue, 18 Jun 2024 17:05:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcGq-0000000FyQk-387t
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 17:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09762619EC;
	Tue, 18 Jun 2024 17:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B60C4AF1C;
	Tue, 18 Jun 2024 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718730323;
	bh=JquywNTKPX5QUQzK0Z8qnVuMwB5TBtbhostjnazELj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0RpD+rv57DLs/GLyn6oBA+H3K7Syjjxgh5bWWh3Y7ieVyQgAsw6MoH/8kqCPSRn9
	 vidbB7/rnRh2oMi7Rs5ayBKHFF3+z5Z9CM5uSWqaA2CYmcM9IrllqyQosJFd+1gH2M
	 ubyHmgkqijVZXanlgyja8ClmnuXrs+QeRM/271sgIK5IWLVLz0DOxaz6/cnGHtkxVr
	 u4SNfdzuJqE0rrhg1epUbLMmkUxwu4GS93HVPWRkFFd0sZZflqBWtyUk9/JiZAoZFA
	 ClbnoDk4Pg8OmvyzLPXdxrs0ULypOkZEYfHi2UquBJjVTIIJaGgugcqF7lV+A0Uy68
	 B0I5j8+0WuOKg==
Date: Tue, 18 Jun 2024 18:05:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/9] dt-bindings: timer: Add SpacemiT K1 CLINT
Message-ID: <20240618-retriever-outlying-e7209ff51ad3@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_2A51312A21F88DDB7C7D82A2DA8E8EE7B808@qq.com>
 <20240618-backlands-flaring-f8b8b603868c@spud>
 <tencent_895CC418D210ECC617BE44C17EED3BC72E07@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_895CC418D210ECC617BE44C17EED3BC72E07@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_100524_919960_3297E797 
X-CRM114-Status: GOOD (  13.50  )
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
Content-Type: multipart/mixed; boundary="===============7383174924572974643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7383174924572974643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o/ilq4bEQ8dG8Vw0"
Content-Disposition: inline


--o/ilq4bEQ8dG8Vw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 11:48:26PM +0800, Yangyu Chen wrote:
>=20
> > On Jun 18, 2024, at 23:40, Conor Dooley <conor@kernel.org> wrote:
> >=20
> > On Mon, Jun 17, 2024 at 01:20:49AM +0800, Yangyu Chen wrote:
> >> Add compatible string for SpacemiT K1 CLINT.
> >>=20
> >> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Actually, I'm not confident about this after carefully reviewing
> the file. The "riscv,clint0" is marked deprecated, and the description
> is For the QEMU virtual machine only.

Right, I forgot about that portion of it. Probably, if this is sifive
plic compatible, then fall back to the sifive clint. Same, I suppose,
goes for the plic etc. The alternative is not have a fallback, modify
the driver, and future spacemit things will fall back to the k1's
compatible. I don't mind which you go for.

--o/ilq4bEQ8dG8Vw0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnG+TwAKCRB4tDGHoIJi
0i8xAP9kPV1VZMwXtA842OYL9xVaeu9LyrHcQOF0jq6UsoggfQD/V2NZrL39HZ34
hC/POL8gHioOOkhwLfguC2ZYwPVaZQ4=
=2APS
-----END PGP SIGNATURE-----

--o/ilq4bEQ8dG8Vw0--


--===============7383174924572974643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7383174924572974643==--

