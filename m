Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C955BC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPXQ+8Ml57GfQleUXx1voJ5RYeORRca3CcPnrZX+fT0=; b=lEAx0XR1PZShvZvZXO9RfXnQel
	E5L2P8/QesrTDzvIcZ+VVoEW2F9dUDdssy20DF4hzgg7uBty0X+n2um8cw9JkxpPz5tcYJ4+bhVVK
	nLxCPF+1WqIQBOVB02EWX+Ey9a3dJXmMn9Rqf8bg7LR62B9oG5iSPC3hqQ0lFWAUlep6AbVCWIOi7
	rHpi4j2b1ZAtBZwpTZhEgo6/w0XhPrR/xVYT9hPBzVyMJ3rOOEzASLQQ8KPk00QEU5UtUv3FDgD1s
	qmAwRm5EUgoJx19VF7THh064RHjgZtN11D/xu90gku1VX0nl2LhsEnm+/NGioIbs1YqvDMZ2RN9zV
	x3TS9FqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPs4y-00GziF-Nf; Wed, 08 Feb 2023 21:34:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPs4w-00Gzhk-Ku
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 21:34:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0256C617E9;
	Wed,  8 Feb 2023 21:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BD1C433EF;
	Wed,  8 Feb 2023 21:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675892049;
	bh=Frt26srycEDnTaQe7B7tU/DqA0WSAWAkqfb5tJZSCuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vP97vjw/PyubC0CpESEZgZ1CG2zuzhvGoNNTqp5d49ECfQ2p/BeppEJO5gIau7wxC
	 /cjIj+Od9SPU00zuRCvA/QRnLXPP+i6OSNsd1yttz1ExuUuPpyMlF77qzCxOPSxZO6
	 e4LfTk34m4F4PceT6qJCwd+DmWP7iDYaw3LGzQp3in0nVOrnUgmMSiMLVLOxgFhSKh
	 tXbyD0SMsU3PybPFjAQIA1bgecC+T4UKE/WIBnLQM3aEGIgQK6hkxnCTBlQaqhkYjW
	 td0KMC+m8DyVO125txUrvfhCVKcXavEeSOMlfjOn1vGGb+2ce9v5sXGgc/zVsb0VQy
	 miuQJgRQck0mg==
Date: Wed, 8 Feb 2023 21:34:03 +0000
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
Subject: Re: [PATCH 12/24] RISC-V: ACPI: smpboot: Create wrapper smp_setup()
Message-ID: <Y+QVSxzbpC5WbRvY@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-13-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-13-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_133410_741255_0EAE1D54 
X-CRM114-Status: GOOD (  20.39  )
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
Content-Type: multipart/mixed; boundary="===============3963459891498056765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3963459891498056765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NE7BMaNMGtVs0aCh"
Content-Disposition: inline


--NE7BMaNMGtVs0aCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:13PM +0530, Sunil V L wrote:
> Subject: RISC-V: ACPI: smpboot: Create wrapper smp_setup()

As I pointed out the other day, this one of the patches that really
doesn't warrant an ACPI: prefix.

With that fixed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> smp_setup() currently assumes DT based platforms. To enable ACPI,
> first make this as a wrapper function and move existing code to
> a separate DT specific function.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/kernel/smpboot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 00b53913d4c6..26214ddefaa4 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  }
> =20
> -void __init setup_smp(void)
> +static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
>  	unsigned long hart;
> @@ -116,6 +116,11 @@ void __init setup_smp(void)
>  	}
>  }
> =20
> +void __init setup_smp(void)
> +{
> +	of_parse_and_init_cpus();
> +}
> +
>  static int start_secondary_cpu(int cpu, struct task_struct *tidle)
>  {
>  	if (cpu_ops[cpu]->cpu_start)
> --=20
> 2.38.0
>=20

--NE7BMaNMGtVs0aCh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+QVSwAKCRB4tDGHoIJi
0rA0AQCroHvywJ2/alTXUyLQurVVhB6TsNE5+X/Kdt9LMX+7PwEA2ThIcbHkMQtO
X/uJ5T+Gft/uIzrywZzvl8dgupEJfAA=
=h91G
-----END PGP SIGNATURE-----

--NE7BMaNMGtVs0aCh--


--===============3963459891498056765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3963459891498056765==--

