Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F5AC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7ksqTvTlIgIMxMoa4s2Qo2NqJDjSV4SZJbmBKeKBTQ=; b=RDNjjxcMdukWGpzgdGtdnVfj7a
	W92D+X9lF4MHOMeWH4eYYixMtLIrJYfCxhNp7QfG8RMInlobXwScduTzBSD9PRdzRbXFi0zJsp3zw
	GhgL25J+rkiQFc09i6UlLWe04qYM/xEsEnyrSwRCwxoIVNy6KyMgeYyTpOalkJi9wp95AbhzZh9TM
	WRqt9hXRwWjavqZp10ngzdbPOi+NL0854ZVF6jXD/WzCxB7Hg+HE4rdsEL9+RqT2KVFMdUub2ehqH
	+YHu6iwrPgFa/BXdI/RVlB5e+W6rr05QFPqYz+taCZO63DyTaVTa01yQl1QifFOn07fxKrN7zZCpi
	05Q8dAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lmv-001fai-1u;
	Wed, 22 Nov 2023 11:53:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lmt-001fWR-1V
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:53:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7F9CFCE1DDB;
	Wed, 22 Nov 2023 11:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB449C433C8;
	Wed, 22 Nov 2023 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653973;
	bh=6HUfCsIZN73Rfw9oZVATg1h0lM2yZjP8z3Oyozgx/P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmli1BSFtWbxoDvzjlM4fWq1nk+WcjRWNLmiG6UGJFyjEQXAkOt4zsDfPUF1AJtbU
	 qPSB+aPTAvHc4X27KHfzCx3/1k4J7VZiLZPJXh9O5nGxhAtvF2W2c25Eorr1rnguuE
	 stWlEj8kgsygCPcoHTjKpI+OpZPJZ/2TjmZKUu/DeI2v0avddvgLS0nPw7hl/1X9HK
	 9u6j3BK0WdKCaECaYDCRT9hrG8tNdQ3s86C1ONUdbimNjqMbajMawtdQQqpgQXUq+S
	 ZJNcTytEhPuxLTzIj665mLon2G2riQs17UGYT+zXOBoQyEHZybpqvlcrhXCsEQGv2J
	 tFGOB7dq12N3g==
Date: Wed, 22 Nov 2023 11:52:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: sifive: shunt ccache driver to drivers/cache
Message-ID: <20231122-reanalyze-modified-9e59bbc89864@spud>
References: <20231012-mooing-refined-ad1ab421c0d3@spud>
 <d94d54d2-50a3-4dc8-9178-e69c118aeefe@sifive.com>
MIME-Version: 1.0
In-Reply-To: <d94d54d2-50a3-4dc8-9178-e69c118aeefe@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_035259_689810_DE5F2EBC 
X-CRM114-Status: GOOD (  11.38  )
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
Content-Type: multipart/mixed; boundary="===============0086522774527731464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0086522774527731464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rNDhmjMV63rJ3BwW"
Content-Disposition: inline


--rNDhmjMV63rJ3BwW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 07:25:20PM -0600, Samuel Holland wrote:

> > +if ARCH_SIFIVE || ARCH_STARFIVE
>=20
> Since this is now in a file grouped/sorted by subsystem instead of by pla=
tform,
> maybe it makes sense to convert this to a "depends on" line?

I did that on application, thanks.

> > -source "drivers/soc/sifive/Kconfig"
> >  source "drivers/soc/starfive/Kconfig"
>=20
> This file has a conflict and needs to be rebased, but otherwise:

am -3 took care of it :)

> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>

Cheers,
Conor.

--rNDhmjMV63rJ3BwW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV3rkAAKCRB4tDGHoIJi
0gJRAQCwfZQa91tNalHtWg8iTRs3q9HQ052E5Uh3dKT//WBpWwD/QP7AySJZUHGo
PAy7SRowDv8Qyg7KxGUqZSh3hgp/rw4=
=4nYW
-----END PGP SIGNATURE-----

--rNDhmjMV63rJ3BwW--


--===============0086522774527731464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0086522774527731464==--

