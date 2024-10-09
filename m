Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FC2CF044A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79QgvxxxDBmz+chy8/qLS+vvgt7/cANtZudwQHq0EGg=; b=o6PI3+5OCcZLbbI8ZVCtZN7U3Y
	TZd6rkyylimdNqVZcz4t7pHc7ZTOG3uUHIPPzhXX1QvvkUpftCe67/gsRmF4Xz3kRsIzafRYhkW9D
	n6IJhz7c8+rB27mS/EDxJPMsNQEkuaPULHpq5V7u+tolvS/oXxxPyrbaAdVM+1cjcQNRk2R2VbEvK
	oqqCHPcNjQGvTYXPTCYW+05ebUEqoJB96rDA3GkDl+6ftCwfkeQmj2ENxPld56JbaW9xh+cslpws4
	/QulRh4NZ2OG+HD3u+0fjH8rYwTDi6K7OH88x8rqybjjcWTg6mT2BISDswfCwF4x+ziHDpFI4+1R/
	m4g9ysZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syULP-00000008xGi-1fa2;
	Wed, 09 Oct 2024 10:55:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syULL-00000008xEx-3sBn
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 10:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CE535C270A;
	Wed,  9 Oct 2024 10:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C84CC4CEC5;
	Wed,  9 Oct 2024 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728471299;
	bh=z+qG+7MeovasL/jwPMj7qoK5CnU41fHNpz23gh1MWZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qO/Sg6KXTz1otwIZlGG9OOOMezAuVWBk+FdwKcMqDfNfN9UXOTPYFYBGlRBmV4k07
	 69y7hliNAu/dPWXuW84XJ+QW8nlZlFG7FdDLcpUTi8rwubAunKKFEF7fzYV+EPVy/r
	 z0f8pyepk4tIVc/jnfUGbEXtCjVwPj5A5lPu5lDMuTFtxZUrfmMynObDUhe0ITQjDj
	 Wo1BgP4cyMbieH3yXrBmyiHSNXiHg6X9K7K9CTgxkT/2Owe1g2v8y9rnOtye/QCnlQ
	 2ejQ7MyrlyVfvFQhJs0hKM7sQiGxeNPll8RPIVCIF0HXtfxMCxBSh/JIBRltjq4eyj
	 64qZNatMHnJ9Q==
Date: Wed, 9 Oct 2024 11:54:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Guillem Senabre <guillemsenabre@gmail.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [RISCV] [BUG] CPU topology issue on TH1520 on Kernel
 5.10.113-th15020
Message-ID: <20241009-shaky-thrive-e21f964547c8@spud>
References: <CAE30jh3Wa_imwKQ78wTW8E8D4JMoWtCY2TbJAO0-gz7sHceYFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE30jh3Wa_imwKQ78wTW8E8D4JMoWtCY2TbJAO0-gz7sHceYFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_035500_076501_AC6AE8EF 
X-CRM114-Status: GOOD (  20.25  )
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
Content-Type: multipart/mixed; boundary="===============3162477063263549104=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3162477063263549104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PyfD90ai0b2D2vCl"
Content-Disposition: inline


--PyfD90ai0b2D2vCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2024 at 11:43:28AM +0200, Guillem Senabre wrote:
> Dear Linux kernel developers, `sysfs` shows unexpected values when
> listing CPU topology for a TH1520 RISC-V CPU.
>=20
> In particular, the following commands output always -1:
>=20
> cat /sys/devices/system/cpu/cpu0/topology/{core_id,die_id,physical_packag=
e_id}
> cat /sys/devices/system/cpu/cpu1/topology/{core_id,die_id,physical_packag=
e_id}
> cat /sys/devices/system/cpu/cpu2/topology/{core_id,die_id,physical_packag=
e_id}
> cat /sys/devices/system/cpu/cpu3/topology/{core_id,die_id,physical_packag=
e_id}
>=20
> The expected outputs would be a positive integer, rather than the -1
> currently obtained for all.
>=20
> For more context: We are testing qemu on top of libvirt. This issue is
> blocking us since libvirt aborts after calling "virHostCPUGetCore()",
> which reads: /sys/devices/system/cpu/cpu0/topology/core_id and obtain
> a "-1".
>=20
> We have resources allocated to debug this issue, but we'd appreciate
> guidance on where to focus our efforts.
>=20
> Hardware:
> - Board: Sipeed LicheePi4a
> - Processor: TH1520
> - Architecture: riscv64
>=20
> Software:
> - OS: Debian GNU/Linux trixie/sid
> - Kernel: Linux 5.10.113-th15020

What is a 5.10.113-th15020 kernel? Stable for 5.10 is currently at
5.10.226, so what you have here is horrifically out of date and
unsupported. 5.10 itself is something I would highly suggest not using
with riscv in the first place as a lot has changed in the ?4? years
since it was released.

I fixed the topology issues ages ago, which was backported in v5.10.152.
The TL;DR is that riscv was using the default topology code shared with
arm64, but without the fallback arm64 has to cpuid registers that
contain the information. riscv now has sensible defaults, if topology
info is not provided in the devicetree.
The alternative, if updating to a more recent kernel is not possible,
is to provide the topology information in the devicetree using the
cpu-map property.

Hope that helps,
Conor.

> - libvirt: 10.6.0
>=20
> Thank you for your time and assistance. Please let us know if you need
> any additional information to help diagnose this issue.
>=20
> Best regards,
> Guillem
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--PyfD90ai0b2D2vCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwZg/QAKCRB4tDGHoIJi
0kptAP0Xc1qR/LsRHP51ICH7LggRToIYTjSPnHyhglOq0y7yWwEA9/KCpWxy7FrP
Ex+l7EncDtln9dn76YXPTudjp+3qFg0=
=c9nn
-----END PGP SIGNATURE-----

--PyfD90ai0b2D2vCl--


--===============3162477063263549104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3162477063263549104==--

