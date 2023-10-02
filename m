Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610BEE784BF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSpckB0EYLhkOA+XcwE9xpRspLPLvHJp9PiMwxSz3VE=; b=Y0HTq2iYJOB2qatbFAFw196Iyh
	HYNyr/ncyx3DrUW+BHIqzgJs18+uM6xpgLU2C3ZUbN0aqgQNGEwSi1jVYqMMUGJ4/xPPmg0Ho8DZa
	vS5Teo01s0EAzhHQFxZ+3OGcY/Yra3A3y+r+e2nKzvYxJXj9hlL0FnQFLxPtZGGdzNc0tC+JClNCA
	EaW6MBWzxKtzPFUWFReXj8J5gHiSJUA0qIlyT2jxI79KPNjidLqa84xHSdOyeAxZcAw2WSSf8mUHf
	3VCQTEG/JixTY79AkE7V+BQDnwIY+8dGzZm5WsPeuYSpjDVqUJG+1+hBaIX+xfmCuBkUagNQVjzgZ
	n2cVCbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnL8J-00D0jo-07;
	Mon, 02 Oct 2023 15:46:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnL8F-00D0jN-2K
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C1AF60F2A;
	Mon,  2 Oct 2023 15:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E29C433CA;
	Mon,  2 Oct 2023 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696261610;
	bh=CmmG84b/1OBnh9RduBYlaC31PLcl9rWTf7tM7hAt0i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/PAwkBadBvbGrpkDaXWNVVBDnVeHkW1OSHNMHBGISuRWXaQT9+M0PS00iAThcFaU
	 mIpBADPxntPzj9BWoSebDW8KKXItg8G+Xf0IH4smglI1BecONgtU+tws0KE7dmweRr
	 hi3pi2gHuCjar8xeO4b1UDHk+mz8TQ6b9KAFV7wOukcAk/h66Sk6CGKhp90/qhN2Jz
	 T8SNYwPq+Euel24AtDA23nefvRHTVuTBXgCTKhPfGpRltqgDX11sM3TwzyOlDK8/TG
	 YwVnw0ilipHuN/tuLIa6MXzz2UgaWGg5yjLSxQlrI9zEIu2wfDZTjUrft6vgk1EscK
	 5kFcJYt0aFXBA==
Date: Mon, 2 Oct 2023 16:46:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v2 -next 4/4] clocksource/timer-riscv: ACPI: Add
 timer_cannot_wakeup_cpu
Message-ID: <20231002-doorman-catchy-ff5b9ba14c3a@spud>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230927170015.295232-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_084651_799978_9CFE135A 
X-CRM114-Status: GOOD (  16.74  )
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
Content-Type: multipart/mixed; boundary="===============3452887391609245135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3452887391609245135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aL1TA5F1n3lbU8nP"
Content-Disposition: inline


--aL1TA5F1n3lbU8nP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 10:30:15PM +0530, Sunil V L wrote:
> The timer capability to wakeup the cpu irrespective of its idle state is
> provided by the flag in RHCT. Update the timer code to set this flag.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/clocksource/timer-riscv.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index 9c8f3e2decc2..06f5bad3c3e0 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -225,6 +225,10 @@ TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_i=
nit_dt);
>  #ifdef CONFIG_ACPI
>  static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
>  {
> +	struct acpi_table_rhct *rhct =3D (struct acpi_table_rhct *)table;
> +
> +	riscv_timer_cannot_wake_cpu =3D rhct->flags & ACPI_RHCT_TIMER_CANNOT_WA=
KEUP_CPU;
> +
>  	return riscv_timer_init_common();
>  }
> =20
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--aL1TA5F1n3lbU8nP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRrl5AAKCRB4tDGHoIJi
0hIpAP4l78wWWSJgv9GiRYKP3viLL22FMxgc4K5BcjViUuXTFgEA1phiOLRhZJXQ
5THh1DtDO53ISPllC0QaOhA0ZPUYoAs=
=6uzF
-----END PGP SIGNATURE-----

--aL1TA5F1n3lbU8nP--


--===============3452887391609245135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3452887391609245135==--

