Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1260EEDF150
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3pvGYwNPeOZKFqbL+/98LjDEUpbclxu4LaUuMAVCZ8=; b=wFQ0zb9s8yxKev0aUGYhHMwH93
	jRMjfUnlLTYJuMnoCXAE6R6aLNnLR5IF5148/7RPCSDkg9NdhGzZI4rqJB/Qs2lDlGbbhxdEefYeT
	17D5fgJQgUgH48haAaLllh428H0Yy/taa8DWYN3+CpjMqxch0VOcMC+0+iD9S0dBRroxSihUAnFTm
	qb8cgfN2uMRNF2tz+EAMbNP8dUwe7EOsR1VpHJVoTZyMuJj6DW96RPvY9Gyc04kQhU2qUdmGLlDgE
	UNUcGQa+qysE9dQBNmH6qMBUJzE/TAfG5EbNIY/GTNoArXc0KjgtnHL+mubVfaOUpGArahltJ99G2
	fzZjXuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqhu-00000003LQU-1EZb;
	Fri, 13 Feb 2026 10:47:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqht-00000003LPx-08UV
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 10:47:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 696046132B;
	Fri, 13 Feb 2026 10:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D51C116C6;
	Fri, 13 Feb 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770979648;
	bh=MPhmJdSbmkLCcTbhIAWsiuKeTmpUaTlJpmlGSv8jbNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXREe9GuNj4Q/WDDAI/ysmEyLIGoTtGvQPAVbQooVxd0DX/d/sx+TWu2uESiVvc9v
	 gOjPwTQoevriFfdwhdeeOeR+mflUlSzTX3ULFix1m/aUPo7NoaCHLwbhywj5W1ZZZi
	 r2C1IGobD3f8byGmtkhs5rmCGDFnWxKNBrgyyws05/Blt2RPB5nwqmzR1ufP3na6/B
	 C3mPq2udmHmXOCehg6o5cMnxl1Jw5V7t4P84rhYTI0yoDxO0HAT2yIYu1RdkWxnap1
	 7+CNePIWwaA7fM2xp5uyuiHWeO4pihNp7b+/BACBkD/zLrAIqsb/8e8L3p0+9Vb2FJ
	 aSzWIaVXr7+Zw==
Date: Fri, 13 Feb 2026 10:47:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
	zhouzhouyi <zhouzhouyi@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: fix minor typos and style issues in XIP code
Message-ID: <20260213-entomb-ambulance-ec51cd9ea179@spud>
References: <20260213094739.397762-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260213094739.397762-1-kunwu.chan@linux.dev>
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
Content-Type: multipart/mixed; boundary="===============6302598129185646495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6302598129185646495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BEIjFZm0cacbTy0b"
Content-Disposition: inline


--BEIjFZm0cacbTy0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 05:47:37PM +0800, Kunwu Chan wrote:
> Fix a few minor issues found in riscv XIP-related code:
>=20
> - xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
> - head.S: spelling typo and wrong #endif comment
>=20
> Kunwu Chan (2):
>   riscv: xip_fixup.h: fix comment typo and whitespace issue
>   riscv: head.S: fix typo and wrong #endif comment
>=20
>  arch/riscv/include/asm/xip_fixup.h | 4 ++--
>  arch/riscv/kernel/head.S           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

The patches should be sent in reply to the cover letter.

--BEIjFZm0cacbTy0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY8BOwAKCRB4tDGHoIJi
0r9PAP9uCIBEydePL8Tn39iS1gQNdwYLxnZ+I6SDRz8KVT6/ywD+KNwZeaK8dXuN
KZ/ruhoa7DzBMFn/ZXqJKHJFbBvyfg8=
=c+lv
-----END PGP SIGNATURE-----

--BEIjFZm0cacbTy0b--


--===============6302598129185646495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6302598129185646495==--

