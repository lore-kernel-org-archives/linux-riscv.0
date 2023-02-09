Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF719C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2DYE2ZXZr65waF5TQvty0OkCje22GVvvddZa3rGQLc=; b=zhWK0r3gz9yE0/C7nZ0njiJ/il
	5WBNWhsxcMZS8Za1x1gcTdBhbQjWCX4WeLWFJBVLtXph/qfGvyp9QUQyc+q5JxRlDqogyVulWfk0c
	NEMuyJwz9to44Zo2rKmcVd4gneK243rKY8IpXhvyo1iZmYFh1CXAExkLX4eXQ+AQUGdjAta3UIJCa
	R+r20acq2ZEqsvOPoLfDuJLx+eJyya4nQ5dl+oTeBp/wJT6Ge6uxFzhbEgtE1FCAJuf/8A84tUM9T
	v7VsZoB0/VqA1RzIsE3zKXTv22iK2Hl1Q1mcRKrcLkwnMCsVCOBbWEn63FSvL90757OLe0xBoSmv2
	aVA968qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQEsU-003Kat-MK; Thu, 09 Feb 2023 21:54:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQEsS-003KaN-LZ
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 21:54:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C4D261BC4;
	Thu,  9 Feb 2023 21:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA4CC433D2;
	Thu,  9 Feb 2023 21:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675979687;
	bh=jRismUHOyVxVBabYaWn4wT8Nrr82S/bxWlRxPdH4hO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1NVK4lpV5VB6E2sgPr/s/cSKIEm2oUyhlAyffmdhJiJQJ0YjGJcPDGmGpjDbHmXW
	 HRJGhBBdW1Iia4hzMLl5bU2BE+rwlOa7E/M2USCNji8LBCIfWhiNC9ujBSojlHcDaJ
	 tM5XaPqnzeqFJC5LzDSzvvZliOzPc3yMNUN8XB1Hb8YrUgpJUU1QVPNMy03EppKxDZ
	 qPz4BoCynp/MOMccqOOUXKAhftwYEvE3shOtSoLdoc8XK7U8rRNVlCRfSLMsz3u0nB
	 6tv8EvcJ6RaAAY4rnDasoNvXcbprzoPJwijhU0enTk+csnSekIiA2cH9c1+xSD0Vbq
	 3VS4mfUuoLP0g==
Date: Thu, 9 Feb 2023 21:54:42 +0000
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
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 23/24] MAINTAINERS: Add entry for drivers/acpi/riscv
Message-ID: <Y+Vroj6CmrL4I9lN@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-24-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-24-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_135448_762086_FFA39539 
X-CRM114-Status: GOOD (  15.84  )
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
Content-Type: multipart/mixed; boundary="===============0669161761316755898=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0669161761316755898==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V5lUTQp9r2xga7S0"
Content-Disposition: inline


--V5lUTQp9r2xga7S0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:24PM +0530, Sunil V L wrote:
> ACPI defines few RISC-V specific tables which need
> parsing code added in drivers/acpi/riscv. Add maintainer
> entries for this newly created folder.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a5c25c20d00..b14ceb917a81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -450,6 +450,13 @@ S:	Orphan
>  F:	drivers/platform/x86/wmi.c
>  F:	include/uapi/linux/wmi.h
> =20
> +ACPI FOR RISC-V (ACPI/riscv)
> +M:	Sunil V L <sunilvl@ventanamicro.com>
> +L:	linux-acpi@vger.kernel.org
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained

Supported, no?

> +F:	drivers/acpi/riscv
> +
>  ACRN HYPERVISOR SERVICE MODULE
>  M:	Fei Li <fei1.li@intel.com>
>  L:	acrn-dev@lists.projectacrn.org (subscribers-only)
> --=20
> 2.38.0
>=20

--V5lUTQp9r2xga7S0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VroQAKCRB4tDGHoIJi
0hKrAP9++kwugl7SFcTtfhGUxoAGynIdNXhyQA747zCm8InMJgEA//0+dz0BbQmI
3S1VtaoE6iBUoXd7Qq+7iHfGORrEogM=
=gQ/m
-----END PGP SIGNATURE-----

--V5lUTQp9r2xga7S0--


--===============0669161761316755898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0669161761316755898==--

