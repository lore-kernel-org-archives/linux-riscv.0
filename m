Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA5C77B7E
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzxVQpxo2BbpqalaIqriun9vOmfRv1PA75HW0PAegTk=; b=YLmi8CVafskgYgaWzKpIBfO865
	+zU0FmZw6pAZv177lDufB7uU4qVA5LR0LTQ7ZxD9pPiEZQl8/JA/9rP/6p+A+sjEac5kCVXt7VU2v
	h3Vq2TWAbdrw52d3u09wUSaswAuOswiYdMPd7T756tGqT8/r3gpXWgFEMNJKdf6Pj0lNtAJQ3cB1Z
	/w2sXBNCjvT3gcw0+dR3ayvTZ5neYQCrJxQcpOXZ71UlihqoxbVurM/r22Bzbf2GXNsSGy+5AP7Dn
	CIK/h68mXsK7NmVHeSSrooRA52sPidiwunRBJWa+zMf54iS6YHBWuOiKKYc/5+DUmvnsZ41ShI823
	TCqCwCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pshEI-00CVrQ-2O;
	Sat, 29 Apr 2023 09:50:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pshEF-00CVqY-35
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 09:50:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55BA560A16;
	Sat, 29 Apr 2023 09:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16431C4339B;
	Sat, 29 Apr 2023 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682761854;
	bh=3QV0GbV5gWzKWisLdYF7p6lD5dc3jxVmLZ6ZNkHJpNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BY48QoO1Ihbm7bGmZS3hbsdkJjRZjgWnvGrNiYl9zoCgQJwU/TvJYsY3WBAOjr10Y
	 S4+rkPcVQPnPhR4lEk1RsuLSWlsLYefVmIZUgQm1G5eDccohUZxcSZvomZ6GZpUsbV
	 StzOt59ZP35I8z3cFFUeAWf4eA2fA6EnD8NMWLaLA+omDqVU7QqNrpwbMmzT2sWqva
	 /8pqwmdm807CdeCKjeBRk3POGIE2NGB/ahJQ9GhBo6F7OHODhsqaZLVS/s68fgw/5+
	 ZMJQtnL4HGV6ercpMToq1hfwf9o9DRUE8nTvoQc/Dr/06D1RMZ+xApuQcQq/8U4/u9
	 gBBxYwS1d9ZnA==
Date: Sat, 29 Apr 2023 10:50:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] riscv: fix sifive and thead section mismatches in errata
Message-ID: <20230429-exclusion-specimen-f47b03c6d859@spud>
References: <20230429043530.20503-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20230429043530.20503-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_025056_068348_28FEE2D8 
X-CRM114-Status: GOOD (  20.90  )
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
Content-Type: multipart/mixed; boundary="===============5531984479187153477=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5531984479187153477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IcQ4eY/AV7BFjoO1"
Content-Disposition: inline


--IcQ4eY/AV7BFjoO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 09:35:30PM -0700, Randy Dunlap wrote:
> When CONFIG_MODULES is set, __init_or_module becomes <empty>, but when
> CONFIG_MODULES is not set, __init_or_module becomes __init.
> In the latter case, it causes section mismatch warnings:
>=20
> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cp=
u_mfr_info (section: .text) -> sifive_errata_patch_func (section: .init.tex=
t)
> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_cp=
u_mfr_info (section: .text) -> thead_errata_patch_func (section: .init.text)
>=20
> It appears that CONFIG_MODULES not set is not tested very much.

I dunno if it the testing is *that* rare, because I'm not sure that the
fixes tags below are correct. I think that it is actually:
Fixes: bb3f89487fd9 ("RISC-V: hwprobe: Remove __init on probe_vendor_featur=
es()")
That was only applied on 20/04.

Cheers,
Conor.

> Fixes: a8e910168bba ("riscv: implement module alternatives")
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/errata/sifive/errata.c |    8 +++-----
>  arch/riscv/errata/thead/errata.c  |    6 +++---
>  2 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff -- a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/er=
rata.c
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -82,11 +82,9 @@ static void __init_or_module warn_miss_e
>  	pr_warn("--------------------------------------------------------------=
--\n");
>  }
> =20
> -void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
> -					       struct alt_entry *end,
> -					       unsigned long archid,
> -					       unsigned long impid,
> -					       unsigned int stage)
> +void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry =
*end,
> +			      unsigned long archid, unsigned long impid,
> +			      unsigned int stage)
>  {
>  	struct alt_entry *alt;
>  	u32 cpu_req_errata;
> diff -- a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/erra=
ta.c
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -83,9 +83,9 @@ static u32 thead_errata_probe(unsigned i
>  	return cpu_req_errata;
>  }
> =20
> -void __init_or_module thead_errata_patch_func(struct alt_entry *begin, s=
truct alt_entry *end,
> -					      unsigned long archid, unsigned long impid,
> -					      unsigned int stage)
> +void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *=
end,
> +			     unsigned long archid, unsigned long impid,
> +			     unsigned int stage)
>  {
>  	struct alt_entry *alt;
>  	u32 cpu_req_errata =3D thead_errata_probe(stage, archid, impid);

--IcQ4eY/AV7BFjoO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEzoegAKCRB4tDGHoIJi
0neEAQDt7ZWE+zuZ+C9BSkBU7Mx6/aHmGOU/uJDzIBTwvI1PpgD+P0ufRsHpQfWX
jvvcKs6ip23Lvz6kqZ6YMmkMTSpDXAY=
=tmZN
-----END PGP SIGNATURE-----

--IcQ4eY/AV7BFjoO1--


--===============5531984479187153477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5531984479187153477==--

