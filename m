Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB9CC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 23:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyJI+B/Smsw5nycRE1GlcG0Ez4swD6PWZ6MpjtKW1Cs=; b=mGkHi4EKR3DnkmvIhfZcc4aURw
	l2NFpOObqR3gbS7Jr23Ce7owPmeu9iYc0dLSmY9YvkW9IONjT76uvSVMwy25JZRPIWe3XGJCS/IPO
	h3lJ6NjJe6FABG2/dPBrVgXhbIOgNDGzdgC33Ie15ER36JhhM64jXl00C6L6SLnIwbgJ9JkBOaam7
	XTBH3Hpnz67GWZjLMz69fwvEuy/+iBxwsEHD0li74LiMq/Irgxampf138EuUfMmwIEd3iX++8+uju
	DZEiQCchdSt9DV58RGqvMPX6yppd5iG+U5P1LtFGEvuCs+Ogcbcn5EZ9lk+i9W5pWLmjzkvhgh1a7
	ujvlQpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKxF-000bYh-Bn; Thu, 23 Feb 2023 23:24:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKxC-000bYA-MI
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 23:24:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4972D617BA;
	Thu, 23 Feb 2023 23:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C3EC433EF;
	Thu, 23 Feb 2023 23:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677194685;
	bh=/lKh7qdGRzXWLU1PhPaoBgrOWWTgnE56k1MaMFxGa7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KGBooMBu4Se7mLd4V7zwSX4bzEYWbjA5pAiiNmdkmjUFo55pW/nXMG4xcOz7yiBBW
	 nz+11q/876TZGOXfYbs/kOLJoq/M7AuACIaNNXoF4h15i0PxVdMATFcpG4XbyA1LRv
	 js+MVHBXNzWI9bysFl0/Uye9jVB5+HY6tFUHxPNZGBpEIPLrt5YiFdbh3eXsD/X9Vo
	 T0j8cJVU6HrNcx2adTuU2SLJWbwdiEzX8iwTLU3DqH6EtK5DY2nZGBQuOysZezLM1E
	 Mh6J9PZoKYWEjvgbMylXPixpe+j8R5kFI438kcpEngLtthEG7pCxmTXSTfnKpWWywh
	 ZTJVchao1k2zw==
Date: Thu, 23 Feb 2023 23:24:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 3/5] riscv: alternatives: Rename errata_id to patch_id
Message-ID: <Y/f1uRERxTU5kAgh@spud>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-4-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230221185603.570882-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_152446_824888_71D20133 
X-CRM114-Status: GOOD (  23.33  )
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
Content-Type: multipart/mixed; boundary="===============4823503806518086322=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4823503806518086322==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w7pCE7Z5C6wVDdAH"
Content-Disposition: inline


--w7pCE7Z5C6wVDdAH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 07:56:01PM +0100, Andrew Jones wrote:
> Alternatives are used for both errata and cpufeatures. Use a more
> generic name, 'patch_id', as in "ID of code patching site", to
> avoid confusion when alternatives are used for cpufeatures.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                          |  6 +-
>  arch/riscv/errata/sifive/errata.c           |  6 +-
>  arch/riscv/errata/thead/errata.c            |  4 +-
>  arch/riscv/include/asm/alternative-macros.h | 72 ++++++++++-----------
>  arch/riscv/include/asm/alternative.h        |  2 +-
>  arch/riscv/kernel/cpufeature.c              |  6 +-
>  6 files changed, 48 insertions(+), 48 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 736f42f572aa..0c494c36e911 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -377,9 +377,9 @@ config RISCV_ALTERNATIVE
>  	depends on !XIP_KERNEL
>  	help
>  	  This Kconfig allows the kernel to automatically patch the
> -	  errata required by the execution platform at run time. The
> -	  code patching is performed once in the boot stages. It means
> -	  that the overhead from this mechanism is just taken once.
> +	  erratum or cpufeature required by the execution platform at run
> +	  time. The code patching is performed once in the boot stages. It
> +	  means that the overhead from this mechanism is just taken once.

A line in this comment doesn't really make much sense to an unfamiliar
reader. "Once in the boot stages"? That's just not true, is it?
Code patching for alternatives happens more than once and not just
during boot? Not this patch's doing though!

> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 3beef400a971..8f39d4e8598d 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -38,7 +38,7 @@ struct alt_entry {
>  	s32 alt_offset;		/* offset relative to replacement instruction or data =
*/
>  	u16 vendor_id;		/* cpu vendor id */
>  	u16 alt_len;		/* The replacement size */
> -	u32 errata_id;		/* The errata id */
> +	u32 patch_id;		/* The patch ID (erratum ID or cpufeature ID) */

The inconsistent use of ID versus id in these comments bothers my OCD!

Either way, "patch" is a more accurate description of the usage than
errata, so I am on board.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--w7pCE7Z5C6wVDdAH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/f1uAAKCRB4tDGHoIJi
0umXAQCyiWA1tSFMB/17ZN5LmisMkmEAZXo5sYA9zPT5UxkLNgEA0+l5HaubRJWb
yi6w4SU69GxvIdMSjR9igjvMmtMIgQA=
=vO1i
-----END PGP SIGNATURE-----

--w7pCE7Z5C6wVDdAH--


--===============4823503806518086322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4823503806518086322==--

