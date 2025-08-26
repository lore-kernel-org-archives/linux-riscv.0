Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ADCA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GijdGppabV929XFtBUMXGxC4toMEkQ+NtrKI8E39YDM=; b=oI8f4dCa3My/E6HSL+ARZuLgRt
	yMpgWyCt4RKN20d5gB2hHfLzraooOVhtKFEgLUDXwM1V0YkOqldaWtX4DPqpyEYjhN7nhT26bbgls
	NkKhQVswRJvCtiT8f0zPMhhglDIxxt8eLOTKyrTQ1fbYLY0El0yzDBpHUBAjSDIsfceU8nBIyf65M
	j67ZUQEK77pah8M0/kAfw9X71xyIinEcPIq4B54eeWDB5Nu4M13De8X8kdLwH4dt0qE00uidDY90c
	4hkvO71MOevmMAQjxjzfoep9m1ixAEI2OPXwmkPShicSoWn2syVyP9ZwnkHVbU+o7g4mBNCfVCWUx
	HQBFEZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxkR-0000000Cnge-3SII;
	Tue, 26 Aug 2025 17:46:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxkP-0000000Cnfg-1RDP
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 17:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14D84409E7;
	Tue, 26 Aug 2025 17:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A800C4CEF1;
	Tue, 26 Aug 2025 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756230376;
	bh=ITt90kpmmeDMeUFwRnkeVdhCWAM4V8MY6rHrGixc0WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqzxHFB5RosrS8ENluWDmbu8kBd1gzFDLzLCu7GM6Phd2mXFdacNhxNSISmmkoF7Z
	 g3CWqwpvqTU3+OYu6CIFmV5xcgt1f7Huf6wU3F9sOnMMRfO0DB+lMdlvUILbSli0hL
	 xbaR7/Cn/hGfenf33Fy9nJV1Q9g96hSUikd8GX70dmAVP6TlTj3ub4W29LmNYe8TY6
	 gzKUQdvolulosCT/+ZetsmKLqwPmdi3v+xxPHiQT7/T4JLORwGkjVYZxe6DVt4ACoZ
	 xVclhu+N1VSDmWVOEiQarhnpx0mRmDzLwzgODYuTP9kiKStyuODMSjFhZN/GRr/KqF
	 eqgSQ3BBS7ltg==
Date: Tue, 26 Aug 2025 18:46:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] riscv: Add Zalasr ISA exntesion support
Message-ID: <20250826-dullness-seventy-c93e7c8479d0@spud>
References: <20250826145740.92276-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20250826145740.92276-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_104617_400275_6F83970C 
X-CRM114-Status: GOOD (  13.71  )
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
Content-Type: multipart/mixed; boundary="===============3382973372764987774=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3382973372764987774==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecRtX6R0aqjkVC7D"
Content-Disposition: inline


--ecRtX6R0aqjkVC7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 10:57:36PM +0800, Xu Lu wrote:
> This patch adds support for the Zalasr ISA extension, which supplies the
> real load acquire/store release instructions.
>=20
> The specification can be found here:
> https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

Why is this an RFC?
Is the RFC tag related to how you have not CCed all relevant mailing
lists and maintainers?

Cheers,
Conor.

>=20
> Xu Lu (4):
>   riscv: add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: Instroduce Zalasr instructions
>   riscv: Use Zalasr for smp_load_acquire/smp_store_release
>=20
>  .../devicetree/bindings/riscv/extensions.yaml |  5 ++
>  arch/riscv/include/asm/barrier.h              | 79 ++++++++++++++++---
>  arch/riscv/include/asm/hwcap.h                |  1 +
>  arch/riscv/include/asm/insn-def.h             | 79 +++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c                |  1 +
>  5 files changed, 154 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.20.1
>=20

--ecRtX6R0aqjkVC7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK3y5AAKCRB4tDGHoIJi
0vCDAP4y+UC6BToxZJGgQ7KuD1FhxqpyWwUg0+wokTRKOXBkXwEAurnvoIBSfisz
w+JIFLhc1tPLgjoOm25xDqppolc7mwc=
=Owt8
-----END PGP SIGNATURE-----

--ecRtX6R0aqjkVC7D--


--===============3382973372764987774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3382973372764987774==--

