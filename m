Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCBACF45CF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4zfl9DmLC1iNxRzwboZuklvwL788VbaQngYqDKX2BU=; b=4KyidSrCyl5zJ49gV2mFYgGSIq
	6diTmrupkz4UgnZB9jEPWUvzAUHF56yJOgifD0j6ypNczLN+9FBhghVVuWMEVL72hMWzS3ALYgH03
	pT2cP7EcGP4SZ1HX3uLZRE2hr8+pU+tiCIQ005ZPQW8kTJAxDVucH9sizy7EULb6Mj/4E4gvIXOze
	pbaZ+QSd1Br3o5NJ9PAmKYonUwSzgkq0Jj+zZuOaGfza6oOuCwnL8tEIG/B1NnSF+wb7zeSSbvlXp
	g7uqG66p9IUiYZhNuj7dTCxiQ/RNBqKEXvHhEFICm7L2vJvRS8DZgwL/RHneHmaC5HapEWK/L93PP
	N2jflxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPe6-00000006E0U-3KSp;
	Mon, 12 Jan 2026 21:40:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPe4-00000006Dzu-2HhN
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 21:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 088C84372D;
	Mon, 12 Jan 2026 21:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E10EC116D0;
	Mon, 12 Jan 2026 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768254015;
	bh=LOKmVbta3KTlWJmOJeErvVo/1aCGqs/kS5P/v8xIT3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzc0zWr2W5aD2r0ZMy3D4N4/K56s2M41SGvIrHAqAQUNJeWnFJ9omfRoDK027cOs6
	 fYegE+qhqx4F63n9SCSobEwwuJ75SVJ8HXzRa4tpYCD2qfEuE2EQjexGkqclkQlxu0
	 mQnBH7p+JC7r0FZjrsXwBkzKsMwyEGdraQ3Zm0Ut2U+kRwwr7zHZZlVsvgFRf5HGqw
	 uR51RPALmPAEn5CTUsyytKOKFLrQ/8na9dfe2yKseFjBanHd/rYC2DsfQIHJ5dwMcA
	 irk8HGDi1bdFooC//9nT70kg5DPoZxO/lKullY6snbMaiyyl97oPNGyt+fAi9GM9BC
	 2uvj/9iPPm/1w==
Date: Mon, 12 Jan 2026 21:40:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 09/11] dt-bindings: riscv: Add Sha and its comprised
 extensions
Message-ID: <20260112-quintuple-reviver-7f5af13e6399@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-9-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260110-k3-basic-dt-v4-9-d492f3a30ffa@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_134016_622867_C3F3302E 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: multipart/mixed; boundary="===============6186056820642027766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6186056820642027766==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OnOpPJV8XtrAgdMC"
Content-Disposition: inline


--OnOpPJV8XtrAgdMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 01:18:21PM +0800, Guodong Xu wrote:
> Add descriptions for the Sha extension and the seven extensions it
> comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
> and Ssstateen.
>=20
> Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
> "rva23/rvb23 ratified") as a new profile-defined extension that captures
> the full set of features that are mandated to be supported along with
> the H extension.
>=20
> Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
> and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
> b1d806605f87 "Updated to ratified state").
>=20
> The requirement status for Sha and its comprised extension in RISC-V
> Profiles are:
>  - Sha: Mandatory in RVA23S64
>  - H: Optional in RVA22S64; Mandatory in RVA23S64
>  - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
>  - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
>  - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
>  - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
>  - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
>  - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
>  - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--OnOpPJV8XtrAgdMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWVqOAAKCRB4tDGHoIJi
0kJIAPwMyqd17Gr0W0AzQIkInGX+fgrRE2t6v3qKpAOfalSyyQEA4En4SHB46aGG
PPpEsCnL16wsGwrk2jfzVNeBYJouUwQ=
=HvhX
-----END PGP SIGNATURE-----

--OnOpPJV8XtrAgdMC--


--===============6186056820642027766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6186056820642027766==--

