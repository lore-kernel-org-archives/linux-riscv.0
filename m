Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78036C761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nwtet85FQzLpLzWZbOA0XLgJ0Nt+y3+pixbu5gcUKkM=; b=SLRcV9uv+HAWBAHoc1bi0uv1uA
	ibwwPknIIlJRb3oMyweCJerkeBSXu5xpjqdobR2ABzggAyxnV8XSQc4uHP1ecsWrWGbKelIO6Oi+7
	tBFo9PnBWnXLvkGpcDMdC5sC8KImwgyowUwUPwhDZdW2miTwQNJonIxUvHpIgUwLuRHEUKyOULPWW
	2/tjz/u8c6QYucCFFVmrz4pJHyiVoIP3259kO1GEAZgKS1HS5xcUswcfJiy6WvnYMgRPAIMkybmZ3
	ueK1ka3iIqtJXWEKkTtHx0oieeJSCKZRsOb/quTaxKL3ADKlbGPz+Qx5sC/l6ZoM9TiSvYVYBj930
	dttK1Ghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglBP-00AlyN-06;
	Mon, 27 Mar 2023 11:38:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglBJ-00Alxe-2X
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 11:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679917113; x=1711453113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q2B4kA6um1AUrS22dRB1g2bdoajEizZ7FOgCaLz1DVw=;
  b=nuiM1DC+IfZ5sR1k92C1joyoF23EVkF3srU379YY751ilzK0E3QfWIOT
   B2Otz1V6fmpxN70Zyg3gXsqUwlnlDHGM9mlg6UO8J4LVXXtIZuX/os3d3
   NSxK2lvU9DfN43gBUFZzVzMiJnj3DigG69l4g54p3SeLTmhSqBOiLTRx3
   A+7nsOwGp0uYXNCxAI5t0NYh/kW70O96OlzQYAF94G6YBO6qHlDNkZeYR
   ehx1fGQudVKOVeBHd6GlLQ4LyAwZYLPp/FGVXO1cPyS0M9Ki8kLZMkJXN
   0a4Ym8MmC3mFIMnunPBLueiYC9CFsAKKkz9Fa2pcOoMuvBMucelaB7N/Q
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,294,1673938800"; 
   d="asc'?scan'208";a="207407574"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Mar 2023 04:38:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 04:38:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Mar 2023 04:38:27 -0700
Date: Mon, 27 Mar 2023 12:49:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bjorn@kernel.org>
Subject: Re: [PATCH V2] riscv: export cpu/freq invariant to scheduler
Message-ID: <b6d48638-92b6-4406-b472-90d3d53b021f@spud>
References: <20230323123924.3032174-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230323123924.3032174-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_043833_889384_9065EB33 
X-CRM114-Status: GOOD (  19.62  )
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
Content-Type: multipart/mixed; boundary="===============0403122540651486148=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0403122540651486148==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Edl0/TOuOami8mTi"
Content-Disposition: inline

--Edl0/TOuOami8mTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Bjorn,

On Thu, Mar 23, 2023 at 08:39:24PM +0800, Song Shuai wrote:
> RISC-V now manages CPU topology using arch_topology which provides
> CPU capacity and frequency related interfaces to access the cpu/freq
> invariant in possible heterogeneous or DVFS-enabled platforms.
>=20
> Here adds topology.h file to export the arch_topology interfaces for
> replacing the scheduler's constant-based cpu/freq invariant accounting.
>=20
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>

Something in CI really, really doesn't like this patch:
https://patchwork.kernel.org/project/linux-riscv/patch/20230323123924.30321=
74-1-suagrfillet@gmail.com/

The CI stuff applies the patch, builds the tree, resets to HEAD~1,
builds it again, goes back to the applied patch and builds a third time.
Builds 2 and 3 are incremental.
In theory the same stuff should change between applying and removing the
patch, and therefore each of builds 2 and 3 should have the same coverage,
but that doesn't seem to be happening here.
Build 2 looks to have rebuilt almost nothing and build 3 has rebuilt the
world.
I'm gonna chalk that one down as a CI issue rather than your patch!

That said, I was wondering if you would end up submitting this patch,
given the discussion on your last one ;)

Looks to be the same as was done for arm64, so fwiw:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> changes from V1:
>   - fix the leading underscore and tidy the patch up=20
> ---
>  arch/riscv/include/asm/topology.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 arch/riscv/include/asm/topology.h
>=20
> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/t=
opology.h
> new file mode 100644
> index 000000000000..727e8d163a3b
> --- /dev/null
> +++ b/arch/riscv/include/asm/topology.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_TOPOLOGY_H
> +#define _ASM_RISCV_TOPOLOGY_H
> +
> +#include <linux/arch_topology.h>
> +
> +/* Replace task scheduler's default frequency-invariant accounting */
> +#define arch_scale_freq_tick	topology_scale_freq_tick
> +#define arch_set_freq_scale	topology_set_freq_scale
> +#define arch_scale_freq_capacity	topology_get_freq_scale
> +#define arch_scale_freq_invariant	topology_scale_freq_invariant
> +
> +/* Replace task scheduler's default cpu-invariant accounting */
> +#define arch_scale_cpu_capacity	topology_get_cpu_scale
> +
> +/* Enable topology flag updates */
> +#define arch_update_cpu_topology	topology_update_cpu_topology
> +
> +#include <asm-generic/topology.h>
> +#endif /* _ASM_RISCV_TOPOLOGY_H */
> --=20
> 2.20.1
>=20
>=20

--Edl0/TOuOami8mTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCGC2AAKCRB4tDGHoIJi
0l+xAP0XEpkCEwAle/m9iBKU+5bYreUYM96+rKjw0G4g24GPGgEAxMrUg2z+QaPq
gEVLcP4H1EF+3p8QDiDa+tdyUjhgyA0=
=noGV
-----END PGP SIGNATURE-----

--Edl0/TOuOami8mTi--


--===============0403122540651486148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0403122540651486148==--

