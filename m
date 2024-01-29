Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B3C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23q2M1CLdxQ66XXxAIlRbVBai4Ge8bvBVERBt3oJxOo=; b=gIzUj5DB/Q6KIDWldoM+RahhpJ
	WZa1D1ebuFuvDBck1REhJrQyFiIfzBhFqZJWurNpbzQ72rTAeLPNTMr7F12IEE6WvsCwxFaE2t0UA
	K7a/DI9vRsvnrX8pgNATzlnJqIN12+QTD9bug97wYdKXgblucrZyHU7SyM5wJugPY6F3viWO9vRWu
	QThWP4Rao5Qa3MbCaHkcsjDFfNXHlq4DUWVSP8Syuy6s+dm0SM+MwRiym0OkZN5bQPEK8vd2U/eTg
	aj5h5dP0xS42B8Dy3sNo4uj0QSuzT5nJU7GjTYBSYTV0AvjihvTg5EdQdKRHkn9Z352+6elrRVqAT
	FTn5p0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQ9V-0000000CSkE-2txe;
	Mon, 29 Jan 2024 11:50:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQ9S-0000000CSjS-2wBB
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 11:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA0DFCE11E4;
	Mon, 29 Jan 2024 11:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5D6C433F1;
	Mon, 29 Jan 2024 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706529004;
	bh=d/7Cao1fa5uNtHVJeNeOcyV5BXPwyg7qKYG0DlJJURU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhsCfzMtF+wa0MRKxpY6wjlhTJZ9p3pPVJ/mL6dNu/h5UzruWXsGFrwwg+zXoMdeO
	 faqJYtcL9qn0Ag34GPs9rPYMRMi2VOzHitogsyekads18D0O8mThUZgCHLVppzKXEj
	 PNcicpWZFcv310lzAeP/WToWutVe7YRjlCwP/sGmeJe/KC5m40ugmlQQFdZJh7Yiwz
	 sLPqf7DLssf7x5tA1/9w8DXKGTdWrXAEBj+ZlsDSMVKIaD4SVm7dAM3ATQ2U6zeitY
	 6Dr6P3QKOqLzD9pbeHdve+EiHxDhO5Wqi03qrRCXVy0yWsmVuxaN4RG5mthSlu2QCJ
	 bBfgJBbtSqkfA==
Date: Mon, 29 Jan 2024 11:50:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, robh@kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com
Subject: Re: [RFC v1 0/2] riscv: Cache Population Code Refactoring for ACPI
 and DT Support
Message-ID: <20240129-disburse-plug-9f4a37c550f3@spud>
References: <20240129075957.116033-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240129075957.116033-1-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_035010_962803_3D8D9C41 
X-CRM114-Status: GOOD (  12.26  )
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
Content-Type: multipart/mixed; boundary="===============7463134167035143049=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7463134167035143049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o34RwNIDBnTGdKPm"
Content-Disposition: inline


--o34RwNIDBnTGdKPm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 11:59:55PM -0800, Sia Jee Heng wrote:
> This series of patches refactors the cache population function to
> seamlessly accommodate both DT and ACPI-based platforms. Additionally,
> to streamline the code, the unused parameter in the ci_leaf_init()
> function has been removed.

Why's this an RFC? I don't see any mention of why.

Thanks,
Conor.

>=20
> Sia Jee Heng (2):
>   riscv: cacheinfo: Remove unused parameter
>   riscv: cacheinfo: Refactor populate_cache_leaves()
>=20
>  arch/riscv/kernel/cacheinfo.c | 50 ++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 30 deletions(-)
>=20
>=20
> base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--o34RwNIDBnTGdKPm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbeQ6AAKCRB4tDGHoIJi
0hrSAP9VpSG7xJ0EGkIkENZOYmiIn8wZFM2aQt/wBKaDPeX7fwD+Jx9Ffx+YGruo
IXh5n+p/dDi2z5gI/jsh/cRaRPk/7ww=
=0ZiD
-----END PGP SIGNATURE-----

--o34RwNIDBnTGdKPm--


--===============7463134167035143049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7463134167035143049==--

