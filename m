Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7654CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MXZ/K/xeRCst/jCKpS2yBxzD1r2sUWnYQOlx4SVwlI=; b=xgUFmmi4O/5Q44Zhvm0SyMdjDk
	ozW/hrySzwswOhfWML6ukVSNeelAMgUC5BbTCuceVRWg+s8zMqkw6tSpNkzD6iypTlDBMzASegQhW
	bwnlPttFmRm6jlxMoFGQsQ/wSTqO42O9tOAtI8a3jKLo7gCUBLihF3xrwF9B9oRe8AobuwVRA2GxA
	nkhGLKfd8mQbjtcKTQ20Pm67EtJTwC4lwenZ0qIjMB6T/HkLyG6NfwLdCi48PEZAy2taznj9Cl264
	cgzqs7vyd1M1UF658Zx127ocJ4/+iAFcjGmu0uzYGCpZB6auLEysVTwubm5kPRoVKBEezBcnZRZ1N
	DmUo/Myg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ttM-00000006jn0-2YyL;
	Thu, 09 Oct 2025 16:53:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ttL-00000006jmS-032A
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 16:53:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1E6C48831;
	Thu,  9 Oct 2025 16:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246BDC4CEE7;
	Thu,  9 Oct 2025 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760028802;
	bh=s3EeI5Z56afA2rXL7zIjK2ku2OOzEBiB/kUemFUGtIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoF+m5hsCRlnJ3mziERlyxeSUZkpA+Uq3/wyy0nW6KS76Qfb+DLrB7hQ4iX52qBHG
	 7tXtaxX24wHY/VwV9QKXc/FiB2EJAmz5u+VKW8IEu1dmCUNunglycXeDQVoaBd7VdY
	 dJzXhEOr48fU7PwHGyMy45putihKE4EoaFAvtrOVJ7FYK/LOCIiXQ6QvJFljBV3dXC
	 5lDb8tQRlWcItlQ+g9QOd+oI6bns4qp+WL2GQJP4+tUFU7s2GY/gsFpJdwkjJ4dKg3
	 bRNiLY4RVfWd+P6Ud/EfIwhG4WBQO0oJk5VxwnQC113R7E1j57jp6id5eK7q0kVWcT
	 FJMxRKP14E4TQ==
Date: Thu, 9 Oct 2025 17:53:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, rostedt@goodmis.org, mhiramat@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, ardb@kernel.org, willy@infradead.org,
	guoren@kernel.org, ziy@nvidia.com, akpm@linux-foundation.org,
	bjorn@rivosinc.com, ajones@ventanamicro.com, parri.andrea@gmail.com,
	cleger@rivosinc.com, yongxuan.wang@sifive.com, inochiama@gmail.com,
	samuel.holland@sifive.com, charlie@rivosinc.com,
	conor.dooley@microchip.com, yikming2222@gmail.com,
	andybnac@gmail.com, yury.norov@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: add support for Ziccid
Message-ID: <20251009-secluded-writing-adefb1f71a72@spud>
References: <20251009134514.8549-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20251009134514.8549-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_095323_091369_144966FE 
X-CRM114-Status: GOOD (  14.29  )
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
Content-Type: multipart/mixed; boundary="===============1334615570432915947=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1334615570432915947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nor471u/BfNy6yoJ"
Content-Disposition: inline


--nor471u/BfNy6yoJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 09:45:14PM +0800, Yunhui Cui wrote:
> The Ziccid extension provides hardware synchronization between
> Dcache and Icache. With this hardware support, there's no longer
> a need to trigger remote hart execution of fence.i via IPI.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Actual correctness aside, in an RFC should you really state why this is
an RFC and not just a v1 patch. You're missing a dt-binding change
that's required for new extensions, that you'll need for v2.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 67b59699357da..2da82aa2dbf0a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -540,6 +540,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> +	__RISCV_ISA_EXT_DATA(ziccid, RISCV_ISA_EXT_ZICCID),
>  };

The comment about this structure reads:
/*
 * The canonical order of ISA extension names in the ISA string is defined =
in
 * chapter 27 of the unprivileged specification.
 *
 * Ordinarily, for in-kernel data structures, this order is unimportant but
 * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
 *
 * The specification uses vague wording, such as should, when it comes to
 * ordering, so for our purposes the following rules apply:
 *
 * 1. All multi-letter extensions must be separated from other extensions b=
y an
 *    underscore.
 *
 * 2. Additional standard extensions (starting with 'Z') must be sorted aft=
er
 *    single-letter extensions and before any higher-privileged extensions.
 *
 * 3. The first letter following the 'Z' conventionally indicates the most
 *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
 *    If multiple 'Z' extensions are named, they must be ordered first by
 *    category, then alphabetically within a category.
 *
 * 3. Standard supervisor-level extensions (starting with 'S') must be list=
ed
 *    after standard unprivileged extensions.  If multiple supervisor-level
 *    extensions are listed, they must be ordered alphabetically.
 *
 * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
 *    after any lower-privileged, standard extensions.  If multiple
 *    machine-level extensions are listed, they must be ordered
 *    alphabetically.
 *
 * 5. Non-standard extensions (starting with 'X') must be listed after all
 *    standard extensions. If multiple non-standard extensions are listed, =
they
 *    must be ordered alphabetically.
 *
 * An example string following the order is:
 *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 *
 * New entries to this struct should follow the ordering rules described ab=
ove.
 */

Cheers,
Conor.

--nor471u/BfNy6yoJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfoegAKCRB4tDGHoIJi
0hdSAP4mmjzLQiGeP2lXFFu31PWRRLqRQHE8ipZDJS96deFWTQD+PwyH70gg9y03
slIpEN0aUuJ9z2FpvqNH5MXCJurtAgE=
=tcgM
-----END PGP SIGNATURE-----

--nor471u/BfNy6yoJ--


--===============1334615570432915947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1334615570432915947==--

