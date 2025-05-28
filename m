Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6D0C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJOvhK0h3HCSBsPlucdwzl6lAwKi3DCdKcimdlZs1II=; b=X/KYlGKtxqKqPtoh/HO8LUQMKE
	aABLHyhC3qnLGT74xtLJdwMyHXbvSLrVbPHV1b8zG4G4RzNz5GI75hbgRYJepsERkFkZjXcN/UxHK
	01rOWjxmxL/nn7gxuQNDx9pXh/Xk7/baDx7OgPXW18v7Uj739nmo1Q5ojxt8e8+DId2FnqWsKw/1z
	9HyDBpLteX70a0AxlXhuEqNslwbwZ/go7EGNlOGM8+Fl/jP0dmTydSbdbE+gH8bMeFKzC5Tdtot7T
	J3jY9hLbYvVLEaGuerAXKXqDYHf+bNtXltzUid9sMzzWJwA/39XXWHx3gwNFgvpbjLWOOvxztLETC
	222sUtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHwe-0000000DRUX-1Btn;
	Wed, 28 May 2025 14:39:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHvz-0000000DRMo-2cZa
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 14:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F66E629CE;
	Wed, 28 May 2025 14:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33433C4CEED;
	Wed, 28 May 2025 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748443150;
	bh=MDmnkq8+Itlg3khoIZNBGAIgH4Fb/xMO2XKebl8pjFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We/bsCcOlCTZfNb1DUVQgicc8PAfli6EFlqnWncULdYK/TmHdJHOWhZ3OUh/jaFSL
	 omS7gB7RwuJ8+veFWfewUHEoWJXQpWK0tVAKSOF+R/e0zjVWZJHXOW6OJJpwSNh0hn
	 72TsGoFyuwUtCR1jN9H03yfHdfOfwUvg5p4Ve75BiwFeA4UGwOb1vyHy8nZD5zq2vN
	 JpaNchKBLi7KHvlpn4nC7Hk4BvdPXiugKaagEE5mIZbthW1y9cCnEMwdfHV1E35J+f
	 ol4MPdBSldz7PxoFjq16jzWZ+EyGbkD0DpSf7USAZH4agtpg1KwXp4tNs+iivUbIYZ
	 zI2nK49X6e8dw==
Date: Wed, 28 May 2025 15:39:07 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: cpufeature: add validation for zfa, zfh and zfhmin
Message-ID: <20250528-stuffing-parasitic-89064d69d780@spud>
References: <20250527100001.33284-1-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250527100001.33284-1-cleger@rivosinc.com>
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
Content-Type: multipart/mixed; boundary="===============7397460863594746094=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7397460863594746094==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KDMI6SrfLb5YgK4d"
Content-Disposition: inline


--KDMI6SrfLb5YgK4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:00:00PM +0200, Cl=E9ment L=E9ger wrote:
> These extensions depends on the F one. Add a validation callback
> checking for the F extension to be present. Now that extensions are
> correctly reported using the F/D presence, we can remove the
> has_fpu() check in hwprobe_isa_ext0().
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--KDMI6SrfLb5YgK4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcgCgAKCRB4tDGHoIJi
0tcIAP96A+ZQ0TxlKr55JHZ0NuqQ1MG8NvB7955IHUTsvSSHSwEAiC6UiaVfS5AS
pw2FqoPvoXb/TdUUyuHoIubHVOoX5ws=
=g5Ge
-----END PGP SIGNATURE-----

--KDMI6SrfLb5YgK4d--


--===============7397460863594746094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7397460863594746094==--

