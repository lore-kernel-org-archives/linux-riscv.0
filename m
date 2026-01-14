Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3C6D39019
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 20:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROxmo/BIeZX3SN1cG3y0H+A7QOMzXOk7+b8dlMp81oo=; b=2GcZYA1XiiI/OT8R3LzO1Y9GQT
	nZkor8m1kE6E4Su7uQhZ7SYFJn/CJiPU8qlzJMoeC23q3iz5etqtpz1dnPhXOZaPyPkkqyNNYNf7H
	Z4kkKrMee+NeSk9UpTXiUI5OwYXnuvRJmXeto2sRCMq8Q6q/EPiTszUK3wwWH8Gx8aoOuzSFWWjxC
	bnBHS0EQ3NNY9D1/JRE3XN4gHj24dCIeSCfDGhA3w88rg/hkL6Ky8jGcLVkFC97hsLiNQqBbCSWRg
	kcYcxfpGtB4RkpE+DA0bp3CR53Be4wA8BaAWGB6C7rnrdKAA8SvNQ/dmVpy1czUqWjyadEVYLpE1H
	NWdpEmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7gg-0000000AfGq-3gpY;
	Wed, 14 Jan 2026 20:41:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7gg-0000000AfGY-0ZeL
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 20:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4230D6001D;
	Wed, 14 Jan 2026 20:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56940C4CEF7;
	Wed, 14 Jan 2026 20:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768423313;
	bh=xks1CkG37ZPOINd1xjIH3n2/FSSeQbbO+pHUnZtsvLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipxtyX4Zh1fNUT13+4Nrjgk32/0w618CWJ40BdCQk3dzZOtYHMQxtO3C9zaB/Zflv
	 82qrSZ1amcwGBXPa0cbru+k/oEaeVMCcMVuHW7t9hUfP7dA4QHUQcr7Enyy/S+lRVM
	 gJlzu9YAaV1skPbWzR4lV/FiiUHEt5cZRrBFvx6CTiqtqiobZSAyzb4lDZcQIYhZWi
	 +0BDbt0l1y2Iw1Ca16KyqUCHF1Cink4UxVFTAF5Vmnz7GwrIA47jjSeNo1vfTCaldn
	 SLb2Wu2QfdObSm+OZtkrkRBdiYR9yhQEKbwf5+ASh2bEnq6V7BHBNxyyoRvrwTIMvZ
	 SQwWW46DJkpzw==
Date: Wed, 14 Jan 2026 20:41:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guodong Xu <guodong@riscstar.com>, Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
Message-ID: <20260114-outdoors-favorable-2105f50048c3@spud>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
 <dc610e3e-48f4-5df4-4929-fafeab9c381f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <dc610e3e-48f4-5df4-4929-fafeab9c381f@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0456730910059562133=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0456730910059562133==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vVgGIcdJNqOfMBsr"
Content-Disposition: inline


--vVgGIcdJNqOfMBsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:22:54PM -0700, Paul Walmsley wrote:
> On Tue, 13 Jan 2026, Guodong Xu wrote:
>=20
> > Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> > Unprivileged Architecture. The chapter numbering differs across
> > specification versions - for example, in version 20250508, the ISA
> > Extension Naming Conventions is chapter 36, not chapter 27.
> >=20
> > Historical versions of the RISC-V specification can be found via Link [=
1].
> >=20
> > Link: https://riscv.org/specifications/ratified/ [1]
> > Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA str=
ing ordering in /proc/cpuinfo")
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
>=20
> Conor, want to take this one if you pick up the subsequent patch?  If so,

Nah, I think you should take this. The subsequent bit is going to be
split into several patches for different trees. Not sure if any of it is
for me.

--vVgGIcdJNqOfMBsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWf/igAKCRB4tDGHoIJi
0l04AQD48ns7/JCoOSGHlDk+xE/Gtd9uFdFZLKvr+VZq53AaEAEAjxqK7NkGZZWt
R8s+ZMI8YyQiTtPHiJpgB4NxXJMSnAY=
=+NUi
-----END PGP SIGNATURE-----

--vVgGIcdJNqOfMBsr--


--===============0456730910059562133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0456730910059562133==--

