Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1044FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBeSKuPJgpXVPq182Gz1pFWK9TuVLXyTjt5196C5KZ4=; b=O6CjF88FuTND7ea5RFI9HVU3A8
	yTjAyq/TfTij++T0B7HJ3svBd12oYkiivBeQUAqmRVQQSjFf6c5fuLJZFhKeGr4lMpjA5iJqQXWTE
	gh4lKPo/qkFgL17BRbmHJKI5CaqlkL+8rmJxsdMQ3ZyW0xTUj/+KBicabCabkpEopD7hrPSrO2NP0
	rrvxQ2DwLGREzG+G0nBIfbydAyJeCm4pph4eIHp9qv71SElPkWPh73YiXPlaTUN4U5GK6297NwHmn
	71qPY1dmNx/tSMDZa1ySCTxlJHqj0LQCDUNTw2fjIJHlBhoQvGCDCc7SRlxZZQr4ABIy6cYBmOcSh
	hLFIyS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hZC-00E2p9-0t;
	Thu, 15 Jun 2023 07:38:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hYz-00E2ju-1z
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686814717; x=1718350717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PyAZ+UQySht1Ggox4vj01CIS3UNR5OIbU5jcrfJvb9c=;
  b=inIIj6HGY8srznBDgedjYLYG8BlbC6+QRHZfylT0jsBJt2F80f7MejPJ
   7Srx1a8lO7u6Ot3/On9mJ7s8AE7RFQz9kvNFrR1hYY3xZO6wDH5O+bdAM
   mxo/TTOUPNXUFG5275driq/U4/FYuJwhurWqrmjUz0amNlRvsefQptGZV
   pdhdSuNtAgV6tKLzfQ3jfXuzElMeJTgTq2DVsxG1P2PkvXGI7igTyz48o
   GysaVfXmM+OhqN3G0z2rwMiVJnAcypIjPx2WWHZ94KhpPSOlOWpvDOhK0
   STGnISiH+ozoFQRm9VBIWgwRje/wisqZv0CQkuetsn4GGgBJyAVJzPWee
   g==;
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="asc'?scan'208";a="220398517"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2023 00:38:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 15 Jun 2023 00:38:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 15 Jun 2023 00:38:25 -0700
Date: Thu, 15 Jun 2023 08:37:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<jszhang@kernel.org>, <ajones@ventanamicro.com>, <aou@eecs.berkeley.edu>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <greentime.hu@sifive.com>,
	<zong.li@sifive.com>, <nylon7717@gmail.com>
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
Message-ID: <20230615-unvisited-deceit-9beab8ce987a@wendy>
References: <20230615072302.25638-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230615072302.25638-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003837_708001_A3861AD0 
X-CRM114-Status: GOOD (  16.24  )
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
Content-Type: multipart/mixed; boundary="===============5457537550657994416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5457537550657994416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X3uZfQHN9blau7pK"
Content-Disposition: inline

--X3uZfQHN9blau7pK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nylon, thanks for the update.

On Thu, Jun 15, 2023 at 03:23:02PM +0800, Nylon Chen wrote:
> Fix the 'unsupported relocation type' error caused by
> enabling the -fasynchronous-unwind-tables flag,
> which generates relocation types that are not supported.

What commit adds the -fasynchronous-unwind-tables flag?
Should there be a Fixes: tag for that commit?

Cheers,
Conor.

>=20
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
> Changed in v2:
> - add commit message.
>=20
>  arch/riscv/kernel/module.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7c651d55fcbd..65be0360a494 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -310,6 +310,15 @@ static int apply_r_riscv_sub64_rela(struct module *m=
e, u32 *location,
>  	return 0;
>  }
> =20
> +static int apply_r_riscv_pcrel_32_rela(struct module *me, u32 *location,
> +				       Elf_Addr v)
> +{
> +	ptrdiff_t offset =3D (void *)v - (void *)location;
> +
> +	*location =3D (*location & 0xffff0000) | (offset & 0xffff);
> +	return 0;
> +}
> +
>  static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  				Elf_Addr v) =3D {
>  	[R_RISCV_32]			=3D apply_r_riscv_32_rela,
> @@ -335,6 +344,7 @@ static int (*reloc_handlers_rela[]) (struct module *m=
e, u32 *location,
>  	[R_RISCV_SUB16]			=3D apply_r_riscv_sub16_rela,
>  	[R_RISCV_SUB32]			=3D apply_r_riscv_sub32_rela,
>  	[R_RISCV_SUB64]			=3D apply_r_riscv_sub64_rela,
> +	[R_RISCV_32_PCREL]		=3D apply_r_riscv_pcrel_32_rela,
>  };
> =20
>  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> --=20
> 2.40.1
>=20

--X3uZfQHN9blau7pK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIq/ywAKCRB4tDGHoIJi
0keJAQDIkc/zpv4sa2yC/D7U/ZNdjXyjn1F4e5TOctnC6ykUpAD+KeZHi+Wx/6e9
ONGjEQkKXwjDw/MTgIei7DiKwsSShAw=
=bAj9
-----END PGP SIGNATURE-----

--X3uZfQHN9blau7pK--


--===============5457537550657994416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5457537550657994416==--

