Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFA5C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 23:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fdikhv7g8LzEERKDj4fC9AfGPrXFfzkeQgEYgNIsjw=; b=2vna07D6JV8iuiy/Bdd8E3nIdT
	PWwV8gl3nREF3gHmvdHcuOedmTeDqQ+vW4E1++By36EUO5AGpFKuRDn0j/v8zqG67Bh2lw5phvC5R
	r7NABVf9IA7iTzP8W/kMwCRfvpC995xZEB7KmHrOSNonFGk2E/7BZkB5b8XnRcsYACcNzmMogjvey
	BF7ZlAa4NhtQFs7/b0EHbgBpYP3cEEUVv+t1dQEFaBov7pra69B9ehnATKOvmWwVmDG4xhuRq/obo
	rP0WqP4yqa1+ZToSsYi9snlL25fFRKMda+2esJgCJL4ek3fE2WIbN7tofmqXeTl9UKa27jXMlvIYg
	JZC46+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLYH2-00GrfM-BJ; Fri, 27 Jan 2023 23:36:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLYGz-00GreU-1p
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 23:36:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3519861DCE;
	Fri, 27 Jan 2023 23:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D09C433EF;
	Fri, 27 Jan 2023 23:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674862603;
	bh=VWlzWalnkhO1dohr/NVJ6IZeHtHEw2u6z553J4C7hrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNksFuc7dfDCFXFmM+MOZMTmiGs5w0d9rSTZdOucxVGg+rPtU0FZyHxukJrwGMnyE
	 P53Yl7QKjzeg/+lgWEZcuieSfeNvsctPmI+6dqUTI7yqWEEOUebzOVlv8WAvpXZxYP
	 6dYY7SE98rIkmefqh11iFJ/OGy+iCTUK/3uygjMPd4JlhKxFkwI7v5UzE82n8gBRzN
	 whv545rDPf/4WQZUfowe7OBB3T0xJccYN1Wpu+s2u1QC1d41kZRZ2GXK/Wdw3SZlkK
	 cpazTg+eXGRgIl2tPacpLk8lVTs04FAfAc34xQJoE+SZXBXZ+cHesENMj4iLBP8JDe
	 mknmGSb55FBGA==
Date: Fri, 27 Jan 2023 23:36:38 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, conor.dooley@microchip.com,
	apatel@ventanamicro.com, atishp@atishpatra.org,
	mark.rutland@arm.com, bjorn@kernel.org, tongtiangen@huawei.com,
	ajones@ventanamicro.com, andrew@sifive.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] riscv: Fixup race condition on PG_dcache_clean in
 flush_icache_pte
Message-ID: <Y9RgBh9X6KM1/uvp@spud>
References: <20230127035306.1819561-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230127035306.1819561-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_153645_197014_E12B6943 
X-CRM114-Status: GOOD (  20.72  )
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
Content-Type: multipart/mixed; boundary="===============4758355478732505490=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4758355478732505490==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GuNVYafotbXvgZR0"
Content-Disposition: inline


--GuNVYafotbXvgZR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Guo Ren,

On Thu, Jan 26, 2023 at 10:53:06PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> In commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean
> in __sync_icache_dcache()"), we found RISC-V has the same issue as the
> previous arm64. The previous implementation didn't guarantee the correct
> sequence of operations, which means flush_icache_all() hasn't been
> called when the PG_dcache_clean was set. That would cause a risk of page
> synchronization.
>=20
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executabl=
e")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
> Changelog:
> V2:
>  - Optimize commit log

Probably would have benefited from providing the analysis that the arm64
commit did, for riscv, rather than referring to theirs.
But that's not really important and the diff itself seems sound, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  - Rebase on riscv for-next (20230127)
>=20
> V1:
> https://lore.kernel.org/linux-riscv/20221023133205.3493564-2-guoren@kerne=
l.org/
> ---
>  arch/riscv/mm/cacheflush.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 3cc07ed45aeb..fcd6145fbead 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -90,8 +90,10 @@ void flush_icache_pte(pte_t pte)
>  	if (PageHuge(page))
>  		page =3D compound_head(page);
> =20
> -	if (!test_and_set_bit(PG_dcache_clean, &page->flags))
> +	if (!test_bit(PG_dcache_clean, &page->flags)) {
>  		flush_icache_all();
> +		set_bit(PG_dcache_clean, &page->flags);
> +	}
>  }
>  #endif /* CONFIG_MMU */
> =20
> --=20
> 2.36.1
>=20

--GuNVYafotbXvgZR0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9RgBgAKCRB4tDGHoIJi
0m+jAQCoWHcrkvq5cRc39KGXssFRtqfRT9ZMxIkLfGtPSIG16QD/fWAAQ8JWzxde
siNntjh6A6FImIAQ0pLweSyiW0bfEAk=
=qMS9
-----END PGP SIGNATURE-----

--GuNVYafotbXvgZR0--


--===============4758355478732505490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4758355478732505490==--

