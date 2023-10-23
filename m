Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618DDC25B41
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDGzq2yh8u64YKsYKjryztGMc/EZhDlsccPysXdiv4M=; b=0aEmFnecxit4Q5qJLZHX27pPm4
	VmTy5BbitIZmOXc5fZ2NxSwuxQwfRJuXZgjKGHdxWp8F3HNe7EWHeUoL7+qgFGaJnkK8JDaG+sv6J
	QxCDbhszitFJv0TD3sxH/tVUqyB5XSq/NqYWS6DAjT6Y4y5RtAM2cNsKhu/J1fuRz18RfkTlKkJoH
	oNY8lku60u8D7Y+l3Ktr3DDlBnQe3LymZydksBXvYiGj8jwVeB2Rcol5nyf3D5IjcR/zn6CB+S6KW
	nnQ4LFkNCDKvOlQDXd4+pzUmzf0GQhJmXd3MU/iWJbHoLPY/DX3G5Cc4liIIfs3EMwj4AZO6VusYm
	E8uTfOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qur9h-006sRt-2W;
	Mon, 23 Oct 2023 09:23:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qur9f-006sQw-0F;
	Mon, 23 Oct 2023 09:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39F3B61A73;
	Mon, 23 Oct 2023 09:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A67AC433C7;
	Mon, 23 Oct 2023 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698053001;
	bh=aZBFa7fN1EH0urSii1LHTdENO3pg0U4aosD5CcywGOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsdUSetCYsPxlm2mEo2erqrcSSEMIbJPN+mwquIMS5v0zBB/zF6vOthd+ohrOuVAZ
	 UVU8ksImL8gz4CcLRlhjrMCeI/Vf2dsFqgU83vgk4pNmOc7UqFNyYyTW7pKzoOdp9i
	 Y4vY6QJg0LyHMsDiraZt8HDlO2JNBvvene6Uegl9FK0uUL/hhd1/WzE5DRS6joh6Iv
	 47DDn0lyl6SBWknnaeb4p/6fbIygzeyZrThucG0QudR/UeulSJsOBp2llQllpS5aTl
	 Pp6NYW3mNjD0amOF2TrdevqGyAWAf6SDvINhvZGhQ6VW5Mtr1w5Djz0iJqMDQmohMQ
	 uv3sSew7XVDkQ==
Date: Mon, 23 Oct 2023 10:23:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 RESEND 01/13] riscv: errata: Rename defines for Andes
Message-ID: <20231023-splashing-dandy-1effebb9ec30@spud>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-2-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231023004100.2663486-2-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_022323_155253_63007858 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4014336755480782770=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4014336755480782770==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dr6k7xdk2Nj78Rm8"
Content-Disposition: inline


--Dr6k7xdk2Nj78Rm8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 08:40:48AM +0800, Yu Chien Peter Lin wrote:
> Using "ANDES" rather than "ANDESTECH" to unify the naming
> convention with directory, file names, Kconfig options
> and other definitions.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Dr6k7xdk2Nj78Rm8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTY7fgAKCRB4tDGHoIJi
0szrAQDpbVZqytSdG3WsXMLtVH5Uqmw9YxPlcM5oJY5NdKbzngEAsaz52IDy3Sk5
0HxrIcXgEJ5z+J2YeJShi5+5WFBDYQc=
=HAN/
-----END PGP SIGNATURE-----

--Dr6k7xdk2Nj78Rm8--


--===============4014336755480782770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4014336755480782770==--

