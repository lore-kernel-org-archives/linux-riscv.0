Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB21061B12
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTUIYR7sAAFFY35hAexMYsP2E6ZYRjBLeyxKD1aq2Dg=; b=PzimbjWdASdMG1U1Okon8w+gZ7
	hZTDY5Jv+zDQ4Dep4Y75TkZdDOZYMTTpoJg77Qi2/S7zP4LX+8E62Bn7sWLaTfkj2/lWafSdmflO2
	3kdr20v9DVMalZA6V5aTKnyP5Z3nwdOIvSpy1EDZhxOnFFyLThR1MrrtPmqzurOM4espZ846IJmZI
	/YO5Twpr2cnoz5vejjDIJ6HcyCIyeWly/rzwLlD6/fFmSsmy1rhKjwn4ze0MFY5IFGNZh+dtFA5+c
	CJB5Rm6YIjFHf8pmqbk2U1X5jHLndvZpT2GUH36SZRq0MPyMncKKDihhh/PIxTf4uxmlqYOS93XUt
	EdS/vGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7F6P-0000000Bby7-3H0C;
	Mon, 30 Mar 2026 16:04:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7F6M-0000000Bbxm-3MfF
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 16:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EDAA416C3;
	Mon, 30 Mar 2026 16:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FB6C4CEF7;
	Mon, 30 Mar 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886670;
	bh=owNCY5NrXXCi7Gi47uvNRkPcUBD4vZPhSUHEWfE+QDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VC0iAUrPFUKXwdCr0/Owz+hUIBfcN8/LHgpvAwPtrhGm3W+5mmhjwA6e/8+c6rYLE
	 A1VKcytW9oH2X/YJZUk031Y7nO27Tv/6wLqcT7MOtDw1dGHF7/J+ExVvMFY1BlEc5T
	 ZilnacoTQ8nfzxA21Mz9hgZef7TUqDN/Vi+gay7Tte31xhB9pdXTV/oh8ZSE/cv4IM
	 v/cpbHDiuWbR45bCLxqTjiaSXJmsoosNilecVPQTVKTzaJIsJJ2AL0/X271XjZkwzr
	 elsLZXbKZlJnD/mzaeKbkdcGfzQwWwgslKg42I/3nRa2nre0sC9nziGp9oChIVgx8C
	 t00S/FP9F5D5g==
Date: Mon, 30 Mar 2026 17:04:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com,
	Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: Re: [PATCH 3/7] cache: andes_llcache: improve performance of LLC
 operation
Message-ID: <20260330-snowbound-obtrusive-92ff63549bad@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-4-minachou@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20260330102724.1012470-4-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_090430_899971_6869803A 
X-CRM114-Status: GOOD (  23.80  )
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
Content-Type: multipart/mixed; boundary="===============3132640496063294276=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3132640496063294276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A56KgNt4UDiuDCQI"
Content-Disposition: inline


--A56KgNt4UDiuDCQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:20PM +0800, Hui Min Mina Chou wrote:
> Eliminate get_cpu() on !CONFIG_SMP and switch readl/writel to their

Where is the get_cpu() that you're talking about eliminating here?

> relaxed variants to remove unnecessary fence instructions on I/O
> memory access. The platform specification defines all I/O regions are
> on channel 0 (point-to-point strongly ordered), so explicit fences are
> not required [1][2][3]. Explicit memory barriers (mb) are added before
> and after the CCTL loop to ensure overall memory consistency.
>=20

> Also fix hart ID mapping by switching to cpuid_to_hartid_map() instead
> of using the logical CPU ID directly. In AMP setups (e.g. Linux on
> Hart 1, RTOS on Hart 0), Linux sees itself as CPU 0 but must access
> Hart 1's CCTL registers, so using the logical ID would cause accidental
> interference with other cores.

This seems like it should be a separate fix for sure.

>=20
> [1] platform spec 2.1.1: https://github.com/riscvarchive/riscv-platform-s=
pecs/blob/main/riscv-platform-spec.adoc?plain=3D1#L169
> [2] privileged spec 3.6.5: https://github.com/riscv/riscv-isa-manual/blob=
/main/src/machine.adoc?plain=3D1#L2835
> [3] riscv: asm/mmio.h: https://gitea.andestech.com/RD-SW/linux/src/branch=
/ast-v5_4_0-branch/arch/riscv/include/asm/mmio.h#L105
>=20
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  drivers/cache/andes_llcache.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
> index d318b8009f7f..57f666bc537a 100644
> --- a/drivers/cache/andes_llcache.c
> +++ b/drivers/cache/andes_llcache.c
> @@ -66,7 +66,7 @@ static struct andes_priv andes_priv;
>  /* LLC operations */
>  static inline uint32_t andes_cpu_llc_get_cctl_status(void)
>  {
> -	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
> +	return readl_relaxed(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OF=
FSET_C0);
>  }
> =20
>  static void andes_cpu_cache_operation(unsigned long start, unsigned long=
 end,
> @@ -74,16 +74,22 @@ static void andes_cpu_cache_operation(unsigned long s=
tart, unsigned long end,
>  {
>  	unsigned long line_size =3D andes_priv.andes_cache_line_size;
>  	void __iomem *base =3D andes_priv.llc_base;
> -	int mhartid =3D smp_processor_id();
>  	unsigned long pa;
> +	int mhartid =3D 0;
> =20
> +	if (IS_ENABLED(CONFIG_SMP))
> +		mhartid =3D cpuid_to_hartid_map(get_cpu());

But I dunno why this dance is required. Can't you just retain the call
to smp_processor_id() and pass the result unconditionally to
cpuid_to_hartid_map()? Or just make it a oneliner with
cpuid_to_hartid_map(smp_processor_id())?

> +	else
> +		mhartid =3D cpuid_to_hartid_map(0);
> +
> +	mb(); /* complete earlier memory accesses before the cache flush */
>  	while (end > start) {
>  		csr_write(CSR_UCCTLBEGINADDR, start);
>  		csr_write(CSR_UCCTLCOMMAND, l1_op);
> =20
>  		pa =3D virt_to_phys((void *)start);
> -		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
> -		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
> +		writel_relaxed(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mharti=
d));
> +		writel_relaxed(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mh=
artid));
>  		while ((andes_cpu_llc_get_cctl_status() &
>  			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=3D
>  			ANDES_LLC_CCTL_STATUS_IDLE)
> @@ -91,6 +97,10 @@ static void andes_cpu_cache_operation(unsigned long st=
art, unsigned long end,
> =20
>  		start +=3D line_size;
>  	}
> +	mb(); /* issue later memory accesses after the cache flush */
> +
> +	if (IS_ENABLED(CONFIG_SMP))
> +		put_cpu();
>  }
> =20
>  /* Write-back L1 and LLC entry */
> --=20
> 2.34.1
>=20

--A56KgNt4UDiuDCQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqfCAAKCRB4tDGHoIJi
0hxrAPsFopm3rlVHdGdGWrZBgZ2VVCjgEhwQ655QHUxzHVCa2wEAg6oe7w0BdhmL
L3ERf7rF84HDlqz73WtNqaR3tMixowE=
=rsx9
-----END PGP SIGNATURE-----

--A56KgNt4UDiuDCQI--


--===============3132640496063294276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3132640496063294276==--

