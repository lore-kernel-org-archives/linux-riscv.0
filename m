Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD6D11700
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2CmeAYM2fushHT6I238SdxN3V1dbcLIidDbHuTgIuw=; b=kUO7OHdd9Ho/+ySbbOhxM8lLM9
	1amVtOSJWfK82d+WuYLCkGDWQmtJ52YO2CeS87OYxmNAm7A6TcgtY334Q6+ksyTLLoVm9xMK1cruP
	Sd8CyzLGUE4noUybe/xaWAgiyO2DXcbNCh60RUIPCcZk2a74XVNz8y0G4jiLJ4E51bXQl2HvllnVv
	BGvVSFUUW/zinlVDiGeWE280XH3PIV/8P7bHuSoQSJrOYRzWAzLtWhFPxGJsfifU86ZTSU4rDfCjZ
	iZviZ4Cga+ygpBxKyJ6dm7m1Wjn6WNbql/rh1YW6464PwBZIzBlhKJigiP1Nk26IouxPq9DLbGJ3b
	FBSnVXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQT9L-00000005c2r-2HXi;
	Tue, 02 Dec 2025 16:22:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQT9L-00000005c2l-02Wb
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 16:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 202E760186;
	Tue,  2 Dec 2025 16:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591E3C4CEF1;
	Tue,  2 Dec 2025 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764692565;
	bh=JC95kGuUq6hHZ5hUg6HiwzZmNls4FjFiTSpD9XX+iIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CT5jFpdRGOWVgQSV8JiVZqV+d5nrGwGHpKbiobaVbLO1KonH+pSOkBNg44S2fcMZK
	 jHNZu6kQ+KKgbs7w7R819eet0fUeMlMBWsF2HW8KAY7HfPdyRAuGB1ToiMpv4Yj3dc
	 QL06ezRlYeHJQWTjp6c5e9aGptHQcMilx3WQdwsFPlSR90l6h1SDugZqdcnjLnZoh/
	 GDjEaz1Of6ONLfC8u4cksPaXoVmZmiWRgS3y4pKdCj8ZqpRWf+GiBDZTDtsoQ1f6hh
	 rLhP2Hv8yVdOOshW5N01hJ/1iNTk33lofsLhXDx7Pahb+uCbAr0Zt43TcCZUygA4sw
	 6ndm/l8znRmkg==
Date: Tue, 2 Dec 2025 16:22:41 +0000
From: Conor Dooley <conor@kernel.org>
To: q691800735@163.com
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	jybruceupup <691800735@qq.com>
Subject: Re: [PATCH] riscv: defconfig: Add initial Kendryte K230 defconfig
Message-ID: <20251202-choice-crudely-b7775c3e452d@spud>
References: <20251202120120.283883-1-q691800735@163.com>
MIME-Version: 1.0
In-Reply-To: <20251202120120.283883-1-q691800735@163.com>
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
Content-Type: multipart/mixed; boundary="===============8937967880292922139=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8937967880292922139==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CIyCs0y5cjgJOud1"
Content-Disposition: inline


--CIyCs0y5cjgJOud1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 02, 2025 at 08:01:20PM +0800, q691800735@163.com wrote:
> From: jybruceupup <691800735@qq.com>
>=20
> Add initial defconfig support for the Kendryte K230 RISC-V SoC. This defc=
onfig enables:
> - Essential RISC-V architecture features (64-bit, S-mode, page tables)
> - Core peripherals required for boot (UART, GPIO, MMC, clock)
> - Device Tree overlay support
> - Basic power management and reset functionality
> - Debugging features (printk, earlycon)
>=20
> This defconfig serves as the base configuration for K230-based platforms
> (including CanMV DongshanPi) and is compatible with upstream RISC-V kerne=
l features.

I'm sorry, but we don't do per-device configs in upstream. I know that
there's k210 ones but they are an exception that would not be permitted
now. Please add whatever bare-minimum things that are needed to boot
to the standard defconfig and other platform specific items that would be
helpful to upstream kernel developers as modules.

Thanks,
Conor.

--CIyCs0y5cjgJOud1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaS8SUQAKCRB4tDGHoIJi
0hlZAQC1gBSLo57QuuZEbiFKSpL7kLtxWwO1VZaJZdTCSaw2gQEAjCwUtUHKKxrJ
GEaBUhoOE4+mdK9shYSd/sVqWXkw5QI=
=xUU0
-----END PGP SIGNATURE-----

--CIyCs0y5cjgJOud1--


--===============8937967880292922139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8937967880292922139==--

