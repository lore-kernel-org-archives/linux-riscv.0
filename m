Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0064C07E8E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 11:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hflIaR5H9dx2sHtsRfzv/8U1vkefto9rP8jdmBzA3k=; b=lQx2b8IIoxN7DbiLidGnNyVa6y
	7lLYwCtNslJGuiRBrx/UYpJcRpyWUiO0h5tO7czgp3pDeyEC7Es0wz66KKhrcFn+8CVRIVis/RQa4
	GCaNZP8dgYYIOkkXkzraArXlX35QKBhYczuAuiZaScKMyUWkgquQLrf3ftDcfqB2C6cHOMPOoESGQ
	7B35j2fEuslxhTYqT89nE+058563+vR7StAMPOFBNwPDP3tJWOO3IJmMytdJ5FouTLyPm1wjfGxUl
	rtQPdXaxJoTzRxo5e+uMWk+y+FMQCNifTNkhzg0XRMbGnSIK3NBIEm9n4wfkpviuLHvMoy0OskQpw
	Fpg+iFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbBk-00000003xrv-18i8;
	Wed, 24 Apr 2024 11:53:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbBg-00000003xr4-2jFa
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 11:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E211C6197E;
	Wed, 24 Apr 2024 11:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17F3C113CE;
	Wed, 24 Apr 2024 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713959599;
	bh=23Cvb1oQxiiBMinqA52N6tC+CyDRmP6EK//67Drz7Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ax1p09C4HyLvQXikKZI9gDm+6RVYhq0bMaMiM5506Axm+ysagYru3LA6p2cD8mHBR
	 pzzmbqFyubkIqhEoAQF9uCTZzY59OYkXdrB6oGXWtFMPJ5lnm0UBOjtD28ng3ATUQs
	 29QaZRCCDAwO1Az/3Jka99iWvh0zWXtd1MKN7ZT6Z82EzY85pCWcuwdkC4RAOHrJUU
	 Y9nNFLvjkK9amH/Lb7X9juwmJb4m41Z+eJzZsG6v82+uDwWHVmSzvPpINixB6rnAjk
	 mw5Hd5LQfYQlC8ZJd6MHkIFVwnJPG7CBf19YzOBF+Ls/FHumCztJHigGYhaD6trsbj
	 PtL+LNDPT+IYQ==
Date: Wed, 24 Apr 2024 12:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clocksource/drivers/timer-clint: Add T-Head C9xx
 clint
Message-ID: <20240424-cost-monkhood-14ab2a933bb5@spud>
References: <20240410142347.964-1-jszhang@kernel.org>
 <20240410142347.964-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240410142347.964-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_045320_963449_40DD4DFB 
X-CRM114-Status: GOOD (  28.24  )
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
Content-Type: multipart/mixed; boundary="===============2142337447713046861=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2142337447713046861==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lz5okcR+0u5/Th3B"
Content-Disposition: inline


--lz5okcR+0u5/Th3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 10:23:47PM +0800, Jisheng Zhang wrote:
> To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
> care two points:
>=20
> 1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> implement such support.
>=20
> 2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
> add a quirk for lacking mtime register") of opensbi:
>=20
> "T-Head developers surely have a different understanding of time CSR and
> CLINT's mtime register with SiFive ones, that they did not implement
> the mtime register at all -- as shown in openC906 source code, their
> time CSR value is just exposed at the top of their processor IP block
> and expects an external continous counter, which makes it not
> overrideable, and thus mtime register is not implemented, even not for
> reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
> extended CSR, these systems still rely on the mtimecmp registers to
> generate timer interrupts. This makes it necessary to implement T-Head
> C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
> reading mtime register and falls back to default code that reads time
> CSR."
>=20
> So, we need to fall back to read time CSR instead of mtime register.
> Add riscv_csr_time_available static key for this purpose.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/clint.h    |  2 ++
>  arch/riscv/include/asm/timex.h    | 18 +++++++++---
>  drivers/clocksource/timer-clint.c | 48 +++++++++++++++++++++++++++----
>  3 files changed, 59 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clin=
t.h
> index 0789fd37b40a..c6057a182c5d 100644
> --- a/arch/riscv/include/asm/clint.h
> +++ b/arch/riscv/include/asm/clint.h
> @@ -10,6 +10,7 @@
>  #include <asm/mmio.h>
> =20
>  #ifdef CONFIG_RISCV_M_MODE
> +#include <linux/jump_label.h>
>  /*
>   * This lives in the CLINT driver, but is accessed directly by timex.h t=
o avoid
>   * any overhead when accessing the MMIO timer.
> @@ -21,6 +22,7 @@
>   * like "riscv_mtime", to signify that these non-ISA assumptions must ho=
ld.
>   */
>  extern u64 __iomem *clint_time_val;
> +DECLARE_STATIC_KEY_FALSE(riscv_csr_time_available);
>  #endif
> =20
>  #endif
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/time=
x.h
> index a06697846e69..007a15482d75 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -17,18 +17,27 @@ typedef unsigned long cycles_t;
>  #ifdef CONFIG_64BIT
>  static inline cycles_t get_cycles(void)
>  {
> -	return readq_relaxed(clint_time_val);
> +	if (static_branch_likely(&riscv_csr_time_available))
> +		return csr_read(CSR_TIME);
> +	else
> +		return readq_relaxed(clint_time_val);
>  }
>  #else /* !CONFIG_64BIT */
>  static inline u32 get_cycles(void)
>  {
> -	return readl_relaxed(((u32 *)clint_time_val));
> +	if (static_branch_likely(&riscv_csr_time_available))
> +		return csr_read(CSR_TIME);
> +	else
> +		return readl_relaxed(((u32 *)clint_time_val));
>  }
>  #define get_cycles get_cycles
> =20
>  static inline u32 get_cycles_hi(void)
>  {
> -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> +	if (static_branch_likely(&riscv_csr_time_available))
> +		return csr_read(CSR_TIMEH);
> +	else
> +		return readl_relaxed(((u32 *)clint_time_val) + 1);
>  }

None of the else branches here need to actually be an else, since the
other branch returns. Otherwise, looks aight to me, thanks for the
update.


--lz5okcR+0u5/Th3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijyqwAKCRB4tDGHoIJi
0hy4AP9JegSBsHiHnM07wt58IUz0/2DqOK3o0ixEcZxvridBeQD+OvSUI8uuyTtQ
uumudgwba6J5ooHgWxpTebvoUvFCGAo=
=LZ74
-----END PGP SIGNATURE-----

--lz5okcR+0u5/Th3B--


--===============2142337447713046861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2142337447713046861==--

