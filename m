Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4DCC636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhZ/WQEaYSKPnDNzmlIwQZbUqCOjlFV2aq8nyWRuQnk=; b=m6q9dtrDLjW7WP0pk4/yxyA8u1
	qDj/C2q8IplYjlRfyxiyZui1dMt4666aTVDsLdAkbVm9ts1a3nhIXf9296dBBdPt66qJZOdd7uWUV
	Kpcmve+cuZXpj/U9JhBX9PdPozWE2N9jIw/h9JF/vcMQRcfdSbBUr598pVxYVdiOdp6pCFraSHRJ7
	sTXe5YALxudPliuPKLgziBUv9lTAOABqbyhcUES0T3ez5lotxqXjBfFAaOWzBrFJlcWdhxybhTL9S
	72DHzczE0eks3lltTFDW8a5c1dLiYq5JyU4ObXFDi8VkrnC4dLrIWs6igESR8u2WPbnEHfbO5Qo/g
	rmPH5JbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqb5-00GowZ-6V; Wed, 08 Feb 2023 19:59:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqb2-00Gov9-DQ
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 19:59:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0AC4617BE;
	Wed,  8 Feb 2023 19:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09504C433EF;
	Wed,  8 Feb 2023 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675886346;
	bh=0L/axqFrTla1CjyJcAYNEtPZxT9IS5v2UY5FZZEsCkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFqrMlQmq/8t32iG+XK1RwRmiNQkaDdASAMhJ5U2dk/ihWKkwE4y7Bjji7Hg96vyU
	 WAZZKauygf7/Uyzr2hM76BT/f/d3qklXvwqLPiTW0awBdxYYkyirs561FZmYIsljS+
	 /7/zSLfvTStUgDEIzQ2biuTb0GlGVrU4WAp6C6ROgv97vMdpUgfC+nNbur0eBEA7rD
	 iLIjN+lSEOLmNSWuRRnOdtl7SH7zLEwqzJpQ5VnVaaN+PW9JobJDXunpOEGP53oDF7
	 OkZEIHrssruZ/bBCJ0Kz253RcOWxNqKNOXSTjss1a1ZeePJ+s37UxXWbVZIIxvh/jf
	 /XMOZ8E+BF8xA==
Date: Wed, 8 Feb 2023 19:59:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Robert Moore <robert.moore@intel.com>,
	acpica-devel@lists.linuxfoundation.org
Subject: Re: [PATCH 02/24] ACPICA: MADT: Add RISC-V INTC interrupt controller
Message-ID: <Y+P/BDbP68vNTOao@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_115912_560312_362566A5 
X-CRM114-Status: GOOD (  22.67  )
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
Content-Type: multipart/mixed; boundary="===============5320790054924736869=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5320790054924736869==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C3CfOFtGyHgf+Q8p"
Content-Disposition: inline


--C3CfOFtGyHgf+Q8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:03PM +0530, Sunil V L wrote:
> The ECR to add RISC-V INTC interrupt controller is approved by
> the UEFI forum and will be availabl in the next revision of

nit: available

> the ACPI specification.
>=20
> This patch is not yet merged in ACPICA but a PR is raised.
>=20
> ACPICA PR: https://github.com/acpica/acpica/pull/804

I had a quick check with git grep, and as this doesn't appear to be a
regular pattern in the history, so could you please make this a regular
Link: trailer?

Cheers,
Conor.

> Reference: Mantis ID: 2348
>=20
> Cc: Robert Moore <robert.moore@intel.com>
> Cc: acpica-devel@lists.linuxfoundation.org
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  include/acpi/actbl2.h | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> index b2973dbe37ee..c432fd15db65 100644
> --- a/include/acpi/actbl2.h
> +++ b/include/acpi/actbl2.h
> @@ -891,7 +891,8 @@ enum acpi_madt_type {
>  	ACPI_MADT_TYPE_MSI_PIC =3D 21,
>  	ACPI_MADT_TYPE_BIO_PIC =3D 22,
>  	ACPI_MADT_TYPE_LPC_PIC =3D 23,
> -	ACPI_MADT_TYPE_RESERVED =3D 24,	/* 24 to 0x7F are reserved */
> +	ACPI_MADT_TYPE_RINTC =3D 24,
> +	ACPI_MADT_TYPE_RESERVED =3D 25,	/* 25 to 0x7F are reserved */
>  	ACPI_MADT_TYPE_OEM_RESERVED =3D 0x80	/* 0x80 to 0xFF are reserved for O=
EM use */
>  };
> =20
> @@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
>  	ACPI_MADT_LPC_PIC_VERSION_RESERVED =3D 2	/* 2 and greater are reserved =
*/
>  };
> =20
> +/* 24: RISC-V INTC */
> +struct acpi_madt_rintc {
> +	struct acpi_subtable_header header;
> +	u8 version;
> +	u8 reserved;
> +	u32 flags;
> +	u64 hart_id;
> +	u32 uid;		/* ACPI processor UID */
> +};
> +
> +/* Values for RISC-V INTC Version field above */
> +
> +enum acpi_madt_rintc_version {
> +	ACPI_MADT_RINTC_VERSION_NONE =3D 0,
> +	ACPI_MADT_RINTC_VERSION_V1 =3D 1,
> +	ACPI_MADT_RINTC_VERSION_RESERVED =3D 2	/* 2 and greater are reserved */
> +};
> +
>  /* 80: OEM data */
> =20
>  struct acpi_madt_oem_data {
> --=20
> 2.38.0
>=20

--C3CfOFtGyHgf+Q8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+P/BAAKCRB4tDGHoIJi
0oxgAP9WC8kaZpNByCNLjTup93CdqUIB1TlRT73uQ3yz9WixvQD/Rvbx0KtjGQdl
xUQvPl6J6xLQx7FkEo52jziNk7hw9wU=
=J+2F
-----END PGP SIGNATURE-----

--C3CfOFtGyHgf+Q8p--


--===============5320790054924736869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5320790054924736869==--

