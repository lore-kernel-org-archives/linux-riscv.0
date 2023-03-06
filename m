Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CFCC64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D8I2M/g+IAquKGQ8n8iNBaAjOIOI40N7l8uWe6jJqI=; b=ikbaZ3ig4PGZC2i8b0Ue6kYBJg
	VZvWdn3lOdP00fQ/ZR2qhUsFhE0TwsYtUQWNnfQotdyAXDK14aL0zhf3U+7FlwB+1Yermj9XpE6Gh
	9YbbjN+XCheCXcyqMHP2zrSKaP7dBTPk9CjT9ENo8SNwSS/MDx1c2VA+Bi3eRLTupXfkUzB1q2HOA
	v2HehwpAn3OpnLXAxhICM9w3/pUYRsOxqexZd7OhipJf6bsIa8XzS4W0HlIz6z/ja3hGxvEUA1QBv
	nHQPtNxCV06mCm6oIiGg82boG13gckx3Ne1PrR1ii5/UUWc2f/sut40icSqgoUBzYwciwqY8n1Jsu
	NSi6J4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZI2P-00F2ue-2z; Mon, 06 Mar 2023 21:06:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZI2M-00F2su-6i
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 21:06:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DF6AACE17A9;
	Mon,  6 Mar 2023 21:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E8FC433D2;
	Mon,  6 Mar 2023 21:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678136779;
	bh=idi/6s5Qo9QDBdVMI12wKo77YC0Au3UM5k9rnmjlsKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jadhch3R6vjQ+nSfoA7Uwab3TYTynSl6yBMobTbxxx6m/03OWG9QugHFMZ4oeq/p9
	 677UGJFLAPZN5A5yAggWck4JZfPvZmwgYBaa5B4LRBVQAjopUy9Qq0os5fW71fwZuY
	 D5jAPnNOtvbi0GUxZ8FZqCPeF+1mT9VS9NMxv0inkqkPkSf2Zhy36NDRo4fM7h7UPN
	 5SXmsxCytFSw7VpK6OiVeGdt61CVLt8dms+iGw4gCb1gKj4tmRsdL5EYySh/zK0LKS
	 vGQpvv3COzj4Pt4AE3OruZHCsHCALMVcrIYy8YEkriYV+6dLIZsMB32fIeSnhl3d2c
	 7DZ+wW9B2jVPQ==
Date: Mon, 6 Mar 2023 21:06:13 +0000
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
Subject: Re: [PATCH V3 16/20] clocksource/timer-riscv: Add ACPI support
Message-ID: <567aac52-8b84-47a9-9faf-b27ff1a1963e@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-17-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-17-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_130626_630956_25A8E967 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Type: multipart/mixed; boundary="===============5167097744230620059=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5167097744230620059==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KUsNw6CACrWxwcHM"
Content-Disposition: inline


--KUsNw6CACrWxwcHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 07:06:43PM +0530, Sunil V L wrote:
> Initialize the timer driver based on RHCT table on ACPI based
> platforms.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

The SBI spec allows for implementations where the timer cannot wake the
cpu. You previously said "We have plans to add a flag in RHCT. But that
still needs approval.", so could you please convert this to a more
concrete wording and put the explanation for why this is missing into
the commit message?

Cheers,
Conor.

> ---
>  drivers/clocksource/timer-riscv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index cecc4662293b..da3071b387eb 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -10,6 +10,7 @@
> =20
>  #define pr_fmt(fmt) "riscv-timer: " fmt
> =20
> +#include <linux/acpi.h>
>  #include <linux/clocksource.h>
>  #include <linux/clockchips.h>
>  #include <linux/cpu.h>
> @@ -207,3 +208,13 @@ static int __init riscv_timer_init_dt(struct device_=
node *n)
>  }
> =20
>  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> +
> +#ifdef CONFIG_ACPI
> +static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
> +{
> +	return riscv_timer_init_common();
> +}
> +
> +TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
> +
> +#endif
> --=20
> 2.34.1
>=20

--KUsNw6CACrWxwcHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZVxQAKCRB4tDGHoIJi
0ghAAP4lpF2feMoFrQxas6vkJHXKFiI7ARMvhKONsSV8xUNn7wEAkI8McxF1J2fl
c4aLJfk6KJvLtcvGqjczoc+H9X2Rfw0=
=A6TU
-----END PGP SIGNATURE-----

--KUsNw6CACrWxwcHM--


--===============5167097744230620059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5167097744230620059==--

