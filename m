Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F3DC83F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQI27K+UCH6HEaMroNFEh+iI40kUCkgl3ID6W1vwUGw=; b=4nMNxZBeFwLb+x7ABVrw9uanKp
	xGuTophVOXb74rcQaVsIgqo8RXvxdukZadOyLELDgGRE7tbYx9DjSyPt3yTMFPXS8hZ4I/SE9krVO
	KSzAxVBiOYR5ejdR2NB/zF7jO6KQukuTERm0mToLMnqjznGITr0kVFxUW4/lqpig/288ndBqS8ARu
	m1BpmiJ3zlrNkm9/H7MfD/goO8alOJ22UShSIx4WaHuv5r2uXGA2acymwh4Q0Eq9OeXIE3b/kxbIM
	QJ9kIGy4kaceV7h4h8pN7zOCO7DYe+E31pU9ROASLd1mFKvBNH7wKu1wB4mj/e+cJZWXk/mUKnqwJ
	G0USc9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkWG-00FZcW-2P;
	Thu, 31 Aug 2023 16:27:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkWE-00FZc3-0I
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:27:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67DB362899;
	Thu, 31 Aug 2023 16:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CACC433C8;
	Thu, 31 Aug 2023 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693499260;
	bh=XyBU7y8iftnfW1B0HnPV7Jewsik3C5z40GOikIPo1xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fznOIm8JEM6ueZP5h017wfCmPZ0Y9qVlwndF23JPofzAbq0vCkyKrsXBDUusy7kRj
	 tdzNfSV2IfLJlZPH44wzqwBECyP409ngJuerpiftyZfRPEiXREKuKUnejkVrbU8tHv
	 Y2MpGA++u3a9+Kci1qY3nTXCQNnoi1cRi1rkcv80THBcuzidxb7y4OtBhCMkI1aVM6
	 2+caLMZD482V2RkVNui+Sa7GId/V6jWBIswW987rV7VcxhdgtmCn82GhIAdUom1PQ+
	 z0CbpDbhqNjVZtXt+J3Ic+ctb+jxkzKfXmil71MUK7MvxxcNEJkQM87o9V5gTaJJ+v
	 RdoEWZ4Iee22g==
Date: Thu, 31 Aug 2023 17:27:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, suagrfillet@gmail.com
Subject: Re: [PATCH v2 1/2] RISC-V: Provide pgtable_l5_enabled on rv32
Message-ID: <20230831-mating-marital-9963d47f361b@spud>
References: <20230830044129.11481-1-palmer@rivosinc.com>
 <20230830044129.11481-2-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230830044129.11481-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_092742_211709_6E8BDFB2 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Type: multipart/mixed; boundary="===============8139846763162640944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8139846763162640944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8rWbC0X0koCA4Dly"
Content-Disposition: inline


--8rWbC0X0koCA4Dly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 09:39:19PM -0700, Palmer Dabbelt wrote:
> A few of the other page table level helpers are defined on rv32, but not
> pgtable_l5_enabled.  This adds the definition as a constant and converts
> pgtable_l4_enabled to a constant as well.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable-32.h | 3 +++
>  arch/riscv/include/asm/pgtable.h    | 1 -
>  arch/riscv/mm/init.c                | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm=
/pgtable-32.h
> index 59ba1fbaf784..49c42016f0ed 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -33,4 +33,7 @@
>  					  _PAGE_WRITE | _PAGE_EXEC |	\
>  					  _PAGE_USER | _PAGE_GLOBAL))
> =20
> +static const __maybe_unused int pgtable_l4_enabled =3D 0;
> +static const __maybe_unused int pgtable_l5_enabled =3D 0;

FYI the automation complains:
	ERROR: do not initialise statics to 0

> +
>  #endif /* _ASM_RISCV_PGTABLE_32_H */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 75970ee2bda2..dae884f52cc1 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -878,7 +878,6 @@ extern uintptr_t _dtb_early_pa;
>  #define dtb_early_pa	_dtb_early_pa
>  #endif /* CONFIG_XIP_KERNEL */
>  extern u64 satp_mode;
> -extern bool pgtable_l4_enabled;
> =20
>  void paging_init(void);
>  void misc_mem_init(void);
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 70fb31960b63..25ff8864e9bf 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -48,10 +48,12 @@ u64 satp_mode __ro_after_init =3D SATP_MODE_32;
>  #endif
>  EXPORT_SYMBOL(satp_mode);
> =20
> +#ifdef CONFIG_64BIT
>  bool pgtable_l4_enabled =3D IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONF=
IG_XIP_KERNEL);
>  bool pgtable_l5_enabled =3D IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONF=
IG_XIP_KERNEL);
>  EXPORT_SYMBOL(pgtable_l4_enabled);
>  EXPORT_SYMBOL(pgtable_l5_enabled);
> +#endif
> =20
>  phys_addr_t phys_ram_base __ro_after_init;
>  EXPORT_SYMBOL(phys_ram_base);
> --=20
> 2.41.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--8rWbC0X0koCA4Dly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPC/eQAKCRB4tDGHoIJi
0jUzAQDlIn7+niyRu9bDGejov1p0h4gimIQJTZ4WUgE9rWl3UwEAk/x3BIEElqHD
ttEloYNjJ/iwOWcqDB7Yu9yp6mPIHQg=
=Cq6a
-----END PGP SIGNATURE-----

--8rWbC0X0koCA4Dly--


--===============8139846763162640944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8139846763162640944==--

