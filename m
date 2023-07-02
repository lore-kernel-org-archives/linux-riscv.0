Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61249EB64DA
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs5vJsSmg2YOiBe6lGBoM+T+ULEfCxnBcuM1hAY8z+4=; b=Rs1lnFMJuOWGKTOXwTUeOtZqPw
	w/D5KcquPykqQmOSmcSufuPS6gD+/gOYHKbtSfoYMZVOjMtCSObF+P/70qbePVb4tcTNuTJ+ugNc8
	NqDSADTP4w+3ws7CMmyRfPAtIqXhHe8GnIhjzn/pgoul/L02IjNrU9uJ28qM9wOrjq/9yxgqTvgH0
	Ch69ZxkwKVSrBDi4Wc2ofl6hy/Ib8HtMw/bVATAYFdVREY4HqMvPMsaUmWmoctphp28qZ43osC2HE
	fVCBteOd1XuH9Qjm8Y4JcFtBDDG5d5oJDtFP0y6ltLDLl/xwqH0em5UZ6artzkgaSvzKTkwzc5zoE
	K/RLvI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFwPc-007po4-1X;
	Sun, 02 Jul 2023 12:42:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFwPa-007pnH-1s
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 12:42:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C63B160C0B;
	Sun,  2 Jul 2023 12:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3918FC433C7;
	Sun,  2 Jul 2023 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688301761;
	bh=jVfUQVWB8u0PmmvQDyZ7KO7ngMdVLhTl+YUPfPEXFwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etgRBNp8U1GtrE29PKQP3Z3l+S96gV65/AkfTD5miA8hii+65r21ZygpaH4oa/xqS
	 VD0FpE9p5jIRdEFGPQS1D0AICq7rxv0y5f/bvUqiaSL87hpivTQ/SdqvrmaQ7YGgaB
	 6h+1UjENycYhZ9wBlyWGHvrhtLeSvTliD6PYZU2t43XGlgI9C+gT+XvZ08nKG8NxKN
	 oO9wGR43e29JGoaxOOjN/2Hjcz0NmWGPf9KBz9K+WiKz+LNXCxztfy7d7cRDmYzpYt
	 f7n8CTIbVoCqzaK5zocFUDlpy5BejlA1DUts7zqhSx+YX4HrLbmMeuKKPZ/2JzPYfo
	 X/dZEkgXcsExQ==
Date: Sun, 2 Jul 2023 13:42:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: ardb@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	rminnich@gmail.com, mark.rutland@arm.com, lpieralisi@kernel.org,
	rafael@kernel.org, lenb@kernel.org, jdelvare@suse.com,
	yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, geshijian@bytedance.com,
	weidong.wd@bytedance.com
Subject: Re: [PATCH v2 3/3] riscv: obtain SMBIOS entry from FFI.
Message-ID: <20230702-confiding-aqueduct-25c3c2852de3@spud>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230702095735.860-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230702095735.860-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_054242_663509_6E82D0D8 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: multipart/mixed; boundary="===============4681672578388794415=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4681672578388794415==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UYIYQ5+ccvyV+xol"
Content-Disposition: inline


--UYIYQ5+ccvyV+xol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sun, Jul 02, 2023 at 05:57:34PM +0800, Yunhui Cui wrote:
> When we bringup with coreboot on riscv, we need to obtain
> the entry address of SMBIOS through the FFI scheme.

What do you need it for?

>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/ffi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/ffi.c b/arch/riscv/kernel/ffi.c
> index c5ac2b5d9148..c44f943a1cb5 100644
> --- a/arch/riscv/kernel/ffi.c
> +++ b/arch/riscv/kernel/ffi.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
> +#include <linux/ffi.h>
> =20
>  u64 acpi_rsdp;
> =20
> @@ -34,4 +35,7 @@ void __init ffi_acpi_root_pointer(void)
>  void __init ffi_init(void)
>  {
>  	ffi_acpi_root_pointer();
> +#if CONFIG_FDT_FW_INTERFACE
> +	ffi_smbios_root_pointer();
> +#endif

Please stub this function so that we don't need ifdeffery here.

Cheers,
Conor.

--UYIYQ5+ccvyV+xol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKFwugAKCRB4tDGHoIJi
0u0QAP9PDkIgfu8QYYuLUfYPSliixPVA8qI4IFs1lvMEqm8TFQEAjpx7JLvefDUL
j3QKZLxc+OyZF1oBq//GpMhDgP3T2Q0=
=aVzp
-----END PGP SIGNATURE-----

--UYIYQ5+ccvyV+xol--


--===============4681672578388794415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4681672578388794415==--

