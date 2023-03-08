Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47434C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GHG3YtNEp47DhWuHvmyHYfqpxMvrp/3HbL8C1hfpc0=; b=gLOP5UthIe4b56An5UXOxjvoZh
	2fIfS1k803a95Oro4bf5pylZYsN7LE+H76NNOpPoUzgGpqLm0Q1yE5+fMzt8O3+aEKz9E39TZIX8W
	t91ExhWrcrBp+nkY0UJhj5A26xDM4UaKjHOC4yDDPQdtj9DxWK+AdIhdCPjS0+odRiQ1nd0yQRd8Y
	OKk9/CL68G6u/VWM8uoM3wfaXJqazE9E3oAAq30FKy43Qo8t69q6O43rTEHIrm80vGyk8MkeriQJz
	oobGw/w7BkS2IEzPTJnK3CiRWtuGMjF5OizvO+NRzXT+DKEaFbhEG2BmP7iapjPMZmUsocIWzbJjG
	/j+nY0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqv7-004OFe-PA; Wed, 08 Mar 2023 10:21:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqv3-004ODw-Vv
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 10:21:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7FBC9B81C00;
	Wed,  8 Mar 2023 10:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C23C433D2;
	Wed,  8 Mar 2023 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678270871;
	bh=4KQBiX+zBplgwRl6rTGlLz+7p9lJaG6/YAbBfam9ax8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3OAOeSrAu1FcFxJNz/WU3Ux4YtOS5a3Fx2RygOGxk+DJzfs8TFol4Sg6TYBVuT1I
	 qnC+XjChuawvxf6EWUZF/3TNWZaVP4E1H+g1QsFXE9gwqeCzClVt4dJl977eoVcP4d
	 fZyhsGFpYIyDNH/EcAykYFi2zt/YUJ/HetK4QvZLGG4u6lBhfpruY5BeuXwwWbOaUQ
	 l0Yxm8UD78gawFw9DwkKRQxx66E6q0fpA/N8UrGZrgFun+KpTN+cn0A7q16uJ0u4T+
	 9zFTZdEM3dF5KzelHUYY7KtjGW9X3fzTVtl0m6q3TIBONW5XthXSQ1uwzx3Xjx5Mv/
	 HwHpr7QJw8rzQ==
Date: Wed, 8 Mar 2023 10:21:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 18/20] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <e1cf9976-17a1-4096-b497-08985c1f8e0f@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-19-sunilvl@ventanamicro.com>
 <b38179fe-f1b8-4146-ae22-11e8bbbd500e@spud>
 <ZAhYeuCmdYAnanNv@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <ZAhYeuCmdYAnanNv@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_022114_355585_DDF7F0BB 
X-CRM114-Status: GOOD (  30.22  )
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
Content-Type: multipart/mixed; boundary="===============2215231951125016294=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2215231951125016294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="63+IG2qcJZyEQHTv"
Content-Disposition: inline


--63+IG2qcJZyEQHTv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 03:12:18PM +0530, Sunil V L wrote:
> On Mon, Mar 06, 2023 at 09:17:34PM +0000, Conor Dooley wrote:
> > On Fri, Mar 03, 2023 at 07:06:45PM +0530, Sunil V L wrote:
> > > Initialize the ACPI core for RISC-V during boot.
> > >=20
> > > ACPI tables and interpreter are initialized based on
> > > the information passed from the firmware and the value of
> > > the kernel parameter 'acpi'.
> > >=20
> > > With ACPI support added for RISC-V, the kernel parameter 'acpi'
> > > is also supported on RISC-V. Hence, update the documentation.
> > >=20
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> >=20
> > > +static int __init acpi_fadt_sanity_check(void)
> > > +{
> > > +	struct acpi_table_header *table;
> > > +	struct acpi_table_fadt *fadt;
> > > +	acpi_status status;
> > > +	int ret =3D 0;
> > > +
> > > +	/*
> > > +	 * FADT is required on riscv; retrieve it to check its presence
> > > +	 * and carry out revision and ACPI HW reduced compliancy tests
> > > +	 */
> > > +	status =3D acpi_get_table(ACPI_SIG_FADT, 0, &table);
> > > +	if (ACPI_FAILURE(status)) {
> > > +		const char *msg =3D acpi_format_exception(status);
> > > +
> > > +		pr_err("Failed to get FADT table, %s\n", msg);
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	fadt =3D (struct acpi_table_fadt *)table;
> > > +
> > > +	/*
> > > +	 * Revision in table header is the FADT Major revision, and there
> > > +	 * is a minor revision of FADT.
> >=20
> > What is the point of this part of the comment? Isn't it obvious from the
> > below code that you expect a major and minor revision?
> > If feel like you're trying to make a point in it, but the point has been
> > lost :/
> >=20
> It just highlights that major and minor revision fields are in two
> different places.=20

I thought that that was what you meant, but only because the code does
it. The comment doesn't actually say so!

Instead of deleting it, something like the following?
/*
 * The revision in the table header is the FADT's Major revision. The
 * FADT also has a minor revision, which is stored in the FADT itself.
 * <snip>


--63+IG2qcJZyEQHTv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAhhkQAKCRB4tDGHoIJi
0krvAP0eBw+cdEVFy8lgx9EsKqFkr7cLWq8k9aDC+5LghJ2RuQD/ZnzN20QyBPC1
imyxaNv7BcEyf8CQlBw+HH7hKVgtYQ4=
=2b/3
-----END PGP SIGNATURE-----

--63+IG2qcJZyEQHTv--


--===============2215231951125016294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2215231951125016294==--

