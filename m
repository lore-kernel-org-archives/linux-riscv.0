Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346EEC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=585f8/2XOAgsIVMcx/IAnvRPpuXCPyISG68nd47PKMg=; b=D8xt236M0ykl4qvjvNVYKYVezm
	wsqg5oLWU/11S0VJKOYV017oi8HDbht5i9jcWJBboMAl8IcgHEoq+1P5lxXVZ1M8xhSj1Eb6zoy/f
	nC5KLU/iZt7g2Oc+ioc0N4Y7n5sAODUJ6f37a7Bz1WppBcKLMRMFskiZYchLC8j/fQIO8323gIxNs
	BfuiaIhz8GHHvDeKoYj5Jml0N9Lo8upSxDd4C+auaYIsoOCyHR7xMi7w/J7oYVqDYS8Vo5UxliH+V
	4swIEjZ70T3vbs1c307Y4En8QQ5Bc9byrXA+Uf7nSv35ee/8TJvzDMZiDi1joX4QROtLcQO0OjWXL
	17+3v4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQE05-003EDZ-LK; Thu, 09 Feb 2023 20:58:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQE02-003ECx-C0
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 20:58:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EBD21B82316;
	Thu,  9 Feb 2023 20:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78184C433D2;
	Thu,  9 Feb 2023 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675976311;
	bh=+Yd/d9WuWdnBLSjpzdnSBSDjImB9hMd6N45zMT0LCx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgKbH+CS4kLbySGezMezeFiTVHmyOSyo7q2O4z/Fut/YpS/SurHjFhuTAEQRC0gAo
	 eirVQEJXCf0O7cMYrR6BbafEV8dk4AUrYU4bKLLA9YLAz4AoiCkA6qR47Izy07EEPs
	 0xdcNTO6EvwhDsjqK1erVlnk3D2he5F8WjoMmEx3pcOKO0sumP6VSnZCe+T0gwnsSB
	 b6DPusCTY8c1YEPyd624PuFthCYX6gcDdsTYj03Dxm0aUpm7/G8WJ8KVBL1RFXgY5S
	 sZoSjGbwFXlGwOjhH75OPKuzUwENcBWlzUniT0l0MFz1fJpI6Q+h0VUUilx8LftG49
	 788XZo15WNZXA==
Date: Thu, 9 Feb 2023 20:58:25 +0000
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
Subject: Re: [PATCH 16/24] RISC-V: ACPI: clocksource/timer-riscv: Add ACPI
 support
Message-ID: <Y+VecXd9PVpkDggY@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-17-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-17-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_125834_601085_0E4EAB16 
X-CRM114-Status: GOOD (  17.88  )
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
Content-Type: multipart/mixed; boundary="===============6813376733600274049=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6813376733600274049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5sSD2eN/0kaTN7tv"
Content-Disposition: inline


--5sSD2eN/0kaTN7tv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:17PM +0530, Sunil V L wrote:
> timer-riscv driver needs to get the timebase-frequency from
> RISC-V Hart Capabilities Table (RHCT) on ACPI platforms. Add
> support to read the information from RHCT.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/clocksource/timer-riscv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index 4016c065a01c..8079666753a6 100644
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
> @@ -198,3 +199,11 @@ static int __init riscv_timer_init_dt(struct device_=
node *n)
>  }
> =20
>  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> +
> +#ifdef CONFIG_ACPI
> +static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
> +{
> +	return riscv_timer_init_common();

I feel like I need to ask as it was deleted in the previous patch, how
does ACPI determine whether the arch timer can wake the CPUs?

Cheers,
Conor.


--5sSD2eN/0kaTN7tv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VecQAKCRB4tDGHoIJi
0lj/APsFW/j+nu+K0lFR7Ikr83L7/hsc6PYgzVXs9X/hKGhcNAD/TXOjuugHcgLq
fQKGugiSw4cbY1As8Bl4hW5omFPxugM=
=oD+2
-----END PGP SIGNATURE-----

--5sSD2eN/0kaTN7tv--


--===============6813376733600274049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6813376733600274049==--

