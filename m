Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C55EC3A59D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3lL8BmVIJEQBBfHOM2qgdIP/j0lVukVJa0I0AyzpSs=; b=clFDDY8Zts49AoLvC2vvt3mCTw
	TwXMsnspQY436a8rFnP+poHuR1QyEkfChfechpz49YNHbfe4WtJfG+4oH23prwRbASPL50YEkaINd
	4zWEMAdsA3je8U1zAytZFLsA0Dlc2KefjgelN84AItI2xPPygBCcAI0/EAIOWnCHucqXjh8qmSCwP
	jLtwS2YNhbzLup0vsvV4NYhUBmc508yTpJYdy1Y1IgtYzpNArx1XiwZixYebqYRIJEY2X93L/UE3/
	XeEAyPI6qeEIUdIeL471DR+RuibXLuBp4VZUMvxXKykhVbU4+bBpSzz/fu4pwkUIJ3+HAyuhHVCoH
	Kz28amIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR6q-00FCnK-1h;
	Wed, 13 Dec 2023 15:25:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR6l-00FCgv-1M;
	Wed, 13 Dec 2023 15:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 99E73B81AA4;
	Wed, 13 Dec 2023 15:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE5DC433C7;
	Wed, 13 Dec 2023 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481109;
	bh=k3475fUWjt6cqtLAtUFoDPFZz/q8UFyFG6t5hNV1fdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhEL5Jr+r1wwkykwxdY9oQmsfodd9RscQA12rUVSylaaZzmWiWpnlGhVa+sp+3r7b
	 v98l3JDxaUBwRrSzu+mVf2fO350PgvFHe6HkXQltyVGpjer10RytkbZiEdJ1J46xxB
	 Rwnd4MPP43z9LtQY4FzMMoqGpyvLzymWkT+GZhRXDFwftlnk0o61XcKDpTOJ4c3VFV
	 WJek1HcyaFQE9cN2hOQhehvJFy7ICm8oKjfbFVNg9P51rjkPVfb0+1FG4ftPbraIGI
	 h+9bCQ4O85y3TPmEFTZdDXAyKrldhroD8lPJl7ea9llzgrX9j0sI3kcrN2TuQrnLCe
	 RPgdAjfZ6EasQ==
Date: Wed, 13 Dec 2023 15:24:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 15/16] riscv: dts: renesas: Add Andes PMU extension
 for r9a07g043f
Message-ID: <20231213-porous-panic-015409053e1d@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-16-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231213070301.1684751-16-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_072511_605707_9FFCC127 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============8544741346854703194=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8544741346854703194==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CdyUBDMnoeaw9TCE"
Content-Disposition: inline


--CdyUBDMnoeaw9TCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:03:00PM +0800, Yu Chien Peter Lin wrote:
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--CdyUBDMnoeaw9TCE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMyQAKCRB4tDGHoIJi
0iyVAQCorZx0jwXEAp2RWyzoTrHFg9KDdgLQHzCY1iV7IeT9DgD/SalZhcE47FKy
2wTkZDKDhXwkKbx9fAYA++KOZn1smA8=
=pQrz
-----END PGP SIGNATURE-----

--CdyUBDMnoeaw9TCE--


--===============8544741346854703194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8544741346854703194==--

